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
with Windows.Foundation;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
with Windows.Foundation.Numerics;
limited with Windows.UI;
--------------------------------------------------------------------------------
package Windows.Graphics.Printing3D is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type Print3DTaskDetail is (
      Unknown,
      ModelExceedsPrintBed,
      UploadFailed,
      InvalidMaterialSelection,
      InvalidModel,
      ModelNotManifold,
      InvalidPrintTicket
   );
   for Print3DTaskDetail use (
      Unknown => 0,
      ModelExceedsPrintBed => 1,
      UploadFailed => 2,
      InvalidMaterialSelection => 3,
      InvalidModel => 4,
      ModelNotManifold => 5,
      InvalidPrintTicket => 6
   );
   for Print3DTaskDetail'Size use 32;
   
   type Print3DTaskDetail_Ptr is access Print3DTaskDetail;
   
   type Print3DTaskCompletion is (
      Abandoned,
      Canceled,
      Failed,
      Slicing,
      Submitted
   );
   for Print3DTaskCompletion use (
      Abandoned => 0,
      Canceled => 1,
      Failed => 2,
      Slicing => 3,
      Submitted => 4
   );
   for Print3DTaskCompletion'Size use 32;
   
   type Print3DTaskCompletion_Ptr is access Print3DTaskCompletion;
   
   type Printing3DBufferFormat is (
      Unknown,
      R32G32B32A32Float,
      R32G32B32A32UInt,
      R32G32B32Float,
      R32G32B32UInt,
      Printing3DDouble,
      Printing3DUInt
   );
   for Printing3DBufferFormat use (
      Unknown => 0,
      R32G32B32A32Float => 2,
      R32G32B32A32UInt => 3,
      R32G32B32Float => 6,
      R32G32B32UInt => 7,
      Printing3DDouble => 500,
      Printing3DUInt => 501
   );
   for Printing3DBufferFormat'Size use 32;
   
   type Printing3DBufferFormat_Ptr is access Printing3DBufferFormat;
   
   type Printing3DMeshVerificationMode is (
      FindFirstError,
      FindAllErrors
   );
   for Printing3DMeshVerificationMode use (
      FindFirstError => 0,
      FindAllErrors => 1
   );
   for Printing3DMeshVerificationMode'Size use 32;
   
   type Printing3DMeshVerificationMode_Ptr is access Printing3DMeshVerificationMode;
   
   type Printing3DModelUnit is (
      Meter,
      Micron,
      Millimeter,
      Centimeter,
      Inch,
      Foot
   );
   for Printing3DModelUnit use (
      Meter => 0,
      Micron => 1,
      Millimeter => 2,
      Centimeter => 3,
      Inch => 4,
      Foot => 5
   );
   for Printing3DModelUnit'Size use 32;
   
   type Printing3DModelUnit_Ptr is access Printing3DModelUnit;
   
   type Printing3DTextureEdgeBehavior is (
      None,
      Wrap,
      Mirror,
      Clamp
   );
   for Printing3DTextureEdgeBehavior use (
      None => 0,
      Wrap => 1,
      Mirror => 2,
      Clamp => 3
   );
   for Printing3DTextureEdgeBehavior'Size use 32;
   
   type Printing3DTextureEdgeBehavior_Ptr is access Printing3DTextureEdgeBehavior;
   
   type Printing3DObjectType is (
      Model,
      Support,
      Others_x
   );
   for Printing3DObjectType use (
      Model => 0,
      Support => 1,
      Others_x => 2
   );
   for Printing3DObjectType'Size use 32;
   
   type Printing3DObjectType_Ptr is access Printing3DObjectType;
   
   type Printing3DPackageCompression is (
      Low,
      Medium,
      High
   );
   for Printing3DPackageCompression use (
      Low => 0,
      Medium => 1,
      High => 2
   );
   for Printing3DPackageCompression'Size use 32;
   
   type Printing3DPackageCompression_Ptr is access Printing3DPackageCompression;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Printing3DContract is null record;
   pragma Convention (C_Pass_By_Copy , Printing3DContract);
   
   type Printing3DContract_Ptr is access Printing3DContract;
   
   type Printing3DBufferDescription is record
      Format : Windows.Graphics.Printing3D.Printing3DBufferFormat;
      Stride : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , Printing3DBufferDescription);
   
   type Printing3DBufferDescription_Ptr is access Printing3DBufferDescription;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type Print3DTaskSourceRequestedHandler_Interface;
   type Print3DTaskSourceRequestedHandler is access all Print3DTaskSourceRequestedHandler_Interface'Class;
   type Print3DTaskSourceRequestedHandler_Ptr is access all Print3DTaskSourceRequestedHandler;
   type TypedEventHandler_IPrint3DTask_add_Submitting_Interface;
   type TypedEventHandler_IPrint3DTask_add_Submitting is access all TypedEventHandler_IPrint3DTask_add_Submitting_Interface'Class;
   type TypedEventHandler_IPrint3DTask_add_Submitting_Ptr is access all TypedEventHandler_IPrint3DTask_add_Submitting;
   type TypedEventHandler_IPrint3DTask_add_Completed_Interface;
   type TypedEventHandler_IPrint3DTask_add_Completed is access all TypedEventHandler_IPrint3DTask_add_Completed_Interface'Class;
   type TypedEventHandler_IPrint3DTask_add_Completed_Ptr is access all TypedEventHandler_IPrint3DTask_add_Completed;
   type TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface;
   type TypedEventHandler_IPrint3DTask_add_SourceChanged is access all TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface'Class;
   type TypedEventHandler_IPrint3DTask_add_SourceChanged_Ptr is access all TypedEventHandler_IPrint3DTask_add_SourceChanged;
   type TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface;
   type TypedEventHandler_IPrint3DManager_add_TaskRequested is access all TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface'Class;
   type TypedEventHandler_IPrint3DManager_add_TaskRequested_Ptr is access all TypedEventHandler_IPrint3DManager_add_TaskRequested;
   type AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface;
   type AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult is access all AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Ptr is access all AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult;
   type AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface;
   type AsyncOperationCompletedHandler_IPrinting3D3MFPackage is access all AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface'Class;
   type AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Ptr is access all AsyncOperationCompletedHandler_IPrinting3D3MFPackage;
   type AsyncOperationCompletedHandler_IPrinting3DModel_Interface;
   type AsyncOperationCompletedHandler_IPrinting3DModel is access all AsyncOperationCompletedHandler_IPrinting3DModel_Interface'Class;
   type AsyncOperationCompletedHandler_IPrinting3DModel_Ptr is access all AsyncOperationCompletedHandler_IPrinting3DModel;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrint3DTaskCompletedEventArgs_Interface;
   type IPrint3DTaskCompletedEventArgs is access all IPrint3DTaskCompletedEventArgs_Interface'Class;
   type IPrint3DTaskCompletedEventArgs_Ptr is access all IPrint3DTaskCompletedEventArgs;
   type IPrint3DTaskSourceChangedEventArgs_Interface;
   type IPrint3DTaskSourceChangedEventArgs is access all IPrint3DTaskSourceChangedEventArgs_Interface'Class;
   type IPrint3DTaskSourceChangedEventArgs_Ptr is access all IPrint3DTaskSourceChangedEventArgs;
   type IPrint3DTask_Interface;
   type IPrint3DTask is access all IPrint3DTask_Interface'Class;
   type IPrint3DTask_Ptr is access all IPrint3DTask;
   type IPrint3DTaskSourceRequestedArgs_Interface;
   type IPrint3DTaskSourceRequestedArgs is access all IPrint3DTaskSourceRequestedArgs_Interface'Class;
   type IPrint3DTaskSourceRequestedArgs_Ptr is access all IPrint3DTaskSourceRequestedArgs;
   type IPrint3DTaskRequest_Interface;
   type IPrint3DTaskRequest is access all IPrint3DTaskRequest_Interface'Class;
   type IPrint3DTaskRequest_Ptr is access all IPrint3DTaskRequest;
   type IPrint3DTaskRequestedEventArgs_Interface;
   type IPrint3DTaskRequestedEventArgs is access all IPrint3DTaskRequestedEventArgs_Interface'Class;
   type IPrint3DTaskRequestedEventArgs_Ptr is access all IPrint3DTaskRequestedEventArgs;
   type IPrint3DManagerStatics_Interface;
   type IPrint3DManagerStatics is access all IPrint3DManagerStatics_Interface'Class;
   type IPrint3DManagerStatics_Ptr is access all IPrint3DManagerStatics;
   type IPrint3DManager_Interface;
   type IPrint3DManager is access all IPrint3DManager_Interface'Class;
   type IPrint3DManager_Ptr is access all IPrint3DManager;
   type IPrinting3DMesh_Interface;
   type IPrinting3DMesh is access all IPrinting3DMesh_Interface'Class;
   type IPrinting3DMesh_Ptr is access all IPrinting3DMesh;
   type IPrinting3DModelTexture_Interface;
   type IPrinting3DModelTexture is access all IPrinting3DModelTexture_Interface'Class;
   type IPrinting3DModelTexture_Ptr is access all IPrinting3DModelTexture;
   type IPrinting3DTextureResource_Interface;
   type IPrinting3DTextureResource is access all IPrinting3DTextureResource_Interface'Class;
   type IPrinting3DTextureResource_Ptr is access all IPrinting3DTextureResource;
   type IPrinting3DComponentWithMatrix_Interface;
   type IPrinting3DComponentWithMatrix is access all IPrinting3DComponentWithMatrix_Interface'Class;
   type IPrinting3DComponentWithMatrix_Ptr is access all IPrinting3DComponentWithMatrix;
   type IPrinting3DComponent_Interface;
   type IPrinting3DComponent is access all IPrinting3DComponent_Interface'Class;
   type IPrinting3DComponent_Ptr is access all IPrinting3DComponent;
   type IPrinting3DBaseMaterialStatics_Interface;
   type IPrinting3DBaseMaterialStatics is access all IPrinting3DBaseMaterialStatics_Interface'Class;
   type IPrinting3DBaseMaterialStatics_Ptr is access all IPrinting3DBaseMaterialStatics;
   type IPrinting3DBaseMaterial_Interface;
   type IPrinting3DBaseMaterial is access all IPrinting3DBaseMaterial_Interface'Class;
   type IPrinting3DBaseMaterial_Ptr is access all IPrinting3DBaseMaterial;
   type IPrinting3DColorMaterial_Interface;
   type IPrinting3DColorMaterial is access all IPrinting3DColorMaterial_Interface'Class;
   type IPrinting3DColorMaterial_Ptr is access all IPrinting3DColorMaterial;
   type IPrinting3DColorMaterial2_Interface;
   type IPrinting3DColorMaterial2 is access all IPrinting3DColorMaterial2_Interface'Class;
   type IPrinting3DColorMaterial2_Ptr is access all IPrinting3DColorMaterial2;
   type IPrinting3DTexture2CoordMaterial_Interface;
   type IPrinting3DTexture2CoordMaterial is access all IPrinting3DTexture2CoordMaterial_Interface'Class;
   type IPrinting3DTexture2CoordMaterial_Ptr is access all IPrinting3DTexture2CoordMaterial;
   type IPrinting3DCompositeMaterial_Interface;
   type IPrinting3DCompositeMaterial is access all IPrinting3DCompositeMaterial_Interface'Class;
   type IPrinting3DCompositeMaterial_Ptr is access all IPrinting3DCompositeMaterial;
   type IPrinting3DMultiplePropertyMaterial_Interface;
   type IPrinting3DMultiplePropertyMaterial is access all IPrinting3DMultiplePropertyMaterial_Interface'Class;
   type IPrinting3DMultiplePropertyMaterial_Ptr is access all IPrinting3DMultiplePropertyMaterial;
   type IPrinting3DBaseMaterialGroupFactory_Interface;
   type IPrinting3DBaseMaterialGroupFactory is access all IPrinting3DBaseMaterialGroupFactory_Interface'Class;
   type IPrinting3DBaseMaterialGroupFactory_Ptr is access all IPrinting3DBaseMaterialGroupFactory;
   type IPrinting3DBaseMaterialGroup_Interface;
   type IPrinting3DBaseMaterialGroup is access all IPrinting3DBaseMaterialGroup_Interface'Class;
   type IPrinting3DBaseMaterialGroup_Ptr is access all IPrinting3DBaseMaterialGroup;
   type IPrinting3DColorMaterialGroupFactory_Interface;
   type IPrinting3DColorMaterialGroupFactory is access all IPrinting3DColorMaterialGroupFactory_Interface'Class;
   type IPrinting3DColorMaterialGroupFactory_Ptr is access all IPrinting3DColorMaterialGroupFactory;
   type IPrinting3DColorMaterialGroup_Interface;
   type IPrinting3DColorMaterialGroup is access all IPrinting3DColorMaterialGroup_Interface'Class;
   type IPrinting3DColorMaterialGroup_Ptr is access all IPrinting3DColorMaterialGroup;
   type IPrinting3DTexture2CoordMaterialGroupFactory_Interface;
   type IPrinting3DTexture2CoordMaterialGroupFactory is access all IPrinting3DTexture2CoordMaterialGroupFactory_Interface'Class;
   type IPrinting3DTexture2CoordMaterialGroupFactory_Ptr is access all IPrinting3DTexture2CoordMaterialGroupFactory;
   type IPrinting3DTexture2CoordMaterialGroup_Interface;
   type IPrinting3DTexture2CoordMaterialGroup is access all IPrinting3DTexture2CoordMaterialGroup_Interface'Class;
   type IPrinting3DTexture2CoordMaterialGroup_Ptr is access all IPrinting3DTexture2CoordMaterialGroup;
   type IPrinting3DTexture2CoordMaterialGroup2_Interface;
   type IPrinting3DTexture2CoordMaterialGroup2 is access all IPrinting3DTexture2CoordMaterialGroup2_Interface'Class;
   type IPrinting3DTexture2CoordMaterialGroup2_Ptr is access all IPrinting3DTexture2CoordMaterialGroup2;
   type IPrinting3DCompositeMaterialGroupFactory_Interface;
   type IPrinting3DCompositeMaterialGroupFactory is access all IPrinting3DCompositeMaterialGroupFactory_Interface'Class;
   type IPrinting3DCompositeMaterialGroupFactory_Ptr is access all IPrinting3DCompositeMaterialGroupFactory;
   type IPrinting3DCompositeMaterialGroup2_Interface;
   type IPrinting3DCompositeMaterialGroup2 is access all IPrinting3DCompositeMaterialGroup2_Interface'Class;
   type IPrinting3DCompositeMaterialGroup2_Ptr is access all IPrinting3DCompositeMaterialGroup2;
   type IPrinting3DCompositeMaterialGroup_Interface;
   type IPrinting3DCompositeMaterialGroup is access all IPrinting3DCompositeMaterialGroup_Interface'Class;
   type IPrinting3DCompositeMaterialGroup_Ptr is access all IPrinting3DCompositeMaterialGroup;
   type IPrinting3DMultiplePropertyMaterialGroupFactory_Interface;
   type IPrinting3DMultiplePropertyMaterialGroupFactory is access all IPrinting3DMultiplePropertyMaterialGroupFactory_Interface'Class;
   type IPrinting3DMultiplePropertyMaterialGroupFactory_Ptr is access all IPrinting3DMultiplePropertyMaterialGroupFactory;
   type IPrinting3DMultiplePropertyMaterialGroup_Interface;
   type IPrinting3DMultiplePropertyMaterialGroup is access all IPrinting3DMultiplePropertyMaterialGroup_Interface'Class;
   type IPrinting3DMultiplePropertyMaterialGroup_Ptr is access all IPrinting3DMultiplePropertyMaterialGroup;
   type IPrinting3DMaterial_Interface;
   type IPrinting3DMaterial is access all IPrinting3DMaterial_Interface'Class;
   type IPrinting3DMaterial_Ptr is access all IPrinting3DMaterial;
   type IPrinting3DMeshVerificationResult_Interface;
   type IPrinting3DMeshVerificationResult is access all IPrinting3DMeshVerificationResult_Interface'Class;
   type IPrinting3DMeshVerificationResult_Ptr is access all IPrinting3DMeshVerificationResult;
   type IPrinting3DModel_Interface;
   type IPrinting3DModel is access all IPrinting3DModel_Interface'Class;
   type IPrinting3DModel_Ptr is access all IPrinting3DModel;
   type IPrinting3DFaceReductionOptions_Interface;
   type IPrinting3DFaceReductionOptions is access all IPrinting3DFaceReductionOptions_Interface'Class;
   type IPrinting3DFaceReductionOptions_Ptr is access all IPrinting3DFaceReductionOptions;
   type IPrinting3DModel2_Interface;
   type IPrinting3DModel2 is access all IPrinting3DModel2_Interface'Class;
   type IPrinting3DModel2_Ptr is access all IPrinting3DModel2;
   type IPrinting3D3MFPackageStatics_Interface;
   type IPrinting3D3MFPackageStatics is access all IPrinting3D3MFPackageStatics_Interface'Class;
   type IPrinting3D3MFPackageStatics_Ptr is access all IPrinting3D3MFPackageStatics;
   type IPrinting3D3MFPackage_Interface;
   type IPrinting3D3MFPackage is access all IPrinting3D3MFPackage_Interface'Class;
   type IPrinting3D3MFPackage_Ptr is access all IPrinting3D3MFPackage;
   type IPrinting3D3MFPackage2_Interface;
   type IPrinting3D3MFPackage2 is access all IPrinting3D3MFPackage2_Interface'Class;
   type IPrinting3D3MFPackage2_Ptr is access all IPrinting3D3MFPackage2;
   type IAsyncOperation_IPrinting3DMeshVerificationResult_Interface;
   type IAsyncOperation_IPrinting3DMeshVerificationResult is access all IAsyncOperation_IPrinting3DMeshVerificationResult_Interface'Class;
   type IAsyncOperation_IPrinting3DMeshVerificationResult_Ptr is access all IAsyncOperation_IPrinting3DMeshVerificationResult;
   type IIterator_IPrinting3DComponentWithMatrix_Interface;
   type IIterator_IPrinting3DComponentWithMatrix is access all IIterator_IPrinting3DComponentWithMatrix_Interface'Class;
   type IIterator_IPrinting3DComponentWithMatrix_Ptr is access all IIterator_IPrinting3DComponentWithMatrix;
   type IIterable_IPrinting3DComponentWithMatrix_Interface;
   type IIterable_IPrinting3DComponentWithMatrix is access all IIterable_IPrinting3DComponentWithMatrix_Interface'Class;
   type IIterable_IPrinting3DComponentWithMatrix_Ptr is access all IIterable_IPrinting3DComponentWithMatrix;
   type IVectorView_IPrinting3DComponentWithMatrix_Interface;
   type IVectorView_IPrinting3DComponentWithMatrix is access all IVectorView_IPrinting3DComponentWithMatrix_Interface'Class;
   type IVectorView_IPrinting3DComponentWithMatrix_Ptr is access all IVectorView_IPrinting3DComponentWithMatrix;
   type IVector_IPrinting3DComponentWithMatrix_Interface;
   type IVector_IPrinting3DComponentWithMatrix is access all IVector_IPrinting3DComponentWithMatrix_Interface'Class;
   type IVector_IPrinting3DComponentWithMatrix_Ptr is access all IVector_IPrinting3DComponentWithMatrix;
   type IIterator_IPrinting3DBaseMaterial_Interface;
   type IIterator_IPrinting3DBaseMaterial is access all IIterator_IPrinting3DBaseMaterial_Interface'Class;
   type IIterator_IPrinting3DBaseMaterial_Ptr is access all IIterator_IPrinting3DBaseMaterial;
   type IIterable_IPrinting3DBaseMaterial_Interface;
   type IIterable_IPrinting3DBaseMaterial is access all IIterable_IPrinting3DBaseMaterial_Interface'Class;
   type IIterable_IPrinting3DBaseMaterial_Ptr is access all IIterable_IPrinting3DBaseMaterial;
   type IVectorView_IPrinting3DBaseMaterial_Interface;
   type IVectorView_IPrinting3DBaseMaterial is access all IVectorView_IPrinting3DBaseMaterial_Interface'Class;
   type IVectorView_IPrinting3DBaseMaterial_Ptr is access all IVectorView_IPrinting3DBaseMaterial;
   type IVector_IPrinting3DBaseMaterial_Interface;
   type IVector_IPrinting3DBaseMaterial is access all IVector_IPrinting3DBaseMaterial_Interface'Class;
   type IVector_IPrinting3DBaseMaterial_Ptr is access all IVector_IPrinting3DBaseMaterial;
   type IIterator_IPrinting3DColorMaterial_Interface;
   type IIterator_IPrinting3DColorMaterial is access all IIterator_IPrinting3DColorMaterial_Interface'Class;
   type IIterator_IPrinting3DColorMaterial_Ptr is access all IIterator_IPrinting3DColorMaterial;
   type IIterable_IPrinting3DColorMaterial_Interface;
   type IIterable_IPrinting3DColorMaterial is access all IIterable_IPrinting3DColorMaterial_Interface'Class;
   type IIterable_IPrinting3DColorMaterial_Ptr is access all IIterable_IPrinting3DColorMaterial;
   type IVectorView_IPrinting3DColorMaterial_Interface;
   type IVectorView_IPrinting3DColorMaterial is access all IVectorView_IPrinting3DColorMaterial_Interface'Class;
   type IVectorView_IPrinting3DColorMaterial_Ptr is access all IVectorView_IPrinting3DColorMaterial;
   type IVector_IPrinting3DColorMaterial_Interface;
   type IVector_IPrinting3DColorMaterial is access all IVector_IPrinting3DColorMaterial_Interface'Class;
   type IVector_IPrinting3DColorMaterial_Ptr is access all IVector_IPrinting3DColorMaterial;
   type IIterator_IPrinting3DTexture2CoordMaterial_Interface;
   type IIterator_IPrinting3DTexture2CoordMaterial is access all IIterator_IPrinting3DTexture2CoordMaterial_Interface'Class;
   type IIterator_IPrinting3DTexture2CoordMaterial_Ptr is access all IIterator_IPrinting3DTexture2CoordMaterial;
   type IIterable_IPrinting3DTexture2CoordMaterial_Interface;
   type IIterable_IPrinting3DTexture2CoordMaterial is access all IIterable_IPrinting3DTexture2CoordMaterial_Interface'Class;
   type IIterable_IPrinting3DTexture2CoordMaterial_Ptr is access all IIterable_IPrinting3DTexture2CoordMaterial;
   type IVectorView_IPrinting3DTexture2CoordMaterial_Interface;
   type IVectorView_IPrinting3DTexture2CoordMaterial is access all IVectorView_IPrinting3DTexture2CoordMaterial_Interface'Class;
   type IVectorView_IPrinting3DTexture2CoordMaterial_Ptr is access all IVectorView_IPrinting3DTexture2CoordMaterial;
   type IVector_IPrinting3DTexture2CoordMaterial_Interface;
   type IVector_IPrinting3DTexture2CoordMaterial is access all IVector_IPrinting3DTexture2CoordMaterial_Interface'Class;
   type IVector_IPrinting3DTexture2CoordMaterial_Ptr is access all IVector_IPrinting3DTexture2CoordMaterial;
   type IIterator_IPrinting3DCompositeMaterial_Interface;
   type IIterator_IPrinting3DCompositeMaterial is access all IIterator_IPrinting3DCompositeMaterial_Interface'Class;
   type IIterator_IPrinting3DCompositeMaterial_Ptr is access all IIterator_IPrinting3DCompositeMaterial;
   type IIterable_IPrinting3DCompositeMaterial_Interface;
   type IIterable_IPrinting3DCompositeMaterial is access all IIterable_IPrinting3DCompositeMaterial_Interface'Class;
   type IIterable_IPrinting3DCompositeMaterial_Ptr is access all IIterable_IPrinting3DCompositeMaterial;
   type IVectorView_IPrinting3DCompositeMaterial_Interface;
   type IVectorView_IPrinting3DCompositeMaterial is access all IVectorView_IPrinting3DCompositeMaterial_Interface'Class;
   type IVectorView_IPrinting3DCompositeMaterial_Ptr is access all IVectorView_IPrinting3DCompositeMaterial;
   type IVector_IPrinting3DCompositeMaterial_Interface;
   type IVector_IPrinting3DCompositeMaterial is access all IVector_IPrinting3DCompositeMaterial_Interface'Class;
   type IVector_IPrinting3DCompositeMaterial_Ptr is access all IVector_IPrinting3DCompositeMaterial;
   type IIterator_IPrinting3DMultiplePropertyMaterial_Interface;
   type IIterator_IPrinting3DMultiplePropertyMaterial is access all IIterator_IPrinting3DMultiplePropertyMaterial_Interface'Class;
   type IIterator_IPrinting3DMultiplePropertyMaterial_Ptr is access all IIterator_IPrinting3DMultiplePropertyMaterial;
   type IIterable_IPrinting3DMultiplePropertyMaterial_Interface;
   type IIterable_IPrinting3DMultiplePropertyMaterial is access all IIterable_IPrinting3DMultiplePropertyMaterial_Interface'Class;
   type IIterable_IPrinting3DMultiplePropertyMaterial_Ptr is access all IIterable_IPrinting3DMultiplePropertyMaterial;
   type IVectorView_IPrinting3DMultiplePropertyMaterial_Interface;
   type IVectorView_IPrinting3DMultiplePropertyMaterial is access all IVectorView_IPrinting3DMultiplePropertyMaterial_Interface'Class;
   type IVectorView_IPrinting3DMultiplePropertyMaterial_Ptr is access all IVectorView_IPrinting3DMultiplePropertyMaterial;
   type IVector_IPrinting3DMultiplePropertyMaterial_Interface;
   type IVector_IPrinting3DMultiplePropertyMaterial is access all IVector_IPrinting3DMultiplePropertyMaterial_Interface'Class;
   type IVector_IPrinting3DMultiplePropertyMaterial_Ptr is access all IVector_IPrinting3DMultiplePropertyMaterial;
   type IIterator_IPrinting3DBaseMaterialGroup_Interface;
   type IIterator_IPrinting3DBaseMaterialGroup is access all IIterator_IPrinting3DBaseMaterialGroup_Interface'Class;
   type IIterator_IPrinting3DBaseMaterialGroup_Ptr is access all IIterator_IPrinting3DBaseMaterialGroup;
   type IIterable_IPrinting3DBaseMaterialGroup_Interface;
   type IIterable_IPrinting3DBaseMaterialGroup is access all IIterable_IPrinting3DBaseMaterialGroup_Interface'Class;
   type IIterable_IPrinting3DBaseMaterialGroup_Ptr is access all IIterable_IPrinting3DBaseMaterialGroup;
   type IVectorView_IPrinting3DBaseMaterialGroup_Interface;
   type IVectorView_IPrinting3DBaseMaterialGroup is access all IVectorView_IPrinting3DBaseMaterialGroup_Interface'Class;
   type IVectorView_IPrinting3DBaseMaterialGroup_Ptr is access all IVectorView_IPrinting3DBaseMaterialGroup;
   type IVector_IPrinting3DBaseMaterialGroup_Interface;
   type IVector_IPrinting3DBaseMaterialGroup is access all IVector_IPrinting3DBaseMaterialGroup_Interface'Class;
   type IVector_IPrinting3DBaseMaterialGroup_Ptr is access all IVector_IPrinting3DBaseMaterialGroup;
   type IIterator_IPrinting3DColorMaterialGroup_Interface;
   type IIterator_IPrinting3DColorMaterialGroup is access all IIterator_IPrinting3DColorMaterialGroup_Interface'Class;
   type IIterator_IPrinting3DColorMaterialGroup_Ptr is access all IIterator_IPrinting3DColorMaterialGroup;
   type IIterable_IPrinting3DColorMaterialGroup_Interface;
   type IIterable_IPrinting3DColorMaterialGroup is access all IIterable_IPrinting3DColorMaterialGroup_Interface'Class;
   type IIterable_IPrinting3DColorMaterialGroup_Ptr is access all IIterable_IPrinting3DColorMaterialGroup;
   type IVectorView_IPrinting3DColorMaterialGroup_Interface;
   type IVectorView_IPrinting3DColorMaterialGroup is access all IVectorView_IPrinting3DColorMaterialGroup_Interface'Class;
   type IVectorView_IPrinting3DColorMaterialGroup_Ptr is access all IVectorView_IPrinting3DColorMaterialGroup;
   type IVector_IPrinting3DColorMaterialGroup_Interface;
   type IVector_IPrinting3DColorMaterialGroup is access all IVector_IPrinting3DColorMaterialGroup_Interface'Class;
   type IVector_IPrinting3DColorMaterialGroup_Ptr is access all IVector_IPrinting3DColorMaterialGroup;
   type IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface;
   type IIterator_IPrinting3DTexture2CoordMaterialGroup is access all IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface'Class;
   type IIterator_IPrinting3DTexture2CoordMaterialGroup_Ptr is access all IIterator_IPrinting3DTexture2CoordMaterialGroup;
   type IIterable_IPrinting3DTexture2CoordMaterialGroup_Interface;
   type IIterable_IPrinting3DTexture2CoordMaterialGroup is access all IIterable_IPrinting3DTexture2CoordMaterialGroup_Interface'Class;
   type IIterable_IPrinting3DTexture2CoordMaterialGroup_Ptr is access all IIterable_IPrinting3DTexture2CoordMaterialGroup;
   type IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface;
   type IVectorView_IPrinting3DTexture2CoordMaterialGroup is access all IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface'Class;
   type IVectorView_IPrinting3DTexture2CoordMaterialGroup_Ptr is access all IVectorView_IPrinting3DTexture2CoordMaterialGroup;
   type IVector_IPrinting3DTexture2CoordMaterialGroup_Interface;
   type IVector_IPrinting3DTexture2CoordMaterialGroup is access all IVector_IPrinting3DTexture2CoordMaterialGroup_Interface'Class;
   type IVector_IPrinting3DTexture2CoordMaterialGroup_Ptr is access all IVector_IPrinting3DTexture2CoordMaterialGroup;
   type IIterator_IPrinting3DCompositeMaterialGroup_Interface;
   type IIterator_IPrinting3DCompositeMaterialGroup is access all IIterator_IPrinting3DCompositeMaterialGroup_Interface'Class;
   type IIterator_IPrinting3DCompositeMaterialGroup_Ptr is access all IIterator_IPrinting3DCompositeMaterialGroup;
   type IIterable_IPrinting3DCompositeMaterialGroup_Interface;
   type IIterable_IPrinting3DCompositeMaterialGroup is access all IIterable_IPrinting3DCompositeMaterialGroup_Interface'Class;
   type IIterable_IPrinting3DCompositeMaterialGroup_Ptr is access all IIterable_IPrinting3DCompositeMaterialGroup;
   type IVectorView_IPrinting3DCompositeMaterialGroup_Interface;
   type IVectorView_IPrinting3DCompositeMaterialGroup is access all IVectorView_IPrinting3DCompositeMaterialGroup_Interface'Class;
   type IVectorView_IPrinting3DCompositeMaterialGroup_Ptr is access all IVectorView_IPrinting3DCompositeMaterialGroup;
   type IVector_IPrinting3DCompositeMaterialGroup_Interface;
   type IVector_IPrinting3DCompositeMaterialGroup is access all IVector_IPrinting3DCompositeMaterialGroup_Interface'Class;
   type IVector_IPrinting3DCompositeMaterialGroup_Ptr is access all IVector_IPrinting3DCompositeMaterialGroup;
   type IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface;
   type IIterator_IPrinting3DMultiplePropertyMaterialGroup is access all IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface'Class;
   type IIterator_IPrinting3DMultiplePropertyMaterialGroup_Ptr is access all IIterator_IPrinting3DMultiplePropertyMaterialGroup;
   type IIterable_IPrinting3DMultiplePropertyMaterialGroup_Interface;
   type IIterable_IPrinting3DMultiplePropertyMaterialGroup is access all IIterable_IPrinting3DMultiplePropertyMaterialGroup_Interface'Class;
   type IIterable_IPrinting3DMultiplePropertyMaterialGroup_Ptr is access all IIterable_IPrinting3DMultiplePropertyMaterialGroup;
   type IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface;
   type IVectorView_IPrinting3DMultiplePropertyMaterialGroup is access all IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface'Class;
   type IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Ptr is access all IVectorView_IPrinting3DMultiplePropertyMaterialGroup;
   type IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface;
   type IVector_IPrinting3DMultiplePropertyMaterialGroup is access all IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface'Class;
   type IVector_IPrinting3DMultiplePropertyMaterialGroup_Ptr is access all IVector_IPrinting3DMultiplePropertyMaterialGroup;
   type IIterator_IPrinting3DModelTexture_Interface;
   type IIterator_IPrinting3DModelTexture is access all IIterator_IPrinting3DModelTexture_Interface'Class;
   type IIterator_IPrinting3DModelTexture_Ptr is access all IIterator_IPrinting3DModelTexture;
   type IIterable_IPrinting3DModelTexture_Interface;
   type IIterable_IPrinting3DModelTexture is access all IIterable_IPrinting3DModelTexture_Interface'Class;
   type IIterable_IPrinting3DModelTexture_Ptr is access all IIterable_IPrinting3DModelTexture;
   type IVectorView_IPrinting3DModelTexture_Interface;
   type IVectorView_IPrinting3DModelTexture is access all IVectorView_IPrinting3DModelTexture_Interface'Class;
   type IVectorView_IPrinting3DModelTexture_Ptr is access all IVectorView_IPrinting3DModelTexture;
   type IVector_IPrinting3DModelTexture_Interface;
   type IVector_IPrinting3DModelTexture is access all IVector_IPrinting3DModelTexture_Interface'Class;
   type IVector_IPrinting3DModelTexture_Ptr is access all IVector_IPrinting3DModelTexture;
   type IIterator_IPrinting3DMesh_Interface;
   type IIterator_IPrinting3DMesh is access all IIterator_IPrinting3DMesh_Interface'Class;
   type IIterator_IPrinting3DMesh_Ptr is access all IIterator_IPrinting3DMesh;
   type IIterable_IPrinting3DMesh_Interface;
   type IIterable_IPrinting3DMesh is access all IIterable_IPrinting3DMesh_Interface'Class;
   type IIterable_IPrinting3DMesh_Ptr is access all IIterable_IPrinting3DMesh;
   type IVectorView_IPrinting3DMesh_Interface;
   type IVectorView_IPrinting3DMesh is access all IVectorView_IPrinting3DMesh_Interface'Class;
   type IVectorView_IPrinting3DMesh_Ptr is access all IVectorView_IPrinting3DMesh;
   type IVector_IPrinting3DMesh_Interface;
   type IVector_IPrinting3DMesh is access all IVector_IPrinting3DMesh_Interface'Class;
   type IVector_IPrinting3DMesh_Ptr is access all IVector_IPrinting3DMesh;
   type IIterator_IPrinting3DComponent_Interface;
   type IIterator_IPrinting3DComponent is access all IIterator_IPrinting3DComponent_Interface'Class;
   type IIterator_IPrinting3DComponent_Ptr is access all IIterator_IPrinting3DComponent;
   type IIterable_IPrinting3DComponent_Interface;
   type IIterable_IPrinting3DComponent is access all IIterable_IPrinting3DComponent_Interface'Class;
   type IIterable_IPrinting3DComponent_Ptr is access all IIterable_IPrinting3DComponent;
   type IVectorView_IPrinting3DComponent_Interface;
   type IVectorView_IPrinting3DComponent is access all IVectorView_IPrinting3DComponent_Interface'Class;
   type IVectorView_IPrinting3DComponent_Ptr is access all IVectorView_IPrinting3DComponent;
   type IVector_IPrinting3DComponent_Interface;
   type IVector_IPrinting3DComponent is access all IVector_IPrinting3DComponent_Interface'Class;
   type IVector_IPrinting3DComponent_Ptr is access all IVector_IPrinting3DComponent;
   type IAsyncOperation_IPrinting3D3MFPackage_Interface;
   type IAsyncOperation_IPrinting3D3MFPackage is access all IAsyncOperation_IPrinting3D3MFPackage_Interface'Class;
   type IAsyncOperation_IPrinting3D3MFPackage_Ptr is access all IAsyncOperation_IPrinting3D3MFPackage;
   type IIterator_IPrinting3DTextureResource_Interface;
   type IIterator_IPrinting3DTextureResource is access all IIterator_IPrinting3DTextureResource_Interface'Class;
   type IIterator_IPrinting3DTextureResource_Ptr is access all IIterator_IPrinting3DTextureResource;
   type IIterable_IPrinting3DTextureResource_Interface;
   type IIterable_IPrinting3DTextureResource is access all IIterable_IPrinting3DTextureResource_Interface'Class;
   type IIterable_IPrinting3DTextureResource_Ptr is access all IIterable_IPrinting3DTextureResource;
   type IVectorView_IPrinting3DTextureResource_Interface;
   type IVectorView_IPrinting3DTextureResource is access all IVectorView_IPrinting3DTextureResource_Interface'Class;
   type IVectorView_IPrinting3DTextureResource_Ptr is access all IVectorView_IPrinting3DTextureResource;
   type IVector_IPrinting3DTextureResource_Interface;
   type IVector_IPrinting3DTextureResource is access all IVector_IPrinting3DTextureResource_Interface'Class;
   type IVector_IPrinting3DTextureResource_Ptr is access all IVector_IPrinting3DTextureResource;
   type IAsyncOperation_IPrinting3DModel_Interface;
   type IAsyncOperation_IPrinting3DModel is access all IAsyncOperation_IPrinting3DModel_Interface'Class;
   type IAsyncOperation_IPrinting3DModel_Ptr is access all IAsyncOperation_IPrinting3DModel;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTaskCompletedEventArgs : aliased constant Windows.IID := (3424195759, 9748, 20253, (172, 204, 214, 252, 79, 218, 84, 85 ));
   
   type IPrint3DTaskCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Completion
   (
      This       : access IPrint3DTaskCompletedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Print3DTaskCompletion
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access IPrint3DTaskCompletedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Print3DTaskDetail
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTaskSourceChangedEventArgs : aliased constant Windows.IID := (1540175023, 9449, 19472, (141, 7, 20, 195, 70, 186, 63, 207 ));
   
   type IPrint3DTaskSourceChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IPrint3DTaskSourceChangedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTask : aliased constant Windows.IID := (2363740288, 8472, 19496, (128, 222, 244, 38, 215, 1, 145, 174 ));
   
   type IPrint3DTask_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IPrint3DTask_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   function add_Submitting
   (
      This       : access IPrint3DTask_Interface
      ; eventHandler : TypedEventHandler_IPrint3DTask_add_Submitting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Submitting
   (
      This       : access IPrint3DTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access IPrint3DTask_Interface
      ; eventHandler : TypedEventHandler_IPrint3DTask_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IPrint3DTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceChanged
   (
      This       : access IPrint3DTask_Interface
      ; eventHandler : TypedEventHandler_IPrint3DTask_add_SourceChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceChanged
   (
      This       : access IPrint3DTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTaskSourceRequestedArgs : aliased constant Windows.IID := (3346832058, 9391, 16973, (163, 191, 146, 37, 12, 53, 86, 2 ));
   
   type IPrint3DTaskSourceRequestedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function SetSource
   (
      This       : access IPrint3DTaskSourceRequestedArgs_Interface
      ; source : Windows.Graphics.Printing3D.IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTaskRequest : aliased constant Windows.IID := (630572143, 8773, 19546, (135, 49, 13, 96, 77, 198, 188, 60 ));
   
   type IPrint3DTaskRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTask
   (
      This       : access IPrint3DTaskRequest_Interface
      ; title : Windows.String
      ; printerId : Windows.String
      ; handler : Windows.Graphics.Printing3D.Print3DTaskSourceRequestedHandler
      ; RetVal : access Windows.Graphics.Printing3D.IPrint3DTask
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DTaskRequestedEventArgs : aliased constant Windows.IID := (353154943, 6341, 16599, (159, 64, 250, 179, 9, 110, 5, 169 ));
   
   type IPrint3DTaskRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IPrint3DTaskRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrint3DTaskRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DManagerStatics : aliased constant Windows.IID := (250727166, 43437, 19464, (169, 23, 29, 31, 134, 62, 171, 203 ));
   
   type IPrint3DManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IPrint3DManagerStatics_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrint3DManager
   )
   return Windows.HRESULT is abstract;
   
   function ShowPrintUIAsync
   (
      This       : access IPrint3DManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DManager : aliased constant Windows.IID := (1294977802, 29542, 18801, (139, 213, 23, 196, 227, 232, 198, 192 ));
   
   type IPrint3DManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_TaskRequested
   (
      This       : access IPrint3DManager_Interface
      ; eventHandler : TypedEventHandler_IPrint3DManager_add_TaskRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TaskRequested
   (
      This       : access IPrint3DManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMesh : aliased constant Windows.IID := (422482140, 552, 11777, (188, 32, 197, 41, 12, 191, 50, 196 ));
   
   type IPrinting3DMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VertexCount
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_VertexCount
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IndexCount
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_IndexCount
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexPositionsDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_VertexPositionsDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexNormalsDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_VertexNormalsDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_TriangleIndicesDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_TriangleIndicesDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_TriangleMaterialIndicesDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_TriangleMaterialIndicesDescription
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DBufferDescription
   )
   return Windows.HRESULT is abstract;
   
   function GetVertexPositions
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateVertexPositions
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetVertexNormals
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateVertexNormals
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetTriangleIndices
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateTriangleIndices
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetTriangleMaterialIndices
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateTriangleMaterialIndices
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferDescriptionSet
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferSet
   (
      This       : access IPrinting3DMesh_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function VerifyAsync
   (
      This       : access IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DMeshVerificationMode
      ; RetVal : access Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DMeshVerificationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DModelTexture : aliased constant Windows.IID := (1571802881, 46493, 18492, (151, 187, 164, 213, 70, 209, 199, 92 ));
   
   type IPrinting3DModelTexture_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextureResource
   (
      This       : access IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function put_TextureResource
   (
      This       : access IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_TileStyleU
   (
      This       : access IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_TileStyleU
   (
      This       : access IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_TileStyleV
   (
      This       : access IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_TileStyleV
   (
      This       : access IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DTextureResource : aliased constant Windows.IID := (2802709293, 27313, 17582, (188, 69, 162, 115, 130, 192, 211, 140 ));
   
   type IPrinting3DTextureResource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextureData
   (
      This       : access IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function put_TextureData
   (
      This       : access IPrinting3DTextureResource_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IPrinting3DTextureResource_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DComponentWithMatrix : aliased constant Windows.IID := (846852917, 3824, 17771, (154, 33, 73, 190, 190, 139, 81, 194 ));
   
   type IPrinting3DComponentWithMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Component
   (
      This       : access IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function put_Component
   (
      This       : access IPrinting3DComponentWithMatrix_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function get_Matrix
   (
      This       : access IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   function put_Matrix
   (
      This       : access IPrinting3DComponentWithMatrix_Interface
      ; value : Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DComponent : aliased constant Windows.IID := (2116581445, 49023, 19675, (162, 127, 48, 160, 20, 55, 254, 222 ));
   
   type IPrinting3DComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mesh
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function put_Mesh
   (
      This       : access IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function get_Components
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DComponentWithMatrix -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DObjectType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DObjectType
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IPrinting3DComponent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PartNumber
   (
      This       : access IPrinting3DComponent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PartNumber
   (
      This       : access IPrinting3DComponent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DBaseMaterialStatics : aliased constant Windows.IID := (2170177468, 14154, 18285, (190, 146, 62, 207, 209, 203, 151, 118 ));
   
   type IPrinting3DBaseMaterialStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Abs
   (
      This       : access IPrinting3DBaseMaterialStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pla
   (
      This       : access IPrinting3DBaseMaterialStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DBaseMaterial : aliased constant Windows.IID := (3505448771, 50444, 19403, (157, 4, 252, 22, 173, 206, 162, 201 ));
   
   type IPrinting3DBaseMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IPrinting3DBaseMaterial_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Color
   (
      This       : access IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IPrinting3DBaseMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DColorMaterial : aliased constant Windows.IID := (3783891240, 31975, 17029, (163, 93, 241, 69, 201, 81, 12, 123 ));
   
   type IPrinting3DColorMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IPrinting3DColorMaterial_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DColorMaterial2 : aliased constant Windows.IID := (4205897810, 2799, 17641, (157, 221, 54, 238, 234, 90, 205, 68 ));
   
   type IPrinting3DColorMaterial2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IPrinting3DColorMaterial2_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IPrinting3DColorMaterial2_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DTexture2CoordMaterial : aliased constant Windows.IID := (2374257659, 2025, 18822, (152, 51, 141, 211, 212, 140, 104, 89 ));
   
   type IPrinting3DTexture2CoordMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Texture
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function put_Texture
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function get_U
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_U
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_V
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_V
   (
      This       : access IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DCompositeMaterial : aliased constant Windows.IID := (1176647901, 22062, 20332, (136, 45, 244, 216, 65, 253, 99, 199 ));
   
   type IPrinting3DCompositeMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Values
   (
      This       : access IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMultiplePropertyMaterial : aliased constant Windows.IID := (631645515, 50921, 18509, (162, 20, 162, 94, 87, 118, 186, 98 ));
   
   type IPrinting3DMultiplePropertyMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaterialIndices
   (
      This       : access IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DBaseMaterialGroupFactory : aliased constant Windows.IID := (1544898268, 34455, 16787, (151, 107, 132, 187, 65, 22, 229, 191 ));
   
   type IPrinting3DBaseMaterialGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrinting3DBaseMaterialGroupFactory_Interface
      ; MaterialGroupId : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DBaseMaterialGroup : aliased constant Windows.IID := (2498785464, 9493, 19085, (161, 240, 208, 252, 19, 208, 96, 33 ));
   
   type IPrinting3DBaseMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bases
   (
      This       : access IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DBaseMaterial -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupId
   (
      This       : access IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DColorMaterialGroupFactory : aliased constant Windows.IID := (1909689709, 45546, 19035, (188, 84, 25, 198, 95, 61, 240, 68 ));
   
   type IPrinting3DColorMaterialGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrinting3DColorMaterialGroupFactory_Interface
      ; MaterialGroupId : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DColorMaterialGroup : aliased constant Windows.IID := (1731536, 43743, 16934, (175, 233, 243, 105, 160, 180, 80, 4 ));
   
   type IPrinting3DColorMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Colors
   (
      This       : access IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DColorMaterial -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupId
   (
      This       : access IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DTexture2CoordMaterialGroupFactory : aliased constant Windows.IID := (3417328048, 18058, 19567, (178, 162, 142, 184, 186, 141, 234, 72 ));
   
   type IPrinting3DTexture2CoordMaterialGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrinting3DTexture2CoordMaterialGroupFactory_Interface
      ; MaterialGroupId : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DTexture2CoordMaterialGroup : aliased constant Windows.IID := (1652391079, 28048, 20409, (159, 196, 159, 239, 243, 223, 168, 146 ));
   
   type IPrinting3DTexture2CoordMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Texture2Coords
   (
      This       : access IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DTexture2CoordMaterial -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupId
   (
      This       : access IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DTexture2CoordMaterialGroup2 : aliased constant Windows.IID := (1778113466, 45358, 17051, (131, 134, 223, 82, 132, 246, 232, 15 ));
   
   type IPrinting3DTexture2CoordMaterialGroup2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Texture
   (
      This       : access IPrinting3DTexture2CoordMaterialGroup2_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function put_Texture
   (
      This       : access IPrinting3DTexture2CoordMaterialGroup2_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DCompositeMaterialGroupFactory : aliased constant Windows.IID := (3499019539, 37631, 17322, (166, 39, 141, 67, 194, 44, 129, 126 ));
   
   type IPrinting3DCompositeMaterialGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrinting3DCompositeMaterialGroupFactory_Interface
      ; MaterialGroupId : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DCompositeMaterialGroup2 : aliased constant Windows.IID := (115895650, 32059, 16865, (148, 76, 186, 253, 228, 85, 84, 131 ));
   
   type IPrinting3DCompositeMaterialGroup2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaseMaterialGroup
   (
      This       : access IPrinting3DCompositeMaterialGroup2_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function put_BaseMaterialGroup
   (
      This       : access IPrinting3DCompositeMaterialGroup2_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DCompositeMaterialGroup : aliased constant Windows.IID := (2375314011, 16625, 18797, (165, 251, 52, 10, 90, 103, 142, 48 ));
   
   type IPrinting3DCompositeMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Composites
   (
      This       : access IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DCompositeMaterial -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupId
   (
      This       : access IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialIndices
   (
      This       : access IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMultiplePropertyMaterialGroupFactory : aliased constant Windows.IID := (842930542, 54470, 17694, (168, 20, 77, 120, 162, 16, 254, 83 ));
   
   type IPrinting3DMultiplePropertyMaterialGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrinting3DMultiplePropertyMaterialGroupFactory_Interface
      ; MaterialGroupId : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMultiplePropertyMaterialGroup : aliased constant Windows.IID := (4036298009, 44729, 17685, (163, 155, 160, 136, 251, 187, 39, 124 ));
   
   type IPrinting3DMultiplePropertyMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MultipleProperties
   (
      This       : access IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DMultiplePropertyMaterial -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupIndices
   (
      This       : access IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialGroupId
   (
      This       : access IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMaterial : aliased constant Windows.IID := (932033110, 60770, 18770, (184, 91, 3, 86, 125, 124, 70, 94 ));
   
   type IPrinting3DMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaseGroups
   (
      This       : access IPrinting3DMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DBaseMaterialGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorGroups
   (
      This       : access IPrinting3DMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DColorMaterialGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Texture2CoordGroups
   (
      This       : access IPrinting3DMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DTexture2CoordMaterialGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CompositeGroups
   (
      This       : access IPrinting3DMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DCompositeMaterialGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MultiplePropertyGroups
   (
      This       : access IPrinting3DMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DMultiplePropertyMaterialGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DMeshVerificationResult : aliased constant Windows.IID := (425095610, 59706, 20106, (164, 111, 222, 168, 232, 82, 25, 126 ));
   
   type IPrinting3DMeshVerificationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsValid
   (
      This       : access IPrinting3DMeshVerificationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NonmanifoldTriangles
   (
      This       : access IPrinting3DMeshVerificationResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ReversedNormalTriangles
   (
      This       : access IPrinting3DMeshVerificationResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DModel : aliased constant Windows.IID := (755052272, 21243, 37274, (119, 176, 75, 26, 59, 128, 50, 79 ));
   
   type IPrinting3DModel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unit
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DModelUnit
   )
   return Windows.HRESULT is abstract;
   
   function put_Unit
   (
      This       : access IPrinting3DModel_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DModelUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_Textures
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DModelTexture -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Meshes
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DMesh -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Components
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DComponent -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Material
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMaterial
   )
   return Windows.HRESULT is abstract;
   
   function put_Material
   (
      This       : access IPrinting3DModel_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Build
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function put_Build
   (
      This       : access IPrinting3DModel_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Version
   (
      This       : access IPrinting3DModel_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RequiredExtensions
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Metadata
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RepairAsync
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DFaceReductionOptions : aliased constant Windows.IID := (3154039703, 11636, 18167, (190, 133, 153, 166, 123, 187, 102, 41 ));
   
   type IPrinting3DFaceReductionOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxReductionArea
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxReductionArea
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetTriangleCount
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetTriangleCount
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxEdgeLength
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxEdgeLength
   (
      This       : access IPrinting3DFaceReductionOptions_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3DModel2 : aliased constant Windows.IID := (3374344647, 51265, 18419, (168, 78, 161, 73, 253, 8, 182, 87 ));
   
   type IPrinting3DModel2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryPartialRepairAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryPartialRepairWithTimeAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; maxWaitTime : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryReduceFacesAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryReduceFacesWithOptionsAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; printing3DFaceReductionOptions : Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryReduceFacesWithOptionsAndTimeAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; printing3DFaceReductionOptions : Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions
      ; maxWait : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RepairWithProgressAsync
   (
      This       : access IPrinting3DModel2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3D3MFPackageStatics : aliased constant Windows.IID := (1884871087, 31386, 18311, (184, 23, 246, 244, 89, 33, 72, 35 ));
   
   type IPrinting3D3MFPackageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadAsync
   (
      This       : access IPrinting3D3MFPackageStatics_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3D3MFPackage : aliased constant Windows.IID := (4132296136, 10935, 17833, (161, 183, 38, 126, 148, 141, 91, 24 ));
   
   type IPrinting3D3MFPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function SaveAsync
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintTicket
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function put_PrintTicket
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelPart
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function put_ModelPart
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_Textures
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVector_IPrinting3DTextureResource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadModelFromPackageAsync
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DModel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveModelToPackageAsync
   (
      This       : access IPrinting3D3MFPackage_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModel
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrinting3D3MFPackage2 : aliased constant Windows.IID := (2522643140, 37835, 17456, (146, 184, 120, 156, 212, 84, 248, 131 ));
   
   type IPrinting3D3MFPackage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Compression
   (
      This       : access IPrinting3D3MFPackage2_Interface
      ; RetVal : access Windows.Graphics.Printing3D.Printing3DPackageCompression
   )
   return Windows.HRESULT is abstract;
   
   function put_Compression
   (
      This       : access IPrinting3D3MFPackage2_Interface
      ; value : Windows.Graphics.Printing3D.Printing3DPackageCompression
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPrinting3DMeshVerificationResult : aliased constant Windows.IID := (262059716, 6645, 23529, (154, 219, 100, 242, 74, 241, 21, 216 ));
   
   type IAsyncOperation_IPrinting3DMeshVerificationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPrinting3DMeshVerificationResult_Interface
      ; handler : Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPrinting3DMeshVerificationResult_Interface
      ; RetVal : access Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPrinting3DMeshVerificationResult_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DComponentWithMatrix : aliased constant Windows.IID := (30592580, 35683, 22303, (185, 46, 191, 44, 247, 204, 109, 83 ));
   
   type IIterator_IPrinting3DComponentWithMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DComponentWithMatrix_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DComponentWithMatrix : aliased constant Windows.IID := (2317432392, 2945, 24099, (164, 142, 175, 233, 246, 105, 28, 193 ));
   
   type IIterable_IPrinting3DComponentWithMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DComponentWithMatrix : aliased constant Windows.IID := (248867463, 30534, 21576, (141, 157, 223, 249, 250, 159, 215, 96 ));
   
   type IVectorView_IPrinting3DComponentWithMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DComponentWithMatrix_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DComponentWithMatrix_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DComponentWithMatrix_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DComponentWithMatrix : aliased constant Windows.IID := (4036967895, 25062, 23181, (157, 223, 87, 0, 31, 112, 93, 231 ));
   
   type IVector_IPrinting3DComponentWithMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DComponentWithMatrix_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DBaseMaterial : aliased constant Windows.IID := (3671383309, 22955, 20511, (157, 107, 162, 9, 199, 213, 70, 73 ));
   
   type IIterator_IPrinting3DBaseMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DBaseMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DBaseMaterial : aliased constant Windows.IID := (2590757168, 28450, 21916, (185, 44, 20, 249, 248, 221, 218, 71 ));
   
   type IIterable_IPrinting3DBaseMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DBaseMaterial : aliased constant Windows.IID := (3435589794, 19929, 21773, (133, 120, 51, 14, 19, 138, 218, 7 ));
   
   type IVectorView_IPrinting3DBaseMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DBaseMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DBaseMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DBaseMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DBaseMaterial : aliased constant Windows.IID := (1784325535, 65040, 20859, (177, 169, 198, 133, 236, 206, 22, 68 ));
   
   type IVector_IPrinting3DBaseMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DBaseMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterial_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DColorMaterial : aliased constant Windows.IID := (1515496609, 19863, 22739, (189, 204, 27, 243, 139, 67, 141, 109 ));
   
   type IIterator_IPrinting3DColorMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DColorMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DColorMaterial : aliased constant Windows.IID := (3346878248, 30850, 21172, (179, 201, 125, 88, 200, 131, 101, 115 ));
   
   type IIterable_IPrinting3DColorMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DColorMaterial : aliased constant Windows.IID := (2161809294, 31938, 21279, (129, 107, 250, 104, 170, 68, 110, 140 ));
   
   type IVectorView_IPrinting3DColorMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DColorMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DColorMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DColorMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DColorMaterial : aliased constant Windows.IID := (1616996093, 27637, 21409, (177, 174, 195, 72, 146, 239, 22, 99 ));
   
   type IVector_IPrinting3DColorMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DColorMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterial_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DTexture2CoordMaterial : aliased constant Windows.IID := (1926761827, 13862, 23087, (165, 121, 120, 231, 10, 168, 109, 70 ));
   
   type IIterator_IPrinting3DTexture2CoordMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DTexture2CoordMaterial : aliased constant Windows.IID := (674706038, 18492, 23504, (153, 199, 1, 191, 160, 74, 87, 212 ));
   
   type IIterable_IPrinting3DTexture2CoordMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DTexture2CoordMaterial : aliased constant Windows.IID := (357892317, 61578, 23363, (135, 20, 139, 192, 23, 148, 206, 35 ));
   
   type IVectorView_IPrinting3DTexture2CoordMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DTexture2CoordMaterial : aliased constant Windows.IID := (4050632492, 51075, 24287, (173, 123, 127, 183, 234, 207, 21, 1 ));
   
   type IVector_IPrinting3DTexture2CoordMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DCompositeMaterial : aliased constant Windows.IID := (3085349242, 43141, 23703, (178, 158, 191, 38, 30, 181, 218, 212 ));
   
   type IIterator_IPrinting3DCompositeMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DCompositeMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DCompositeMaterial : aliased constant Windows.IID := (2695833123, 6929, 21455, (151, 93, 100, 149, 147, 134, 205, 211 ));
   
   type IIterable_IPrinting3DCompositeMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DCompositeMaterial : aliased constant Windows.IID := (3700687650, 11087, 23658, (183, 246, 53, 140, 237, 51, 188, 104 ));
   
   type IVectorView_IPrinting3DCompositeMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DCompositeMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DCompositeMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DCompositeMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DCompositeMaterial : aliased constant Windows.IID := (3283253909, 24316, 21191, (181, 222, 232, 46, 5, 154, 114, 46 ));
   
   type IVector_IPrinting3DCompositeMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DCompositeMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DMultiplePropertyMaterial : aliased constant Windows.IID := (1632373258, 49013, 22189, (163, 4, 183, 159, 96, 1, 123, 131 ));
   
   type IIterator_IPrinting3DMultiplePropertyMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DMultiplePropertyMaterial : aliased constant Windows.IID := (234628942, 44621, 23483, (147, 168, 125, 201, 248, 77, 218, 195 ));
   
   type IIterable_IPrinting3DMultiplePropertyMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DMultiplePropertyMaterial : aliased constant Windows.IID := (2895584862, 44082, 22651, (167, 1, 251, 190, 106, 241, 177, 18 ));
   
   type IVectorView_IPrinting3DMultiplePropertyMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DMultiplePropertyMaterial : aliased constant Windows.IID := (3793317286, 27177, 22946, (157, 214, 147, 6, 47, 68, 186, 173 ));
   
   type IVector_IPrinting3DMultiplePropertyMaterial_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterial_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DBaseMaterialGroup : aliased constant Windows.IID := (2739783433, 58023, 21076, (157, 193, 205, 71, 232, 94, 37, 4 ));
   
   type IIterator_IPrinting3DBaseMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DBaseMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DBaseMaterialGroup : aliased constant Windows.IID := (3230633584, 63215, 21609, (128, 106, 124, 182, 1, 221, 219, 103 ));
   
   type IIterable_IPrinting3DBaseMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DBaseMaterialGroup : aliased constant Windows.IID := (1550347310, 52616, 21077, (169, 97, 91, 79, 43, 241, 60, 112 ));
   
   type IVectorView_IPrinting3DBaseMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DBaseMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DBaseMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DBaseMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DBaseMaterialGroup : aliased constant Windows.IID := (729862863, 21577, 23681, (130, 38, 235, 252, 125, 114, 245, 121 ));
   
   type IVector_IPrinting3DBaseMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DBaseMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DColorMaterialGroup : aliased constant Windows.IID := (1233414078, 56846, 21803, (178, 78, 142, 226, 94, 201, 164, 134 ));
   
   type IIterator_IPrinting3DColorMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DColorMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DColorMaterialGroup : aliased constant Windows.IID := (468920966, 9899, 22352, (181, 76, 59, 218, 103, 134, 127, 138 ));
   
   type IIterable_IPrinting3DColorMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DColorMaterialGroup : aliased constant Windows.IID := (3702568512, 35343, 22467, (158, 62, 213, 169, 136, 28, 194, 17 ));
   
   type IVectorView_IPrinting3DColorMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DColorMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DColorMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DColorMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DColorMaterialGroup : aliased constant Windows.IID := (2088769523, 33637, 23208, (159, 208, 167, 105, 242, 110, 63, 239 ));
   
   type IVector_IPrinting3DColorMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DColorMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DTexture2CoordMaterialGroup : aliased constant Windows.IID := (300608708, 27329, 22167, (155, 245, 30, 246, 23, 225, 223, 235 ));
   
   type IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DTexture2CoordMaterialGroup : aliased constant Windows.IID := (96797, 38588, 23566, (183, 134, 89, 79, 180, 208, 119, 182 ));
   
   type IIterable_IPrinting3DTexture2CoordMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DTexture2CoordMaterialGroup : aliased constant Windows.IID := (1296362560, 20281, 21810, (185, 218, 106, 111, 154, 97, 168, 66 ));
   
   type IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DTexture2CoordMaterialGroup : aliased constant Windows.IID := (2110164630, 10850, 24186, (133, 213, 72, 100, 208, 53, 145, 235 ));
   
   type IVector_IPrinting3DTexture2CoordMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DTexture2CoordMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DCompositeMaterialGroup : aliased constant Windows.IID := (2944855716, 56733, 23209, (174, 229, 190, 56, 146, 18, 71, 66 ));
   
   type IIterator_IPrinting3DCompositeMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DCompositeMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DCompositeMaterialGroup : aliased constant Windows.IID := (4076859233, 49748, 22720, (130, 6, 179, 179, 9, 107, 233, 203 ));
   
   type IIterable_IPrinting3DCompositeMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DCompositeMaterialGroup : aliased constant Windows.IID := (108092939, 21233, 23942, (158, 236, 31, 7, 151, 54, 51, 131 ));
   
   type IVectorView_IPrinting3DCompositeMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DCompositeMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DCompositeMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DCompositeMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DCompositeMaterialGroup : aliased constant Windows.IID := (508349816, 46784, 20913, (171, 43, 195, 66, 47, 2, 194, 78 ));
   
   type IVector_IPrinting3DCompositeMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DCompositeMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DMultiplePropertyMaterialGroup : aliased constant Windows.IID := (2722868122, 55622, 20534, (177, 201, 28, 9, 183, 147, 243, 108 ));
   
   type IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DMultiplePropertyMaterialGroup : aliased constant Windows.IID := (603410830, 9273, 21875, (166, 131, 239, 202, 12, 97, 168, 214 ));
   
   type IIterable_IPrinting3DMultiplePropertyMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DMultiplePropertyMaterialGroup : aliased constant Windows.IID := (2232668985, 4841, 23819, (151, 141, 254, 150, 125, 5, 19, 21 ));
   
   type IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DMultiplePropertyMaterialGroup : aliased constant Windows.IID := (576215956, 13473, 23402, (186, 227, 191, 68, 101, 152, 18, 243 ));
   
   type IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DMultiplePropertyMaterialGroup_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DModelTexture : aliased constant Windows.IID := (1028078754, 19084, 23741, (128, 127, 73, 175, 21, 128, 210, 186 ));
   
   type IIterator_IPrinting3DModelTexture_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DModelTexture_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DModelTexture_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DModelTexture : aliased constant Windows.IID := (2490959984, 24641, 23812, (134, 153, 23, 65, 113, 23, 187, 133 ));
   
   type IIterable_IPrinting3DModelTexture_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DModelTexture : aliased constant Windows.IID := (864944973, 34866, 23557, (129, 191, 39, 171, 127, 73, 38, 74 ));
   
   type IVectorView_IPrinting3DModelTexture_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DModelTexture_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DModelTexture_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DModelTexture_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DModelTexture : aliased constant Windows.IID := (1316116367, 39914, 22115, (134, 153, 231, 252, 173, 53, 71, 167 ));
   
   type IVector_IPrinting3DModelTexture_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DModelTexture
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DModelTexture_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DModelTexture_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DModelTexture_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DMesh : aliased constant Windows.IID := (383643954, 63501, 21426, (176, 159, 164, 46, 217, 104, 159, 196 ));
   
   type IIterator_IPrinting3DMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DMesh_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DMesh_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DMesh_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMesh_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DMesh : aliased constant Windows.IID := (2818674650, 56909, 22266, (134, 9, 253, 34, 152, 191, 181, 88 ));
   
   type IIterable_IPrinting3DMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DMesh : aliased constant Windows.IID := (1266904294, 7446, 24149, (177, 160, 97, 199, 15, 41, 147, 27 ));
   
   type IVectorView_IPrinting3DMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DMesh_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DMesh_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DMesh_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMesh_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DMesh : aliased constant Windows.IID := (3138502254, 46482, 23490, (154, 83, 1, 39, 169, 179, 33, 114 ));
   
   type IVector_IPrinting3DMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DMesh
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DMesh_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DMesh_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DMesh_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DMesh_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DMesh_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DComponent : aliased constant Windows.IID := (782150586, 6219, 23572, (174, 95, 235, 99, 74, 167, 23, 224 ));
   
   type IIterator_IPrinting3DComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DComponent_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DComponent_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DComponent_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponent_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DComponent : aliased constant Windows.IID := (1365595850, 63586, 23032, (130, 65, 224, 240, 193, 119, 218, 221 ));
   
   type IIterable_IPrinting3DComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DComponent : aliased constant Windows.IID := (3284966780, 45663, 24146, (148, 116, 157, 41, 21, 244, 78, 172 ));
   
   type IVectorView_IPrinting3DComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DComponent_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DComponent_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DComponent_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponent_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DComponent : aliased constant Windows.IID := (1239831746, 62322, 22574, (151, 204, 203, 107, 15, 163, 186, 98 ));
   
   type IVector_IPrinting3DComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DComponent
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DComponent_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DComponent_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponent_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DComponent_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DComponent_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPrinting3D3MFPackage : aliased constant Windows.IID := (1827859256, 57448, 21848, (148, 176, 1, 97, 25, 44, 95, 25 ));
   
   type IAsyncOperation_IPrinting3D3MFPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPrinting3D3MFPackage_Interface
      ; handler : Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPrinting3D3MFPackage_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3D3MFPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrinting3DTextureResource : aliased constant Windows.IID := (108582363, 36810, 20612, (168, 81, 115, 18, 254, 83, 247, 53 ));
   
   type IIterator_IPrinting3DTextureResource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrinting3DTextureResource_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTextureResource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrinting3DTextureResource : aliased constant Windows.IID := (1424205597, 60128, 20889, (151, 40, 250, 201, 100, 133, 14, 187 ));
   
   type IIterable_IPrinting3DTextureResource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IIterator_IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrinting3DTextureResource : aliased constant Windows.IID := (172582093, 54151, 23921, (167, 29, 79, 10, 85, 185, 182, 137 ));
   
   type IVectorView_IPrinting3DTextureResource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrinting3DTextureResource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrinting3DTextureResource_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrinting3DTextureResource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTextureResource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrinting3DTextureResource : aliased constant Windows.IID := (302598345, 43685, 24293, (161, 51, 50, 21, 208, 86, 20, 4 ));
   
   type IVector_IPrinting3DTextureResource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IVectorView_IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; value : Windows.Graphics.Printing3D.IPrinting3DTextureResource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing3D.IPrinting3DTextureResource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrinting3DTextureResource_Interface
      ; items : Windows.Graphics.Printing3D.IPrinting3DTextureResource_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPrinting3DModel : aliased constant Windows.IID := (455577611, 4309, 21503, (154, 52, 75, 49, 243, 21, 130, 176 ));
   
   type IAsyncOperation_IPrinting3DModel_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPrinting3DModel_Interface
      ; handler : Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3DModel
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.AsyncOperationCompletedHandler_IPrinting3DModel
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPrinting3DModel_Interface
      ; RetVal : access Windows.Graphics.Printing3D.IPrinting3DModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_Print3DTaskSourceRequestedHandler : aliased constant Windows.IID := (3910622832, 51479, 18142, (187, 81, 217, 169, 77, 179, 113, 31 ));
   
   type Print3DTaskSourceRequestedHandler_Interface(Callback : access procedure (args : Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs)) is new Windows.IMulticastDelegate_Interface(IID_Print3DTaskSourceRequestedHandler'access) with null record;
   function Invoke
   (
      This       : access Print3DTaskSourceRequestedHandler_Interface
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DTask_add_Submitting : aliased constant Windows.IID := (3221755409, 29829, 22696, (136, 190, 130, 231, 18, 216, 193, 186 ));
   
   type TypedEventHandler_IPrint3DTask_add_Submitting_Interface(Callback : access procedure (sender : Windows.Graphics.Printing3D.IPrint3DTask ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DTask_add_Submitting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_Submitting_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DTask_add_Completed : aliased constant Windows.IID := (3167711381, 48270, 24565, (131, 192, 213, 105, 30, 10, 162, 77 ));
   
   type TypedEventHandler_IPrint3DTask_add_Completed_Interface(Callback : access procedure (sender : Windows.Graphics.Printing3D.IPrint3DTask ; args : Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DTask_add_Completed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_Completed_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DTask_add_SourceChanged : aliased constant Windows.IID := (1490247765, 577, 21853, (175, 123, 159, 5, 229, 218, 164, 18 ));
   
   type TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Printing3D.IPrint3DTask ; args : Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DTask_add_SourceChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DManager_add_TaskRequested : aliased constant Windows.IID := (2009359523, 42950, 21778, (152, 89, 65, 45, 179, 246, 106, 196 ));
   
   type TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface(Callback : access procedure (sender : Windows.Graphics.Printing3D.IPrint3DManager ; args : Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DManager_add_TaskRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DManager
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult : aliased constant Windows.IID := (409710103, 22678, 22238, (191, 244, 79, 23, 107, 62, 97, 148 ));
   
   type AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DMeshVerificationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DMeshVerificationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPrinting3D3MFPackage : aliased constant Windows.IID := (683061768, 34215, 21489, (131, 174, 87, 122, 125, 230, 106, 155 ));
   
   type AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPrinting3D3MFPackage'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPrinting3DModel : aliased constant Windows.IID := (653579084, 41245, 23305, (153, 8, 173, 232, 177, 177, 53, 85 ));
   
   type AsyncOperationCompletedHandler_IPrinting3DModel_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DModel ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPrinting3DModel'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3DModel_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DModel
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Print3DTaskCompletedEventArgs is Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs;
   subtype Print3DTaskSourceChangedEventArgs is Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs;
   subtype Print3DTask is Windows.Graphics.Printing3D.IPrint3DTask;
   subtype Print3DTaskSourceRequestedArgs is Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs;
   subtype Print3DTaskRequest is Windows.Graphics.Printing3D.IPrint3DTaskRequest;
   subtype Print3DTaskRequestedEventArgs is Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs;
   subtype Print3DManager is Windows.Graphics.Printing3D.IPrint3DManager;
   subtype Printing3DMeshVerificationResult is Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult;
   subtype Printing3DTextureResource is Windows.Graphics.Printing3D.IPrinting3DTextureResource;
   function Create return Windows.Graphics.Printing3D.IPrinting3DTextureResource;
   
   subtype Printing3DComponent is Windows.Graphics.Printing3D.IPrinting3DComponent;
   function Create return Windows.Graphics.Printing3D.IPrinting3DComponent;
   
   subtype Printing3DMesh is Windows.Graphics.Printing3D.IPrinting3DMesh;
   function Create return Windows.Graphics.Printing3D.IPrinting3DMesh;
   
   subtype Printing3DComponentWithMatrix is Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix;
   function Create return Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix;
   
   subtype Printing3DColorMaterial is Windows.Graphics.Printing3D.IPrinting3DColorMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DColorMaterial;
   
   subtype Printing3DModelTexture is Windows.Graphics.Printing3D.IPrinting3DModelTexture;
   function Create return Windows.Graphics.Printing3D.IPrinting3DModelTexture;
   
   subtype Printing3DBaseMaterialGroup is Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup;
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup;
   
   subtype Printing3DBaseMaterial is Windows.Graphics.Printing3D.IPrinting3DBaseMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DBaseMaterial;
   
   subtype Printing3DColorMaterialGroup is Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup;
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup;
   
   subtype Printing3DTexture2CoordMaterialGroup is Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup;
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup;
   
   subtype Printing3DTexture2CoordMaterial is Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial;
   
   subtype Printing3DCompositeMaterialGroup is Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup;
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup;
   
   subtype Printing3DCompositeMaterial is Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial;
   
   subtype Printing3DMultiplePropertyMaterialGroup is Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup;
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup;
   
   subtype Printing3DMultiplePropertyMaterial is Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial;
   
   subtype Printing3DMaterial is Windows.Graphics.Printing3D.IPrinting3DMaterial;
   function Create return Windows.Graphics.Printing3D.IPrinting3DMaterial;
   
   subtype Printing3DModel is Windows.Graphics.Printing3D.IPrinting3DModel;
   function Create return Windows.Graphics.Printing3D.IPrinting3DModel;
   
   subtype Printing3DFaceReductionOptions is Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions;
   function Create return Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions;
   
   subtype Printing3D3MFPackage is Windows.Graphics.Printing3D.IPrinting3D3MFPackage;
   function Create return Windows.Graphics.Printing3D.IPrinting3D3MFPackage;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Printing3D.IPrint3DManager;
   
   function ShowPrintUIAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_Abs
   return Windows.String;
   
   function get_Pla
   return Windows.String;
   
   function LoadAsync
   (
      value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage;
   
end;
