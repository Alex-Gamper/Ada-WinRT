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
with Windows.Foundation.Collections;
limited with Windows.UI.Composition;
with Windows.Foundation.Numerics;
--------------------------------------------------------------------------------
package Windows.UI.Input.Inking.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CoreWetStrokeDisposition is (
      Inking,
      Completed,
      Canceled
   );
   for CoreWetStrokeDisposition use (
      Inking => 0,
      Completed => 1,
      Canceled => 2
   );
   for CoreWetStrokeDisposition'Size use 32;
   
   type CoreWetStrokeDisposition_Ptr is access CoreWetStrokeDisposition;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface'Class;
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Ptr is access all TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface'Class;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Ptr is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface'Class;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Ptr is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface'Class;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Ptr is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface'Class;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Ptr is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface'Class;
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Ptr is access all TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreInkIndependentInputSource_Interface;
   type ICoreInkIndependentInputSource is access all ICoreInkIndependentInputSource_Interface'Class;
   type ICoreInkIndependentInputSource_Ptr is access all ICoreInkIndependentInputSource;
   type ICoreInkIndependentInputSourceStatics_Interface;
   type ICoreInkIndependentInputSourceStatics is access all ICoreInkIndependentInputSourceStatics_Interface'Class;
   type ICoreInkIndependentInputSourceStatics_Ptr is access all ICoreInkIndependentInputSourceStatics;
   type ICoreWetStrokeUpdateEventArgs_Interface;
   type ICoreWetStrokeUpdateEventArgs is access all ICoreWetStrokeUpdateEventArgs_Interface'Class;
   type ICoreWetStrokeUpdateEventArgs_Ptr is access all ICoreWetStrokeUpdateEventArgs;
   type ICoreWetStrokeUpdateSource_Interface;
   type ICoreWetStrokeUpdateSource is access all ICoreWetStrokeUpdateSource_Interface'Class;
   type ICoreWetStrokeUpdateSource_Ptr is access all ICoreWetStrokeUpdateSource;
   type ICoreWetStrokeUpdateSourceStatics_Interface;
   type ICoreWetStrokeUpdateSourceStatics is access all ICoreWetStrokeUpdateSourceStatics_Interface'Class;
   type ICoreWetStrokeUpdateSourceStatics_Ptr is access all ICoreWetStrokeUpdateSourceStatics;
   type ICoreInkPresenterHost_Interface;
   type ICoreInkPresenterHost is access all ICoreInkPresenterHost_Interface'Class;
   type ICoreInkPresenterHost_Ptr is access all ICoreInkPresenterHost;
   type ICoreIncrementalInkStroke_Interface;
   type ICoreIncrementalInkStroke is access all ICoreIncrementalInkStroke_Interface'Class;
   type ICoreIncrementalInkStroke_Ptr is access all ICoreIncrementalInkStroke;
   type ICoreIncrementalInkStrokeFactory_Interface;
   type ICoreIncrementalInkStrokeFactory is access all ICoreIncrementalInkStrokeFactory_Interface'Class;
   type ICoreIncrementalInkStrokeFactory_Ptr is access all ICoreIncrementalInkStrokeFactory;
   
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
   
   IID_ICoreInkIndependentInputSource : aliased constant Windows.IID := (968068521, 30265, 17561, (165, 181, 25, 29, 0, 227, 91, 22 ));
   
   type ICoreInkIndependentInputSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PointerEntering
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerEntering
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerHovering
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerHovering
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerExiting
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerExiting
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerPressing
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerPressing
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerMoving
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerMoving
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerReleasing
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerReleasing
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerLost
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; handler : TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerLost
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_InkPresenter
   (
      This       : access ICoreInkIndependentInputSource_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInkIndependentInputSourceStatics : aliased constant Windows.IID := (1944453403, 32960, 19963, (155, 102, 16, 186, 127, 63, 156, 132 ));
   
   type ICoreInkIndependentInputSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICoreInkIndependentInputSourceStatics_Interface
      ; inkPresenter : Windows.UI.Input.Inking.IInkPresenter
      ; RetVal : access Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWetStrokeUpdateEventArgs : aliased constant Windows.IID := (4211593548, 13184, 17786, (169, 135, 153, 19, 87, 137, 108, 27 ));
   
   type ICoreWetStrokeUpdateEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewInkPoints
   (
      This       : access ICoreWetStrokeUpdateEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVector_IInkPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerId
   (
      This       : access ICoreWetStrokeUpdateEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Disposition
   (
      This       : access ICoreWetStrokeUpdateEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Inking.Core.CoreWetStrokeDisposition
   )
   return Windows.HRESULT is abstract;
   
   function put_Disposition
   (
      This       : access ICoreWetStrokeUpdateEventArgs_Interface
      ; value : Windows.UI.Input.Inking.Core.CoreWetStrokeDisposition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWetStrokeUpdateSource : aliased constant Windows.IID := (527535650, 61010, 19968, (130, 9, 76, 62, 91, 33, 163, 204 ));
   
   type ICoreWetStrokeUpdateSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_WetStrokeStarting
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; handler : TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WetStrokeStarting
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WetStrokeContinuing
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; handler : TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WetStrokeContinuing
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WetStrokeStopping
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; handler : TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WetStrokeStopping
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WetStrokeCompleted
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; handler : TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WetStrokeCompleted
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WetStrokeCanceled
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; handler : TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WetStrokeCanceled
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_InkPresenter
   (
      This       : access ICoreWetStrokeUpdateSource_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWetStrokeUpdateSourceStatics : aliased constant Windows.IID := (1034788026, 7485, 18094, (171, 157, 134, 71, 72, 108, 111, 144 ));
   
   type ICoreWetStrokeUpdateSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICoreWetStrokeUpdateSourceStatics_Interface
      ; inkPresenter : Windows.UI.Input.Inking.IInkPresenter
      ; RetVal : access Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInkPresenterHost : aliased constant Windows.IID := (963545574, 32085, 17943, (158, 88, 104, 199, 12, 145, 105, 185 ));
   
   type ICoreInkPresenterHost_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InkPresenter
   (
      This       : access ICoreInkPresenterHost_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.HRESULT is abstract;
   
   function get_RootVisual
   (
      This       : access ICoreInkPresenterHost_Interface
      ; RetVal : access Windows.UI.Composition.IContainerVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_RootVisual
   (
      This       : access ICoreInkPresenterHost_Interface
      ; value : Windows.UI.Composition.IContainerVisual
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreIncrementalInkStroke : aliased constant Windows.IID := (4255126995, 40294, 20349, (165, 127, 204, 112, 185, 207, 170, 118 ));
   
   type ICoreIncrementalInkStroke_Interface is interface and Windows.IInspectable_Interface;
   
   function AppendInkPoints
   (
      This       : access ICoreIncrementalInkStroke_Interface
      ; inkPoints : Windows.UI.Input.Inking.IIterable_IInkPoint
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CreateInkStroke
   (
      This       : access ICoreIncrementalInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function get_DrawingAttributes
   (
      This       : access ICoreIncrementalInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function get_PointTransform
   (
      This       : access ICoreIncrementalInkStroke_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingRect
   (
      This       : access ICoreIncrementalInkStroke_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreIncrementalInkStrokeFactory : aliased constant Windows.IID := (3620052806, 36264, 20336, (151, 81, 229, 59, 182, 223, 69, 150 ));
   
   type ICoreIncrementalInkStrokeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICoreIncrementalInkStrokeFactory_Interface
      ; drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
      ; pointTransform : Windows.Foundation.Numerics.Matrix3x2
      ; RetVal : access Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost : aliased constant Windows.IID := (3091185304, 34858, 23401, (189, 28, 198, 102, 144, 112, 127, 239 ));
   
   type TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting : aliased constant Windows.IID := (1744795112, 676, 21076, (169, 101, 11, 37, 76, 125, 7, 136 ));
   
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing : aliased constant Windows.IID := (1744795112, 676, 21076, (169, 101, 11, 37, 76, 125, 7, 136 ));
   
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping : aliased constant Windows.IID := (1744795112, 676, 21076, (169, 101, 11, 37, 76, 125, 7, 136 ));
   
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted : aliased constant Windows.IID := (1744795112, 676, 21076, (169, 101, 11, 37, 76, 125, 7, 136 ));
   
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled : aliased constant Windows.IID := (1744795112, 676, 21076, (169, 101, 11, 37, 76, 125, 7, 136 ));
   
   type TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CoreInkIndependentInputSource is Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource;
   subtype CoreWetStrokeUpdateEventArgs is Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs;
   subtype CoreWetStrokeUpdateSource is Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource;
   subtype CoreInkPresenterHost is Windows.UI.Input.Inking.Core.ICoreInkPresenterHost;
   
   function CreateCoreInkPresenterHost return Windows.UI.Input.Inking.Core.ICoreInkPresenterHost;
   
   subtype CoreIncrementalInkStroke is Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke;
   function Create
   (
      drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
      ; pointTransform : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource;
   

end;
