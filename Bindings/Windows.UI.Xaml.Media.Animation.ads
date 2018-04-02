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
limited with Windows.UI.Xaml.Controls.Primitives;
with Windows.Foundation.Collections;
limited with Windows.UI.Composition;
limited with Windows.UI.Xaml.Controls;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Media.Animation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ClockState is (
      Active,
      Filling,
      Stopped
   );
   for ClockState use (
      Active => 0,
      Filling => 1,
      Stopped => 2
   );
   for ClockState'Size use 32;
   
   type ClockState_Ptr is access ClockState;
   
   type EasingMode is (
      EaseOut,
      EaseIn,
      EaseInOut
   );
   for EasingMode use (
      EaseOut => 0,
      EaseIn => 1,
      EaseInOut => 2
   );
   for EasingMode'Size use 32;
   
   type EasingMode_Ptr is access EasingMode;
   
   type FillBehavior is (
      HoldEnd,
      Stop
   );
   for FillBehavior use (
      HoldEnd => 0,
      Stop => 1
   );
   for FillBehavior'Size use 32;
   
   type FillBehavior_Ptr is access FillBehavior;
   
   type RepeatBehaviorType is (
      Count,
      Duration,
      Forever
   );
   for RepeatBehaviorType use (
      Count => 0,
      Duration => 1,
      Forever => 2
   );
   for RepeatBehaviorType'Size use 32;
   
   type RepeatBehaviorType_Ptr is access RepeatBehaviorType;
   
   type ConnectedAnimationComponent is (
      OffsetX,
      OffsetY,
      CrossFade,
      Scale
   );
   for ConnectedAnimationComponent use (
      OffsetX => 0,
      OffsetY => 1,
      CrossFade => 2,
      Scale => 3
   );
   for ConnectedAnimationComponent'Size use 32;
   
   type ConnectedAnimationComponent_Ptr is access ConnectedAnimationComponent;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type KeyTime is record
      TimeSpan : Windows.Foundation.TimeSpan;
   end record;
   pragma Convention (C_Pass_By_Copy , KeyTime);
   
   type KeyTime_Ptr is access KeyTime;
   
   type RepeatBehavior is record
      Count : Windows.Double;
      Duration : Windows.Foundation.TimeSpan;
      Type_x : Windows.UI.Xaml.Media.Animation.RepeatBehaviorType;
   end record;
   pragma Convention (C_Pass_By_Copy , RepeatBehavior);
   
   type RepeatBehavior_Ptr is access RepeatBehavior;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IConnectedAnimation_add_Completed_Interface;
   type TypedEventHandler_IConnectedAnimation_add_Completed is access all TypedEventHandler_IConnectedAnimation_add_Completed_Interface'Class;
   type TypedEventHandler_IConnectedAnimation_add_Completed_Ptr is access all TypedEventHandler_IConnectedAnimation_add_Completed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKeyTimeHelper_Interface;
   type IKeyTimeHelper is access all IKeyTimeHelper_Interface'Class;
   type IKeyTimeHelper_Ptr is access all IKeyTimeHelper;
   type IKeyTimeHelperStatics_Interface;
   type IKeyTimeHelperStatics is access all IKeyTimeHelperStatics_Interface'Class;
   type IKeyTimeHelperStatics_Ptr is access all IKeyTimeHelperStatics;
   type IRepeatBehaviorHelper_Interface;
   type IRepeatBehaviorHelper is access all IRepeatBehaviorHelper_Interface'Class;
   type IRepeatBehaviorHelper_Ptr is access all IRepeatBehaviorHelper;
   type IRepeatBehaviorHelperStatics_Interface;
   type IRepeatBehaviorHelperStatics is access all IRepeatBehaviorHelperStatics_Interface'Class;
   type IRepeatBehaviorHelperStatics_Ptr is access all IRepeatBehaviorHelperStatics;
   type IVector_Transition_Interface;
   type IVector_Transition is access all IVector_Transition_Interface'Class;
   type IVector_Transition_Ptr is access all IVector_Transition;
   type IIterable_Transition_Interface;
   type IIterable_Transition is access all IIterable_Transition_Interface'Class;
   type IIterable_Transition_Ptr is access all IIterable_Transition;
   type IVector_DoubleKeyFrame_Interface;
   type IVector_DoubleKeyFrame is access all IVector_DoubleKeyFrame_Interface'Class;
   type IVector_DoubleKeyFrame_Ptr is access all IVector_DoubleKeyFrame;
   type IIterable_DoubleKeyFrame_Interface;
   type IIterable_DoubleKeyFrame is access all IIterable_DoubleKeyFrame_Interface'Class;
   type IIterable_DoubleKeyFrame_Ptr is access all IIterable_DoubleKeyFrame;
   type IVector_ObjectKeyFrame_Interface;
   type IVector_ObjectKeyFrame is access all IVector_ObjectKeyFrame_Interface'Class;
   type IVector_ObjectKeyFrame_Ptr is access all IVector_ObjectKeyFrame;
   type IIterable_ObjectKeyFrame_Interface;
   type IIterable_ObjectKeyFrame is access all IIterable_ObjectKeyFrame_Interface'Class;
   type IIterable_ObjectKeyFrame_Ptr is access all IIterable_ObjectKeyFrame;
   type IVector_Timeline_Interface;
   type IVector_Timeline is access all IVector_Timeline_Interface'Class;
   type IVector_Timeline_Ptr is access all IVector_Timeline;
   type IIterable_Timeline_Interface;
   type IIterable_Timeline is access all IIterable_Timeline_Interface'Class;
   type IIterable_Timeline_Ptr is access all IIterable_Timeline;
   type IDoubleKeyFrame_Interface;
   type IDoubleKeyFrame is access all IDoubleKeyFrame_Interface'Class;
   type IDoubleKeyFrame_Ptr is access all IDoubleKeyFrame;
   type IDoubleKeyFrameStatics_Interface;
   type IDoubleKeyFrameStatics is access all IDoubleKeyFrameStatics_Interface'Class;
   type IDoubleKeyFrameStatics_Ptr is access all IDoubleKeyFrameStatics;
   type IDoubleKeyFrameFactory_Interface;
   type IDoubleKeyFrameFactory is access all IDoubleKeyFrameFactory_Interface'Class;
   type IDoubleKeyFrameFactory_Ptr is access all IDoubleKeyFrameFactory;
   type IEasingFunctionBase_Interface;
   type IEasingFunctionBase is access all IEasingFunctionBase_Interface'Class;
   type IEasingFunctionBase_Ptr is access all IEasingFunctionBase;
   type IEasingFunctionBaseStatics_Interface;
   type IEasingFunctionBaseStatics is access all IEasingFunctionBaseStatics_Interface'Class;
   type IEasingFunctionBaseStatics_Ptr is access all IEasingFunctionBaseStatics;
   type IEasingFunctionBaseFactory_Interface;
   type IEasingFunctionBaseFactory is access all IEasingFunctionBaseFactory_Interface'Class;
   type IEasingFunctionBaseFactory_Ptr is access all IEasingFunctionBaseFactory;
   type IKeySpline_Interface;
   type IKeySpline is access all IKeySpline_Interface'Class;
   type IKeySpline_Ptr is access all IKeySpline;
   type INavigationTransitionInfo_Interface;
   type INavigationTransitionInfo is access all INavigationTransitionInfo_Interface'Class;
   type INavigationTransitionInfo_Ptr is access all INavigationTransitionInfo;
   type INavigationTransitionInfoOverrides_Interface;
   type INavigationTransitionInfoOverrides is access all INavigationTransitionInfoOverrides_Interface'Class;
   type INavigationTransitionInfoOverrides_Ptr is access all INavigationTransitionInfoOverrides;
   type INavigationTransitionInfoFactory_Interface;
   type INavigationTransitionInfoFactory is access all INavigationTransitionInfoFactory_Interface'Class;
   type INavigationTransitionInfoFactory_Ptr is access all INavigationTransitionInfoFactory;
   type IObjectKeyFrame_Interface;
   type IObjectKeyFrame is access all IObjectKeyFrame_Interface'Class;
   type IObjectKeyFrame_Ptr is access all IObjectKeyFrame;
   type IObjectKeyFrameStatics_Interface;
   type IObjectKeyFrameStatics is access all IObjectKeyFrameStatics_Interface'Class;
   type IObjectKeyFrameStatics_Ptr is access all IObjectKeyFrameStatics;
   type IObjectKeyFrameFactory_Interface;
   type IObjectKeyFrameFactory is access all IObjectKeyFrameFactory_Interface'Class;
   type IObjectKeyFrameFactory_Ptr is access all IObjectKeyFrameFactory;
   type ITimeline_Interface;
   type ITimeline is access all ITimeline_Interface'Class;
   type ITimeline_Ptr is access all ITimeline;
   type ITimelineStatics_Interface;
   type ITimelineStatics is access all ITimelineStatics_Interface'Class;
   type ITimelineStatics_Ptr is access all ITimelineStatics;
   type ITimelineFactory_Interface;
   type ITimelineFactory is access all ITimelineFactory_Interface'Class;
   type ITimelineFactory_Ptr is access all ITimelineFactory;
   type ITransition_Interface;
   type ITransition is access all ITransition_Interface'Class;
   type ITransition_Ptr is access all ITransition;
   type ITransitionFactory_Interface;
   type ITransitionFactory is access all ITransitionFactory_Interface'Class;
   type ITransitionFactory_Ptr is access all ITransitionFactory;
   type IAddDeleteThemeTransition_Interface;
   type IAddDeleteThemeTransition is access all IAddDeleteThemeTransition_Interface'Class;
   type IAddDeleteThemeTransition_Ptr is access all IAddDeleteThemeTransition;
   type IBackEase_Interface;
   type IBackEase is access all IBackEase_Interface'Class;
   type IBackEase_Ptr is access all IBackEase;
   type IBackEaseStatics_Interface;
   type IBackEaseStatics is access all IBackEaseStatics_Interface'Class;
   type IBackEaseStatics_Ptr is access all IBackEaseStatics;
   type IBeginStoryboard_Interface;
   type IBeginStoryboard is access all IBeginStoryboard_Interface'Class;
   type IBeginStoryboard_Ptr is access all IBeginStoryboard;
   type IBeginStoryboardStatics_Interface;
   type IBeginStoryboardStatics is access all IBeginStoryboardStatics_Interface'Class;
   type IBeginStoryboardStatics_Ptr is access all IBeginStoryboardStatics;
   type IBounceEase_Interface;
   type IBounceEase is access all IBounceEase_Interface'Class;
   type IBounceEase_Ptr is access all IBounceEase;
   type IBounceEaseStatics_Interface;
   type IBounceEaseStatics is access all IBounceEaseStatics_Interface'Class;
   type IBounceEaseStatics_Ptr is access all IBounceEaseStatics;
   type ICircleEase_Interface;
   type ICircleEase is access all ICircleEase_Interface'Class;
   type ICircleEase_Ptr is access all ICircleEase;
   type IColorAnimation_Interface;
   type IColorAnimation is access all IColorAnimation_Interface'Class;
   type IColorAnimation_Ptr is access all IColorAnimation;
   type IColorAnimationStatics_Interface;
   type IColorAnimationStatics is access all IColorAnimationStatics_Interface'Class;
   type IColorAnimationStatics_Ptr is access all IColorAnimationStatics;
   type IContentThemeTransition_Interface;
   type IContentThemeTransition is access all IContentThemeTransition_Interface'Class;
   type IContentThemeTransition_Ptr is access all IContentThemeTransition;
   type IContentThemeTransitionStatics_Interface;
   type IContentThemeTransitionStatics is access all IContentThemeTransitionStatics_Interface'Class;
   type IContentThemeTransitionStatics_Ptr is access all IContentThemeTransitionStatics;
   type ICubicEase_Interface;
   type ICubicEase is access all ICubicEase_Interface'Class;
   type ICubicEase_Ptr is access all ICubicEase;
   type IDiscreteDoubleKeyFrame_Interface;
   type IDiscreteDoubleKeyFrame is access all IDiscreteDoubleKeyFrame_Interface'Class;
   type IDiscreteDoubleKeyFrame_Ptr is access all IDiscreteDoubleKeyFrame;
   type IDiscreteObjectKeyFrame_Interface;
   type IDiscreteObjectKeyFrame is access all IDiscreteObjectKeyFrame_Interface'Class;
   type IDiscreteObjectKeyFrame_Ptr is access all IDiscreteObjectKeyFrame;
   type IDoubleAnimation_Interface;
   type IDoubleAnimation is access all IDoubleAnimation_Interface'Class;
   type IDoubleAnimation_Ptr is access all IDoubleAnimation;
   type IDoubleAnimationStatics_Interface;
   type IDoubleAnimationStatics is access all IDoubleAnimationStatics_Interface'Class;
   type IDoubleAnimationStatics_Ptr is access all IDoubleAnimationStatics;
   type IDoubleAnimationUsingKeyFrames_Interface;
   type IDoubleAnimationUsingKeyFrames is access all IDoubleAnimationUsingKeyFrames_Interface'Class;
   type IDoubleAnimationUsingKeyFrames_Ptr is access all IDoubleAnimationUsingKeyFrames;
   type IDoubleAnimationUsingKeyFramesStatics_Interface;
   type IDoubleAnimationUsingKeyFramesStatics is access all IDoubleAnimationUsingKeyFramesStatics_Interface'Class;
   type IDoubleAnimationUsingKeyFramesStatics_Ptr is access all IDoubleAnimationUsingKeyFramesStatics;
   type IEasingDoubleKeyFrame_Interface;
   type IEasingDoubleKeyFrame is access all IEasingDoubleKeyFrame_Interface'Class;
   type IEasingDoubleKeyFrame_Ptr is access all IEasingDoubleKeyFrame;
   type IEasingDoubleKeyFrameStatics_Interface;
   type IEasingDoubleKeyFrameStatics is access all IEasingDoubleKeyFrameStatics_Interface'Class;
   type IEasingDoubleKeyFrameStatics_Ptr is access all IEasingDoubleKeyFrameStatics;
   type IEdgeUIThemeTransition_Interface;
   type IEdgeUIThemeTransition is access all IEdgeUIThemeTransition_Interface'Class;
   type IEdgeUIThemeTransition_Ptr is access all IEdgeUIThemeTransition;
   type IEdgeUIThemeTransitionStatics_Interface;
   type IEdgeUIThemeTransitionStatics is access all IEdgeUIThemeTransitionStatics_Interface'Class;
   type IEdgeUIThemeTransitionStatics_Ptr is access all IEdgeUIThemeTransitionStatics;
   type IElasticEase_Interface;
   type IElasticEase is access all IElasticEase_Interface'Class;
   type IElasticEase_Ptr is access all IElasticEase;
   type IElasticEaseStatics_Interface;
   type IElasticEaseStatics is access all IElasticEaseStatics_Interface'Class;
   type IElasticEaseStatics_Ptr is access all IElasticEaseStatics;
   type IEntranceThemeTransition_Interface;
   type IEntranceThemeTransition is access all IEntranceThemeTransition_Interface'Class;
   type IEntranceThemeTransition_Ptr is access all IEntranceThemeTransition;
   type IEntranceThemeTransitionStatics_Interface;
   type IEntranceThemeTransitionStatics is access all IEntranceThemeTransitionStatics_Interface'Class;
   type IEntranceThemeTransitionStatics_Ptr is access all IEntranceThemeTransitionStatics;
   type IExponentialEase_Interface;
   type IExponentialEase is access all IExponentialEase_Interface'Class;
   type IExponentialEase_Ptr is access all IExponentialEase;
   type IExponentialEaseStatics_Interface;
   type IExponentialEaseStatics is access all IExponentialEaseStatics_Interface'Class;
   type IExponentialEaseStatics_Ptr is access all IExponentialEaseStatics;
   type ILinearDoubleKeyFrame_Interface;
   type ILinearDoubleKeyFrame is access all ILinearDoubleKeyFrame_Interface'Class;
   type ILinearDoubleKeyFrame_Ptr is access all ILinearDoubleKeyFrame;
   type IObjectAnimationUsingKeyFrames_Interface;
   type IObjectAnimationUsingKeyFrames is access all IObjectAnimationUsingKeyFrames_Interface'Class;
   type IObjectAnimationUsingKeyFrames_Ptr is access all IObjectAnimationUsingKeyFrames;
   type IObjectAnimationUsingKeyFramesStatics_Interface;
   type IObjectAnimationUsingKeyFramesStatics is access all IObjectAnimationUsingKeyFramesStatics_Interface'Class;
   type IObjectAnimationUsingKeyFramesStatics_Ptr is access all IObjectAnimationUsingKeyFramesStatics;
   type IPaneThemeTransition_Interface;
   type IPaneThemeTransition is access all IPaneThemeTransition_Interface'Class;
   type IPaneThemeTransition_Ptr is access all IPaneThemeTransition;
   type IPaneThemeTransitionStatics_Interface;
   type IPaneThemeTransitionStatics is access all IPaneThemeTransitionStatics_Interface'Class;
   type IPaneThemeTransitionStatics_Ptr is access all IPaneThemeTransitionStatics;
   type IPointAnimation_Interface;
   type IPointAnimation is access all IPointAnimation_Interface'Class;
   type IPointAnimation_Ptr is access all IPointAnimation;
   type IPointAnimationStatics_Interface;
   type IPointAnimationStatics is access all IPointAnimationStatics_Interface'Class;
   type IPointAnimationStatics_Ptr is access all IPointAnimationStatics;
   type IPopupThemeTransition_Interface;
   type IPopupThemeTransition is access all IPopupThemeTransition_Interface'Class;
   type IPopupThemeTransition_Ptr is access all IPopupThemeTransition;
   type IPopupThemeTransitionStatics_Interface;
   type IPopupThemeTransitionStatics is access all IPopupThemeTransitionStatics_Interface'Class;
   type IPopupThemeTransitionStatics_Ptr is access all IPopupThemeTransitionStatics;
   type IPowerEase_Interface;
   type IPowerEase is access all IPowerEase_Interface'Class;
   type IPowerEase_Ptr is access all IPowerEase;
   type IPowerEaseStatics_Interface;
   type IPowerEaseStatics is access all IPowerEaseStatics_Interface'Class;
   type IPowerEaseStatics_Ptr is access all IPowerEaseStatics;
   type IQuadraticEase_Interface;
   type IQuadraticEase is access all IQuadraticEase_Interface'Class;
   type IQuadraticEase_Ptr is access all IQuadraticEase;
   type IQuarticEase_Interface;
   type IQuarticEase is access all IQuarticEase_Interface'Class;
   type IQuarticEase_Ptr is access all IQuarticEase;
   type IQuinticEase_Interface;
   type IQuinticEase is access all IQuinticEase_Interface'Class;
   type IQuinticEase_Ptr is access all IQuinticEase;
   type IReorderThemeTransition_Interface;
   type IReorderThemeTransition is access all IReorderThemeTransition_Interface'Class;
   type IReorderThemeTransition_Ptr is access all IReorderThemeTransition;
   type IRepositionThemeTransition_Interface;
   type IRepositionThemeTransition is access all IRepositionThemeTransition_Interface'Class;
   type IRepositionThemeTransition_Ptr is access all IRepositionThemeTransition;
   type IRepositionThemeTransition2_Interface;
   type IRepositionThemeTransition2 is access all IRepositionThemeTransition2_Interface'Class;
   type IRepositionThemeTransition2_Ptr is access all IRepositionThemeTransition2;
   type IRepositionThemeTransitionStatics2_Interface;
   type IRepositionThemeTransitionStatics2 is access all IRepositionThemeTransitionStatics2_Interface'Class;
   type IRepositionThemeTransitionStatics2_Ptr is access all IRepositionThemeTransitionStatics2;
   type ISineEase_Interface;
   type ISineEase is access all ISineEase_Interface'Class;
   type ISineEase_Ptr is access all ISineEase;
   type ISplineDoubleKeyFrame_Interface;
   type ISplineDoubleKeyFrame is access all ISplineDoubleKeyFrame_Interface'Class;
   type ISplineDoubleKeyFrame_Ptr is access all ISplineDoubleKeyFrame;
   type ISplineDoubleKeyFrameStatics_Interface;
   type ISplineDoubleKeyFrameStatics is access all ISplineDoubleKeyFrameStatics_Interface'Class;
   type ISplineDoubleKeyFrameStatics_Ptr is access all ISplineDoubleKeyFrameStatics;
   type IStoryboard_Interface;
   type IStoryboard is access all IStoryboard_Interface'Class;
   type IStoryboard_Ptr is access all IStoryboard;
   type IStoryboardStatics_Interface;
   type IStoryboardStatics is access all IStoryboardStatics_Interface'Class;
   type IStoryboardStatics_Ptr is access all IStoryboardStatics;
   type IVector_ColorKeyFrame_Interface;
   type IVector_ColorKeyFrame is access all IVector_ColorKeyFrame_Interface'Class;
   type IVector_ColorKeyFrame_Ptr is access all IVector_ColorKeyFrame;
   type IIterable_ColorKeyFrame_Interface;
   type IIterable_ColorKeyFrame is access all IIterable_ColorKeyFrame_Interface'Class;
   type IIterable_ColorKeyFrame_Ptr is access all IIterable_ColorKeyFrame;
   type IConnectedAnimation_Interface;
   type IConnectedAnimation is access all IConnectedAnimation_Interface'Class;
   type IConnectedAnimation_Ptr is access all IConnectedAnimation;
   type IConnectedAnimation2_Interface;
   type IConnectedAnimation2 is access all IConnectedAnimation2_Interface'Class;
   type IConnectedAnimation2_Ptr is access all IConnectedAnimation2;
   type IConnectedAnimationService_Interface;
   type IConnectedAnimationService is access all IConnectedAnimationService_Interface'Class;
   type IConnectedAnimationService_Ptr is access all IConnectedAnimationService;
   type IConnectedAnimationServiceStatics_Interface;
   type IConnectedAnimationServiceStatics is access all IConnectedAnimationServiceStatics_Interface'Class;
   type IConnectedAnimationServiceStatics_Ptr is access all IConnectedAnimationServiceStatics;
   type IVector_PointKeyFrame_Interface;
   type IVector_PointKeyFrame is access all IVector_PointKeyFrame_Interface'Class;
   type IVector_PointKeyFrame_Ptr is access all IVector_PointKeyFrame;
   type IIterable_PointKeyFrame_Interface;
   type IIterable_PointKeyFrame is access all IIterable_PointKeyFrame_Interface'Class;
   type IIterable_PointKeyFrame_Ptr is access all IIterable_PointKeyFrame;
   type IColorKeyFrame_Interface;
   type IColorKeyFrame is access all IColorKeyFrame_Interface'Class;
   type IColorKeyFrame_Ptr is access all IColorKeyFrame;
   type IColorKeyFrameStatics_Interface;
   type IColorKeyFrameStatics is access all IColorKeyFrameStatics_Interface'Class;
   type IColorKeyFrameStatics_Ptr is access all IColorKeyFrameStatics;
   type IColorKeyFrameFactory_Interface;
   type IColorKeyFrameFactory is access all IColorKeyFrameFactory_Interface'Class;
   type IColorKeyFrameFactory_Ptr is access all IColorKeyFrameFactory;
   type IPointKeyFrame_Interface;
   type IPointKeyFrame is access all IPointKeyFrame_Interface'Class;
   type IPointKeyFrame_Ptr is access all IPointKeyFrame;
   type IPointKeyFrameStatics_Interface;
   type IPointKeyFrameStatics is access all IPointKeyFrameStatics_Interface'Class;
   type IPointKeyFrameStatics_Ptr is access all IPointKeyFrameStatics;
   type IPointKeyFrameFactory_Interface;
   type IPointKeyFrameFactory is access all IPointKeyFrameFactory_Interface'Class;
   type IPointKeyFrameFactory_Ptr is access all IPointKeyFrameFactory;
   type IColorAnimationUsingKeyFrames_Interface;
   type IColorAnimationUsingKeyFrames is access all IColorAnimationUsingKeyFrames_Interface'Class;
   type IColorAnimationUsingKeyFrames_Ptr is access all IColorAnimationUsingKeyFrames;
   type IColorAnimationUsingKeyFramesStatics_Interface;
   type IColorAnimationUsingKeyFramesStatics is access all IColorAnimationUsingKeyFramesStatics_Interface'Class;
   type IColorAnimationUsingKeyFramesStatics_Ptr is access all IColorAnimationUsingKeyFramesStatics;
   type IDiscreteColorKeyFrame_Interface;
   type IDiscreteColorKeyFrame is access all IDiscreteColorKeyFrame_Interface'Class;
   type IDiscreteColorKeyFrame_Ptr is access all IDiscreteColorKeyFrame;
   type IDiscretePointKeyFrame_Interface;
   type IDiscretePointKeyFrame is access all IDiscretePointKeyFrame_Interface'Class;
   type IDiscretePointKeyFrame_Ptr is access all IDiscretePointKeyFrame;
   type IDragItemThemeAnimation_Interface;
   type IDragItemThemeAnimation is access all IDragItemThemeAnimation_Interface'Class;
   type IDragItemThemeAnimation_Ptr is access all IDragItemThemeAnimation;
   type IDragItemThemeAnimationStatics_Interface;
   type IDragItemThemeAnimationStatics is access all IDragItemThemeAnimationStatics_Interface'Class;
   type IDragItemThemeAnimationStatics_Ptr is access all IDragItemThemeAnimationStatics;
   type IDragOverThemeAnimation_Interface;
   type IDragOverThemeAnimation is access all IDragOverThemeAnimation_Interface'Class;
   type IDragOverThemeAnimation_Ptr is access all IDragOverThemeAnimation;
   type IDragOverThemeAnimationStatics_Interface;
   type IDragOverThemeAnimationStatics is access all IDragOverThemeAnimationStatics_Interface'Class;
   type IDragOverThemeAnimationStatics_Ptr is access all IDragOverThemeAnimationStatics;
   type IDrillInThemeAnimation_Interface;
   type IDrillInThemeAnimation is access all IDrillInThemeAnimation_Interface'Class;
   type IDrillInThemeAnimation_Ptr is access all IDrillInThemeAnimation;
   type IDrillInThemeAnimationStatics_Interface;
   type IDrillInThemeAnimationStatics is access all IDrillInThemeAnimationStatics_Interface'Class;
   type IDrillInThemeAnimationStatics_Ptr is access all IDrillInThemeAnimationStatics;
   type IDrillOutThemeAnimation_Interface;
   type IDrillOutThemeAnimation is access all IDrillOutThemeAnimation_Interface'Class;
   type IDrillOutThemeAnimation_Ptr is access all IDrillOutThemeAnimation;
   type IDrillOutThemeAnimationStatics_Interface;
   type IDrillOutThemeAnimationStatics is access all IDrillOutThemeAnimationStatics_Interface'Class;
   type IDrillOutThemeAnimationStatics_Ptr is access all IDrillOutThemeAnimationStatics;
   type IDropTargetItemThemeAnimation_Interface;
   type IDropTargetItemThemeAnimation is access all IDropTargetItemThemeAnimation_Interface'Class;
   type IDropTargetItemThemeAnimation_Ptr is access all IDropTargetItemThemeAnimation;
   type IDropTargetItemThemeAnimationStatics_Interface;
   type IDropTargetItemThemeAnimationStatics is access all IDropTargetItemThemeAnimationStatics_Interface'Class;
   type IDropTargetItemThemeAnimationStatics_Ptr is access all IDropTargetItemThemeAnimationStatics;
   type IEasingColorKeyFrame_Interface;
   type IEasingColorKeyFrame is access all IEasingColorKeyFrame_Interface'Class;
   type IEasingColorKeyFrame_Ptr is access all IEasingColorKeyFrame;
   type IEasingColorKeyFrameStatics_Interface;
   type IEasingColorKeyFrameStatics is access all IEasingColorKeyFrameStatics_Interface'Class;
   type IEasingColorKeyFrameStatics_Ptr is access all IEasingColorKeyFrameStatics;
   type IEasingPointKeyFrame_Interface;
   type IEasingPointKeyFrame is access all IEasingPointKeyFrame_Interface'Class;
   type IEasingPointKeyFrame_Ptr is access all IEasingPointKeyFrame;
   type IEasingPointKeyFrameStatics_Interface;
   type IEasingPointKeyFrameStatics is access all IEasingPointKeyFrameStatics_Interface'Class;
   type IEasingPointKeyFrameStatics_Ptr is access all IEasingPointKeyFrameStatics;
   type IFadeInThemeAnimation_Interface;
   type IFadeInThemeAnimation is access all IFadeInThemeAnimation_Interface'Class;
   type IFadeInThemeAnimation_Ptr is access all IFadeInThemeAnimation;
   type IFadeInThemeAnimationStatics_Interface;
   type IFadeInThemeAnimationStatics is access all IFadeInThemeAnimationStatics_Interface'Class;
   type IFadeInThemeAnimationStatics_Ptr is access all IFadeInThemeAnimationStatics;
   type IFadeOutThemeAnimation_Interface;
   type IFadeOutThemeAnimation is access all IFadeOutThemeAnimation_Interface'Class;
   type IFadeOutThemeAnimation_Ptr is access all IFadeOutThemeAnimation;
   type IFadeOutThemeAnimationStatics_Interface;
   type IFadeOutThemeAnimationStatics is access all IFadeOutThemeAnimationStatics_Interface'Class;
   type IFadeOutThemeAnimationStatics_Ptr is access all IFadeOutThemeAnimationStatics;
   type ILinearColorKeyFrame_Interface;
   type ILinearColorKeyFrame is access all ILinearColorKeyFrame_Interface'Class;
   type ILinearColorKeyFrame_Ptr is access all ILinearColorKeyFrame;
   type ILinearPointKeyFrame_Interface;
   type ILinearPointKeyFrame is access all ILinearPointKeyFrame_Interface'Class;
   type ILinearPointKeyFrame_Ptr is access all ILinearPointKeyFrame;
   type IPointAnimationUsingKeyFrames_Interface;
   type IPointAnimationUsingKeyFrames is access all IPointAnimationUsingKeyFrames_Interface'Class;
   type IPointAnimationUsingKeyFrames_Ptr is access all IPointAnimationUsingKeyFrames;
   type IPointAnimationUsingKeyFramesStatics_Interface;
   type IPointAnimationUsingKeyFramesStatics is access all IPointAnimationUsingKeyFramesStatics_Interface'Class;
   type IPointAnimationUsingKeyFramesStatics_Ptr is access all IPointAnimationUsingKeyFramesStatics;
   type IPointerDownThemeAnimation_Interface;
   type IPointerDownThemeAnimation is access all IPointerDownThemeAnimation_Interface'Class;
   type IPointerDownThemeAnimation_Ptr is access all IPointerDownThemeAnimation;
   type IPointerDownThemeAnimationStatics_Interface;
   type IPointerDownThemeAnimationStatics is access all IPointerDownThemeAnimationStatics_Interface'Class;
   type IPointerDownThemeAnimationStatics_Ptr is access all IPointerDownThemeAnimationStatics;
   type IPointerUpThemeAnimation_Interface;
   type IPointerUpThemeAnimation is access all IPointerUpThemeAnimation_Interface'Class;
   type IPointerUpThemeAnimation_Ptr is access all IPointerUpThemeAnimation;
   type IPointerUpThemeAnimationStatics_Interface;
   type IPointerUpThemeAnimationStatics is access all IPointerUpThemeAnimationStatics_Interface'Class;
   type IPointerUpThemeAnimationStatics_Ptr is access all IPointerUpThemeAnimationStatics;
   type IPopInThemeAnimation_Interface;
   type IPopInThemeAnimation is access all IPopInThemeAnimation_Interface'Class;
   type IPopInThemeAnimation_Ptr is access all IPopInThemeAnimation;
   type IPopInThemeAnimationStatics_Interface;
   type IPopInThemeAnimationStatics is access all IPopInThemeAnimationStatics_Interface'Class;
   type IPopInThemeAnimationStatics_Ptr is access all IPopInThemeAnimationStatics;
   type IPopOutThemeAnimation_Interface;
   type IPopOutThemeAnimation is access all IPopOutThemeAnimation_Interface'Class;
   type IPopOutThemeAnimation_Ptr is access all IPopOutThemeAnimation;
   type IPopOutThemeAnimationStatics_Interface;
   type IPopOutThemeAnimationStatics is access all IPopOutThemeAnimationStatics_Interface'Class;
   type IPopOutThemeAnimationStatics_Ptr is access all IPopOutThemeAnimationStatics;
   type IRepositionThemeAnimation_Interface;
   type IRepositionThemeAnimation is access all IRepositionThemeAnimation_Interface'Class;
   type IRepositionThemeAnimation_Ptr is access all IRepositionThemeAnimation;
   type IRepositionThemeAnimationStatics_Interface;
   type IRepositionThemeAnimationStatics is access all IRepositionThemeAnimationStatics_Interface'Class;
   type IRepositionThemeAnimationStatics_Ptr is access all IRepositionThemeAnimationStatics;
   type ISplineColorKeyFrame_Interface;
   type ISplineColorKeyFrame is access all ISplineColorKeyFrame_Interface'Class;
   type ISplineColorKeyFrame_Ptr is access all ISplineColorKeyFrame;
   type ISplineColorKeyFrameStatics_Interface;
   type ISplineColorKeyFrameStatics is access all ISplineColorKeyFrameStatics_Interface'Class;
   type ISplineColorKeyFrameStatics_Ptr is access all ISplineColorKeyFrameStatics;
   type ISplinePointKeyFrame_Interface;
   type ISplinePointKeyFrame is access all ISplinePointKeyFrame_Interface'Class;
   type ISplinePointKeyFrame_Ptr is access all ISplinePointKeyFrame;
   type ISplinePointKeyFrameStatics_Interface;
   type ISplinePointKeyFrameStatics is access all ISplinePointKeyFrameStatics_Interface'Class;
   type ISplinePointKeyFrameStatics_Ptr is access all ISplinePointKeyFrameStatics;
   type ISplitCloseThemeAnimation_Interface;
   type ISplitCloseThemeAnimation is access all ISplitCloseThemeAnimation_Interface'Class;
   type ISplitCloseThemeAnimation_Ptr is access all ISplitCloseThemeAnimation;
   type ISplitCloseThemeAnimationStatics_Interface;
   type ISplitCloseThemeAnimationStatics is access all ISplitCloseThemeAnimationStatics_Interface'Class;
   type ISplitCloseThemeAnimationStatics_Ptr is access all ISplitCloseThemeAnimationStatics;
   type ISplitOpenThemeAnimation_Interface;
   type ISplitOpenThemeAnimation is access all ISplitOpenThemeAnimation_Interface'Class;
   type ISplitOpenThemeAnimation_Ptr is access all ISplitOpenThemeAnimation;
   type ISplitOpenThemeAnimationStatics_Interface;
   type ISplitOpenThemeAnimationStatics is access all ISplitOpenThemeAnimationStatics_Interface'Class;
   type ISplitOpenThemeAnimationStatics_Ptr is access all ISplitOpenThemeAnimationStatics;
   type ISwipeBackThemeAnimation_Interface;
   type ISwipeBackThemeAnimation is access all ISwipeBackThemeAnimation_Interface'Class;
   type ISwipeBackThemeAnimation_Ptr is access all ISwipeBackThemeAnimation;
   type ISwipeBackThemeAnimationStatics_Interface;
   type ISwipeBackThemeAnimationStatics is access all ISwipeBackThemeAnimationStatics_Interface'Class;
   type ISwipeBackThemeAnimationStatics_Ptr is access all ISwipeBackThemeAnimationStatics;
   type ISwipeHintThemeAnimation_Interface;
   type ISwipeHintThemeAnimation is access all ISwipeHintThemeAnimation_Interface'Class;
   type ISwipeHintThemeAnimation_Ptr is access all ISwipeHintThemeAnimation;
   type ISwipeHintThemeAnimationStatics_Interface;
   type ISwipeHintThemeAnimationStatics is access all ISwipeHintThemeAnimationStatics_Interface'Class;
   type ISwipeHintThemeAnimationStatics_Ptr is access all ISwipeHintThemeAnimationStatics;
   type ICommonNavigationTransitionInfo_Interface;
   type ICommonNavigationTransitionInfo is access all ICommonNavigationTransitionInfo_Interface'Class;
   type ICommonNavigationTransitionInfo_Ptr is access all ICommonNavigationTransitionInfo;
   type ICommonNavigationTransitionInfoStatics_Interface;
   type ICommonNavigationTransitionInfoStatics is access all ICommonNavigationTransitionInfoStatics_Interface'Class;
   type ICommonNavigationTransitionInfoStatics_Ptr is access all ICommonNavigationTransitionInfoStatics;
   type IContinuumNavigationTransitionInfo_Interface;
   type IContinuumNavigationTransitionInfo is access all IContinuumNavigationTransitionInfo_Interface'Class;
   type IContinuumNavigationTransitionInfo_Ptr is access all IContinuumNavigationTransitionInfo;
   type IContinuumNavigationTransitionInfoStatics_Interface;
   type IContinuumNavigationTransitionInfoStatics is access all IContinuumNavigationTransitionInfoStatics_Interface'Class;
   type IContinuumNavigationTransitionInfoStatics_Ptr is access all IContinuumNavigationTransitionInfoStatics;
   type IDrillInNavigationTransitionInfo_Interface;
   type IDrillInNavigationTransitionInfo is access all IDrillInNavigationTransitionInfo_Interface'Class;
   type IDrillInNavigationTransitionInfo_Ptr is access all IDrillInNavigationTransitionInfo;
   type IEntranceNavigationTransitionInfo_Interface;
   type IEntranceNavigationTransitionInfo is access all IEntranceNavigationTransitionInfo_Interface'Class;
   type IEntranceNavigationTransitionInfo_Ptr is access all IEntranceNavigationTransitionInfo;
   type IEntranceNavigationTransitionInfoStatics_Interface;
   type IEntranceNavigationTransitionInfoStatics is access all IEntranceNavigationTransitionInfoStatics_Interface'Class;
   type IEntranceNavigationTransitionInfoStatics_Ptr is access all IEntranceNavigationTransitionInfoStatics;
   type INavigationThemeTransition_Interface;
   type INavigationThemeTransition is access all INavigationThemeTransition_Interface'Class;
   type INavigationThemeTransition_Ptr is access all INavigationThemeTransition;
   type INavigationThemeTransitionStatics_Interface;
   type INavigationThemeTransitionStatics is access all INavigationThemeTransitionStatics_Interface'Class;
   type INavigationThemeTransitionStatics_Ptr is access all INavigationThemeTransitionStatics;
   type ISlideNavigationTransitionInfo_Interface;
   type ISlideNavigationTransitionInfo is access all ISlideNavigationTransitionInfo_Interface'Class;
   type ISlideNavigationTransitionInfo_Ptr is access all ISlideNavigationTransitionInfo;
   type ISuppressNavigationTransitionInfo_Interface;
   type ISuppressNavigationTransitionInfo is access all ISuppressNavigationTransitionInfo_Interface'Class;
   type ISuppressNavigationTransitionInfo_Ptr is access all ISuppressNavigationTransitionInfo;
   
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
   type IKeyTimeHelper_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IKeyTimeHelper : aliased constant Windows.IID := (910419072, 18467, 18026, (171, 229, 94, 121, 200, 237, 119, 237 ));
   
   ------------------------------------------------------------------------
   type IKeyTimeHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromTimeSpan
   (
      This       : access IKeyTimeHelperStatics_Interface
      ; timeSpan : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IKeyTimeHelperStatics : aliased constant Windows.IID := (2141348140, 8873, 17897, (154, 247, 199, 65, 110, 255, 247, 165 ));
   
   ------------------------------------------------------------------------
   type IRepeatBehaviorHelper_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IRepeatBehaviorHelper : aliased constant Windows.IID := (1751362418, 18839, 18425, (135, 173, 55, 239, 183, 89, 147, 234 ));
   
   ------------------------------------------------------------------------
   type IRepeatBehaviorHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Forever
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is abstract;
   
   function FromCount
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; count : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is abstract;
   
   function FromDuration
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is abstract;
   
   function GetHasCount
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetHasDuration
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access IRepeatBehaviorHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepeatBehaviorHelperStatics : aliased constant Windows.IID := (2054770739, 31219, 19929, (178, 103, 156, 245, 15, 181, 31, 132 ));
   
   ------------------------------------------------------------------------
   type IVector_Transition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Transition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Transition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Transition_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Transition_Interface
      ; value : Windows.UI.Xaml.Media.Animation.ITransition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Transition_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Transition_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Transition_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Transition_Interface
      ; value : Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Transition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Transition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Transition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.ITransition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Transition_Interface
      ; items : Windows.UI.Xaml.Media.Animation.ITransition_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Transition : aliased constant Windows.IID := (3885520671, 32318, 24090, (170, 85, 203, 201, 59, 131, 248, 33 ));
   
   ------------------------------------------------------------------------
   type IIterable_Transition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Transition_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITransition
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Transition : aliased constant Windows.IID := (4273279896, 20443, 20754, (138, 155, 106, 135, 134, 202, 1, 206 ));
   
   ------------------------------------------------------------------------
   type IVector_DoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_DoubleKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_DoubleKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_DoubleKeyFrame_Interface
      ; items : Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_DoubleKeyFrame : aliased constant Windows.IID := (3620462114, 34495, 22319, (132, 115, 7, 157, 21, 7, 108, 62 ));
   
   ------------------------------------------------------------------------
   type IIterable_DoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DoubleKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_DoubleKeyFrame : aliased constant Windows.IID := (1595307738, 41989, 23418, (186, 241, 150, 141, 228, 57, 31, 183 ));
   
   ------------------------------------------------------------------------
   type IVector_ObjectKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ObjectKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ObjectKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ObjectKeyFrame_Interface
      ; items : Windows.UI.Xaml.Media.Animation.IObjectKeyFrame_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ObjectKeyFrame : aliased constant Windows.IID := (1601387839, 29350, 21251, (151, 39, 43, 3, 234, 231, 221, 76 ));
   
   ------------------------------------------------------------------------
   type IIterable_ObjectKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ObjectKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ObjectKeyFrame : aliased constant Windows.IID := (2424613089, 36685, 24035, (177, 198, 229, 240, 87, 36, 202, 237 ));
   
   ------------------------------------------------------------------------
   type IVector_Timeline_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Timeline_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Timeline_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Timeline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Timeline_Interface
      ; value : Windows.UI.Xaml.Media.Animation.ITimeline
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Timeline_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Timeline_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Timeline_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Timeline_Interface
      ; value : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Timeline_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Timeline_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Timeline_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.ITimeline_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Timeline_Interface
      ; items : Windows.UI.Xaml.Media.Animation.ITimeline_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Timeline : aliased constant Windows.IID := (537249785, 51159, 21019, (168, 28, 44, 157, 173, 119, 169, 232 ));
   
   ------------------------------------------------------------------------
   type IIterable_Timeline_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Timeline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Timeline : aliased constant Windows.IID := (2703401798, 59093, 23636, (133, 125, 3, 142, 96, 245, 217, 193 ));
   
   ------------------------------------------------------------------------
   type IDoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IDoubleKeyFrame_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IDoubleKeyFrame_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleKeyFrame : aliased constant Windows.IID := (1732531965, 59422, 20302, (180, 173, 10, 207, 237, 158, 205, 104 ));
   
   ------------------------------------------------------------------------
   type IDoubleKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueProperty
   (
      This       : access IDoubleKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTimeProperty
   (
      This       : access IDoubleKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleKeyFrameStatics : aliased constant Windows.IID := (843465136, 32055, 17018, (173, 235, 67, 243, 139, 182, 26, 77 ));
   
   ------------------------------------------------------------------------
   type IDoubleKeyFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDoubleKeyFrameFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleKeyFrameFactory : aliased constant Windows.IID := (2895634115, 30008, 16569, (177, 82, 105, 111, 127, 191, 71, 34 ));
   
   ------------------------------------------------------------------------
   type IEasingFunctionBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingMode
   (
      This       : access IEasingFunctionBase_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.EasingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingMode
   (
      This       : access IEasingFunctionBase_Interface
      ; value : Windows.UI.Xaml.Media.Animation.EasingMode
   )
   return Windows.HRESULT is abstract;
   
   function Ease
   (
      This       : access IEasingFunctionBase_Interface
      ; normalizedTime : Windows.Double
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingFunctionBase : aliased constant Windows.IID := (3238541375, 11266, 16721, (142, 205, 104, 221, 170, 63, 13, 155 ));
   
   ------------------------------------------------------------------------
   type IEasingFunctionBaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingModeProperty
   (
      This       : access IEasingFunctionBaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingFunctionBaseStatics : aliased constant Windows.IID := (709898666, 11344, 18973, (187, 4, 215, 94, 7, 183, 21, 72 ));
   
   ------------------------------------------------------------------------
   type IEasingFunctionBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IEasingFunctionBaseFactory : aliased constant Windows.IID := (405864042, 61467, 17376, (182, 31, 180, 82, 161, 198, 111, 210 ));
   
   ------------------------------------------------------------------------
   type IKeySpline_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ControlPoint1
   (
      This       : access IKeySpline_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_ControlPoint1
   (
      This       : access IKeySpline_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlPoint2
   (
      This       : access IKeySpline_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_ControlPoint2
   (
      This       : access IKeySpline_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IKeySpline : aliased constant Windows.IID := (2007065531, 54730, 18994, (186, 11, 125, 255, 152, 142, 88, 160 ));
   
   ------------------------------------------------------------------------
   type INavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   IID_INavigationTransitionInfo : aliased constant Windows.IID := (2846904465, 44618, 17266, (134, 37, 33, 183, 168, 185, 140, 164 ));
   
   ------------------------------------------------------------------------
   type INavigationTransitionInfoOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function GetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface
      ; navigationState : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_INavigationTransitionInfoOverrides : aliased constant Windows.IID := (3645996650, 43472, 19447, (157, 176, 70, 51, 166, 157, 175, 242 ));
   
   ------------------------------------------------------------------------
   type INavigationTransitionInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access INavigationTransitionInfoFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_INavigationTransitionInfoFactory : aliased constant Windows.IID := (3992254677, 44899, 20395, (157, 74, 135, 146, 127, 130, 221, 107 ));
   
   ------------------------------------------------------------------------
   type IObjectKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IObjectKeyFrame_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IObjectKeyFrame_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTime
   (
      This       : access IObjectKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTime
   (
      This       : access IObjectKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectKeyFrame : aliased constant Windows.IID := (2555553873, 34195, 18670, (166, 164, 213, 212, 114, 15, 2, 154 ));
   
   ------------------------------------------------------------------------
   type IObjectKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueProperty
   (
      This       : access IObjectKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTimeProperty
   (
      This       : access IObjectKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectKeyFrameStatics : aliased constant Windows.IID := (752265984, 21273, 17030, (142, 237, 78, 117, 94, 160, 207, 156 ));
   
   ------------------------------------------------------------------------
   type IObjectKeyFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IObjectKeyFrameFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectKeyFrameFactory : aliased constant Windows.IID := (371594302, 15981, 17624, (155, 154, 4, 174, 167, 15, 132, 146 ));
   
   ------------------------------------------------------------------------
   type ITimeline_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoReverse
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoReverse
   (
      This       : access ITimeline_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BeginTime
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_BeginTime
   (
      This       : access ITimeline_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access ITimeline_Interface
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeedRatio
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SpeedRatio
   (
      This       : access ITimeline_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FillBehavior
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_FillBehavior
   (
      This       : access ITimeline_Interface
      ; value : Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_RepeatBehavior
   (
      This       : access ITimeline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_RepeatBehavior
   (
      This       : access ITimeline_Interface
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access ITimeline_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access ITimeline_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimeline : aliased constant Windows.IID := (197420508, 48717, 19725, (149, 73, 34, 8, 183, 21, 244, 13 ));
   
   ------------------------------------------------------------------------
   type ITimelineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowDependentAnimations
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowDependentAnimations
   (
      This       : access ITimelineStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoReverseProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_BeginTimeProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DurationProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeedRatioProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FillBehaviorProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RepeatBehaviorProperty
   (
      This       : access ITimelineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimelineStatics : aliased constant Windows.IID := (2835541326, 61200, 19823, (154, 64, 147, 203, 136, 149, 244, 229 ));
   
   ------------------------------------------------------------------------
   type ITimelineFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ITimelineFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimelineFactory : aliased constant Windows.IID := (492223239, 48548, 18315, (138, 218, 235, 4, 213, 128, 205, 94 ));
   
   ------------------------------------------------------------------------
   type ITransition_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITransition : aliased constant Windows.IID := (1013415036, 464, 19918, (179, 51, 151, 111, 147, 49, 43, 8 ));
   
   ------------------------------------------------------------------------
   type ITransitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITransitionFactory : aliased constant Windows.IID := (3701125839, 15305, 17578, (179, 252, 136, 58, 131, 35, 58, 44 ));
   
   ------------------------------------------------------------------------
   type IAddDeleteThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IAddDeleteThemeTransition : aliased constant Windows.IID := (2917958958, 17444, 19883, (153, 193, 58, 4, 227, 106, 60, 72 ));
   
   ------------------------------------------------------------------------
   type IBackEase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Amplitude
   (
      This       : access IBackEase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Amplitude
   (
      This       : access IBackEase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackEase : aliased constant Windows.IID := (3833042663, 63493, 19087, (129, 201, 56, 230, 71, 44, 170, 148 ));
   
   ------------------------------------------------------------------------
   type IBackEaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AmplitudeProperty
   (
      This       : access IBackEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackEaseStatics : aliased constant Windows.IID := (1014014719, 41120, 18310, (146, 108, 34, 50, 31, 143, 37, 183 ));
   
   ------------------------------------------------------------------------
   type IBeginStoryboard_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Storyboard
   (
      This       : access IBeginStoryboard_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   function put_Storyboard
   (
      This       : access IBeginStoryboard_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   IID_IBeginStoryboard : aliased constant Windows.IID := (1679335373, 18924, 20050, (166, 246, 85, 50, 76, 146, 16, 83 ));
   
   ------------------------------------------------------------------------
   type IBeginStoryboardStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StoryboardProperty
   (
      This       : access IBeginStoryboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBeginStoryboardStatics : aliased constant Windows.IID := (315617676, 43665, 19530, (184, 47, 223, 52, 252, 87, 249, 75 ));
   
   ------------------------------------------------------------------------
   type IBounceEase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bounces
   (
      This       : access IBounceEase_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounces
   (
      This       : access IBounceEase_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounciness
   (
      This       : access IBounceEase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounciness
   (
      This       : access IBounceEase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IBounceEase : aliased constant Windows.IID := (737232462, 64625, 18413, (133, 161, 59, 169, 87, 119, 24, 180 ));
   
   ------------------------------------------------------------------------
   type IBounceEaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BouncesProperty
   (
      This       : access IBounceEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_BouncinessProperty
   (
      This       : access IBounceEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBounceEaseStatics : aliased constant Windows.IID := (3228573090, 20339, 16841, (178, 203, 46, 163, 16, 81, 7, 255 ));
   
   ------------------------------------------------------------------------
   type ICircleEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICircleEase : aliased constant Windows.IID := (1403239858, 37239, 20078, (160, 67, 80, 130, 216, 137, 171, 31 ));
   
   ------------------------------------------------------------------------
   type IColorAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_From
   (
      This       : access IColorAnimation_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IColorAnimation_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access IColorAnimation_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access IColorAnimation_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_By
   (
      This       : access IColorAnimation_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_By
   (
      This       : access IColorAnimation_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunction
   (
      This       : access IColorAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IColorAnimation_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IColorAnimation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IColorAnimation_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorAnimation : aliased constant Windows.IID := (3098446357, 3939, 18068, (148, 103, 189, 175, 172, 18, 83, 234 ));
   
   ------------------------------------------------------------------------
   type IColorAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromProperty
   (
      This       : access IColorAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToProperty
   (
      This       : access IColorAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ByProperty
   (
      This       : access IColorAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunctionProperty
   (
      This       : access IColorAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IColorAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorAnimationStatics : aliased constant Windows.IID := (1441461986, 34787, 20296, (149, 143, 133, 91, 47, 158, 169, 236 ));
   
   ------------------------------------------------------------------------
   type IContentThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalOffset
   (
      This       : access IContentThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalOffset
   (
      This       : access IContentThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffset
   (
      This       : access IContentThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_VerticalOffset
   (
      This       : access IContentThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentThemeTransition : aliased constant Windows.IID := (4134520259, 22805, 17277, (142, 59, 173, 248, 231, 240, 171, 87 ));
   
   ------------------------------------------------------------------------
   type IContentThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalOffsetProperty
   (
      This       : access IContentThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalOffsetProperty
   (
      This       : access IContentThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentThemeTransitionStatics : aliased constant Windows.IID := (244245381, 39490, 17497, (175, 169, 51, 125, 196, 30, 21, 135 ));
   
   ------------------------------------------------------------------------
   type ICubicEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICubicEase : aliased constant Windows.IID := (462748790, 56023, 17236, (177, 162, 121, 105, 251, 246, 167, 13 ));
   
   ------------------------------------------------------------------------
   type IDiscreteDoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IDiscreteDoubleKeyFrame : aliased constant Windows.IID := (4126482234, 44305, 18894, (142, 28, 8, 253, 241, 68, 116, 70 ));
   
   ------------------------------------------------------------------------
   type IDiscreteObjectKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IDiscreteObjectKeyFrame : aliased constant Windows.IID := (3353140873, 61741, 19100, (129, 153, 231, 169, 236, 227, 164, 115 ));
   
   ------------------------------------------------------------------------
   type IDoubleAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_From
   (
      This       : access IDoubleAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IDoubleAnimation_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access IDoubleAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access IDoubleAnimation_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_By
   (
      This       : access IDoubleAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_By
   (
      This       : access IDoubleAnimation_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunction
   (
      This       : access IDoubleAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IDoubleAnimation_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IDoubleAnimation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IDoubleAnimation_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleAnimation : aliased constant Windows.IID := (2124365145, 3847, 19401, (151, 125, 3, 118, 63, 248, 21, 79 ));
   
   ------------------------------------------------------------------------
   type IDoubleAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromProperty
   (
      This       : access IDoubleAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToProperty
   (
      This       : access IDoubleAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ByProperty
   (
      This       : access IDoubleAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunctionProperty
   (
      This       : access IDoubleAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IDoubleAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleAnimationStatics : aliased constant Windows.IID := (3799683933, 61713, 17335, (184, 36, 131, 43, 88, 215, 120, 107 ));
   
   ------------------------------------------------------------------------
   type IDoubleAnimationUsingKeyFrames_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyFrames
   (
      This       : access IDoubleAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_DoubleKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IDoubleAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IDoubleAnimationUsingKeyFrames_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleAnimationUsingKeyFrames : aliased constant Windows.IID := (1341022863, 49134, 20341, (131, 194, 169, 59, 57, 72, 132, 115 ));
   
   ------------------------------------------------------------------------
   type IDoubleAnimationUsingKeyFramesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IDoubleAnimationUsingKeyFramesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDoubleAnimationUsingKeyFramesStatics : aliased constant Windows.IID := (278655734, 50703, 18858, (171, 246, 246, 150, 212, 146, 17, 107 ));
   
   ------------------------------------------------------------------------
   type IEasingDoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunction
   (
      This       : access IEasingDoubleKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IEasingDoubleKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingDoubleKeyFrame : aliased constant Windows.IID := (2522536845, 39508, 16648, (180, 255, 181, 165, 33, 44, 179, 56 ));
   
   ------------------------------------------------------------------------
   type IEasingDoubleKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunctionProperty
   (
      This       : access IEasingDoubleKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingDoubleKeyFrameStatics : aliased constant Windows.IID := (3369326661, 56238, 20059, (139, 132, 217, 83, 115, 152, 229, 177 ));
   
   ------------------------------------------------------------------------
   type IEdgeUIThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Edge
   (
      This       : access IEdgeUIThemeTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
   )
   return Windows.HRESULT is abstract;
   
   function put_Edge
   (
      This       : access IEdgeUIThemeTransition_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
   )
   return Windows.HRESULT is abstract;
   
   IID_IEdgeUIThemeTransition : aliased constant Windows.IID := (1552335259, 18903, 6636, (207, 25, 131, 167, 60, 109, 231, 94 ));
   
   ------------------------------------------------------------------------
   type IEdgeUIThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EdgeProperty
   (
      This       : access IEdgeUIThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEdgeUIThemeTransitionStatics : aliased constant Windows.IID := (379760955, 18181, 12331, (39, 198, 42, 172, 146, 246, 69, 172 ));
   
   ------------------------------------------------------------------------
   type IElasticEase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Oscillations
   (
      This       : access IElasticEase_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Oscillations
   (
      This       : access IElasticEase_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Springiness
   (
      This       : access IElasticEase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Springiness
   (
      This       : access IElasticEase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IElasticEase : aliased constant Windows.IID := (4015760780, 45238, 19052, (156, 168, 251, 66, 51, 241, 36, 89 ));
   
   ------------------------------------------------------------------------
   type IElasticEaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OscillationsProperty
   (
      This       : access IElasticEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SpringinessProperty
   (
      This       : access IElasticEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IElasticEaseStatics : aliased constant Windows.IID := (2851432172, 65180, 19243, (142, 82, 187, 120, 93, 86, 33, 133 ));
   
   ------------------------------------------------------------------------
   type IEntranceThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromHorizontalOffset
   (
      This       : access IEntranceThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromHorizontalOffset
   (
      This       : access IEntranceThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access IEntranceThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromVerticalOffset
   (
      This       : access IEntranceThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStaggeringEnabled
   (
      This       : access IEntranceThemeTransition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsStaggeringEnabled
   (
      This       : access IEntranceThemeTransition_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IEntranceThemeTransition : aliased constant Windows.IID := (124357641, 43235, 16794, (160, 29, 116, 16, 160, 174, 142, 200 ));
   
   ------------------------------------------------------------------------
   type IEntranceThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromHorizontalOffsetProperty
   (
      This       : access IEntranceThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffsetProperty
   (
      This       : access IEntranceThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStaggeringEnabledProperty
   (
      This       : access IEntranceThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEntranceThemeTransitionStatics : aliased constant Windows.IID := (936117623, 65432, 19181, (184, 110, 94, 194, 55, 2, 248, 119 ));
   
   ------------------------------------------------------------------------
   type IExponentialEase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exponent
   (
      This       : access IExponentialEase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Exponent
   (
      This       : access IExponentialEase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IExponentialEase : aliased constant Windows.IID := (2092557341, 61627, 19402, (157, 165, 155, 163, 161, 23, 52, 196 ));
   
   ------------------------------------------------------------------------
   type IExponentialEaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExponentProperty
   (
      This       : access IExponentialEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IExponentialEaseStatics : aliased constant Windows.IID := (4085180387, 42849, 17234, (154, 214, 112, 121, 69, 103, 88, 26 ));
   
   ------------------------------------------------------------------------
   type ILinearDoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILinearDoubleKeyFrame : aliased constant Windows.IID := (2399007333, 39547, 17181, (143, 12, 20, 197, 107, 94, 164, 217 ));
   
   ------------------------------------------------------------------------
   type IObjectAnimationUsingKeyFrames_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyFrames
   (
      This       : access IObjectAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_ObjectKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IObjectAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IObjectAnimationUsingKeyFrames_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectAnimationUsingKeyFrames : aliased constant Windows.IID := (860499346, 46922, 19556, (185, 166, 88, 188, 250, 49, 79, 34 ));
   
   ------------------------------------------------------------------------
   type IObjectAnimationUsingKeyFramesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IObjectAnimationUsingKeyFramesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectAnimationUsingKeyFramesStatics : aliased constant Windows.IID := (3950207362, 27377, 18851, (151, 182, 120, 62, 217, 116, 0, 254 ));
   
   ------------------------------------------------------------------------
   type IPaneThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Edge
   (
      This       : access IPaneThemeTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
   )
   return Windows.HRESULT is abstract;
   
   function put_Edge
   (
      This       : access IPaneThemeTransition_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaneThemeTransition : aliased constant Windows.IID := (1191766926, 19452, 60998, (212, 249, 112, 141, 239, 63, 187, 43 ));
   
   ------------------------------------------------------------------------
   type IPaneThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EdgeProperty
   (
      This       : access IPaneThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaneThemeTransitionStatics : aliased constant Windows.IID := (829110319, 19428, 6039, (180, 92, 205, 144, 11, 190, 12, 170 ));
   
   ------------------------------------------------------------------------
   type IPointAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_From
   (
      This       : access IPointAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IPointAnimation_Interface
      ; value : Windows.Foundation.IReference_Point
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access IPointAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access IPointAnimation_Interface
      ; value : Windows.Foundation.IReference_Point
   )
   return Windows.HRESULT is abstract;
   
   function get_By
   (
      This       : access IPointAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_By
   (
      This       : access IPointAnimation_Interface
      ; value : Windows.Foundation.IReference_Point
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunction
   (
      This       : access IPointAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IPointAnimation_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IPointAnimation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IPointAnimation_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointAnimation : aliased constant Windows.IID := (821052178, 30502, 20360, (184, 226, 47, 165, 69, 24, 150, 59 ));
   
   ------------------------------------------------------------------------
   type IPointAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromProperty
   (
      This       : access IPointAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToProperty
   (
      This       : access IPointAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ByProperty
   (
      This       : access IPointAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EasingFunctionProperty
   (
      This       : access IPointAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IPointAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointAnimationStatics : aliased constant Windows.IID := (798602070, 59191, 16523, (160, 253, 50, 120, 38, 211, 34, 85 ));
   
   ------------------------------------------------------------------------
   type IPopupThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromHorizontalOffset
   (
      This       : access IPopupThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromHorizontalOffset
   (
      This       : access IPopupThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access IPopupThemeTransition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromVerticalOffset
   (
      This       : access IPopupThemeTransition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopupThemeTransition : aliased constant Windows.IID := (1199846738, 17027, 21598, (199, 145, 38, 141, 202, 34, 206, 75 ));
   
   ------------------------------------------------------------------------
   type IPopupThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FromHorizontalOffsetProperty
   (
      This       : access IPopupThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffsetProperty
   (
      This       : access IPopupThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopupThemeTransitionStatics : aliased constant Windows.IID := (3852559374, 18701, 5381, (159, 107, 143, 175, 192, 68, 222, 197 ));
   
   ------------------------------------------------------------------------
   type IPowerEase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Power
   (
      This       : access IPowerEase_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Power
   (
      This       : access IPowerEase_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IPowerEase : aliased constant Windows.IID := (1774716281, 61151, 16475, (134, 128, 217, 96, 104, 128, 201, 55 ));
   
   ------------------------------------------------------------------------
   type IPowerEaseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PowerProperty
   (
      This       : access IPowerEaseStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPowerEaseStatics : aliased constant Windows.IID := (2778026243, 37282, 17932, (156, 65, 210, 143, 106, 147, 155, 218 ));
   
   ------------------------------------------------------------------------
   type IQuadraticEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IQuadraticEase : aliased constant Windows.IID := (3780185745, 61293, 17648, (128, 61, 104, 209, 109, 224, 221, 252 ));
   
   ------------------------------------------------------------------------
   type IQuarticEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IQuarticEase : aliased constant Windows.IID := (3899230228, 65090, 18949, (181, 184, 8, 31, 65, 21, 120, 21 ));
   
   ------------------------------------------------------------------------
   type IQuinticEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IQuinticEase : aliased constant Windows.IID := (2465102139, 15433, 16648, (170, 17, 171, 120, 102, 3, 218, 33 ));
   
   ------------------------------------------------------------------------
   type IReorderThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IReorderThemeTransition : aliased constant Windows.IID := (4060503148, 53330, 19153, (131, 98, 183, 27, 54, 223, 116, 151 ));
   
   ------------------------------------------------------------------------
   type IRepositionThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IRepositionThemeTransition : aliased constant Windows.IID := (2285017986, 39155, 17754, (172, 83, 46, 112, 131, 182, 226, 44 ));
   
   ------------------------------------------------------------------------
   type IRepositionThemeTransition2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStaggeringEnabled
   (
      This       : access IRepositionThemeTransition2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsStaggeringEnabled
   (
      This       : access IRepositionThemeTransition2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepositionThemeTransition2 : aliased constant Windows.IID := (3468683364, 56298, 17412, (142, 110, 222, 85, 173, 167, 82, 57 ));
   
   ------------------------------------------------------------------------
   type IRepositionThemeTransitionStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStaggeringEnabledProperty
   (
      This       : access IRepositionThemeTransitionStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepositionThemeTransitionStatics2 : aliased constant Windows.IID := (2453727536, 2585, 18059, (140, 42, 104, 250, 180, 80, 0, 39 ));
   
   ------------------------------------------------------------------------
   type ISineEase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ISineEase : aliased constant Windows.IID := (2839030114, 8971, 18906, (158, 13, 102, 73, 135, 137, 35, 67 ));
   
   ------------------------------------------------------------------------
   type ISplineDoubleKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySpline
   (
      This       : access ISplineDoubleKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   function put_KeySpline
   (
      This       : access ISplineDoubleKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplineDoubleKeyFrame : aliased constant Windows.IID := (14101816, 27435, 18499, (131, 142, 200, 177, 21, 238, 200, 1 ));
   
   ------------------------------------------------------------------------
   type ISplineDoubleKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySplineProperty
   (
      This       : access ISplineDoubleKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplineDoubleKeyFrameStatics : aliased constant Windows.IID := (101355516, 38751, 20046, (158, 199, 19, 197, 174, 224, 32, 98 ));
   
   ------------------------------------------------------------------------
   type IStoryboard_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Children
   (
      This       : access IStoryboard_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_Timeline
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IStoryboard_Interface
      ; offset : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IStoryboard_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Begin_x
   (
      This       : access IStoryboard_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IStoryboard_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access IStoryboard_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentState
   (
      This       : access IStoryboard_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.ClockState
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentTime
   (
      This       : access IStoryboard_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SeekAlignedToLastTick
   (
      This       : access IStoryboard_Interface
      ; offset : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SkipToFill
   (
      This       : access IStoryboard_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoryboard : aliased constant Windows.IID := (3562806894, 13716, 17934, (152, 26, 50, 39, 27, 211, 170, 6 ));
   
   ------------------------------------------------------------------------
   type IStoryboardStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetPropertyProperty
   (
      This       : access IStoryboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetTargetProperty
   (
      This       : access IStoryboardStatics_Interface
      ; element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTargetProperty
   (
      This       : access IStoryboardStatics_Interface
      ; element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; path : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetNameProperty
   (
      This       : access IStoryboardStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetTargetName
   (
      This       : access IStoryboardStatics_Interface
      ; element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTargetName
   (
      This       : access IStoryboardStatics_Interface
      ; element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTarget
   (
      This       : access IStoryboardStatics_Interface
      ; timeline : Windows.UI.Xaml.Media.Animation.ITimeline
      ; target : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoryboardStatics : aliased constant Windows.IID := (3626960856, 29653, 17273, (189, 72, 126, 5, 24, 74, 139, 173 ));
   
   ------------------------------------------------------------------------
   type IVector_ColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IColorKeyFrame
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ColorKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ColorKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.IColorKeyFrame_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ColorKeyFrame_Interface
      ; items : Windows.UI.Xaml.Media.Animation.IColorKeyFrame_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ColorKeyFrame : aliased constant Windows.IID := (2463256504, 44884, 20864, (152, 136, 87, 86, 86, 106, 19, 255 ));
   
   ------------------------------------------------------------------------
   type IIterable_ColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ColorKeyFrame : aliased constant Windows.IID := (408542472, 22573, 20956, (130, 161, 70, 97, 17, 202, 249, 68 ));
   
   ------------------------------------------------------------------------
   type IConnectedAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Completed
   (
      This       : access IConnectedAnimation_Interface
      ; value : TypedEventHandler_IConnectedAnimation_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IConnectedAnimation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryStart
   (
      This       : access IConnectedAnimation_Interface
      ; destination : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Cancel
   (
      This       : access IConnectedAnimation_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IConnectedAnimation : aliased constant Windows.IID := (890790540, 62343, 19493, (172, 152, 68, 232, 108, 60, 173, 240 ));
   
   ------------------------------------------------------------------------
   type IConnectedAnimation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsScaleAnimationEnabled
   (
      This       : access IConnectedAnimation2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsScaleAnimationEnabled
   (
      This       : access IConnectedAnimation2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryStartWithCoordinatedElements
   (
      This       : access IConnectedAnimation2_Interface
      ; destination : Windows.UI.Xaml.IUIElement
      ; coordinatedElements : Windows.UI.Xaml.IIterable_IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAnimationComponent
   (
      This       : access IConnectedAnimation2_Interface
      ; component : Windows.UI.Xaml.Media.Animation.ConnectedAnimationComponent
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IConnectedAnimation2 : aliased constant Windows.IID := (1563397724, 22603, 19933, (182, 104, 151, 56, 145, 67, 20, 89 ));
   
   ------------------------------------------------------------------------
   type IConnectedAnimationService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultDuration
   (
      This       : access IConnectedAnimationService_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultDuration
   (
      This       : access IConnectedAnimationService_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultEasingFunction
   (
      This       : access IConnectedAnimationService_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultEasingFunction
   (
      This       : access IConnectedAnimationService_Interface
      ; value : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   function PrepareToAnimate
   (
      This       : access IConnectedAnimationService_Interface
      ; key : Windows.String
      ; source : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IConnectedAnimation
   )
   return Windows.HRESULT is abstract;
   
   function GetAnimation
   (
      This       : access IConnectedAnimationService_Interface
      ; key : Windows.String
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IConnectedAnimation
   )
   return Windows.HRESULT is abstract;
   
   IID_IConnectedAnimationService : aliased constant Windows.IID := (476607945, 6587, 19783, (185, 170, 102, 200, 2, 220, 185, 255 ));
   
   ------------------------------------------------------------------------
   type IConnectedAnimationServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IConnectedAnimationServiceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IConnectedAnimationService
   )
   return Windows.HRESULT is abstract;
   
   IID_IConnectedAnimationServiceStatics : aliased constant Windows.IID := (3339161253, 54920, 16616, (143, 144, 150, 166, 39, 146, 115, 210 ));
   
   ------------------------------------------------------------------------
   type IVector_PointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_PointKeyFrame_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_PointKeyFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_PointKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_PointKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IPointKeyFrame
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_PointKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_PointKeyFrame_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_PointKeyFrame_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_PointKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_PointKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_PointKeyFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_PointKeyFrame_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Media.Animation.IPointKeyFrame_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_PointKeyFrame_Interface
      ; items : Windows.UI.Xaml.Media.Animation.IPointKeyFrame_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_PointKeyFrame : aliased constant Windows.IID := (2977834718, 40151, 21590, (190, 224, 73, 136, 42, 135, 249, 69 ));
   
   ------------------------------------------------------------------------
   type IIterable_PointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PointKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_PointKeyFrame : aliased constant Windows.IID := (3101576649, 35945, 22003, (175, 88, 4, 15, 19, 25, 100, 156 ));
   
   ------------------------------------------------------------------------
   type IColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IColorKeyFrame_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTime
   (
      This       : access IColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTime
   (
      This       : access IColorKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorKeyFrame : aliased constant Windows.IID := (3038610137, 2320, 17801, (162, 132, 176, 201, 32, 88, 88, 233 ));
   
   ------------------------------------------------------------------------
   type IColorKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueProperty
   (
      This       : access IColorKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTimeProperty
   (
      This       : access IColorKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorKeyFrameStatics : aliased constant Windows.IID := (3225661081, 8460, 17167, (157, 165, 223, 16, 130, 105, 32, 85 ));
   
   ------------------------------------------------------------------------
   type IColorKeyFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IColorKeyFrameFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorKeyFrameFactory : aliased constant Windows.IID := (1989925002, 40187, 19069, (150, 196, 161, 231, 222, 111, 219, 75 ));
   
   ------------------------------------------------------------------------
   type IPointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IPointKeyFrame_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IPointKeyFrame_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTime
   (
      This       : access IPointKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTime
   (
      This       : access IPointKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointKeyFrame : aliased constant Windows.IID := (4241001729, 32642, 19886, (128, 38, 123, 126, 8, 104, 120, 179 ));
   
   ------------------------------------------------------------------------
   type IPointKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueProperty
   (
      This       : access IPointKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTimeProperty
   (
      This       : access IPointKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointKeyFrameStatics : aliased constant Windows.IID := (2513378087, 31077, 19436, (185, 251, 251, 233, 75, 101, 81, 142 ));
   
   ------------------------------------------------------------------------
   type IPointKeyFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPointKeyFrameFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IPointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointKeyFrameFactory : aliased constant Windows.IID := (3407956959, 17002, 17298, (131, 85, 194, 174, 82, 133, 38, 35 ));
   
   ------------------------------------------------------------------------
   type IColorAnimationUsingKeyFrames_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyFrames
   (
      This       : access IColorAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_ColorKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IColorAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IColorAnimationUsingKeyFrames_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorAnimationUsingKeyFrames : aliased constant Windows.IID := (4123534912, 5059, 17066, (154, 226, 126, 107, 81, 201, 47, 149 ));
   
   ------------------------------------------------------------------------
   type IColorAnimationUsingKeyFramesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IColorAnimationUsingKeyFramesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IColorAnimationUsingKeyFramesStatics : aliased constant Windows.IID := (3027385564, 38633, 18681, (141, 146, 155, 100, 139, 47, 28, 198 ));
   
   ------------------------------------------------------------------------
   type IDiscreteColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IDiscreteColorKeyFrame : aliased constant Windows.IID := (587991284, 57442, 19633, (142, 42, 20, 9, 61, 115, 237, 140 ));
   
   ------------------------------------------------------------------------
   type IDiscretePointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IDiscretePointKeyFrame : aliased constant Windows.IID := (3769173773, 19522, 19088, (152, 58, 117, 245, 168, 58, 47, 190 ));
   
   ------------------------------------------------------------------------
   type IDragItemThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IDragItemThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IDragItemThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragItemThemeAnimation : aliased constant Windows.IID := (209542581, 32470, 18761, (180, 230, 167, 140, 159, 79, 151, 141 ));
   
   ------------------------------------------------------------------------
   type IDragItemThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IDragItemThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragItemThemeAnimationStatics : aliased constant Windows.IID := (1645787637, 314, 20401, (134, 252, 146, 188, 78, 141, 2, 65 ));
   
   ------------------------------------------------------------------------
   type IDragOverThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IDragOverThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IDragOverThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ToOffset
   (
      This       : access IDragOverThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ToOffset
   (
      This       : access IDragOverThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access IDragOverThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access IDragOverThemeAnimation_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragOverThemeAnimation : aliased constant Windows.IID := (1928815351, 32337, 19051, (185, 55, 220, 75, 76, 28, 84, 88 ));
   
   ------------------------------------------------------------------------
   type IDragOverThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IDragOverThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToOffsetProperty
   (
      This       : access IDragOverThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DirectionProperty
   (
      This       : access IDragOverThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragOverThemeAnimationStatics : aliased constant Windows.IID := (342883927, 15517, 16857, (165, 255, 141, 114, 57, 81, 104, 16 ));
   
   ------------------------------------------------------------------------
   type IDrillInThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EntranceTargetName
   (
      This       : access IDrillInThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EntranceTargetName
   (
      This       : access IDrillInThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EntranceTarget
   (
      This       : access IDrillInThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_EntranceTarget
   (
      This       : access IDrillInThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetName
   (
      This       : access IDrillInThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitTargetName
   (
      This       : access IDrillInThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTarget
   (
      This       : access IDrillInThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitTarget
   (
      This       : access IDrillInThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IDrillInThemeAnimation : aliased constant Windows.IID := (2962274340, 61906, 16824, (135, 186, 120, 3, 65, 38, 89, 76 ));
   
   ------------------------------------------------------------------------
   type IDrillInThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EntranceTargetNameProperty
   (
      This       : access IDrillInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EntranceTargetProperty
   (
      This       : access IDrillInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetNameProperty
   (
      This       : access IDrillInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetProperty
   (
      This       : access IDrillInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDrillInThemeAnimationStatics : aliased constant Windows.IID := (3323978888, 41338, 19217, (181, 59, 164, 241, 160, 125, 75, 169 ));
   
   ------------------------------------------------------------------------
   type IDrillOutThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EntranceTargetName
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EntranceTargetName
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EntranceTarget
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_EntranceTarget
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetName
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitTargetName
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTarget
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitTarget
   (
      This       : access IDrillOutThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IDrillOutThemeAnimation : aliased constant Windows.IID := (3633368287, 1747, 20350, (142, 74, 79, 183, 110, 37, 97, 57 ));
   
   ------------------------------------------------------------------------
   type IDrillOutThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EntranceTargetNameProperty
   (
      This       : access IDrillOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_EntranceTargetProperty
   (
      This       : access IDrillOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetNameProperty
   (
      This       : access IDrillOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitTargetProperty
   (
      This       : access IDrillOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDrillOutThemeAnimationStatics : aliased constant Windows.IID := (3199589275, 9751, 18568, (128, 221, 114, 250, 123, 182, 250, 195 ));
   
   ------------------------------------------------------------------------
   type IDropTargetItemThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IDropTargetItemThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IDropTargetItemThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IDropTargetItemThemeAnimation : aliased constant Windows.IID := (411158888, 6180, 17963, (135, 232, 195, 87, 33, 43, 151, 123 ));
   
   ------------------------------------------------------------------------
   type IDropTargetItemThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IDropTargetItemThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IDropTargetItemThemeAnimationStatics : aliased constant Windows.IID := (2927686790, 11862, 17683, (191, 24, 215, 116, 112, 22, 74, 229 ));
   
   ------------------------------------------------------------------------
   type IEasingColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunction
   (
      This       : access IEasingColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IEasingColorKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingColorKeyFrame : aliased constant Windows.IID := (3342063152, 62649, 18740, (155, 221, 39, 172, 94, 209, 207, 216 ));
   
   ------------------------------------------------------------------------
   type IEasingColorKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunctionProperty
   (
      This       : access IEasingColorKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingColorKeyFrameStatics : aliased constant Windows.IID := (1865955324, 36413, 17698, (155, 15, 0, 61, 184, 96, 152, 81 ));
   
   ------------------------------------------------------------------------
   type IEasingPointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunction
   (
      This       : access IEasingPointKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_EasingFunction
   (
      This       : access IEasingPointKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingPointKeyFrame : aliased constant Windows.IID := (3016299392, 26728, 16933, (167, 11, 57, 129, 204, 11, 41, 71 ));
   
   ------------------------------------------------------------------------
   type IEasingPointKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EasingFunctionProperty
   (
      This       : access IEasingPointKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IEasingPointKeyFrameStatics : aliased constant Windows.IID := (3794649028, 2060, 16428, (166, 181, 244, 141, 10, 152, 17, 107 ));
   
   ------------------------------------------------------------------------
   type IFadeInThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IFadeInThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IFadeInThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFadeInThemeAnimation : aliased constant Windows.IID := (1833683189, 43288, 17527, (128, 120, 85, 76, 104, 129, 42, 184 ));
   
   ------------------------------------------------------------------------
   type IFadeInThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IFadeInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IFadeInThemeAnimationStatics : aliased constant Windows.IID := (2130778081, 48809, 18723, (178, 58, 13, 223, 77, 123, 135, 55 ));
   
   ------------------------------------------------------------------------
   type IFadeOutThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IFadeOutThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IFadeOutThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFadeOutThemeAnimation : aliased constant Windows.IID := (2301062057, 65492, 17846, (155, 154, 206, 212, 137, 81, 231, 18 ));
   
   ------------------------------------------------------------------------
   type IFadeOutThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IFadeOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IFadeOutThemeAnimationStatics : aliased constant Windows.IID := (4262963226, 16744, 20328, (162, 140, 229, 221, 152, 207, 104, 15 ));
   
   ------------------------------------------------------------------------
   type ILinearColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILinearColorKeyFrame : aliased constant Windows.IID := (1727903471, 44161, 17937, (177, 210, 97, 245, 69, 152, 63, 3 ));
   
   ------------------------------------------------------------------------
   type ILinearPointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILinearPointKeyFrame : aliased constant Windows.IID := (3888756975, 44836, 18926, (132, 241, 168, 102, 0, 164, 227, 25 ));
   
   ------------------------------------------------------------------------
   type IPointAnimationUsingKeyFrames_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyFrames
   (
      This       : access IPointAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_PointKeyFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableDependentAnimation
   (
      This       : access IPointAnimationUsingKeyFrames_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableDependentAnimation
   (
      This       : access IPointAnimationUsingKeyFrames_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointAnimationUsingKeyFrames : aliased constant Windows.IID := (2610188146, 17514, 16848, (161, 41, 65, 166, 32, 244, 89, 93 ));
   
   ------------------------------------------------------------------------
   type IPointAnimationUsingKeyFramesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableDependentAnimationProperty
   (
      This       : access IPointAnimationUsingKeyFramesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointAnimationUsingKeyFramesStatics : aliased constant Windows.IID := (1598377095, 9104, 18154, (186, 167, 118, 47, 75, 195, 13, 4 ));
   
   ------------------------------------------------------------------------
   type IPointerDownThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IPointerDownThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IPointerDownThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerDownThemeAnimation : aliased constant Windows.IID := (3046011214, 50333, 18312, (162, 51, 10, 232, 93, 153, 221, 90 ));
   
   ------------------------------------------------------------------------
   type IPointerDownThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IPointerDownThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerDownThemeAnimationStatics : aliased constant Windows.IID := (1671940987, 27974, 17556, (185, 74, 231, 47, 59, 73, 42, 97 ));
   
   ------------------------------------------------------------------------
   type IPointerUpThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IPointerUpThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IPointerUpThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerUpThemeAnimation : aliased constant Windows.IID := (3924414589, 25408, 18472, (173, 18, 105, 6, 148, 185, 145, 11 ));
   
   ------------------------------------------------------------------------
   type IPointerUpThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IPointerUpThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerUpThemeAnimationStatics : aliased constant Windows.IID := (2086768540, 31122, 16697, (139, 252, 8, 131, 185, 114, 122, 126 ));
   
   ------------------------------------------------------------------------
   type IPopInThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IPopInThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IPopInThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffset
   (
      This       : access IPopInThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromHorizontalOffset
   (
      This       : access IPopInThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access IPopInThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromVerticalOffset
   (
      This       : access IPopInThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopInThemeAnimation : aliased constant Windows.IID := (426326209, 7175, 19496, (136, 71, 249, 240, 85, 179, 40, 85 ));
   
   ------------------------------------------------------------------------
   type IPopInThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IPopInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffsetProperty
   (
      This       : access IPopInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffsetProperty
   (
      This       : access IPopInThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopInThemeAnimationStatics : aliased constant Windows.IID := (4020935123, 8586, 18177, (151, 127, 241, 191, 174, 139, 166, 73 ));
   
   ------------------------------------------------------------------------
   type IPopOutThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IPopOutThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IPopOutThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopOutThemeAnimation : aliased constant Windows.IID := (1200008009, 3656, 20097, (162, 229, 204, 90, 161, 158, 72, 211 ));
   
   ------------------------------------------------------------------------
   type IPopOutThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IPopOutThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPopOutThemeAnimationStatics : aliased constant Windows.IID := (491334665, 961, 17552, (153, 220, 144, 159, 234, 179, 87, 251 ));
   
   ------------------------------------------------------------------------
   type IRepositionThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access IRepositionThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access IRepositionThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffset
   (
      This       : access IRepositionThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromHorizontalOffset
   (
      This       : access IRepositionThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access IRepositionThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromVerticalOffset
   (
      This       : access IRepositionThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepositionThemeAnimation : aliased constant Windows.IID := (3973719272, 35141, 18761, (161, 191, 98, 16, 153, 101, 167, 233 ));
   
   ------------------------------------------------------------------------
   type IRepositionThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access IRepositionThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffsetProperty
   (
      This       : access IRepositionThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffsetProperty
   (
      This       : access IRepositionThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRepositionThemeAnimationStatics : aliased constant Windows.IID := (1301459377, 34315, 19449, (165, 157, 30, 177, 204, 190, 143, 224 ));
   
   ------------------------------------------------------------------------
   type ISplineColorKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySpline
   (
      This       : access ISplineColorKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   function put_KeySpline
   (
      This       : access ISplineColorKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplineColorKeyFrame : aliased constant Windows.IID := (441080129, 8160, 18234, (142, 254, 67, 22, 216, 200, 98, 41 ));
   
   ------------------------------------------------------------------------
   type ISplineColorKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySplineProperty
   (
      This       : access ISplineColorKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplineColorKeyFrameStatics : aliased constant Windows.IID := (1641142679, 34185, 20271, (143, 187, 125, 3, 237, 201, 141, 211 ));
   
   ------------------------------------------------------------------------
   type ISplinePointKeyFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySpline
   (
      This       : access ISplinePointKeyFrame_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   function put_KeySpline
   (
      This       : access ISplinePointKeyFrame_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IKeySpline
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplinePointKeyFrame : aliased constant Windows.IID := (253358854, 28726, 18767, (188, 60, 120, 13, 240, 204, 82, 74 ));
   
   ------------------------------------------------------------------------
   type ISplinePointKeyFrameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySplineProperty
   (
      This       : access ISplinePointKeyFrameStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplinePointKeyFrameStatics : aliased constant Windows.IID := (3917099714, 2682, 18278, (149, 203, 13, 105, 38, 17, 203, 76 ));
   
   ------------------------------------------------------------------------
   type ISplitCloseThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpenedTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTargetName
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTarget
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedLength
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedLength
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedLength
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedLength
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetFromCenter
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OffsetFromCenter
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationDirection
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTranslationDirection
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationOffset
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTranslationOffset
   (
      This       : access ISplitCloseThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplitCloseThemeAnimation : aliased constant Windows.IID := (1333368088, 65337, 20112, (187, 116, 42, 189, 86, 2, 116, 2 ));
   
   ------------------------------------------------------------------------
   type ISplitCloseThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpenedTargetNameProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedTargetProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetNameProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetNameProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedLengthProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedLengthProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetFromCenterProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationDirectionProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationOffsetProperty
   (
      This       : access ISplitCloseThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplitCloseThemeAnimationStatics : aliased constant Windows.IID := (2057915881, 52379, 20112, (161, 26, 0, 80, 162, 33, 106, 158 ));
   
   ------------------------------------------------------------------------
   type ISplitOpenThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpenedTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTargetName
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTarget
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedLength
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OpenedLength
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedLength
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedLength
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetFromCenter
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OffsetFromCenter
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationDirection
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTranslationDirection
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationOffset
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTranslationOffset
   (
      This       : access ISplitOpenThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplitOpenThemeAnimation : aliased constant Windows.IID := (2019547050, 21590, 17977, (143, 210, 38, 186, 230, 165, 255, 228 ));
   
   ------------------------------------------------------------------------
   type ISplitOpenThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OpenedTargetNameProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedTargetProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetNameProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedTargetProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetNameProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTargetProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OpenedLengthProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedLengthProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetFromCenterProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationDirectionProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTranslationOffsetProperty
   (
      This       : access ISplitOpenThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISplitOpenThemeAnimationStatics : aliased constant Windows.IID := (2370632329, 14993, 17805, (176, 251, 76, 173, 98, 92, 191, 141 ));
   
   ------------------------------------------------------------------------
   type ISwipeBackThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffset
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromHorizontalOffset
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffset
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FromVerticalOffset
   (
      This       : access ISwipeBackThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISwipeBackThemeAnimation : aliased constant Windows.IID := (2743747092, 3018, 19757, (149, 247, 206, 186, 87, 251, 175, 96 ));
   
   ------------------------------------------------------------------------
   type ISwipeBackThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access ISwipeBackThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromHorizontalOffsetProperty
   (
      This       : access ISwipeBackThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FromVerticalOffsetProperty
   (
      This       : access ISwipeBackThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISwipeBackThemeAnimationStatics : aliased constant Windows.IID := (1765749183, 19878, 18058, (140, 224, 153, 108, 154, 173, 66, 224 ));
   
   ------------------------------------------------------------------------
   type ISwipeHintThemeAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetName
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ToHorizontalOffset
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ToHorizontalOffset
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ToVerticalOffset
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ToVerticalOffset
   (
      This       : access ISwipeHintThemeAnimation_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISwipeHintThemeAnimation : aliased constant Windows.IID := (3452987328, 22542, 20032, (190, 152, 242, 2, 211, 216, 67, 101 ));
   
   ------------------------------------------------------------------------
   type ISwipeHintThemeAnimationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetNameProperty
   (
      This       : access ISwipeHintThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToHorizontalOffsetProperty
   (
      This       : access ISwipeHintThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ToVerticalOffsetProperty
   (
      This       : access ISwipeHintThemeAnimationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISwipeHintThemeAnimationStatics : aliased constant Windows.IID := (601234007, 37141, 19811, (176, 74, 184, 159, 28, 116, 77, 192 ));
   
   ------------------------------------------------------------------------
   type ICommonNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStaggeringEnabled
   (
      This       : access ICommonNavigationTransitionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsStaggeringEnabled
   (
      This       : access ICommonNavigationTransitionInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ICommonNavigationTransitionInfo : aliased constant Windows.IID := (1345607314, 42325, 17956, (163, 97, 10, 145, 193, 112, 100, 115 ));
   
   ------------------------------------------------------------------------
   type ICommonNavigationTransitionInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStaggeringEnabledProperty
   (
      This       : access ICommonNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStaggerElementProperty
   (
      This       : access ICommonNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsStaggerElement
   (
      This       : access ICommonNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsStaggerElement
   (
      This       : access ICommonNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ICommonNavigationTransitionInfoStatics : aliased constant Windows.IID := (507444787, 20670, 17475, (136, 60, 229, 98, 114, 1, 194, 229 ));
   
   ------------------------------------------------------------------------
   type IContinuumNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExitElement
   (
      This       : access IContinuumNavigationTransitionInfo_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitElement
   (
      This       : access IContinuumNavigationTransitionInfo_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   IID_IContinuumNavigationTransitionInfo : aliased constant Windows.IID := (1273093037, 35750, 16388, (132, 56, 138, 144, 23, 151, 133, 67 ));
   
   ------------------------------------------------------------------------
   type IContinuumNavigationTransitionInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExitElementProperty
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEntranceElementProperty
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsEntranceElement
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsEntranceElement
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsExitElementProperty
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsExitElement
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsExitElement
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitElementContainerProperty
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetExitElementContainer
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.Controls.IListViewBase
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetExitElementContainer
   (
      This       : access IContinuumNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.Controls.IListViewBase
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IContinuumNavigationTransitionInfoStatics : aliased constant Windows.IID := (1042668883, 45455, 19441, (179, 188, 146, 245, 22, 242, 153, 3 ));
   
   ------------------------------------------------------------------------
   type IDrillInNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IDrillInNavigationTransitionInfo : aliased constant Windows.IID := (998645786, 17875, 17979, (147, 158, 200, 89, 95, 67, 155, 204 ));
   
   ------------------------------------------------------------------------
   type IEntranceNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IEntranceNavigationTransitionInfo : aliased constant Windows.IID := (1913267563, 7306, 16878, (130, 236, 138, 135, 192, 207, 71, 218 ));
   
   ------------------------------------------------------------------------
   type IEntranceNavigationTransitionInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTargetElementProperty
   (
      This       : access IEntranceNavigationTransitionInfoStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsTargetElement
   (
      This       : access IEntranceNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsTargetElement
   (
      This       : access IEntranceNavigationTransitionInfoStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IEntranceNavigationTransitionInfoStatics : aliased constant Windows.IID := (4182295162, 16585, 18079, (143, 51, 191, 69, 200, 129, 31, 33 ));
   
   ------------------------------------------------------------------------
   type INavigationThemeTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultNavigationTransitionInfo
   (
      This       : access INavigationThemeTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultNavigationTransitionInfo
   (
      This       : access INavigationThemeTransition_Interface
      ; value : Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_INavigationThemeTransition : aliased constant Windows.IID := (2285077644, 20151, 16882, (135, 153, 158, 239, 10, 33, 59, 115 ));
   
   ------------------------------------------------------------------------
   type INavigationThemeTransitionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultNavigationTransitionInfoProperty
   (
      This       : access INavigationThemeTransitionStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_INavigationThemeTransitionStatics : aliased constant Windows.IID := (3928950496, 24160, 20366, (188, 175, 67, 20, 135, 162, 148, 171 ));
   
   ------------------------------------------------------------------------
   type ISlideNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ISlideNavigationTransitionInfo : aliased constant Windows.IID := (3601636727, 11779, 16479, (128, 237, 230, 43, 238, 243, 102, 143 ));
   
   ------------------------------------------------------------------------
   type ISuppressNavigationTransitionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ISuppressNavigationTransitionInfo : aliased constant Windows.IID := (609057548, 45495, 18545, (157, 62, 213, 98, 3, 163, 165, 180 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IConnectedAnimation_add_Completed_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Media.Animation.IConnectedAnimation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IConnectedAnimation_add_Completed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IConnectedAnimation_add_Completed_Interface
      ; sender : Windows.UI.Xaml.Media.Animation.IConnectedAnimation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IConnectedAnimation_add_Completed : aliased constant Windows.IID := (1154132458, 30104, 20858, (183, 142, 171, 210, 13, 147, 213, 135 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype KeyTimeHelper is Windows.UI.Xaml.Media.Animation.IKeyTimeHelper;
   subtype RepeatBehaviorHelper is Windows.UI.Xaml.Media.Animation.IRepeatBehaviorHelper;
   subtype TransitionCollection is Windows.UI.Xaml.Media.Animation.IVector_Transition;
   
   function CreateTransitionCollection return Windows.UI.Xaml.Media.Animation.IVector_Transition;
   
   subtype DoubleKeyFrameCollection is Windows.UI.Xaml.Media.Animation.IVector_DoubleKeyFrame;
   
   function CreateDoubleKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_DoubleKeyFrame;
   
   subtype ObjectKeyFrameCollection is Windows.UI.Xaml.Media.Animation.IVector_ObjectKeyFrame;
   
   function CreateObjectKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_ObjectKeyFrame;
   
   subtype TimelineCollection is Windows.UI.Xaml.Media.Animation.IVector_Timeline;
   
   function CreateTimelineCollection return Windows.UI.Xaml.Media.Animation.IVector_Timeline;
   
   subtype DoubleKeyFrame is Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame;
   
   type IDoubleKeyFrame_Interface_Impl is new IDoubleKeyFrame_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IDoubleKeyFrame := null;
      m_IDoubleKeyFrame : IDoubleKeyFrame := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IDoubleKeyFrame_Impl is access all IDoubleKeyFrame_Interface_Impl'Class;
   type IDoubleKeyFrame_Impl_Ptr is access all IDoubleKeyFrame_Impl;
   
   function QueryInterface
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IDoubleKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IDoubleKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Value
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Value
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   function put_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   subtype EasingFunctionBase is Windows.UI.Xaml.Media.Animation.IEasingFunctionBase;
   
   subtype KeySpline is Windows.UI.Xaml.Media.Animation.IKeySpline;
   
   function CreateKeySpline return Windows.UI.Xaml.Media.Animation.IKeySpline;
   
   subtype NavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo;
   
   type INavigationTransitionInfoOverrides_Interface_Impl is new INavigationTransitionInfoOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased INavigationTransitionInfoOverrides := null;
      m_INavigationTransitionInfo : INavigationTransitionInfo := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type INavigationTransitionInfoOverrides_Impl is access all INavigationTransitionInfoOverrides_Interface_Impl'Class;
   type INavigationTransitionInfoOverrides_Impl_Ptr is access all INavigationTransitionInfoOverrides_Impl;
   
   function QueryInterface
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function GetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function SetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
      ; navigationState : Windows.String
   )
   return Windows.HRESULT;
   
   type INavigationTransitionInfo_Interface_Impl is new INavigationTransitionInfo_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased INavigationTransitionInfo := null;
      m_INavigationTransitionInfo : INavigationTransitionInfo := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type INavigationTransitionInfo_Impl is access all INavigationTransitionInfo_Interface_Impl'Class;
   type INavigationTransitionInfo_Impl_Ptr is access all INavigationTransitionInfo_Impl;
   
   function QueryInterface
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access INavigationTransitionInfo_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access INavigationTransitionInfo_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype ObjectKeyFrame is Windows.UI.Xaml.Media.Animation.IObjectKeyFrame;
   
   type IObjectKeyFrame_Interface_Impl is new IObjectKeyFrame_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IObjectKeyFrame := null;
      m_IObjectKeyFrame : IObjectKeyFrame := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IObjectKeyFrame_Impl is access all IObjectKeyFrame_Interface_Impl'Class;
   type IObjectKeyFrame_Impl_Ptr is access all IObjectKeyFrame_Impl;
   
   function QueryInterface
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IObjectKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IObjectKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Value
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_Value
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function get_KeyTime
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   function put_KeyTime
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   subtype Timeline is Windows.UI.Xaml.Media.Animation.ITimeline;
   
   type ITimeline_Interface_Impl is new ITimeline_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ITimeline := null;
      m_ITimeline : ITimeline := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ITimeline_Impl is access all ITimeline_Interface_Impl'Class;
   type ITimeline_Impl_Ptr is access all ITimeline_Impl;
   
   function QueryInterface
   (
      This       : access ITimeline_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ITimeline_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ITimeline_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ITimeline_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ITimeline_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ITimeline_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_AutoReverse
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_AutoReverse
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_BeginTime
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function put_BeginTime
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT;
   
   function get_Duration
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT;
   
   function put_Duration
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT;
   
   function get_SpeedRatio
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_SpeedRatio
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_FillBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT;
   
   function put_FillBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT;
   
   function get_RepeatBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT;
   
   function put_RepeatBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT;
   
   function add_Completed
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Completed
   (
      This       : access ITimeline_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype Transition is Windows.UI.Xaml.Media.Animation.ITransition;
   
   subtype AddDeleteThemeTransition is Windows.UI.Xaml.Media.Animation.IAddDeleteThemeTransition;
   
   function CreateAddDeleteThemeTransition return Windows.UI.Xaml.Media.Animation.IAddDeleteThemeTransition;
   
   subtype BackEase is Windows.UI.Xaml.Media.Animation.IBackEase;
   
   function CreateBackEase return Windows.UI.Xaml.Media.Animation.IBackEase;
   
   subtype BeginStoryboard is Windows.UI.Xaml.Media.Animation.IBeginStoryboard;
   
   function CreateBeginStoryboard return Windows.UI.Xaml.Media.Animation.IBeginStoryboard;
   
   subtype BounceEase is Windows.UI.Xaml.Media.Animation.IBounceEase;
   
   function CreateBounceEase return Windows.UI.Xaml.Media.Animation.IBounceEase;
   
   subtype CircleEase is Windows.UI.Xaml.Media.Animation.ICircleEase;
   
   function CreateCircleEase return Windows.UI.Xaml.Media.Animation.ICircleEase;
   
   subtype ColorAnimation is Windows.UI.Xaml.Media.Animation.IColorAnimation;
   
   function CreateColorAnimation return Windows.UI.Xaml.Media.Animation.IColorAnimation;
   
   subtype ContentThemeTransition is Windows.UI.Xaml.Media.Animation.IContentThemeTransition;
   
   function CreateContentThemeTransition return Windows.UI.Xaml.Media.Animation.IContentThemeTransition;
   
   subtype CubicEase is Windows.UI.Xaml.Media.Animation.ICubicEase;
   
   function CreateCubicEase return Windows.UI.Xaml.Media.Animation.ICubicEase;
   
   subtype DiscreteDoubleKeyFrame is Windows.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame;
   
   function CreateDiscreteDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame;
   
   subtype DiscreteObjectKeyFrame is Windows.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame;
   
   function CreateDiscreteObjectKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame;
   
   subtype DoubleAnimation is Windows.UI.Xaml.Media.Animation.IDoubleAnimation;
   
   function CreateDoubleAnimation return Windows.UI.Xaml.Media.Animation.IDoubleAnimation;
   
   subtype DoubleAnimationUsingKeyFrames is Windows.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames;
   
   function CreateDoubleAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames;
   
   subtype EasingDoubleKeyFrame is Windows.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame;
   
   function CreateEasingDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame;
   
   subtype EdgeUIThemeTransition is Windows.UI.Xaml.Media.Animation.IEdgeUIThemeTransition;
   
   function CreateEdgeUIThemeTransition return Windows.UI.Xaml.Media.Animation.IEdgeUIThemeTransition;
   
   subtype ElasticEase is Windows.UI.Xaml.Media.Animation.IElasticEase;
   
   function CreateElasticEase return Windows.UI.Xaml.Media.Animation.IElasticEase;
   
   subtype EntranceThemeTransition is Windows.UI.Xaml.Media.Animation.IEntranceThemeTransition;
   
   function CreateEntranceThemeTransition return Windows.UI.Xaml.Media.Animation.IEntranceThemeTransition;
   
   subtype ExponentialEase is Windows.UI.Xaml.Media.Animation.IExponentialEase;
   
   function CreateExponentialEase return Windows.UI.Xaml.Media.Animation.IExponentialEase;
   
   subtype LinearDoubleKeyFrame is Windows.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame;
   
   function CreateLinearDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame;
   
   subtype ObjectAnimationUsingKeyFrames is Windows.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames;
   
   function CreateObjectAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames;
   
   subtype PaneThemeTransition is Windows.UI.Xaml.Media.Animation.IPaneThemeTransition;
   
   function CreatePaneThemeTransition return Windows.UI.Xaml.Media.Animation.IPaneThemeTransition;
   
   subtype PointAnimation is Windows.UI.Xaml.Media.Animation.IPointAnimation;
   
   function CreatePointAnimation return Windows.UI.Xaml.Media.Animation.IPointAnimation;
   
   subtype PopupThemeTransition is Windows.UI.Xaml.Media.Animation.IPopupThemeTransition;
   
   function CreatePopupThemeTransition return Windows.UI.Xaml.Media.Animation.IPopupThemeTransition;
   
   subtype PowerEase is Windows.UI.Xaml.Media.Animation.IPowerEase;
   
   function CreatePowerEase return Windows.UI.Xaml.Media.Animation.IPowerEase;
   
   subtype QuadraticEase is Windows.UI.Xaml.Media.Animation.IQuadraticEase;
   
   function CreateQuadraticEase return Windows.UI.Xaml.Media.Animation.IQuadraticEase;
   
   subtype QuarticEase is Windows.UI.Xaml.Media.Animation.IQuarticEase;
   
   function CreateQuarticEase return Windows.UI.Xaml.Media.Animation.IQuarticEase;
   
   subtype QuinticEase is Windows.UI.Xaml.Media.Animation.IQuinticEase;
   
   function CreateQuinticEase return Windows.UI.Xaml.Media.Animation.IQuinticEase;
   
   subtype ReorderThemeTransition is Windows.UI.Xaml.Media.Animation.IReorderThemeTransition;
   
   function CreateReorderThemeTransition return Windows.UI.Xaml.Media.Animation.IReorderThemeTransition;
   
   subtype RepositionThemeTransition is Windows.UI.Xaml.Media.Animation.IRepositionThemeTransition;
   
   function CreateRepositionThemeTransition return Windows.UI.Xaml.Media.Animation.IRepositionThemeTransition;
   
   subtype SineEase is Windows.UI.Xaml.Media.Animation.ISineEase;
   
   function CreateSineEase return Windows.UI.Xaml.Media.Animation.ISineEase;
   
   subtype SplineDoubleKeyFrame is Windows.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame;
   
   function CreateSplineDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame;
   
   subtype Storyboard is Windows.UI.Xaml.Media.Animation.IStoryboard;
   
   function CreateStoryboard return Windows.UI.Xaml.Media.Animation.IStoryboard;
   
   subtype ColorKeyFrameCollection is Windows.UI.Xaml.Media.Animation.IVector_ColorKeyFrame;
   
   function CreateColorKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_ColorKeyFrame;
   
   subtype ConnectedAnimation is Windows.UI.Xaml.Media.Animation.IConnectedAnimation;
   subtype ConnectedAnimationService is Windows.UI.Xaml.Media.Animation.IConnectedAnimationService;
   subtype PointKeyFrameCollection is Windows.UI.Xaml.Media.Animation.IVector_PointKeyFrame;
   
   function CreatePointKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_PointKeyFrame;
   
   subtype ColorKeyFrame is Windows.UI.Xaml.Media.Animation.IColorKeyFrame;
   
   type IColorKeyFrame_Interface_Impl is new IColorKeyFrame_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IColorKeyFrame := null;
      m_IColorKeyFrame : IColorKeyFrame := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IColorKeyFrame_Impl is access all IColorKeyFrame_Interface_Impl'Class;
   type IColorKeyFrame_Impl_Ptr is access all IColorKeyFrame_Impl;
   
   function QueryInterface
   (
      This       : access IColorKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IColorKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IColorKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IColorKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IColorKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IColorKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Value
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function put_Value
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT;
   
   function get_KeyTime
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   function put_KeyTime
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   subtype PointKeyFrame is Windows.UI.Xaml.Media.Animation.IPointKeyFrame;
   
   type IPointKeyFrame_Interface_Impl is new IPointKeyFrame_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IPointKeyFrame := null;
      m_IPointKeyFrame : IPointKeyFrame := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IPointKeyFrame_Impl is access all IPointKeyFrame_Interface_Impl'Class;
   type IPointKeyFrame_Impl_Ptr is access all IPointKeyFrame_Impl;
   
   function QueryInterface
   (
      This       : access IPointKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPointKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPointKeyFrame_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPointKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPointKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPointKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Value
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function put_Value
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function get_KeyTime
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   function put_KeyTime
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT;
   
   subtype ColorAnimationUsingKeyFrames is Windows.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames;
   
   function CreateColorAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames;
   
   subtype DiscreteColorKeyFrame is Windows.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame;
   
   function CreateDiscreteColorKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame;
   
   subtype DiscretePointKeyFrame is Windows.UI.Xaml.Media.Animation.IDiscretePointKeyFrame;
   
   function CreateDiscretePointKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscretePointKeyFrame;
   
   subtype DragItemThemeAnimation is Windows.UI.Xaml.Media.Animation.IDragItemThemeAnimation;
   
   function CreateDragItemThemeAnimation return Windows.UI.Xaml.Media.Animation.IDragItemThemeAnimation;
   
   subtype DragOverThemeAnimation is Windows.UI.Xaml.Media.Animation.IDragOverThemeAnimation;
   
   function CreateDragOverThemeAnimation return Windows.UI.Xaml.Media.Animation.IDragOverThemeAnimation;
   
   subtype DrillInThemeAnimation is Windows.UI.Xaml.Media.Animation.IDrillInThemeAnimation;
   
   function CreateDrillInThemeAnimation return Windows.UI.Xaml.Media.Animation.IDrillInThemeAnimation;
   
   subtype DrillOutThemeAnimation is Windows.UI.Xaml.Media.Animation.IDrillOutThemeAnimation;
   
   function CreateDrillOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IDrillOutThemeAnimation;
   
   subtype DropTargetItemThemeAnimation is Windows.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation;
   
   function CreateDropTargetItemThemeAnimation return Windows.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation;
   
   subtype EasingColorKeyFrame is Windows.UI.Xaml.Media.Animation.IEasingColorKeyFrame;
   
   function CreateEasingColorKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingColorKeyFrame;
   
   subtype EasingPointKeyFrame is Windows.UI.Xaml.Media.Animation.IEasingPointKeyFrame;
   
   function CreateEasingPointKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingPointKeyFrame;
   
   subtype FadeInThemeAnimation is Windows.UI.Xaml.Media.Animation.IFadeInThemeAnimation;
   
   function CreateFadeInThemeAnimation return Windows.UI.Xaml.Media.Animation.IFadeInThemeAnimation;
   
   subtype FadeOutThemeAnimation is Windows.UI.Xaml.Media.Animation.IFadeOutThemeAnimation;
   
   function CreateFadeOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IFadeOutThemeAnimation;
   
   subtype LinearColorKeyFrame is Windows.UI.Xaml.Media.Animation.ILinearColorKeyFrame;
   
   function CreateLinearColorKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearColorKeyFrame;
   
   subtype LinearPointKeyFrame is Windows.UI.Xaml.Media.Animation.ILinearPointKeyFrame;
   
   function CreateLinearPointKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearPointKeyFrame;
   
   subtype PointAnimationUsingKeyFrames is Windows.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames;
   
   function CreatePointAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames;
   
   subtype PointerDownThemeAnimation is Windows.UI.Xaml.Media.Animation.IPointerDownThemeAnimation;
   
   function CreatePointerDownThemeAnimation return Windows.UI.Xaml.Media.Animation.IPointerDownThemeAnimation;
   
   subtype PointerUpThemeAnimation is Windows.UI.Xaml.Media.Animation.IPointerUpThemeAnimation;
   
   function CreatePointerUpThemeAnimation return Windows.UI.Xaml.Media.Animation.IPointerUpThemeAnimation;
   
   subtype PopInThemeAnimation is Windows.UI.Xaml.Media.Animation.IPopInThemeAnimation;
   
   function CreatePopInThemeAnimation return Windows.UI.Xaml.Media.Animation.IPopInThemeAnimation;
   
   subtype PopOutThemeAnimation is Windows.UI.Xaml.Media.Animation.IPopOutThemeAnimation;
   
   function CreatePopOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IPopOutThemeAnimation;
   
   subtype RepositionThemeAnimation is Windows.UI.Xaml.Media.Animation.IRepositionThemeAnimation;
   
   function CreateRepositionThemeAnimation return Windows.UI.Xaml.Media.Animation.IRepositionThemeAnimation;
   
   subtype SplineColorKeyFrame is Windows.UI.Xaml.Media.Animation.ISplineColorKeyFrame;
   
   function CreateSplineColorKeyFrame return Windows.UI.Xaml.Media.Animation.ISplineColorKeyFrame;
   
   subtype SplinePointKeyFrame is Windows.UI.Xaml.Media.Animation.ISplinePointKeyFrame;
   
   function CreateSplinePointKeyFrame return Windows.UI.Xaml.Media.Animation.ISplinePointKeyFrame;
   
   subtype SplitCloseThemeAnimation is Windows.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation;
   
   function CreateSplitCloseThemeAnimation return Windows.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation;
   
   subtype SplitOpenThemeAnimation is Windows.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation;
   
   function CreateSplitOpenThemeAnimation return Windows.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation;
   
   subtype SwipeBackThemeAnimation is Windows.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation;
   
   function CreateSwipeBackThemeAnimation return Windows.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation;
   
   subtype SwipeHintThemeAnimation is Windows.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation;
   
   function CreateSwipeHintThemeAnimation return Windows.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation;
   
   subtype CommonNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo;
   
   function CreateCommonNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo;
   
   subtype ContinuumNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo;
   
   function CreateContinuumNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo;
   
   subtype DrillInNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo;
   
   function CreateDrillInNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo;
   
   subtype EntranceNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo;
   
   function CreateEntranceNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo;
   
   subtype NavigationThemeTransition is Windows.UI.Xaml.Media.Animation.INavigationThemeTransition;
   
   function CreateNavigationThemeTransition return Windows.UI.Xaml.Media.Animation.INavigationThemeTransition;
   
   subtype SlideNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo;
   
   function CreateSlideNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo;
   
   subtype SuppressNavigationTransitionInfo is Windows.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo;
   
   function CreateSuppressNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromTimeSpan
   (
      timeSpan : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Media.Animation.KeyTime;
   
   function get_Forever
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   
   function FromCount
   (
      count : Windows.Double
   )
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   
   function FromDuration
   (
      duration : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   
   function GetHasCount
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean;
   
   function GetHasDuration
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean;
   
   function Equals
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame;
   
   function get_ValueProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTimeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo;
   
   function get_ValueProperty_IObjectKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTimeProperty_IObjectKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IObjectKeyFrame;
   
   function get_AllowDependentAnimations
   return Windows.Boolean;
   
   procedure put_AllowDependentAnimations
   (
      value : Windows.Boolean
   )
   ;
   
   function get_AutoReverseProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BeginTimeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DurationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SpeedRatioProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillBehaviorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RepeatBehaviorProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.ITimeline;
   
   function get_AmplitudeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StoryboardProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BouncesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BouncinessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ByProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ByProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IDoubleAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty_IEasingDoubleKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EdgeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OscillationsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_SpringinessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsStaggeringEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExponentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IObjectAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EdgeProperty_IPaneThemeTransition
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ByProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromHorizontalOffsetProperty_IPopupThemeTransition
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromVerticalOffsetProperty_IPopupThemeTransition
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PowerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsStaggeringEnabledProperty_IRepositionThemeTransition
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeySplineProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetPropertyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetTargetProperty
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.String;
   
   procedure SetTargetProperty
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; path : Windows.String
   )
   ;
   
   function get_TargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetTargetName
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.String;
   
   procedure SetTargetName
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; name : Windows.String
   )
   ;
   
   procedure SetTarget
   (
      timeline : Windows.UI.Xaml.Media.Animation.ITimeline
      ; target : Windows.UI.Xaml.IDependencyObject
   )
   ;
   
   function GetForCurrentView
   return Windows.UI.Xaml.Media.Animation.IConnectedAnimationService;
   
   function get_ValueProperty_IColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTimeProperty_IColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IColorKeyFrame;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IPointKeyFrame;
   
   function get_ValueProperty_IPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTimeProperty_IPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IColorAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IDragItemThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IDragOverThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DirectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EntranceTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EntranceTargetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitTargetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EntranceTargetNameProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EntranceTargetProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitTargetNameProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitTargetProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IDropTargetItemThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty_IEasingColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EasingFunctionProperty_IEasingPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IFadeInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IFadeOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_EnableDependentAnimationProperty_IPointAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IPointerDownThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IPointerUpThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromHorizontalOffsetProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromVerticalOffsetProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IPopOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromHorizontalOffsetProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromVerticalOffsetProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeySplineProperty_ISplineColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeySplineProperty_ISplinePointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedTargetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedTargetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTargetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedLengthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedLengthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OffsetFromCenterProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTranslationDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTranslationOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpenedLengthProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClosedLengthProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OffsetFromCenterProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTranslationDirectionProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ContentTranslationOffsetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromHorizontalOffsetProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FromVerticalOffsetProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TargetNameProperty_ISwipeHintThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ToVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsStaggeringEnabledProperty_ICommonNavigationTransitionInfo
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsStaggerElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsStaggerElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean;
   
   procedure SetIsStaggerElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   ;
   
   function get_ExitElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsEntranceElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsEntranceElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean;
   
   procedure SetIsEntranceElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   ;
   
   function get_IsExitElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsExitElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean;
   
   procedure SetIsExitElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   ;
   
   function get_ExitElementContainerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetExitElementContainer
   (
      element : Windows.UI.Xaml.Controls.IListViewBase
   )
   return Windows.Boolean;
   
   procedure SetExitElementContainer
   (
      element : Windows.UI.Xaml.Controls.IListViewBase
      ; value : Windows.Boolean
   )
   ;
   
   function get_IsTargetElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsTargetElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean;
   
   procedure SetIsTargetElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   ;
   
   function get_DefaultNavigationTransitionInfoProperty
   return Windows.UI.Xaml.IDependencyProperty;

end;
