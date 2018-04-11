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
limited with Windows.Data.Xml.Dom;
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Graphics.Printing.PrintTicket is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PrintTicketFeatureSelectionType is (
      PickOne,
      PickMany
   );
   for PrintTicketFeatureSelectionType use (
      PickOne => 0,
      PickMany => 1
   );
   for PrintTicketFeatureSelectionType'Size use 32;
   
   type PrintTicketFeatureSelectionType_Ptr is access PrintTicketFeatureSelectionType;
   
   type PrintTicketParameterDataType is (
      Integer,
      NumericString,
      String
   );
   for PrintTicketParameterDataType use (
      Integer => 0,
      NumericString => 1,
      String => 2
   );
   for PrintTicketParameterDataType'Size use 32;
   
   type PrintTicketParameterDataType_Ptr is access PrintTicketParameterDataType;
   
   type PrintTicketValueType is (
      Integer,
      String,
      Unknown
   );
   for PrintTicketValueType use (
      Integer => 0,
      String => 1,
      Unknown => 2
   );
   for PrintTicketValueType'Size use 32;
   
   type PrintTicketValueType_Ptr is access PrintTicketValueType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult_Interface;
   type AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult is access all AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult_Ptr is access all AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult;
   type AsyncOperationCompletedHandler_IWorkflowPrintTicket_Interface;
   type AsyncOperationCompletedHandler_IWorkflowPrintTicket is access all AsyncOperationCompletedHandler_IWorkflowPrintTicket_Interface'Class;
   type AsyncOperationCompletedHandler_IWorkflowPrintTicket_Ptr is access all AsyncOperationCompletedHandler_IWorkflowPrintTicket;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrintTicketValue_Interface;
   type IPrintTicketValue is access all IPrintTicketValue_Interface'Class;
   type IPrintTicketValue_Ptr is access all IPrintTicketValue;
   type IPrintTicketOption_Interface;
   type IPrintTicketOption is access all IPrintTicketOption_Interface'Class;
   type IPrintTicketOption_Ptr is access all IPrintTicketOption;
   type IPrintTicketFeature_Interface;
   type IPrintTicketFeature is access all IPrintTicketFeature_Interface'Class;
   type IPrintTicketFeature_Ptr is access all IPrintTicketFeature;
   type IPrintTicketParameterDefinition_Interface;
   type IPrintTicketParameterDefinition is access all IPrintTicketParameterDefinition_Interface'Class;
   type IPrintTicketParameterDefinition_Ptr is access all IPrintTicketParameterDefinition;
   type IPrintTicketCapabilities_Interface;
   type IPrintTicketCapabilities is access all IPrintTicketCapabilities_Interface'Class;
   type IPrintTicketCapabilities_Ptr is access all IPrintTicketCapabilities;
   type IPrintTicketParameterInitializer_Interface;
   type IPrintTicketParameterInitializer is access all IPrintTicketParameterInitializer_Interface'Class;
   type IPrintTicketParameterInitializer_Ptr is access all IPrintTicketParameterInitializer;
   type IWorkflowPrintTicketValidationResult_Interface;
   type IWorkflowPrintTicketValidationResult is access all IWorkflowPrintTicketValidationResult_Interface'Class;
   type IWorkflowPrintTicketValidationResult_Ptr is access all IWorkflowPrintTicketValidationResult;
   type IWorkflowPrintTicket_Interface;
   type IWorkflowPrintTicket is access all IWorkflowPrintTicket_Interface'Class;
   type IWorkflowPrintTicket_Ptr is access all IWorkflowPrintTicket;
   type IIterator_IPrintTicketOption_Interface;
   type IIterator_IPrintTicketOption is access all IIterator_IPrintTicketOption_Interface'Class;
   type IIterator_IPrintTicketOption_Ptr is access all IIterator_IPrintTicketOption;
   type IIterable_IPrintTicketOption_Interface;
   type IIterable_IPrintTicketOption is access all IIterable_IPrintTicketOption_Interface'Class;
   type IIterable_IPrintTicketOption_Ptr is access all IIterable_IPrintTicketOption;
   type IVectorView_IPrintTicketOption_Interface;
   type IVectorView_IPrintTicketOption is access all IVectorView_IPrintTicketOption_Interface'Class;
   type IVectorView_IPrintTicketOption_Ptr is access all IVectorView_IPrintTicketOption;
   type IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface;
   type IAsyncOperation_IWorkflowPrintTicketValidationResult is access all IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface'Class;
   type IAsyncOperation_IWorkflowPrintTicketValidationResult_Ptr is access all IAsyncOperation_IWorkflowPrintTicketValidationResult;
   type IAsyncOperation_IWorkflowPrintTicket_Interface;
   type IAsyncOperation_IWorkflowPrintTicket is access all IAsyncOperation_IWorkflowPrintTicket_Interface'Class;
   type IAsyncOperation_IWorkflowPrintTicket_Ptr is access all IAsyncOperation_IWorkflowPrintTicket;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketValue : aliased constant Windows.IID := (1723009586, 9293, 20002, (169, 139, 187, 60, 241, 242, 221, 145 ));
   
   type IPrintTicketValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IPrintTicketValue_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.PrintTicketValueType
   )
   return Windows.HRESULT is abstract;
   
   function GetValueAsInteger
   (
      This       : access IPrintTicketValue_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetValueAsString
   (
      This       : access IPrintTicketValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketOption : aliased constant Windows.IID := (2961624976, 45927, 20043, (189, 72, 156, 120, 160, 187, 49, 206 ));
   
   type IPrintTicketOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrintTicketOption_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IPrintTicketOption_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IPrintTicketOption_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPrintTicketOption_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertyNode
   (
      This       : access IPrintTicketOption_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function GetScoredPropertyNode
   (
      This       : access IPrintTicketOption_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertyValue
   (
      This       : access IPrintTicketOption_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketValue
   )
   return Windows.HRESULT is abstract;
   
   function GetScoredPropertyValue
   (
      This       : access IPrintTicketOption_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketFeature : aliased constant Windows.IID := (3881860458, 23029, 16643, (136, 88, 185, 119, 16, 150, 61, 57 ));
   
   type IPrintTicketFeature_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetOption
   (
      This       : access IPrintTicketFeature_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IVectorView_IPrintTicketOption -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSelectedOption
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   function SetSelectedOption
   (
      This       : access IPrintTicketFeature_Interface
      ; value : Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionType
   (
      This       : access IPrintTicketFeature_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.PrintTicketFeatureSelectionType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketParameterDefinition : aliased constant Windows.IID := (3602560228, 10594, 19457, (183, 243, 154, 146, 148, 235, 131, 53 ));
   
   type IPrintTicketParameterDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_DataType
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.PrintTicketParameterDataType
   )
   return Windows.HRESULT is abstract;
   
   function get_UnitType
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RangeMin
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RangeMax
   (
      This       : access IPrintTicketParameterDefinition_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketCapabilities : aliased constant Windows.IID := (2353352843, 48092, 16982, (161, 66, 47, 214, 21, 236, 180, 22 ));
   
   type IPrintTicketCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentBindingFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentCollateFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentDuplexFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentHolePunchFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentInputBinFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentNUpFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentStapleFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_JobPasscodeFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageBorderlessFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageMediaSizeFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageMediaTypeFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOrientationFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOutputColorFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOutputQualityFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageResolutionFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function GetFeature
   (
      This       : access IPrintTicketCapabilities_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function GetParameterDefinition
   (
      This       : access IPrintTicketCapabilities_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTicketParameterInitializer : aliased constant Windows.IID := (1580414395, 41125, 18609, (157, 92, 7, 17, 109, 220, 89, 122 ));
   
   type IPrintTicketParameterInitializer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPrintTicketParameterInitializer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IPrintTicketParameterInitializer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IPrintTicketParameterInitializer_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IPrintTicketParameterInitializer_Interface
      ; value : Windows.Graphics.Printing.PrintTicket.IPrintTicketValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IPrintTicketParameterInitializer_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWorkflowPrintTicketValidationResult : aliased constant Windows.IID := (181531538, 55931, 18998, (191, 54, 106, 153, 166, 46, 32, 89 ));
   
   type IWorkflowPrintTicketValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Validated
   (
      This       : access IWorkflowPrintTicketValidationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IWorkflowPrintTicketValidationResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWorkflowPrintTicket : aliased constant Windows.IID := (1104487045, 13800, 17550, (168, 197, 228, 182, 162, 207, 130, 108 ));
   
   type IWorkflowPrintTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNamespace
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XmlNode
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function GetCapabilities
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentBindingFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentCollateFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentDuplexFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentHolePunchFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentInputBinFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentNUpFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentStapleFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_JobPasscodeFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageBorderlessFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageMediaSizeFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageMediaTypeFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOrientationFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOutputColorFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOutputQualityFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_PageResolutionFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function GetFeature
   (
      This       : access IWorkflowPrintTicket_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature
   )
   return Windows.HRESULT is abstract;
   
   function NotifyXmlChangedAsync
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ValidateAsync
   (
      This       : access IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicketValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetParameterInitializer
   (
      This       : access IWorkflowPrintTicket_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterInitializer
   )
   return Windows.HRESULT is abstract;
   
   function SetParameterInitializerAsInteger
   (
      This       : access IWorkflowPrintTicket_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; integerValue : Windows.Int32
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterInitializer
   )
   return Windows.HRESULT is abstract;
   
   function SetParameterInitializerAsString
   (
      This       : access IWorkflowPrintTicket_Interface
      ; name : Windows.String
      ; xmlNamespace : Windows.String
      ; stringValue : Windows.String
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterInitializer
   )
   return Windows.HRESULT is abstract;
   
   function MergeAndValidateTicket
   (
      This       : access IWorkflowPrintTicket_Interface
      ; deltaShemaTicket : Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicket
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicket
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrintTicketOption : aliased constant Windows.IID := (3374986722, 33437, 23263, (135, 78, 77, 116, 91, 78, 240, 170 ));
   
   type IIterator_IPrintTicketOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrintTicketOption_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrintTicketOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrintTicketOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrintTicketOption_Interface
      ; items : Windows.Graphics.Printing.PrintTicket.IPrintTicketOption_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrintTicketOption : aliased constant Windows.IID := (1551787638, 36934, 23402, (158, 176, 198, 169, 84, 232, 34, 107 ));
   
   type IIterable_IPrintTicketOption_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrintTicketOption_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IIterator_IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrintTicketOption : aliased constant Windows.IID := (3356182767, 10828, 22149, (183, 164, 136, 204, 121, 108, 162, 116 ));
   
   type IVectorView_IPrintTicketOption_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrintTicketOption_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrintTicketOption_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrintTicketOption_Interface
      ; value : Windows.Graphics.Printing.PrintTicket.IPrintTicketOption
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrintTicketOption_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing.PrintTicket.IPrintTicketOption_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWorkflowPrintTicketValidationResult : aliased constant Windows.IID := (4101803905, 9199, 23144, (136, 64, 112, 7, 71, 177, 9, 153 ));
   
   type IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface
      ; handler : Windows.Graphics.Printing.PrintTicket.AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWorkflowPrintTicketValidationResult_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicketValidationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWorkflowPrintTicket : aliased constant Windows.IID := (648994681, 1625, 23133, (154, 207, 180, 66, 62, 239, 222, 187 ));
   
   type IAsyncOperation_IWorkflowPrintTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWorkflowPrintTicket_Interface
      ; handler : Windows.Graphics.Printing.PrintTicket.AsyncOperationCompletedHandler_IWorkflowPrintTicket
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.AsyncOperationCompletedHandler_IWorkflowPrintTicket
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWorkflowPrintTicket_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicket
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult : aliased constant Windows.IID := (990642168, 3403, 20971, (176, 64, 73, 61, 225, 173, 218, 185 ));
   
   type AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicketValidationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWorkflowPrintTicketValidationResult_Interface
      ; asyncInfo : Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicketValidationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWorkflowPrintTicket : aliased constant Windows.IID := (3565600909, 36476, 24461, (135, 171, 13, 247, 186, 6, 197, 227 ));
   
   type AsyncOperationCompletedHandler_IWorkflowPrintTicket_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicket ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWorkflowPrintTicket'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWorkflowPrintTicket_Interface
      ; asyncInfo : Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicket
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintTicketValue is Windows.Graphics.Printing.PrintTicket.IPrintTicketValue;
   subtype PrintTicketOption is Windows.Graphics.Printing.PrintTicket.IPrintTicketOption;
   subtype PrintTicketFeature is Windows.Graphics.Printing.PrintTicket.IPrintTicketFeature;
   subtype PrintTicketParameterDefinition is Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterDefinition;
   subtype PrintTicketCapabilities is Windows.Graphics.Printing.PrintTicket.IPrintTicketCapabilities;
   subtype PrintTicketParameterInitializer is Windows.Graphics.Printing.PrintTicket.IPrintTicketParameterInitializer;
   subtype WorkflowPrintTicketValidationResult is Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicketValidationResult;
   subtype WorkflowPrintTicket is Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicket;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
