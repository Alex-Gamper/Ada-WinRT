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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.UI.Input.Inking.Analysis is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type InkAnalysisDrawingKind is (
      Drawing,
      Circle,
      Ellipse,
      Triangle,
      IsoscelesTriangle,
      EquilateralTriangle,
      RightTriangle,
      Quadrilateral,
      Rectangle,
      Square,
      Diamond,
      Trapezoid,
      Parallelogram,
      Pentagon,
      Hexagon
   );
   for InkAnalysisDrawingKind use (
      Drawing => 0,
      Circle => 1,
      Ellipse => 2,
      Triangle => 3,
      IsoscelesTriangle => 4,
      EquilateralTriangle => 5,
      RightTriangle => 6,
      Quadrilateral => 7,
      Rectangle => 8,
      Square => 9,
      Diamond => 10,
      Trapezoid => 11,
      Parallelogram => 12,
      Pentagon => 13,
      Hexagon => 14
   );
   for InkAnalysisDrawingKind'Size use 32;
   
   type InkAnalysisDrawingKind_Ptr is access InkAnalysisDrawingKind;
   
   type InkAnalysisNodeKind is (
      UnclassifiedInk,
      Root,
      WritingRegion,
      Paragraph,
      Line,
      InkWord,
      InkBullet,
      InkDrawing,
      ListItem
   );
   for InkAnalysisNodeKind use (
      UnclassifiedInk => 0,
      Root => 1,
      WritingRegion => 2,
      Paragraph => 3,
      Line => 4,
      InkWord => 5,
      InkBullet => 6,
      InkDrawing => 7,
      ListItem => 8
   );
   for InkAnalysisNodeKind'Size use 32;
   
   type InkAnalysisNodeKind_Ptr is access InkAnalysisNodeKind;
   
   type InkAnalysisStatus is (
      Updated,
      Unchanged
   );
   for InkAnalysisStatus use (
      Updated => 0,
      Unchanged => 1
   );
   for InkAnalysisStatus'Size use 32;
   
   type InkAnalysisStatus_Ptr is access InkAnalysisStatus;
   
   type InkAnalysisStrokeKind is (
      Auto,
      Writing,
      Drawing
   );
   for InkAnalysisStrokeKind use (
      Auto => 0,
      Writing => 1,
      Drawing => 2
   );
   for InkAnalysisStrokeKind'Size use 32;
   
   type InkAnalysisStrokeKind_Ptr is access InkAnalysisStrokeKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IInkAnalysisResult_Interface;
   type AsyncOperationCompletedHandler_IInkAnalysisResult is access all AsyncOperationCompletedHandler_IInkAnalysisResult_Interface'Class;
   type AsyncOperationCompletedHandler_IInkAnalysisResult_Ptr is access all AsyncOperationCompletedHandler_IInkAnalysisResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInkAnalyzer_Interface;
   type IInkAnalyzer is access all IInkAnalyzer_Interface'Class;
   type IInkAnalyzer_Ptr is access all IInkAnalyzer;
   type IInkAnalyzerFactory_Interface;
   type IInkAnalyzerFactory is access all IInkAnalyzerFactory_Interface'Class;
   type IInkAnalyzerFactory_Ptr is access all IInkAnalyzerFactory;
   type IInkAnalysisResult_Interface;
   type IInkAnalysisResult is access all IInkAnalysisResult_Interface'Class;
   type IInkAnalysisResult_Ptr is access all IInkAnalysisResult;
   type IInkAnalysisNode_Interface;
   type IInkAnalysisNode is access all IInkAnalysisNode_Interface'Class;
   type IInkAnalysisNode_Ptr is access all IInkAnalysisNode;
   type IInkAnalysisRoot_Interface;
   type IInkAnalysisRoot is access all IInkAnalysisRoot_Interface'Class;
   type IInkAnalysisRoot_Ptr is access all IInkAnalysisRoot;
   type IInkAnalysisWritingRegion_Interface;
   type IInkAnalysisWritingRegion is access all IInkAnalysisWritingRegion_Interface'Class;
   type IInkAnalysisWritingRegion_Ptr is access all IInkAnalysisWritingRegion;
   type IInkAnalysisParagraph_Interface;
   type IInkAnalysisParagraph is access all IInkAnalysisParagraph_Interface'Class;
   type IInkAnalysisParagraph_Ptr is access all IInkAnalysisParagraph;
   type IInkAnalysisListItem_Interface;
   type IInkAnalysisListItem is access all IInkAnalysisListItem_Interface'Class;
   type IInkAnalysisListItem_Ptr is access all IInkAnalysisListItem;
   type IInkAnalysisInkBullet_Interface;
   type IInkAnalysisInkBullet is access all IInkAnalysisInkBullet_Interface'Class;
   type IInkAnalysisInkBullet_Ptr is access all IInkAnalysisInkBullet;
   type IInkAnalysisLine_Interface;
   type IInkAnalysisLine is access all IInkAnalysisLine_Interface'Class;
   type IInkAnalysisLine_Ptr is access all IInkAnalysisLine;
   type IInkAnalysisInkWord_Interface;
   type IInkAnalysisInkWord is access all IInkAnalysisInkWord_Interface'Class;
   type IInkAnalysisInkWord_Ptr is access all IInkAnalysisInkWord;
   type IInkAnalysisInkDrawing_Interface;
   type IInkAnalysisInkDrawing is access all IInkAnalysisInkDrawing_Interface'Class;
   type IInkAnalysisInkDrawing_Ptr is access all IInkAnalysisInkDrawing;
   type IAsyncOperation_IInkAnalysisResult_Interface;
   type IAsyncOperation_IInkAnalysisResult is access all IAsyncOperation_IInkAnalysisResult_Interface'Class;
   type IAsyncOperation_IInkAnalysisResult_Ptr is access all IAsyncOperation_IInkAnalysisResult;
   type IIterator_IInkAnalysisNode_Interface;
   type IIterator_IInkAnalysisNode is access all IIterator_IInkAnalysisNode_Interface'Class;
   type IIterator_IInkAnalysisNode_Ptr is access all IIterator_IInkAnalysisNode;
   type IIterable_IInkAnalysisNode_Interface;
   type IIterable_IInkAnalysisNode is access all IIterable_IInkAnalysisNode_Interface'Class;
   type IIterable_IInkAnalysisNode_Ptr is access all IIterable_IInkAnalysisNode;
   type IVectorView_IInkAnalysisNode_Interface;
   type IVectorView_IInkAnalysisNode is access all IVectorView_IInkAnalysisNode_Interface'Class;
   type IVectorView_IInkAnalysisNode_Ptr is access all IVectorView_IInkAnalysisNode;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalyzer : aliased constant Windows.IID := (4046163861, 2150, 19909, (140, 119, 248, 134, 20, 223, 227, 140 ));
   
   type IInkAnalyzer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnalysisRoot
   (
      This       : access IInkAnalyzer_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAnalyzing
   (
      This       : access IInkAnalyzer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AddDataForStroke
   (
      This       : access IInkAnalyzer_Interface
      ; stroke : Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function AddDataForStrokes
   (
      This       : access IInkAnalyzer_Interface
      ; strokes : Windows.UI.Input.Inking.IIterable_IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function ClearDataForAllStrokes
   (
      This       : access IInkAnalyzer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveDataForStroke
   (
      This       : access IInkAnalyzer_Interface
      ; strokeId : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveDataForStrokes
   (
      This       : access IInkAnalyzer_Interface
      ; strokeIds : Windows.Foundation.Collections.IIterable_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceDataForStroke
   (
      This       : access IInkAnalyzer_Interface
      ; stroke : Windows.UI.Input.Inking.IInkStroke
   )
   return Windows.HRESULT is abstract;
   
   function SetStrokeDataKind
   (
      This       : access IInkAnalyzer_Interface
      ; strokeId : Windows.UInt32
      ; strokeKind : Windows.UI.Input.Inking.Analysis.InkAnalysisStrokeKind
   )
   return Windows.HRESULT is abstract;
   
   function AnalyzeAsync
   (
      This       : access IInkAnalyzer_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IAsyncOperation_IInkAnalysisResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalyzerFactory : aliased constant Windows.IID := (689145478, 6499, 18904, (149, 137, 225, 67, 132, 199, 105, 227 ));
   
   type IInkAnalyzerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAnalyzer
   (
      This       : access IInkAnalyzerFactory_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalyzer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisResult : aliased constant Windows.IID := (2303244921, 41539, 19107, (162, 148, 31, 152, 189, 15, 245, 128 ));
   
   type IInkAnalysisResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IInkAnalysisResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.InkAnalysisStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisNode : aliased constant Windows.IID := (813899525, 24420, 18988, (186, 55, 79, 72, 135, 135, 149, 116 ));
   
   type IInkAnalysisNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.InkAnalysisNodeKind
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingRect
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_RotatedBoundingRect
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.Foundation.IVectorView_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Children
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IVectorView_IInkAnalysisNode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Parent
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
   )
   return Windows.HRESULT is abstract;
   
   function GetStrokeIds
   (
      This       : access IInkAnalysisNode_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisRoot : aliased constant Windows.IID := (1068934084, 12254, 16481, (133, 2, 169, 15, 50, 84, 91, 132 ));
   
   type IInkAnalysisRoot_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisRoot_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FindNodes
   (
      This       : access IInkAnalysisRoot_Interface
      ; nodeKind : Windows.UI.Input.Inking.Analysis.InkAnalysisNodeKind
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IVectorView_IInkAnalysisNode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisWritingRegion : aliased constant Windows.IID := (3714933297, 48406, 18019, (181, 174, 148, 29, 48, 67, 239, 91 ));
   
   type IInkAnalysisWritingRegion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisWritingRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisParagraph : aliased constant Windows.IID := (3651994716, 3281, 19924, (166, 139, 235, 31, 18, 179, 215, 39 ));
   
   type IInkAnalysisParagraph_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisParagraph_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisListItem : aliased constant Windows.IID := (3034825279, 50371, 19514, (161, 166, 157, 133, 84, 126, 229, 134 ));
   
   type IInkAnalysisListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisListItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisInkBullet : aliased constant Windows.IID := (3993277288, 24848, 16694, (149, 249, 238, 128, 159, 194, 0, 48 ));
   
   type IInkAnalysisInkBullet_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisInkBullet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisLine : aliased constant Windows.IID := (2691499149, 11149, 18260, (173, 90, 208, 135, 17, 147, 169, 86 ));
   
   type IInkAnalysisLine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisLine_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IndentLevel
   (
      This       : access IInkAnalysisLine_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisInkWord : aliased constant Windows.IID := (1272064173, 33711, 16436, (143, 59, 248, 104, 125, 255, 244, 54 ));
   
   type IInkAnalysisInkWord_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecognizedText
   (
      This       : access IInkAnalysisInkWord_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TextAlternates
   (
      This       : access IInkAnalysisInkWord_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkAnalysisInkDrawing : aliased constant Windows.IID := (1787161887, 8164, 19989, (137, 140, 142, 17, 35, 119, 224, 33 ));
   
   type IInkAnalysisInkDrawing_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DrawingKind
   (
      This       : access IInkAnalysisInkDrawing_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.InkAnalysisDrawingKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Center
   (
      This       : access IInkAnalysisInkDrawing_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Points
   (
      This       : access IInkAnalysisInkDrawing_Interface
      ; RetVal : access Windows.Foundation.IVectorView_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IInkAnalysisResult : aliased constant Windows.IID := (742838717, 28091, 20487, (186, 133, 61, 1, 6, 189, 223, 80 ));
   
   type IAsyncOperation_IInkAnalysisResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IInkAnalysisResult_Interface
      ; handler : Windows.UI.Input.Inking.Analysis.AsyncOperationCompletedHandler_IInkAnalysisResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IInkAnalysisResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.AsyncOperationCompletedHandler_IInkAnalysisResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IInkAnalysisResult_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalysisResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInkAnalysisNode : aliased constant Windows.IID := (2905992540, 24460, 23144, (166, 225, 103, 242, 9, 160, 94, 167 ));
   
   type IIterator_IInkAnalysisNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInkAnalysisNode_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInkAnalysisNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInkAnalysisNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInkAnalysisNode_Interface
      ; items : Windows.UI.Input.Inking.Analysis.IInkAnalysisNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInkAnalysisNode : aliased constant Windows.IID := (2018444958, 47837, 21080, (189, 143, 66, 206, 32, 92, 201, 90 ));
   
   type IIterable_IInkAnalysisNode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInkAnalysisNode_Interface
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IIterator_IInkAnalysisNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IInkAnalysisNode : aliased constant Windows.IID := (725610001, 21429, 21936, (141, 113, 196, 11, 66, 125, 224, 41 ));
   
   type IVectorView_IInkAnalysisNode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInkAnalysisNode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInkAnalysisNode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInkAnalysisNode_Interface
      ; value : Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInkAnalysisNode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Inking.Analysis.IInkAnalysisNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IInkAnalysisResult : aliased constant Windows.IID := (2817468006, 28612, 22159, (187, 243, 25, 193, 3, 106, 38, 191 ));
   
   type AsyncOperationCompletedHandler_IInkAnalysisResult_Interface(Callback : access procedure (asyncInfo : Windows.UI.Input.Inking.Analysis.IAsyncOperation_IInkAnalysisResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IInkAnalysisResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IInkAnalysisResult_Interface
      ; asyncInfo : Windows.UI.Input.Inking.Analysis.IAsyncOperation_IInkAnalysisResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InkAnalysisRoot is Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot;
   subtype InkAnalysisResult is Windows.UI.Input.Inking.Analysis.IInkAnalysisResult;
   subtype InkAnalyzer is Windows.UI.Input.Inking.Analysis.IInkAnalyzer;
   function Create return Windows.UI.Input.Inking.Analysis.IInkAnalyzer;
   
   subtype InkAnalysisNode is Windows.UI.Input.Inking.Analysis.IInkAnalysisNode;
   subtype InkAnalysisWritingRegion is Windows.UI.Input.Inking.Analysis.IInkAnalysisWritingRegion;
   subtype InkAnalysisParagraph is Windows.UI.Input.Inking.Analysis.IInkAnalysisParagraph;
   subtype InkAnalysisListItem is Windows.UI.Input.Inking.Analysis.IInkAnalysisListItem;
   subtype InkAnalysisInkBullet is Windows.UI.Input.Inking.Analysis.IInkAnalysisInkBullet;
   subtype InkAnalysisLine is Windows.UI.Input.Inking.Analysis.IInkAnalysisLine;
   subtype InkAnalysisInkWord is Windows.UI.Input.Inking.Analysis.IInkAnalysisInkWord;
   subtype InkAnalysisInkDrawing is Windows.UI.Input.Inking.Analysis.IInkAnalysisInkDrawing;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
