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
limited with Windows.UI.Core;
with Windows.Foundation;
with Windows.Foundation.Numerics;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.UI.Input.Inking is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type InkPresenterPredefinedConfiguration is (
      SimpleSinglePointer,
      SimpleMultiplePointer
   );
   for InkPresenterPredefinedConfiguration use (
      SimpleSinglePointer => 0,
      SimpleMultiplePointer => 1
   );
   for InkPresenterPredefinedConfiguration'Size use 32;
   
   type InkPresenterPredefinedConfiguration_Ptr is access InkPresenterPredefinedConfiguration;
   
   type InkInputRightDragAction is (
      LeaveUnprocessed,
      AllowProcessing
   );
   for InkInputRightDragAction use (
      LeaveUnprocessed => 0,
      AllowProcessing => 1
   );
   for InkInputRightDragAction'Size use 32;
   
   type InkInputRightDragAction_Ptr is access InkInputRightDragAction;
   
   type InkInputProcessingMode is (
      None,
      Inking,
      Erasing
   );
   for InkInputProcessingMode use (
      None => 0,
      Inking => 1,
      Erasing => 2
   );
   for InkInputProcessingMode'Size use 32;
   
   type InkInputProcessingMode_Ptr is access InkInputProcessingMode;
   
   type InkPresenterStencilKind is (
      Other,
      Ruler,
      Protractor
   );
   for InkPresenterStencilKind use (
      Other => 0,
      Ruler => 1,
      Protractor => 2
   );
   for InkPresenterStencilKind'Size use 32;
   
   type InkPresenterStencilKind_Ptr is access InkPresenterStencilKind;
   
   type InkHighContrastAdjustment is (
      UseSystemColorsWhenNecessary,
      UseSystemColors,
      UseOriginalColors
   );
   for InkHighContrastAdjustment use (
      UseSystemColorsWhenNecessary => 0,
      UseSystemColors => 1,
      UseOriginalColors => 2
   );
   for InkHighContrastAdjustment'Size use 32;
   
   type InkHighContrastAdjustment_Ptr is access InkHighContrastAdjustment;
   
   type InkManipulationMode is (
      Inking,
      Erasing,
      Selecting
   );
   for InkManipulationMode use (
      Inking => 0,
      Erasing => 1,
      Selecting => 2
   );
   for InkManipulationMode'Size use 32;
   
   type InkManipulationMode_Ptr is access InkManipulationMode;
   
   type InkRecognitionTarget is (
      All_x,
      Selected,
      Recent
   );
   for InkRecognitionTarget use (
      All_x => 0,
      Selected => 1,
      Recent => 2
   );
   for InkRecognitionTarget'Size use 32;
   
   type InkRecognitionTarget_Ptr is access InkRecognitionTarget;
   
   type PenTipShape is (
      Circle,
      Rectangle
   );
   for PenTipShape use (
      Circle => 0,
      Rectangle => 1
   );
   for PenTipShape'Size use 32;
   
   type PenTipShape_Ptr is access PenTipShape;
   
   type InkDrawingAttributesKind is (
      Default,
      Pencil
   );
   for InkDrawingAttributesKind use (
      Default => 0,
      Pencil => 1
   );
   for InkDrawingAttributesKind'Size use 32;
   
   type InkDrawingAttributesKind_Ptr is access InkDrawingAttributesKind;
   
   type InkPersistenceFormat is (
      GifWithEmbeddedIsf,
      Isf
   );
   for InkPersistenceFormat use (
      GifWithEmbeddedIsf => 0,
      Isf => 1
   );
   for InkPersistenceFormat'Size use 32;
   
   type InkPersistenceFormat_Ptr is access InkPersistenceFormat;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface;
   type TypedEventHandler_IInkPresenter_add_StrokesCollected is access all TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface'Class;
   type TypedEventHandler_IInkPresenter_add_StrokesCollected_Ptr is access all TypedEventHandler_IInkPresenter_add_StrokesCollected;
   type TypedEventHandler_IInkPresenter_add_StrokesErased_Interface;
   type TypedEventHandler_IInkPresenter_add_StrokesErased is access all TypedEventHandler_IInkPresenter_add_StrokesErased_Interface'Class;
   type TypedEventHandler_IInkPresenter_add_StrokesErased_Ptr is access all TypedEventHandler_IInkPresenter_add_StrokesErased;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerEntered is access all TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerEntered;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerHovered is access all TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerHovered;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerExited is access all TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerExited;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerPressed is access all TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerPressed;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerMoved is access all TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerMoved;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerReleased is access all TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerReleased;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerLost is access all TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface'Class;
   type TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Ptr is access all TypedEventHandler_IInkUnprocessedInput_add_PointerLost;
   type TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface;
   type TypedEventHandler_IInkStrokeInput_add_StrokeStarted is access all TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface'Class;
   type TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Ptr is access all TypedEventHandler_IInkStrokeInput_add_StrokeStarted;
   type TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface;
   type TypedEventHandler_IInkStrokeInput_add_StrokeContinued is access all TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface'Class;
   type TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Ptr is access all TypedEventHandler_IInkStrokeInput_add_StrokeContinued;
   type TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface;
   type TypedEventHandler_IInkStrokeInput_add_StrokeEnded is access all TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface'Class;
   type TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Ptr is access all TypedEventHandler_IInkStrokeInput_add_StrokeEnded;
   type TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface;
   type TypedEventHandler_IInkStrokeInput_add_StrokeCanceled is access all TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface'Class;
   type TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Ptr is access all TypedEventHandler_IInkStrokeInput_add_StrokeCanceled;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInkStrokesCollectedEventArgs_Interface;
   type IInkStrokesCollectedEventArgs is access all IInkStrokesCollectedEventArgs_Interface'Class;
   type IInkStrokesCollectedEventArgs_Ptr is access all IInkStrokesCollectedEventArgs;
   type IInkStrokesErasedEventArgs_Interface;
   type IInkStrokesErasedEventArgs is access all IInkStrokesErasedEventArgs_Interface'Class;
   type IInkStrokesErasedEventArgs_Ptr is access all IInkStrokesErasedEventArgs;
   type IInkPresenter_Interface;
   type IInkPresenter is access all IInkPresenter_Interface'Class;
   type IInkPresenter_Ptr is access all IInkPresenter;
   type IInkPresenter2_Interface;
   type IInkPresenter2 is access all IInkPresenter2_Interface'Class;
   type IInkPresenter2_Ptr is access all IInkPresenter2;
   type IInkInputProcessingConfiguration_Interface;
   type IInkInputProcessingConfiguration is access all IInkInputProcessingConfiguration_Interface'Class;
   type IInkInputProcessingConfiguration_Ptr is access all IInkInputProcessingConfiguration;
   type IInkSynchronizer_Interface;
   type IInkSynchronizer is access all IInkSynchronizer_Interface'Class;
   type IInkSynchronizer_Ptr is access all IInkSynchronizer;
   type IInkUnprocessedInput_Interface;
   type IInkUnprocessedInput is access all IInkUnprocessedInput_Interface'Class;
   type IInkUnprocessedInput_Ptr is access all IInkUnprocessedInput;
   type IInkStrokeInput_Interface;
   type IInkStrokeInput is access all IInkStrokeInput_Interface'Class;
   type IInkStrokeInput_Ptr is access all IInkStrokeInput;
   type IInkPresenterStencil_Interface;
   type IInkPresenterStencil is access all IInkPresenterStencil_Interface'Class;
   type IInkPresenterStencil_Ptr is access all IInkPresenterStencil;
   type IInkPresenterRuler_Interface;
   type IInkPresenterRuler is access all IInkPresenterRuler_Interface'Class;
   type IInkPresenterRuler_Ptr is access all IInkPresenterRuler;
   type IInkPresenterRuler2_Interface;
   type IInkPresenterRuler2 is access all IInkPresenterRuler2_Interface'Class;
   type IInkPresenterRuler2_Ptr is access all IInkPresenterRuler2;
   type IInkPresenterProtractor_Interface;
   type IInkPresenterProtractor is access all IInkPresenterProtractor_Interface'Class;
   type IInkPresenterProtractor_Ptr is access all IInkPresenterProtractor;
   type IInkPresenterRulerFactory_Interface;
   type IInkPresenterRulerFactory is access all IInkPresenterRulerFactory_Interface'Class;
   type IInkPresenterRulerFactory_Ptr is access all IInkPresenterRulerFactory;
   type IInkPresenterProtractorFactory_Interface;
   type IInkPresenterProtractorFactory is access all IInkPresenterProtractorFactory_Interface'Class;
   type IInkPresenterProtractorFactory_Ptr is access all IInkPresenterProtractorFactory;
   type IInkPoint_Interface;
   type IInkPoint is access all IInkPoint_Interface'Class;
   type IInkPoint_Ptr is access all IInkPoint;
   type IInkPoint2_Interface;
   type IInkPoint2 is access all IInkPoint2_Interface'Class;
   type IInkPoint2_Ptr is access all IInkPoint2;
   type IInkPointFactory_Interface;
   type IInkPointFactory is access all IInkPointFactory_Interface'Class;
   type IInkPointFactory_Ptr is access all IInkPointFactory;
   type IInkPointFactory2_Interface;
   type IInkPointFactory2 is access all IInkPointFactory2_Interface'Class;
   type IInkPointFactory2_Ptr is access all IInkPointFactory2;
   type IInkDrawingAttributes_Interface;
   type IInkDrawingAttributes is access all IInkDrawingAttributes_Interface'Class;
   type IInkDrawingAttributes_Ptr is access all IInkDrawingAttributes;
   type IInkDrawingAttributes2_Interface;
   type IInkDrawingAttributes2 is access all IInkDrawingAttributes2_Interface'Class;
   type IInkDrawingAttributes2_Ptr is access all IInkDrawingAttributes2;
   type IInkDrawingAttributesPencilProperties_Interface;
   type IInkDrawingAttributesPencilProperties is access all IInkDrawingAttributesPencilProperties_Interface'Class;
   type IInkDrawingAttributesPencilProperties_Ptr is access all IInkDrawingAttributesPencilProperties;
   type IInkDrawingAttributes3_Interface;
   type IInkDrawingAttributes3 is access all IInkDrawingAttributes3_Interface'Class;
   type IInkDrawingAttributes3_Ptr is access all IInkDrawingAttributes3;
   type IInkDrawingAttributes4_Interface;
   type IInkDrawingAttributes4 is access all IInkDrawingAttributes4_Interface'Class;
   type IInkDrawingAttributes4_Ptr is access all IInkDrawingAttributes4;
   type IInkDrawingAttributesStatics_Interface;
   type IInkDrawingAttributesStatics is access all IInkDrawingAttributesStatics_Interface'Class;
   type IInkDrawingAttributesStatics_Ptr is access all IInkDrawingAttributesStatics;
   type IInkStrokeRenderingSegment_Interface;
   type IInkStrokeRenderingSegment is access all IInkStrokeRenderingSegment_Interface'Class;
   type IInkStrokeRenderingSegment_Ptr is access all IInkStrokeRenderingSegment;
   type IInkStroke_Interface;
   type IInkStroke is access all IInkStroke_Interface'Class;
   type IInkStroke_Ptr is access all IInkStroke;
   type IInkStroke2_Interface;
   type IInkStroke2 is access all IInkStroke2_Interface'Class;
   type IInkStroke2_Ptr is access all IInkStroke2;
   type IInkStroke3_Interface;
   type IInkStroke3 is access all IInkStroke3_Interface'Class;
   type IInkStroke3_Ptr is access all IInkStroke3;
   type IInkStrokeBuilder_Interface;
   type IInkStrokeBuilder is access all IInkStrokeBuilder_Interface'Class;
   type IInkStrokeBuilder_Ptr is access all IInkStrokeBuilder;
   type IInkStrokeBuilder2_Interface;
   type IInkStrokeBuilder2 is access all IInkStrokeBuilder2_Interface'Class;
   type IInkStrokeBuilder2_Ptr is access all IInkStrokeBuilder2;
   type IInkStrokeBuilder3_Interface;
   type IInkStrokeBuilder3 is access all IInkStrokeBuilder3_Interface'Class;
   type IInkStrokeBuilder3_Ptr is access all IInkStrokeBuilder3;
   type IInkRecognitionResult_Interface;
   type IInkRecognitionResult is access all IInkRecognitionResult_Interface'Class;
   type IInkRecognitionResult_Ptr is access all IInkRecognitionResult;
   type IInkStrokeContainer_Interface;
   type IInkStrokeContainer is access all IInkStrokeContainer_Interface'Class;
   type IInkStrokeContainer_Ptr is access all IInkStrokeContainer;
   type IInkStrokeContainer2_Interface;
   type IInkStrokeContainer2 is access all IInkStrokeContainer2_Interface'Class;
   type IInkStrokeContainer2_Ptr is access all IInkStrokeContainer2;
   type IInkStrokeContainer3_Interface;
   type IInkStrokeContainer3 is access all IInkStrokeContainer3_Interface'Class;
   type IInkStrokeContainer3_Ptr is access all IInkStrokeContainer3;
   type IInkRecognizer_Interface;
   type IInkRecognizer is access all IInkRecognizer_Interface'Class;
   type IInkRecognizer_Ptr is access all IInkRecognizer;
   type IInkRecognizerContainer_Interface;
   type IInkRecognizerContainer is access all IInkRecognizerContainer_Interface'Class;
   type IInkRecognizerContainer_Ptr is access all IInkRecognizerContainer;
   type IInkManager_Interface;
   type IInkManager is access all IInkManager_Interface'Class;
   type IInkManager_Ptr is access all IInkManager;
   type IIterator_IInkStroke_Interface;
   type IIterator_IInkStroke is access all IIterator_IInkStroke_Interface'Class;
   type IIterator_IInkStroke_Ptr is access all IIterator_IInkStroke;
   type IIterable_IInkStroke_Interface;
   type IIterable_IInkStroke is access all IIterable_IInkStroke_Interface'Class;
   type IIterable_IInkStroke_Ptr is access all IIterable_IInkStroke;
   type IVectorView_IInkStroke_Interface;
   type IVectorView_IInkStroke is access all IVectorView_IInkStroke_Interface'Class;
   type IVectorView_IInkStroke_Ptr is access all IVectorView_IInkStroke;
   type IIterator_IInkPoint_Interface;
   type IIterator_IInkPoint is access all IIterator_IInkPoint_Interface'Class;
   type IIterator_IInkPoint_Ptr is access all IIterator_IInkPoint;
   type IIterable_IInkPoint_Interface;
   type IIterable_IInkPoint is access all IIterable_IInkPoint_Interface'Class;
   type IIterable_IInkPoint_Ptr is access all IIterable_IInkPoint;
   type IVectorView_IInkPoint_Interface;
   type IVectorView_IInkPoint is access all IVectorView_IInkPoint_Interface'Class;
   type IVectorView_IInkPoint_Ptr is access all IVectorView_IInkPoint;
   type IVector_IInkPoint_Interface;
   type IVector_IInkPoint is access all IVector_IInkPoint_Interface'Class;
   type IVector_IInkPoint_Ptr is access all IVector_IInkPoint;
   type IIterator_IInkStrokeRenderingSegment_Interface;
   type IIterator_IInkStrokeRenderingSegment is access all IIterator_IInkStrokeRenderingSegment_Interface'Class;
   type IIterator_IInkStrokeRenderingSegment_Ptr is access all IIterator_IInkStrokeRenderingSegment;
   type IIterable_IInkStrokeRenderingSegment_Interface;
   type IIterable_IInkStrokeRenderingSegment is access all IIterable_IInkStrokeRenderingSegment_Interface'Class;
   type IIterable_IInkStrokeRenderingSegment_Ptr is access all IIterable_IInkStrokeRenderingSegment;
   type IVectorView_IInkStrokeRenderingSegment_Interface;
   type IVectorView_IInkStrokeRenderingSegment is access all IVectorView_IInkStrokeRenderingSegment_Interface'Class;
   type IVectorView_IInkStrokeRenderingSegment_Ptr is access all IVectorView_IInkStrokeRenderingSegment;
   type IIterator_IInkRecognitionResult_Interface;
   type IIterator_IInkRecognitionResult is access all IIterator_IInkRecognitionResult_Interface'Class;
   type IIterator_IInkRecognitionResult_Ptr is access all IIterator_IInkRecognitionResult;
   type IIterable_IInkRecognitionResult_Interface;
   type IIterable_IInkRecognitionResult is access all IIterable_IInkRecognitionResult_Interface'Class;
   type IIterable_IInkRecognitionResult_Ptr is access all IIterable_IInkRecognitionResult;
   type IVectorView_IInkRecognitionResult_Interface;
   type IVectorView_IInkRecognitionResult is access all IVectorView_IInkRecognitionResult_Interface'Class;
   type IVectorView_IInkRecognitionResult_Ptr is access all IVectorView_IInkRecognitionResult;
   type IIterator_IInkRecognizer_Interface;
   type IIterator_IInkRecognizer is access all IIterator_IInkRecognizer_Interface'Class;
   type IIterator_IInkRecognizer_Ptr is access all IIterator_IInkRecognizer;
   type IIterable_IInkRecognizer_Interface;
   type IIterable_IInkRecognizer is access all IIterable_IInkRecognizer_Interface'Class;
   type IIterable_IInkRecognizer_Ptr is access all IIterable_IInkRecognizer;
   type IVectorView_IInkRecognizer_Interface;
   type IVectorView_IInkRecognizer is access all IVectorView_IInkRecognizer_Interface'Class;
   type IVectorView_IInkRecognizer_Ptr is access all IVectorView_IInkRecognizer;
   
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
   type IInkStrokesCollectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Strokes
   (
      This       : access IInkStrokesCollectedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStroke -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokesCollectedEventArgs : aliased constant Windows.IID := (3304321577, 6456, 18780, (180, 217, 109, 228, 176, 141, 72, 17 ));
   
   ------------------------------------------------------------------------
   type IInkStrokesErasedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Strokes
   (
      This       : access IInkStrokesErasedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStroke -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokesErasedEventArgs : aliased constant Windows.IID := (2753653282, 5379, 20159, (143, 245, 45, 232, 69, 132, 168, 170 ));
   
   ------------------------------------------------------------------------
   type IInkPresenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsInputEnabled
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInputEnabled
   (
      This       : access IInkPresenter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InputDeviceTypes
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Core.CoreInputDeviceTypes
   )
   return Windows.HRESULT is abstract;
   
   function put_InputDeviceTypes
   (
      This       : access IInkPresenter_Interface
      ; value : Windows.UI.Core.CoreInputDeviceTypes
   )
   return Windows.HRESULT is abstract;
   
   function get_UnprocessedInput
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkUnprocessedInput
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeInput
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStrokeInput
   )
   return Windows.HRESULT is abstract;
   
   function get_InputProcessingConfiguration
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkInputProcessingConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeContainer
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStrokeContainer
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeContainer
   (
      This       : access IInkPresenter_Interface
      ; value : Windows.UI.Input.Inking.IInkStrokeContainer
   )
   return Windows.HRESULT is abstract;
   
   function CopyDefaultDrawingAttributes
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function UpdateDefaultDrawingAttributes
   (
      This       : access IInkPresenter_Interface
      ; value : Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function ActivateCustomDrying
   (
      This       : access IInkPresenter_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkSynchronizer
   )
   return Windows.HRESULT is abstract;
   
   function SetPredefinedConfiguration
   (
      This       : access IInkPresenter_Interface
      ; value : Windows.UI.Input.Inking.InkPresenterPredefinedConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function add_StrokesCollected
   (
      This       : access IInkPresenter_Interface
      ; handler : TypedEventHandler_IInkPresenter_add_StrokesCollected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokesCollected
   (
      This       : access IInkPresenter_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StrokesErased
   (
      This       : access IInkPresenter_Interface
      ; handler : TypedEventHandler_IInkPresenter_add_StrokesErased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokesErased
   (
      This       : access IInkPresenter_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenter : aliased constant Windows.IID := (2795204834, 34939, 17807, (177, 115, 79, 228, 67, 137, 48, 163 ));
   
   ------------------------------------------------------------------------
   type IInkPresenter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HighContrastAdjustment
   (
      This       : access IInkPresenter2_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   function put_HighContrastAdjustment
   (
      This       : access IInkPresenter2_Interface
      ; value : Windows.UI.Input.Inking.InkHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenter2 : aliased constant Windows.IID := (3478382098, 39476, 4582, (159, 51, 162, 79, 192, 217, 100, 156 ));
   
   ------------------------------------------------------------------------
   type IInkInputProcessingConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IInkInputProcessingConfiguration_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkInputProcessingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IInkInputProcessingConfiguration_Interface
      ; value : Windows.UI.Input.Inking.InkInputProcessingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_RightDragAction
   (
      This       : access IInkInputProcessingConfiguration_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkInputRightDragAction
   )
   return Windows.HRESULT is abstract;
   
   function put_RightDragAction
   (
      This       : access IInkInputProcessingConfiguration_Interface
      ; value : Windows.UI.Input.Inking.InkInputRightDragAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkInputProcessingConfiguration : aliased constant Windows.IID := (662231134, 13258, 19206, (166, 211, 172, 57, 69, 17, 109, 55 ));
   
   ------------------------------------------------------------------------
   type IInkSynchronizer_Interface is interface and Windows.IInspectable_Interface;
   
   function BeginDry
   (
      This       : access IInkSynchronizer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStroke -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function EndDry
   (
      This       : access IInkSynchronizer_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkSynchronizer : aliased constant Windows.IID := (2610864480, 44699, 17913, (132, 7, 75, 73, 59, 22, 54, 97 ));
   
   ------------------------------------------------------------------------
   type IInkUnprocessedInput_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PointerEntered
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerEntered
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerHovered
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerHovered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerHovered
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerExited
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerExited
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerPressed
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerPressed
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerMoved
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerMoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerMoved
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerReleased
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerReleased
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerLost
   (
      This       : access IInkUnprocessedInput_Interface
      ; handler : TypedEventHandler_IInkUnprocessedInput_add_PointerLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerLost
   (
      This       : access IInkUnprocessedInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_InkPresenter
   (
      This       : access IInkUnprocessedInput_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkUnprocessedInput : aliased constant Windows.IID := (3678684640, 33688, 18721, (172, 59, 171, 151, 140, 91, 162, 86 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeInput_Interface is interface and Windows.IInspectable_Interface;
   
   function add_StrokeStarted
   (
      This       : access IInkStrokeInput_Interface
      ; handler : TypedEventHandler_IInkStrokeInput_add_StrokeStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokeStarted
   (
      This       : access IInkStrokeInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StrokeContinued
   (
      This       : access IInkStrokeInput_Interface
      ; handler : TypedEventHandler_IInkStrokeInput_add_StrokeContinued
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokeContinued
   (
      This       : access IInkStrokeInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StrokeEnded
   (
      This       : access IInkStrokeInput_Interface
      ; handler : TypedEventHandler_IInkStrokeInput_add_StrokeEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokeEnded
   (
      This       : access IInkStrokeInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StrokeCanceled
   (
      This       : access IInkStrokeInput_Interface
      ; handler : TypedEventHandler_IInkStrokeInput_add_StrokeCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StrokeCanceled
   (
      This       : access IInkStrokeInput_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_InkPresenter
   (
      This       : access IInkStrokeInput_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeInput : aliased constant Windows.IID := (3476029051, 24080, 17350, (160, 128, 136, 242, 110, 29, 198, 125 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterStencil_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IInkPresenterStencil_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkPresenterStencilKind
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVisible
   (
      This       : access IInkPresenterStencil_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVisible
   (
      This       : access IInkPresenterStencil_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IInkPresenterStencil_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IInkPresenterStencil_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IInkPresenterStencil_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundColor
   (
      This       : access IInkPresenterStencil_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Transform
   (
      This       : access IInkPresenterStencil_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_Transform
   (
      This       : access IInkPresenterStencil_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterStencil : aliased constant Windows.IID := (819015021, 15878, 19714, (177, 22, 39, 127, 181, 216, 173, 220 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterRuler_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Length
   (
      This       : access IInkPresenterRuler_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access IInkPresenterRuler_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IInkPresenterRuler_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Width
   (
      This       : access IInkPresenterRuler_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterRuler : aliased constant Windows.IID := (1826258266, 57031, 19927, (135, 122, 33, 51, 241, 131, 212, 138 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterRuler2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AreTickMarksVisible
   (
      This       : access IInkPresenterRuler2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AreTickMarksVisible
   (
      This       : access IInkPresenterRuler2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCompassVisible
   (
      This       : access IInkPresenterRuler2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCompassVisible
   (
      This       : access IInkPresenterRuler2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterRuler2 : aliased constant Windows.IID := (1158876609, 48225, 17620, (164, 35, 84, 113, 42, 230, 113, 196 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterProtractor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AreTickMarksVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AreTickMarksVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AreRaysVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AreRaysVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCenterMarkerVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCenterMarkerVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAngleReadoutVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAngleReadoutVisible
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResizable
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsResizable
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Radius
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Radius
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AccentColor
   (
      This       : access IInkPresenterProtractor_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_AccentColor
   (
      This       : access IInkPresenterProtractor_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterProtractor : aliased constant Windows.IID := (2112090794, 61292, 20113, (167, 59, 91, 112, 213, 111, 189, 23 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterRulerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInkPresenterRulerFactory_Interface
      ; inkPresenter : Windows.UI.Input.Inking.IInkPresenter
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenterRuler
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterRulerFactory : aliased constant Windows.IID := (875961323, 36865, 19019, (166, 144, 105, 219, 175, 99, 229, 1 ));
   
   ------------------------------------------------------------------------
   type IInkPresenterProtractorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInkPresenterProtractorFactory_Interface
      ; inkPresenter : Windows.UI.Input.Inking.IInkPresenter
      ; RetVal : access Windows.UI.Input.Inking.IInkPresenterProtractor
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPresenterProtractorFactory : aliased constant Windows.IID := (838927305, 26874, 18409, (129, 39, 131, 112, 113, 31, 196, 108 ));
   
   ------------------------------------------------------------------------
   type IInkPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IInkPoint_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IInkPoint_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPoint : aliased constant Windows.IID := (2676434731, 34188, 18085, (155, 65, 209, 149, 151, 4, 89, 253 ));
   
   ------------------------------------------------------------------------
   type IInkPoint2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TiltX
   (
      This       : access IInkPoint2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltY
   (
      This       : access IInkPoint2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IInkPoint2_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPoint2 : aliased constant Windows.IID := (4222206967, 44630, 19804, (189, 47, 10, 196, 95, 94, 74, 249 ));
   
   ------------------------------------------------------------------------
   type IInkPointFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInkPoint
   (
      This       : access IInkPointFactory_Interface
      ; position : Windows.Foundation.Point
      ; pressure : Windows.Single
      ; RetVal : access Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPointFactory : aliased constant Windows.IID := (702928156, 51599, 16477, (159, 59, 229, 62, 49, 6, 141, 77 ));
   
   ------------------------------------------------------------------------
   type IInkPointFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInkPointWithTiltAndTimestamp
   (
      This       : access IInkPointFactory2_Interface
      ; position : Windows.Foundation.Point
      ; pressure : Windows.Single
      ; tiltX : Windows.Single
      ; tiltY : Windows.Single
      ; timestamp : Windows.UInt64
      ; RetVal : access Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkPointFactory2 : aliased constant Windows.IID := (3759431301, 56063, 17906, (173, 105, 5, 13, 130, 86, 162, 9 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributes_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IInkDrawingAttributes_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IInkDrawingAttributes_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PenTip
   (
      This       : access IInkDrawingAttributes_Interface
      ; RetVal : access Windows.UI.Input.Inking.PenTipShape
   )
   return Windows.HRESULT is abstract;
   
   function put_PenTip
   (
      This       : access IInkDrawingAttributes_Interface
      ; value : Windows.UI.Input.Inking.PenTipShape
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IInkDrawingAttributes_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IInkDrawingAttributes_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_IgnorePressure
   (
      This       : access IInkDrawingAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IgnorePressure
   (
      This       : access IInkDrawingAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FitToCurve
   (
      This       : access IInkDrawingAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_FitToCurve
   (
      This       : access IInkDrawingAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributes : aliased constant Windows.IID := (2543982444, 26484, 18605, (132, 240, 72, 245, 169, 190, 116, 249 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributes2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PenTipTransform
   (
      This       : access IInkDrawingAttributes2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_PenTipTransform
   (
      This       : access IInkDrawingAttributes2_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function get_DrawAsHighlighter
   (
      This       : access IInkDrawingAttributes2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DrawAsHighlighter
   (
      This       : access IInkDrawingAttributes2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributes2 : aliased constant Windows.IID := (2091607304, 36548, 17149, (165, 165, 228, 183, 209, 213, 49, 109 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributesPencilProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Opacity
   (
      This       : access IInkDrawingAttributesPencilProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IInkDrawingAttributesPencilProperties_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributesPencilProperties : aliased constant Windows.IID := (1327838411, 11654, 16827, (176, 232, 228, 194, 160, 37, 60, 82 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributes3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IInkDrawingAttributes3_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkDrawingAttributesKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PencilProperties
   (
      This       : access IInkDrawingAttributes3_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributes3 : aliased constant Windows.IID := (1912733698, 32091, 18064, (138, 244, 230, 100, 203, 226, 183, 79 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributes4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IgnoreTilt
   (
      This       : access IInkDrawingAttributes4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IgnoreTilt
   (
      This       : access IInkDrawingAttributes4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributes4 : aliased constant Windows.IID := (4016430117, 40729, 17773, (145, 163, 188, 58, 61, 145, 197, 251 ));
   
   ------------------------------------------------------------------------
   type IInkDrawingAttributesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForPencil
   (
      This       : access IInkDrawingAttributesStatics_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkDrawingAttributesStatics : aliased constant Windows.IID := (4147241023, 6757, 18530, (150, 203, 110, 22, 101, 225, 127, 109 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeRenderingSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_BezierControlPoint1
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_BezierControlPoint2
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltX
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltY
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Twist
   (
      This       : access IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeRenderingSegment : aliased constant Windows.IID := (1750142751, 35043, 18298, (162, 250, 86, 159, 95, 31, 155, 213 ));
   
   ------------------------------------------------------------------------
   type IInkStroke_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DrawingAttributes
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function put_DrawingAttributes
   (
      This       : access IInkStroke_Interface
      ; value : Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingRect
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Selected
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Selected
   (
      This       : access IInkStroke_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Recognized
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetRenderingSegments
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStrokeRenderingSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStroke : aliased constant Windows.IID := (353652064, 52451, 20431, (157, 82, 17, 81, 138, 182, 175, 212 ));
   
   ------------------------------------------------------------------------
   type IInkStroke2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointTransform
   (
      This       : access IInkStroke2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_PointTransform
   (
      This       : access IInkStroke2_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function GetInkPoints
   (
      This       : access IInkStroke2_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStroke2 : aliased constant Windows.IID := (1572463860, 47866, 19937, (137, 211, 32, 27, 30, 215, 216, 155 ));
   
   ------------------------------------------------------------------------
   type IInkStroke3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IInkStroke3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeStartedTime
   (
      This       : access IInkStroke3_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeStartedTime
   (
      This       : access IInkStroke3_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDuration
   (
      This       : access IInkStroke3_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDuration
   (
      This       : access IInkStroke3_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStroke3 : aliased constant Windows.IID := (1249932148, 38041, 16669, (161, 196, 104, 133, 93, 3, 214, 95 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeBuilder_Interface is interface and Windows.IInspectable_Interface;
   
   function BeginStroke
   (
      This       : access IInkStrokeBuilder_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function AppendToStroke
   (
      This       : access IInkStrokeBuilder_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function EndStroke
   (
      This       : access IInkStrokeBuilder_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function CreateStroke
   (
      This       : access IInkStrokeBuilder_Interface
      ; points : Windows.Foundation.IIterable_Point
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultDrawingAttributes
   (
      This       : access IInkStrokeBuilder_Interface
      ; drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeBuilder : aliased constant Windows.IID := (2193347036, 7267, 16860, (158, 7, 75, 74, 112, 206, 216, 1 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeBuilder2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateStrokeFromInkPoints
   (
      This       : access IInkStrokeBuilder2_Interface
      ; inkPoints : Windows.UI.Input.Inking.IIterable_IInkPoint
      ; transform : Windows.Foundation.Numerics.Matrix3x2
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeBuilder2 : aliased constant Windows.IID := (3179461671, 29471, 19644, (187, 191, 109, 70, 128, 68, 241, 229 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeBuilder3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateStrokeFromInkPoints
   (
      This       : access IInkStrokeBuilder3_Interface
      ; inkPoints : Windows.UI.Input.Inking.IIterable_IInkPoint
      ; transform : Windows.Foundation.Numerics.Matrix3x2
      ; strokeStartedTime : Windows.Foundation.IReference_DateTime
      ; strokeDuration : Windows.Foundation.IReference_TimeSpan
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeBuilder3 : aliased constant Windows.IID := (2999394253, 21618, 18097, (168, 29, 195, 122, 61, 22, 148, 65 ));
   
   ------------------------------------------------------------------------
   type IInkRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BoundingRect
   (
      This       : access IInkRecognitionResult_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetTextCandidates
   (
      This       : access IInkRecognitionResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStrokes
   (
      This       : access IInkRecognitionResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStroke -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkRecognitionResult : aliased constant Windows.IID := (910563988, 20584, 16623, (138, 5, 44, 47, 182, 9, 8, 162 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BoundingRect
   (
      This       : access IInkStrokeContainer_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function AddStroke
   (
      This       : access IInkStrokeContainer_Interface
      ; stroke : Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function DeleteSelected
   (
      This       : access IInkStrokeContainer_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function MoveSelected
   (
      This       : access IInkStrokeContainer_Interface
      ; translation : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function SelectWithPolyLine
   (
      This       : access IInkStrokeContainer_Interface
      ; polyline : Windows.Foundation.IIterable_Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function SelectWithLine
   (
      This       : access IInkStrokeContainer_Interface
      ; from : Windows.Foundation.Point
      ; to : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CopySelectedToClipboard
   (
      This       : access IInkStrokeContainer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PasteFromClipboard
   (
      This       : access IInkStrokeContainer_Interface
      ; position : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CanPasteFromClipboard
   (
      This       : access IInkStrokeContainer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function LoadAsync
   (
      This       : access IInkStrokeContainer_Interface
      ; inputStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Foundation.IAsyncActionWithProgress_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IInkStrokeContainer_Interface
      ; outputStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateRecognitionResults
   (
      This       : access IInkStrokeContainer_Interface
      ; recognitionResults : Windows.UI.Input.Inking.IVectorView_IInkRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetStrokes
   (
      This       : access IInkStrokeContainer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkStroke -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRecognitionResults
   (
      This       : access IInkStrokeContainer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkRecognitionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeContainer : aliased constant Windows.IID := (581749702, 64169, 20244, (182, 140, 246, 206, 230, 112, 174, 22 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeContainer2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddStrokes
   (
      This       : access IInkStrokeContainer2_Interface
      ; strokes : Windows.UI.Input.Inking.IIterable_IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IInkStrokeContainer2_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeContainer2 : aliased constant Windows.IID := (2298598244, 55862, 19407, (158, 92, 209, 149, 130, 89, 149, 180 ));
   
   ------------------------------------------------------------------------
   type IInkStrokeContainer3_Interface is interface and Windows.IInspectable_Interface;
   
   function SaveWithFormatAsync
   (
      This       : access IInkStrokeContainer3_Interface
      ; outputStream : Windows.Storage.Streams.IOutputStream
      ; inkPersistenceFormat : Windows.UI.Input.Inking.InkPersistenceFormat
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStrokeById
   (
      This       : access IInkStrokeContainer3_Interface
      ; id : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkStrokeContainer3 : aliased constant Windows.IID := (1023917733, 47850, 19586, (167, 25, 123, 131, 218, 16, 103, 210 ));
   
   ------------------------------------------------------------------------
   type IInkRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IInkRecognizer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkRecognizer : aliased constant Windows.IID := (125619875, 36941, 17450, (177, 81, 170, 202, 54, 49, 196, 59 ));
   
   ------------------------------------------------------------------------
   type IInkRecognizerContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function SetDefaultRecognizer
   (
      This       : access IInkRecognizerContainer_Interface
      ; recognizer : Windows.UI.Input.Inking.IInkRecognizer
   )
   return Windows.HRESULT is abstract;
   
   function RecognizeAsync
   (
      This       : access IInkRecognizerContainer_Interface
      ; strokeCollection : Windows.UI.Input.Inking.IInkStrokeContainer
      ; recognitionTarget : Windows.UI.Input.Inking.InkRecognitionTarget
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRecognizers
   (
      This       : access IInkRecognizerContainer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkRecognizer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkRecognizerContainer : aliased constant Windows.IID := (2806880817, 32839, 18072, (169, 18, 248, 42, 80, 133, 1, 47 ));
   
   ------------------------------------------------------------------------
   type IInkManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IInkManager_Interface
      ; RetVal : access Windows.UI.Input.Inking.InkManipulationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IInkManager_Interface
      ; value : Windows.UI.Input.Inking.InkManipulationMode
   )
   return Windows.HRESULT is abstract;
   
   function ProcessPointerDown
   (
      This       : access IInkManager_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function ProcessPointerUpdate
   (
      This       : access IInkManager_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function ProcessPointerUp
   (
      This       : access IInkManager_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultDrawingAttributes
   (
      This       : access IInkManager_Interface
      ; drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
   )
   return Windows.HRESULT is abstract;
   
   function RecognizeAsync2
   (
      This       : access IInkManager_Interface
      ; recognitionTarget : Windows.UI.Input.Inking.InkRecognitionTarget
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IInkManager : aliased constant Windows.IID := (1195668349, 26395, 16739, (156, 149, 78, 141, 122, 3, 95, 225 ));
   
   ------------------------------------------------------------------------
   type IIterator_IInkStroke_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkStroke_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkStroke_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkStroke_Interface
      ; items : Windows.UI.Input.Inking.IInkStroke_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IInkStroke : aliased constant Windows.IID := (1443419561, 59364, 23051, (148, 31, 183, 254, 215, 107, 53, 191 ));
   
   ------------------------------------------------------------------------
   type IIterable_IInkStroke_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkStroke_Interface
      ; RetVal : access Windows.UI.Input.Inking.IIterator_IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IInkStroke : aliased constant Windows.IID := (3149992961, 35280, 21253, (163, 179, 54, 200, 135, 113, 75, 155 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IInkStroke_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkStroke_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkStroke_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkStroke_Interface
      ; value : Windows.UI.Input.Inking.IInkStroke
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkStroke_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkStroke_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IInkStroke : aliased constant Windows.IID := (1732572248, 45634, 22375, (166, 67, 153, 110, 1, 223, 240, 228 ));
   
   ------------------------------------------------------------------------
   type IIterator_IInkPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkPoint_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkPoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkPoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkPoint_Interface
      ; items : Windows.UI.Input.Inking.IInkPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IInkPoint : aliased constant Windows.IID := (1195463762, 56185, 22142, (132, 213, 233, 145, 35, 48, 249, 68 ));
   
   ------------------------------------------------------------------------
   type IIterable_IInkPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkPoint_Interface
      ; RetVal : access Windows.UI.Input.Inking.IIterator_IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IInkPoint : aliased constant Windows.IID := (103858415, 42210, 23286, (178, 233, 142, 4, 46, 41, 78, 23 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IInkPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkPoint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkPoint_Interface
      ; value : Windows.UI.Input.Inking.IInkPoint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkPoint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IInkPoint : aliased constant Windows.IID := (3517727051, 51325, 21519, (138, 177, 78, 13, 9, 217, 210, 131 ));
   
   ------------------------------------------------------------------------
   type IVector_IInkPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IInkPoint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IInkPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IInkPoint_Interface
      ; RetVal : access Windows.UI.Input.Inking.IVectorView_IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IInkPoint_Interface
      ; value : Windows.UI.Input.Inking.IInkPoint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IInkPoint_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IInkPoint_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IInkPoint_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IInkPoint_Interface
      ; value : Windows.UI.Input.Inking.IInkPoint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IInkPoint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IInkPoint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IInkPoint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IInkPoint_Interface
      ; items : Windows.UI.Input.Inking.IInkPoint_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IInkPoint : aliased constant Windows.IID := (281309698, 18347, 22716, (145, 222, 213, 0, 15, 26, 116, 192 ));
   
   ------------------------------------------------------------------------
   type IIterator_IInkStrokeRenderingSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkStrokeRenderingSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkStrokeRenderingSegment_Interface
      ; items : Windows.UI.Input.Inking.IInkStrokeRenderingSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IInkStrokeRenderingSegment : aliased constant Windows.IID := (3621307159, 28479, 20882, (146, 16, 101, 162, 99, 186, 248, 209 ));
   
   ------------------------------------------------------------------------
   type IIterable_IInkStrokeRenderingSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.UI.Input.Inking.IIterator_IInkStrokeRenderingSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IInkStrokeRenderingSegment : aliased constant Windows.IID := (654315335, 10373, 23977, (137, 35, 22, 163, 165, 139, 122, 85 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IInkStrokeRenderingSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkStrokeRenderingSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkStrokeRenderingSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkStrokeRenderingSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkStrokeRenderingSegment_Interface
      ; value : Windows.UI.Input.Inking.IInkStrokeRenderingSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkStrokeRenderingSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkStrokeRenderingSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IInkStrokeRenderingSegment : aliased constant Windows.IID := (4087260189, 18196, 23936, (135, 222, 151, 61, 210, 109, 162, 105 ));
   
   ------------------------------------------------------------------------
   type IIterator_IInkRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkRecognitionResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkRecognitionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkRecognitionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkRecognitionResult_Interface
      ; items : Windows.UI.Input.Inking.IInkRecognitionResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IInkRecognitionResult : aliased constant Windows.IID := (2596021375, 547, 24388, (143, 161, 13, 109, 105, 27, 249, 175 ));
   
   ------------------------------------------------------------------------
   type IIterable_IInkRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkRecognitionResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.IIterator_IInkRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IInkRecognitionResult : aliased constant Windows.IID := (3801834891, 31937, 22044, (153, 18, 0, 29, 188, 168, 102, 81 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IInkRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkRecognitionResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkRecognitionResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkRecognitionResult_Interface
      ; value : Windows.UI.Input.Inking.IInkRecognitionResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkRecognitionResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkRecognitionResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IInkRecognitionResult : aliased constant Windows.IID := (3975958283, 4396, 23763, (172, 240, 215, 70, 214, 189, 254, 181 ));
   
   ------------------------------------------------------------------------
   type IIterator_IInkRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkRecognizer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IInkRecognizer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkRecognizer_Interface
      ; items : Windows.UI.Input.Inking.IInkRecognizer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IInkRecognizer : aliased constant Windows.IID := (4173148311, 21090, 24186, (161, 157, 19, 192, 41, 210, 215, 229 ));
   
   ------------------------------------------------------------------------
   type IIterable_IInkRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkRecognizer_Interface
      ; RetVal : access Windows.UI.Input.Inking.IIterator_IInkRecognizer
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IInkRecognizer : aliased constant Windows.IID := (1629191812, 43011, 20593, (170, 234, 79, 44, 224, 21, 16, 82 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IInkRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkRecognizer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.IInkRecognizer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkRecognizer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkRecognizer_Interface
      ; value : Windows.UI.Input.Inking.IInkRecognizer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkRecognizer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.IInkRecognizer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IInkRecognizer : aliased constant Windows.IID := (2393766479, 10223, 23133, (176, 184, 127, 213, 192, 206, 107, 57 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkPresenter ; args : Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface
      ; sender : Windows.UI.Input.Inking.IInkPresenter
      ; args : Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkPresenter_add_StrokesCollected : aliased constant Windows.IID := (392952463, 49374, 23354, (178, 140, 15, 57, 49, 202, 82, 211 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkPresenter_add_StrokesErased_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkPresenter ; args : Windows.UI.Input.Inking.IInkStrokesErasedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkPresenter_add_StrokesErased_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkPresenter_add_StrokesErased_Interface
      ; sender : Windows.UI.Input.Inking.IInkPresenter
      ; args : Windows.UI.Input.Inking.IInkStrokesErasedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkPresenter_add_StrokesErased : aliased constant Windows.IID := (822004009, 5328, 21775, (132, 242, 19, 127, 198, 169, 240, 143 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerEntered : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerHovered : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerExited : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerPressed : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerMoved : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerReleased : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkUnprocessedInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkUnprocessedInput_add_PointerLost : aliased constant Windows.IID := (1250344312, 23503, 24286, (143, 101, 168, 198, 82, 53, 5, 92 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkStrokeInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkStrokeInput_add_StrokeStarted : aliased constant Windows.IID := (3211180386, 28717, 23559, (162, 213, 21, 242, 21, 131, 196, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkStrokeInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkStrokeInput_add_StrokeContinued : aliased constant Windows.IID := (3211180386, 28717, 23559, (162, 213, 21, 242, 21, 131, 196, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkStrokeInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkStrokeInput_add_StrokeEnded : aliased constant Windows.IID := (3211180386, 28717, 23559, (162, 213, 21, 242, 21, 131, 196, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface(Callback : access procedure (sender : Windows.UI.Input.Inking.IInkStrokeInput ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IInkStrokeInput_add_StrokeCanceled : aliased constant Windows.IID := (3211180386, 28717, 23559, (162, 213, 21, 242, 21, 131, 196, 58 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InkUnprocessedInput is Windows.UI.Input.Inking.IInkUnprocessedInput;
   subtype InkStrokeInput is Windows.UI.Input.Inking.IInkStrokeInput;
   subtype InkInputProcessingConfiguration is Windows.UI.Input.Inking.IInkInputProcessingConfiguration;
   subtype InkSynchronizer is Windows.UI.Input.Inking.IInkSynchronizer;
   subtype InkPresenter is Windows.UI.Input.Inking.IInkPresenter;
   subtype InkStrokesCollectedEventArgs is Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs;
   subtype InkStrokesErasedEventArgs is Windows.UI.Input.Inking.IInkStrokesErasedEventArgs;
   subtype InkPresenterRuler is Windows.UI.Input.Inking.IInkPresenterRuler;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.IInkPresenterRuler;
   
   subtype InkPresenterProtractor is Windows.UI.Input.Inking.IInkPresenterProtractor;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.IInkPresenterProtractor;
   
   subtype InkPoint is Windows.UI.Input.Inking.IInkPoint;
   
   function CreateInkPointWithTiltAndTimestamp
   (
      position : Windows.Foundation.Point
      ; pressure : Windows.Single
      ; tiltX : Windows.Single
      ; tiltY : Windows.Single
      ; timestamp : Windows.UInt64
   )
   return Windows.UI.Input.Inking.IInkPoint;
   
   subtype InkDrawingAttributesPencilProperties is Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties;
   subtype InkDrawingAttributes is Windows.UI.Input.Inking.IInkDrawingAttributes;
   
   function CreateInkDrawingAttributes return Windows.UI.Input.Inking.IInkDrawingAttributes;
   
   subtype InkStrokeRenderingSegment is Windows.UI.Input.Inking.IInkStrokeRenderingSegment;
   subtype InkStroke is Windows.UI.Input.Inking.IInkStroke;
   subtype InkStrokeBuilder is Windows.UI.Input.Inking.IInkStrokeBuilder;
   
   function CreateInkStrokeBuilder return Windows.UI.Input.Inking.IInkStrokeBuilder;
   
   subtype InkRecognitionResult is Windows.UI.Input.Inking.IInkRecognitionResult;
   subtype InkStrokeContainer is Windows.UI.Input.Inking.IInkStrokeContainer;
   
   function CreateInkStrokeContainer return Windows.UI.Input.Inking.IInkStrokeContainer;
   
   subtype InkRecognizer is Windows.UI.Input.Inking.IInkRecognizer;
   subtype InkRecognizerContainer is Windows.UI.Input.Inking.IInkRecognizerContainer;
   
   function CreateInkRecognizerContainer return Windows.UI.Input.Inking.IInkRecognizerContainer;
   
   subtype InkManager is Windows.UI.Input.Inking.IInkManager;
   
   function CreateInkManager return Windows.UI.Input.Inking.IInkManager;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateForPencil
   return Windows.UI.Input.Inking.IInkDrawingAttributes;

end;
