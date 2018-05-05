--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Storage;
limited with Windows.Storage.Streams;
limited with Windows.Graphics.Imaging;
--------------------------------------------------------------------------------
package Windows.AI.MachineLearning.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type LearningModelDeviceKindPreview is (
      LearningDeviceAny,
      LearningDeviceCpu,
      LearningDeviceGpu,
      LearningDeviceNpu,
      LearningDeviceDsp,
      LearningDeviceFpga
   );
   for LearningModelDeviceKindPreview use (
      LearningDeviceAny => 0,
      LearningDeviceCpu => 1,
      LearningDeviceGpu => 2,
      LearningDeviceNpu => 3,
      LearningDeviceDsp => 4,
      LearningDeviceFpga => 5
   );
   for LearningModelDeviceKindPreview'Size use 32;
   
   type LearningModelDeviceKindPreview_Ptr is access LearningModelDeviceKindPreview;
   
   type LearningModelFeatureKindPreview is (
      Undefined,
      Tensor,
      Sequence,
      Map,
      Image
   );
   for LearningModelFeatureKindPreview use (
      Undefined => 0,
      Tensor => 1,
      Sequence => 2,
      Map => 3,
      Image => 4
   );
   for LearningModelFeatureKindPreview'Size use 32;
   
   type LearningModelFeatureKindPreview_Ptr is access LearningModelFeatureKindPreview;
   
   type FeatureElementKindPreview is (
      Undefined,
      Float,
      UInt8,
      Int8,
      UInt16,
      Int16,
      Int32,
      Int64,
      String,
      Boolean,
      Float16,
      Double,
      UInt32,
      UInt64,
      Complex64,
      Complex128
   );
   for FeatureElementKindPreview use (
      Undefined => 0,
      Float => 1,
      UInt8 => 2,
      Int8 => 3,
      UInt16 => 4,
      Int16 => 5,
      Int32 => 6,
      Int64 => 7,
      String => 8,
      Boolean => 9,
      Float16 => 10,
      Double => 11,
      UInt32 => 12,
      UInt64 => 13,
      Complex64 => 14,
      Complex128 => 15
   );
   for FeatureElementKindPreview'Size use 32;
   
   type FeatureElementKindPreview_Ptr is access FeatureElementKindPreview;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type MachineLearningPreviewContract is null record;
   pragma Convention (C_Pass_By_Copy , MachineLearningPreviewContract);
   
   type MachineLearningPreviewContract_Ptr is access MachineLearningPreviewContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Interface;
   type AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview is access all AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Interface'Class;
   type AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Ptr is access all AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview;
   type AsyncOperationCompletedHandler_ILearningModelPreview_Interface;
   type AsyncOperationCompletedHandler_ILearningModelPreview is access all AsyncOperationCompletedHandler_ILearningModelPreview_Interface'Class;
   type AsyncOperationCompletedHandler_ILearningModelPreview_Ptr is access all AsyncOperationCompletedHandler_ILearningModelPreview;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInferencingOptionsPreview_Interface;
   type IInferencingOptionsPreview is access all IInferencingOptionsPreview_Interface'Class;
   type IInferencingOptionsPreview_Ptr is access all IInferencingOptionsPreview;
   type ILearningModelBindingPreview_Interface;
   type ILearningModelBindingPreview is access all ILearningModelBindingPreview_Interface'Class;
   type ILearningModelBindingPreview_Ptr is access all ILearningModelBindingPreview;
   type ILearningModelBindingPreviewFactory_Interface;
   type ILearningModelBindingPreviewFactory is access all ILearningModelBindingPreviewFactory_Interface'Class;
   type ILearningModelBindingPreviewFactory_Ptr is access all ILearningModelBindingPreviewFactory;
   type IMapView_String_Object_Interface;
   type IMapView_String_Object is access all IMapView_String_Object_Interface'Class;
   type IMapView_String_Object_Ptr is access all IMapView_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type ILearningModelPreview_Interface;
   type ILearningModelPreview is access all ILearningModelPreview_Interface'Class;
   type ILearningModelPreview_Ptr is access all ILearningModelPreview;
   type ILearningModelPreviewStatics_Interface;
   type ILearningModelPreviewStatics is access all ILearningModelPreviewStatics_Interface'Class;
   type ILearningModelPreviewStatics_Ptr is access all ILearningModelPreviewStatics;
   type ILearningModelDescriptionPreview_Interface;
   type ILearningModelDescriptionPreview is access all ILearningModelDescriptionPreview_Interface'Class;
   type ILearningModelDescriptionPreview_Ptr is access all ILearningModelDescriptionPreview;
   type ILearningModelVariableDescriptorPreview_Interface;
   type ILearningModelVariableDescriptorPreview is access all ILearningModelVariableDescriptorPreview_Interface'Class;
   type ILearningModelVariableDescriptorPreview_Ptr is access all ILearningModelVariableDescriptorPreview;
   type ITensorVariableDescriptorPreview_Interface;
   type ITensorVariableDescriptorPreview is access all ITensorVariableDescriptorPreview_Interface'Class;
   type ITensorVariableDescriptorPreview_Ptr is access all ITensorVariableDescriptorPreview;
   type ISequenceVariableDescriptorPreview_Interface;
   type ISequenceVariableDescriptorPreview is access all ISequenceVariableDescriptorPreview_Interface'Class;
   type ISequenceVariableDescriptorPreview_Ptr is access all ISequenceVariableDescriptorPreview;
   type IMapVariableDescriptorPreview_Interface;
   type IMapVariableDescriptorPreview is access all IMapVariableDescriptorPreview_Interface'Class;
   type IMapVariableDescriptorPreview_Ptr is access all IMapVariableDescriptorPreview;
   type IImageVariableDescriptorPreview_Interface;
   type IImageVariableDescriptorPreview is access all IImageVariableDescriptorPreview_Interface'Class;
   type IImageVariableDescriptorPreview_Ptr is access all IImageVariableDescriptorPreview;
   type ILearningModelEvaluationResultPreview_Interface;
   type ILearningModelEvaluationResultPreview is access all ILearningModelEvaluationResultPreview_Interface'Class;
   type ILearningModelEvaluationResultPreview_Ptr is access all ILearningModelEvaluationResultPreview;
   type IAsyncOperation_ILearningModelEvaluationResultPreview_Interface;
   type IAsyncOperation_ILearningModelEvaluationResultPreview is access all IAsyncOperation_ILearningModelEvaluationResultPreview_Interface'Class;
   type IAsyncOperation_ILearningModelEvaluationResultPreview_Ptr is access all IAsyncOperation_ILearningModelEvaluationResultPreview;
   type IIterable_ILearningModelPreview_EvaluateFeaturesAsync_Interface;
   type IIterable_ILearningModelPreview_EvaluateFeaturesAsync is access all IIterable_ILearningModelPreview_EvaluateFeaturesAsync_Interface'Class;
   type IIterable_ILearningModelPreview_EvaluateFeaturesAsync_Ptr is access all IIterable_ILearningModelPreview_EvaluateFeaturesAsync;
   type IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface;
   type IMap_ILearningModelPreview_EvaluateFeaturesAsync is access all IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface'Class;
   type IMap_ILearningModelPreview_EvaluateFeaturesAsync_Ptr is access all IMap_ILearningModelPreview_EvaluateFeaturesAsync;
   type IAsyncOperation_ILearningModelPreview_Interface;
   type IAsyncOperation_ILearningModelPreview is access all IAsyncOperation_ILearningModelPreview_Interface'Class;
   type IAsyncOperation_ILearningModelPreview_Ptr is access all IAsyncOperation_ILearningModelPreview;
   type IIterator_ILearningModelVariableDescriptorPreview_Interface;
   type IIterator_ILearningModelVariableDescriptorPreview is access all IIterator_ILearningModelVariableDescriptorPreview_Interface'Class;
   type IIterator_ILearningModelVariableDescriptorPreview_Ptr is access all IIterator_ILearningModelVariableDescriptorPreview;
   type IIterable_ILearningModelVariableDescriptorPreview_Interface;
   type IIterable_ILearningModelVariableDescriptorPreview is access all IIterable_ILearningModelVariableDescriptorPreview_Interface'Class;
   type IIterable_ILearningModelVariableDescriptorPreview_Ptr is access all IIterable_ILearningModelVariableDescriptorPreview;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IInferencingOptionsPreview : aliased constant Windows.IID := (1203536389, 19766, 18345, (143, 104, 255, 203, 51, 157, 208, 252 ));
   
   type IInferencingOptionsPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreferredDeviceKind
   (
      This       : access IInferencingOptionsPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.LearningModelDeviceKindPreview
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredDeviceKind
   (
      This       : access IInferencingOptionsPreview_Interface
      ; value : Windows.AI.MachineLearning.Preview.LearningModelDeviceKindPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTracingEnabled
   (
      This       : access IInferencingOptionsPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTracingEnabled
   (
      This       : access IInferencingOptionsPreview_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IInferencingOptionsPreview_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxBatchSize
   (
      This       : access IInferencingOptionsPreview_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimizeMemoryAllocation
   (
      This       : access IInferencingOptionsPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MinimizeMemoryAllocation
   (
      This       : access IInferencingOptionsPreview_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ReclaimMemoryAfterEvaluation
   (
      This       : access IInferencingOptionsPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ReclaimMemoryAfterEvaluation
   (
      This       : access IInferencingOptionsPreview_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelBindingPreview : aliased constant Windows.IID := (2479423976, 27768, 19279, (174, 193, 166, 187, 158, 105, 22, 36 ));
   
   type ILearningModelBindingPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function Bind
   (
      This       : access ILearningModelBindingPreview_Interface
      ; name : Windows.String
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function BindWithProperties
   (
      This       : access ILearningModelBindingPreview_Interface
      ; name : Windows.String
      ; value : Windows.Object
      ; metadata : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access ILearningModelBindingPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelBindingPreviewFactory : aliased constant Windows.IID := (1220026783, 7761, 19831, (174, 80, 62, 193, 100, 173, 52, 128 ));
   
   type ILearningModelBindingPreviewFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromModel
   (
      This       : access ILearningModelBindingPreviewFactory_Interface
      ; model : Windows.AI.MachineLearning.Preview.ILearningModelPreview
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_String_Object : aliased constant Windows.IID := (3145224234, 63389, 21754, (146, 201, 144, 197, 3, 159, 223, 126 ));
   
   type IMapView_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_Object_Interface
      ; first : access Windows.Object
      ; second : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelPreview : aliased constant Windows.IID := (77342314, 37812, 18316, (174, 184, 112, 21, 123, 240, 255, 148 ));
   
   type ILearningModelPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function EvaluateAsync
   (
      This       : access ILearningModelPreview_Interface
      ; binding : Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview
      ; correlationId : Windows.String
      ; RetVal : access Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelEvaluationResultPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function EvaluateFeaturesAsync
   (
      This       : access ILearningModelPreview_Interface
      ; features : IMap_ILearningModelPreview_EvaluateFeaturesAsync
      ; correlationId : Windows.String
      ; RetVal : access Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelEvaluationResultPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access ILearningModelPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelDescriptionPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_InferencingOptions
   (
      This       : access ILearningModelPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.IInferencingOptionsPreview
   )
   return Windows.HRESULT is abstract;
   
   function put_InferencingOptions
   (
      This       : access ILearningModelPreview_Interface
      ; value : Windows.AI.MachineLearning.Preview.IInferencingOptionsPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelPreviewStatics : aliased constant Windows.IID := (374061920, 33893, 18310, (139, 147, 44, 22, 168, 146, 137, 215 ));
   
   type ILearningModelPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadModelFromStorageFileAsync
   (
      This       : access ILearningModelPreviewStatics_Interface
      ; modelFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadModelFromStreamAsync
   (
      This       : access ILearningModelPreviewStatics_Interface
      ; modelStream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelDescriptionPreview : aliased constant Windows.IID := (4113304006, 34321, 16557, (142, 89, 222, 63, 215, 3, 10, 64 ));
   
   type ILearningModelDescriptionPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Author
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Domain
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Metadata
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InputFeatures
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.IIterable_ILearningModelVariableDescriptorPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputFeatures
   (
      This       : access ILearningModelDescriptionPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.IIterable_ILearningModelVariableDescriptorPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelVariableDescriptorPreview : aliased constant Windows.IID := (2973628034, 64560, 18731, (142, 160, 237, 31, 83, 192, 176, 56 ));
   
   type ILearningModelVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelFeatureKind
   (
      This       : access ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.LearningModelFeatureKindPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRequired
   (
      This       : access ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITensorVariableDescriptorPreview : aliased constant Windows.IID := (2819575834, 39596, 16947, (151, 132, 172, 234, 249, 37, 16, 181 ));
   
   type ITensorVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataType
   (
      This       : access ITensorVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.FeatureElementKindPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Shape
   (
      This       : access ITensorVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterable_Int64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISequenceVariableDescriptorPreview : aliased constant Windows.IID := (2631463570, 39090, 17712, (161, 182, 45, 237, 95, 236, 188, 38 ));
   
   type ISequenceVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ElementType
   (
      This       : access ISequenceVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelVariableDescriptorPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapVariableDescriptorPreview : aliased constant Windows.IID := (1018397552, 49195, 16950, (179, 232, 107, 220, 164, 156, 49, 41 ));
   
   type IMapVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyKind
   (
      This       : access IMapVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.FeatureElementKindPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidStringKeys
   (
      This       : access IMapVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterable_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidIntegerKeys
   (
      This       : access IMapVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterable_Int64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Fields
   (
      This       : access IMapVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelVariableDescriptorPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImageVariableDescriptorPreview : aliased constant Windows.IID := (2061630066, 670, 19909, (162, 248, 95, 183, 99, 21, 65, 80 ));
   
   type IImageVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapPixelFormat
   (
      This       : access IImageVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IImageVariableDescriptorPreview_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IImageVariableDescriptorPreview_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILearningModelEvaluationResultPreview : aliased constant Windows.IID := (3743804063, 39011, 16520, (132, 152, 135, 161, 244, 104, 111, 146 ));
   
   type ILearningModelEvaluationResultPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CorrelationId
   (
      This       : access ILearningModelEvaluationResultPreview_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Outputs
   (
      This       : access ILearningModelEvaluationResultPreview_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILearningModelEvaluationResultPreview : aliased constant Windows.IID := (3326341816, 59960, 21040, (147, 72, 16, 148, 192, 109, 145, 125 ));
   
   type IAsyncOperation_ILearningModelEvaluationResultPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILearningModelEvaluationResultPreview_Interface
      ; handler : Windows.AI.MachineLearning.Preview.AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILearningModelEvaluationResultPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILearningModelEvaluationResultPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelEvaluationResultPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILearningModelPreview_EvaluateFeaturesAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_ILearningModelPreview_EvaluateFeaturesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_ILearningModelPreview_EvaluateFeaturesAsync : aliased constant Windows.IID := (453850480, 2167, 24258, (138, 44, 59, 149, 57, 80, 106, 202 ));
   
   type IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; RetVal : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; key : Windows.String
      ; value : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_ILearningModelPreview_EvaluateFeaturesAsync_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILearningModelPreview : aliased constant Windows.IID := (2261632701, 32925, 23083, (137, 139, 92, 42, 146, 190, 119, 68 ));
   
   type IAsyncOperation_ILearningModelPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILearningModelPreview_Interface
      ; handler : Windows.AI.MachineLearning.Preview.AsyncOperationCompletedHandler_ILearningModelPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILearningModelPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.AsyncOperationCompletedHandler_ILearningModelPreview
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILearningModelPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILearningModelVariableDescriptorPreview : aliased constant Windows.IID := (3916001147, 39375, 22506, (153, 202, 99, 225, 255, 159, 73, 25 ));
   
   type IIterator_ILearningModelVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.ILearningModelVariableDescriptorPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILearningModelVariableDescriptorPreview_Interface
      ; items : Windows.AI.MachineLearning.Preview.ILearningModelVariableDescriptorPreview_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILearningModelVariableDescriptorPreview : aliased constant Windows.IID := (3743669045, 63369, 20897, (133, 109, 135, 205, 124, 208, 66, 241 ));
   
   type IIterable_ILearningModelVariableDescriptorPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILearningModelVariableDescriptorPreview_Interface
      ; RetVal : access Windows.AI.MachineLearning.Preview.IIterator_ILearningModelVariableDescriptorPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview : aliased constant Windows.IID := (4061561556, 20427, 23255, (155, 78, 31, 233, 197, 148, 43, 251 ));
   
   type AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Interface(Callback : access procedure (asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelEvaluationResultPreview ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Interface
      ; asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelEvaluationResultPreview
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILearningModelPreview : aliased constant Windows.IID := (2808912601, 28425, 23809, (140, 31, 81, 102, 35, 203, 250, 133 ));
   
   type AsyncOperationCompletedHandler_ILearningModelPreview_Interface(Callback : access procedure (asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILearningModelPreview'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILearningModelPreview_Interface
      ; asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LearningModelPreview is Windows.AI.MachineLearning.Preview.ILearningModelPreview;
   subtype LearningModelBindingPreview is Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview;
   function CreateFromModel
   (
      model : Windows.AI.MachineLearning.Preview.ILearningModelPreview
   )
   return Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview;
   
   subtype LearningModelEvaluationResultPreview is Windows.AI.MachineLearning.Preview.ILearningModelEvaluationResultPreview;
   subtype LearningModelDescriptionPreview is Windows.AI.MachineLearning.Preview.ILearningModelDescriptionPreview;
   subtype InferencingOptionsPreview is Windows.AI.MachineLearning.Preview.IInferencingOptionsPreview;
   subtype LearningModelVariableDescriptorPreview is Windows.AI.MachineLearning.Preview.ILearningModelVariableDescriptorPreview;
   subtype TensorVariableDescriptorPreview is Windows.AI.MachineLearning.Preview.ITensorVariableDescriptorPreview;
   subtype SequenceVariableDescriptorPreview is Windows.AI.MachineLearning.Preview.ISequenceVariableDescriptorPreview;
   subtype MapVariableDescriptorPreview is Windows.AI.MachineLearning.Preview.IMapVariableDescriptorPreview;
   subtype ImageVariableDescriptorPreview is Windows.AI.MachineLearning.Preview.IImageVariableDescriptorPreview;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function LoadModelFromStorageFileAsync
   (
      modelFile : Windows.Storage.IStorageFile
   )
   return Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview;
   
   function LoadModelFromStreamAsync
   (
      modelStream : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview;
   
end;
