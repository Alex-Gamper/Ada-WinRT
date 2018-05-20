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
limited with Windows.Storage;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Data.Xml.Dom is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NodeType is (
      Invalid,
      ElementNode,
      AttributeNode,
      TextNode,
      DataSectionNode,
      EntityReferenceNode,
      EntityNode,
      ProcessingInstructionNode,
      CommentNode,
      DocumentNode,
      DocumentTypeNode,
      DocumentFragmentNode,
      NotationNode
   );
   for NodeType use (
      Invalid => 0,
      ElementNode => 1,
      AttributeNode => 2,
      TextNode => 3,
      DataSectionNode => 4,
      EntityReferenceNode => 5,
      EntityNode => 6,
      ProcessingInstructionNode => 7,
      CommentNode => 8,
      DocumentNode => 9,
      DocumentTypeNode => 10,
      DocumentFragmentNode => 11,
      NotationNode => 12
   );
   for NodeType'Size use 32;
   
   type NodeType_Ptr is access NodeType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IXmlDocument_Interface;
   type AsyncOperationCompletedHandler_IXmlDocument is access all AsyncOperationCompletedHandler_IXmlDocument_Interface'Class;
   type AsyncOperationCompletedHandler_IXmlDocument_Ptr is access all AsyncOperationCompletedHandler_IXmlDocument;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IXmlNodeSelector_Interface;
   type IXmlNodeSelector is access all IXmlNodeSelector_Interface'Class;
   type IXmlNodeSelector_Ptr is access all IXmlNodeSelector;
   type IVectorView_IXmlNode_Interface;
   type IVectorView_IXmlNode is access all IVectorView_IXmlNode_Interface'Class;
   type IVectorView_IXmlNode_Ptr is access all IVectorView_IXmlNode;
   type IIterable_IXmlNode_Interface;
   type IIterable_IXmlNode is access all IIterable_IXmlNode_Interface'Class;
   type IIterable_IXmlNode_Ptr is access all IIterable_IXmlNode;
   type IXmlNodeSerializer_Interface;
   type IXmlNodeSerializer is access all IXmlNodeSerializer_Interface'Class;
   type IXmlNodeSerializer_Ptr is access all IXmlNodeSerializer;
   type IXmlNode_Interface;
   type IXmlNode is access all IXmlNode_Interface'Class;
   type IXmlNode_Ptr is access all IXmlNode;
   type IXmlDomImplementation_Interface;
   type IXmlDomImplementation is access all IXmlDomImplementation_Interface'Class;
   type IXmlDomImplementation_Ptr is access all IXmlDomImplementation;
   type IXmlDocumentType_Interface;
   type IXmlDocumentType is access all IXmlDocumentType_Interface'Class;
   type IXmlDocumentType_Ptr is access all IXmlDocumentType;
   type IXmlAttribute_Interface;
   type IXmlAttribute is access all IXmlAttribute_Interface'Class;
   type IXmlAttribute_Ptr is access all IXmlAttribute;
   type IXmlDocumentFragment_Interface;
   type IXmlDocumentFragment is access all IXmlDocumentFragment_Interface'Class;
   type IXmlDocumentFragment_Ptr is access all IXmlDocumentFragment;
   type IXmlElement_Interface;
   type IXmlElement is access all IXmlElement_Interface'Class;
   type IXmlElement_Ptr is access all IXmlElement;
   type IDtdNotation_Interface;
   type IDtdNotation is access all IDtdNotation_Interface'Class;
   type IDtdNotation_Ptr is access all IDtdNotation;
   type IDtdEntity_Interface;
   type IDtdEntity is access all IDtdEntity_Interface'Class;
   type IDtdEntity_Ptr is access all IDtdEntity;
   type IXmlEntityReference_Interface;
   type IXmlEntityReference is access all IXmlEntityReference_Interface'Class;
   type IXmlEntityReference_Ptr is access all IXmlEntityReference;
   type IXmlProcessingInstruction_Interface;
   type IXmlProcessingInstruction is access all IXmlProcessingInstruction_Interface'Class;
   type IXmlProcessingInstruction_Ptr is access all IXmlProcessingInstruction;
   type IXmlCharacterData_Interface;
   type IXmlCharacterData is access all IXmlCharacterData_Interface'Class;
   type IXmlCharacterData_Ptr is access all IXmlCharacterData;
   type IXmlComment_Interface;
   type IXmlComment is access all IXmlComment_Interface'Class;
   type IXmlComment_Ptr is access all IXmlComment;
   type IXmlText_Interface;
   type IXmlText is access all IXmlText_Interface'Class;
   type IXmlText_Ptr is access all IXmlText;
   type IXmlCDataSection_Interface;
   type IXmlCDataSection is access all IXmlCDataSection_Interface'Class;
   type IXmlCDataSection_Ptr is access all IXmlCDataSection;
   type IXmlDocument_Interface;
   type IXmlDocument is access all IXmlDocument_Interface'Class;
   type IXmlDocument_Ptr is access all IXmlDocument;
   type IXmlNamedNodeMap_Interface;
   type IXmlNamedNodeMap is access all IXmlNamedNodeMap_Interface'Class;
   type IXmlNamedNodeMap_Ptr is access all IXmlNamedNodeMap;
   type IXmlNodeList_Interface;
   type IXmlNodeList is access all IXmlNodeList_Interface'Class;
   type IXmlNodeList_Ptr is access all IXmlNodeList;
   type IXmlLoadSettings_Interface;
   type IXmlLoadSettings is access all IXmlLoadSettings_Interface'Class;
   type IXmlLoadSettings_Ptr is access all IXmlLoadSettings;
   type IXmlDocumentIO_Interface;
   type IXmlDocumentIO is access all IXmlDocumentIO_Interface'Class;
   type IXmlDocumentIO_Ptr is access all IXmlDocumentIO;
   type IXmlDocumentIO2_Interface;
   type IXmlDocumentIO2 is access all IXmlDocumentIO2_Interface'Class;
   type IXmlDocumentIO2_Ptr is access all IXmlDocumentIO2;
   type IXmlDocumentStatics_Interface;
   type IXmlDocumentStatics is access all IXmlDocumentStatics_Interface'Class;
   type IXmlDocumentStatics_Ptr is access all IXmlDocumentStatics;
   type IAsyncOperation_IXmlDocument_Interface;
   type IAsyncOperation_IXmlDocument is access all IAsyncOperation_IXmlDocument_Interface'Class;
   type IAsyncOperation_IXmlDocument_Ptr is access all IAsyncOperation_IXmlDocument;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IXmlNodeSelector : aliased constant Windows.IID := (1675344523, 53467, 20449, (183, 69, 249, 67, 58, 253, 194, 91 ));
   
   type IXmlNodeSelector_Interface is interface and Windows.IInspectable_Interface;
   
   function SelectSingleNode
   (
      This       : access IXmlNodeSelector_Interface
      ; xpath : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function SelectNodes
   (
      This       : access IXmlNodeSelector_Interface
      ; xpath : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNodeList
   )
   return Windows.HRESULT is abstract;
   
   function SelectSingleNodeNS
   (
      This       : access IXmlNodeSelector_Interface
      ; xpath : Windows.String
      ; namespaces : Windows.Object
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function SelectNodesNS
   (
      This       : access IXmlNodeSelector_Interface
      ; xpath : Windows.String
      ; namespaces : Windows.Object
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNodeList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXmlNode : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_IXmlNode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXmlNode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXmlNode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXmlNode_Interface
      ; value : Windows.Data.Xml.Dom.IXmlNode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXmlNode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Xml.Dom.IXmlNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXmlNode : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IXmlNode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlNodeSerializer : aliased constant Windows.IID := (1556460418, 59101, 18833, (171, 239, 6, 216, 210, 231, 189, 12 ));
   
   type IXmlNodeSerializer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetXml
   (
      This       : access IXmlNodeSerializer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InnerText
   (
      This       : access IXmlNodeSerializer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_InnerText
   (
      This       : access IXmlNodeSerializer_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlNode : aliased constant Windows.IID := (477371737, 8482, 18389, (168, 86, 131, 243, 212, 33, 72, 117 ));
   
   type IXmlNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NodeValue
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeValue
   (
      This       : access IXmlNode_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeType
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.NodeType
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeName
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentNode
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildNodes
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNodeList
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstChild
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_LastChild
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousSibling
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_NextSibling
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_Attributes
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNamedNodeMap
   )
   return Windows.HRESULT is abstract;
   
   function HasChildNodes
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OwnerDocument
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function InsertBefore
   (
      This       : access IXmlNode_Interface
      ; newChild : Windows.Data.Xml.Dom.IXmlNode
      ; referenceChild : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceChild
   (
      This       : access IXmlNode_Interface
      ; newChild : Windows.Data.Xml.Dom.IXmlNode
      ; referenceChild : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function RemoveChild
   (
      This       : access IXmlNode_Interface
      ; childNode : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function AppendChild
   (
      This       : access IXmlNode_Interface
      ; newChild : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function CloneNode
   (
      This       : access IXmlNode_Interface
      ; deep : Windows.Boolean
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function get_NamespaceUri
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalName
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Prefix
   (
      This       : access IXmlNode_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Normalize
   (
      This       : access IXmlNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function put_Prefix
   (
      This       : access IXmlNode_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDomImplementation : aliased constant Windows.IID := (1843757362, 61725, 20411, (140, 198, 88, 60, 186, 147, 17, 47 ));
   
   type IXmlDomImplementation_Interface is interface and Windows.IInspectable_Interface;
   
   function HasFeature
   (
      This       : access IXmlDomImplementation_Interface
      ; feature : Windows.String
      ; version : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocumentType : aliased constant Windows.IID := (4147389477, 38785, 18788, (142, 148, 155, 28, 109, 252, 155, 199 ));
   
   type IXmlDocumentType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IXmlDocumentType_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Entities
   (
      This       : access IXmlDocumentType_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNamedNodeMap
   )
   return Windows.HRESULT is abstract;
   
   function get_Notations
   (
      This       : access IXmlDocumentType_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNamedNodeMap
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlAttribute : aliased constant Windows.IID := (2887010980, 46321, 19894, (178, 6, 138, 34, 195, 8, 219, 10 ));
   
   type IXmlAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IXmlAttribute_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Specified
   (
      This       : access IXmlAttribute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IXmlAttribute_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IXmlAttribute_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocumentFragment : aliased constant Windows.IID := (3807013526, 3105, 17573, (139, 201, 158, 74, 38, 39, 8, 236 ));
   
   type IXmlDocumentFragment_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXmlElement : aliased constant Windows.IID := (771459615, 27408, 20216, (159, 131, 239, 204, 232, 250, 236, 55 ));
   
   type IXmlElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TagName
   (
      This       : access IXmlElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAttribute
   (
      This       : access IXmlElement_Interface
      ; attributeName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAttribute
   (
      This       : access IXmlElement_Interface
      ; attributeName : Windows.String
      ; attributeValue : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAttribute
   (
      This       : access IXmlElement_Interface
      ; attributeName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributeNode
   (
      This       : access IXmlElement_Interface
      ; attributeName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function SetAttributeNode
   (
      This       : access IXmlElement_Interface
      ; newAttribute : Windows.Data.Xml.Dom.IXmlAttribute
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAttributeNode
   (
      This       : access IXmlElement_Interface
      ; attributeNode : Windows.Data.Xml.Dom.IXmlAttribute
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function GetElementsByTagName
   (
      This       : access IXmlElement_Interface
      ; tagName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNodeList
   )
   return Windows.HRESULT is abstract;
   
   function SetAttributeNS
   (
      This       : access IXmlElement_Interface
      ; namespaceUri : Windows.Object
      ; qualifiedName : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributeNS
   (
      This       : access IXmlElement_Interface
      ; namespaceUri : Windows.Object
      ; localName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAttributeNS
   (
      This       : access IXmlElement_Interface
      ; namespaceUri : Windows.Object
      ; localName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAttributeNodeNS
   (
      This       : access IXmlElement_Interface
      ; newAttribute : Windows.Data.Xml.Dom.IXmlAttribute
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributeNodeNS
   (
      This       : access IXmlElement_Interface
      ; namespaceUri : Windows.Object
      ; localName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDtdNotation : aliased constant Windows.IID := (2360664141, 27974, 20187, (171, 115, 223, 131, 197, 26, 211, 151 ));
   
   type IDtdNotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PublicId
   (
      This       : access IDtdNotation_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemId
   (
      This       : access IDtdNotation_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDtdEntity : aliased constant Windows.IID := (1779130364, 25524, 18447, (158, 106, 138, 146, 129, 106, 173, 228 ));
   
   type IDtdEntity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PublicId
   (
      This       : access IDtdEntity_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemId
   (
      This       : access IDtdEntity_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_NotationName
   (
      This       : access IDtdEntity_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlEntityReference : aliased constant Windows.IID := (774850492, 50128, 19663, (187, 134, 10, 184, 195, 106, 97, 207 ));
   
   type IXmlEntityReference_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXmlProcessingInstruction : aliased constant Windows.IID := (654834974, 7826, 20174, (182, 244, 38, 240, 105, 7, 141, 220 ));
   
   type IXmlProcessingInstruction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Target
   (
      This       : access IXmlProcessingInstruction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IXmlProcessingInstruction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IXmlProcessingInstruction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlCharacterData : aliased constant Windows.IID := (321798827, 20022, 19958, (177, 200, 12, 230, 47, 216, 139, 38 ));
   
   type IXmlCharacterData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IXmlCharacterData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IXmlCharacterData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IXmlCharacterData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SubstringData
   (
      This       : access IXmlCharacterData_Interface
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AppendData
   (
      This       : access IXmlCharacterData_Interface
      ; data : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function InsertData
   (
      This       : access IXmlCharacterData_Interface
      ; offset : Windows.UInt32
      ; data : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DeleteData
   (
      This       : access IXmlCharacterData_Interface
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceData
   (
      This       : access IXmlCharacterData_Interface
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
      ; data : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlComment : aliased constant Windows.IID := (3164894421, 46623, 17937, (156, 172, 46, 146, 227, 71, 109, 71 ));
   
   type IXmlComment_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXmlText : aliased constant Windows.IID := (4180780235, 12429, 18272, (161, 213, 67, 182, 116, 80, 172, 126 ));
   
   type IXmlText_Interface is interface and Windows.IInspectable_Interface;
   
   function SplitText
   (
      This       : access IXmlText_Interface
      ; offset : Windows.UInt32
      ; RetVal : access Windows.Data.Xml.Dom.IXmlText
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlCDataSection : aliased constant Windows.IID := (1292153967, 51389, 17844, (136, 153, 4, 0, 215, 194, 198, 15 ));
   
   type IXmlCDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocument : aliased constant Windows.IID := (4159939846, 7815, 17110, (188, 251, 184, 200, 9, 250, 84, 148 ));
   
   type IXmlDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Doctype
   (
      This       : access IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocumentType
   )
   return Windows.HRESULT is abstract;
   
   function get_Implementation
   (
      This       : access IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDomImplementation
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentElement
   (
      This       : access IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlElement
   )
   return Windows.HRESULT is abstract;
   
   function CreateElement
   (
      This       : access IXmlDocument_Interface
      ; tagName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlElement
   )
   return Windows.HRESULT is abstract;
   
   function CreateDocumentFragment
   (
      This       : access IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocumentFragment
   )
   return Windows.HRESULT is abstract;
   
   function CreateTextNode
   (
      This       : access IXmlDocument_Interface
      ; data : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlText
   )
   return Windows.HRESULT is abstract;
   
   function CreateComment
   (
      This       : access IXmlDocument_Interface
      ; data : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlComment
   )
   return Windows.HRESULT is abstract;
   
   function CreateProcessingInstruction
   (
      This       : access IXmlDocument_Interface
      ; target : Windows.String
      ; data : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlProcessingInstruction
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttribute
   (
      This       : access IXmlDocument_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function CreateEntityReference
   (
      This       : access IXmlDocument_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlEntityReference
   )
   return Windows.HRESULT is abstract;
   
   function GetElementsByTagName
   (
      This       : access IXmlDocument_Interface
      ; tagName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNodeList
   )
   return Windows.HRESULT is abstract;
   
   function CreateCDataSection
   (
      This       : access IXmlDocument_Interface
      ; data : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlCDataSection
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentUri
   (
      This       : access IXmlDocument_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttributeNS
   (
      This       : access IXmlDocument_Interface
      ; namespaceUri : Windows.Object
      ; qualifiedName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlAttribute
   )
   return Windows.HRESULT is abstract;
   
   function CreateElementNS
   (
      This       : access IXmlDocument_Interface
      ; namespaceUri : Windows.Object
      ; qualifiedName : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlElement
   )
   return Windows.HRESULT is abstract;
   
   function GetElementById
   (
      This       : access IXmlDocument_Interface
      ; elementId : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlElement
   )
   return Windows.HRESULT is abstract;
   
   function ImportNode
   (
      This       : access IXmlDocument_Interface
      ; node : Windows.Data.Xml.Dom.IXmlNode
      ; deep : Windows.Boolean
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlNamedNodeMap : aliased constant Windows.IID := (3014041264, 43696, 19330, (166, 250, 177, 69, 63, 124, 2, 27 ));
   
   type IXmlNamedNodeMap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Length
   (
      This       : access IXmlNamedNodeMap_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Item
   (
      This       : access IXmlNamedNodeMap_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedItem
   (
      This       : access IXmlNamedNodeMap_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function SetNamedItem
   (
      This       : access IXmlNamedNodeMap_Interface
      ; node : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function RemoveNamedItem
   (
      This       : access IXmlNamedNodeMap_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedItemNS
   (
      This       : access IXmlNamedNodeMap_Interface
      ; namespaceUri : Windows.Object
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function RemoveNamedItemNS
   (
      This       : access IXmlNamedNodeMap_Interface
      ; namespaceUri : Windows.Object
      ; name : Windows.String
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   function SetNamedItemNS
   (
      This       : access IXmlNamedNodeMap_Interface
      ; node : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlNodeList : aliased constant Windows.IID := (2355146103, 33700, 20161, (156, 84, 123, 164, 41, 225, 61, 166 ));
   
   type IXmlNodeList_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Length
   (
      This       : access IXmlNodeList_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Item
   (
      This       : access IXmlNodeList_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Xml.Dom.IXmlNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlLoadSettings : aliased constant Windows.IID := (1487538088, 65238, 18167, (180, 197, 251, 27, 167, 33, 8, 214 ));
   
   type IXmlLoadSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxElementDepth
   (
      This       : access IXmlLoadSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxElementDepth
   (
      This       : access IXmlLoadSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProhibitDtd
   (
      This       : access IXmlLoadSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ProhibitDtd
   (
      This       : access IXmlLoadSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolveExternals
   (
      This       : access IXmlLoadSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ResolveExternals
   (
      This       : access IXmlLoadSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidateOnParse
   (
      This       : access IXmlLoadSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ValidateOnParse
   (
      This       : access IXmlLoadSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementContentWhiteSpace
   (
      This       : access IXmlLoadSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ElementContentWhiteSpace
   (
      This       : access IXmlLoadSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocumentIO : aliased constant Windows.IID := (1825630030, 61029, 17545, (158, 191, 202, 67, 232, 123, 166, 55 ));
   
   type IXmlDocumentIO_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadXml
   (
      This       : access IXmlDocumentIO_Interface
      ; xml : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LoadXmlWithSettings
   (
      This       : access IXmlDocumentIO_Interface
      ; xml : Windows.String
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.HRESULT is abstract;
   
   function SaveToFileAsync
   (
      This       : access IXmlDocumentIO_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocumentIO2 : aliased constant Windows.IID := (1560495713, 31704, 19157, (158, 191, 129, 230, 52, 114, 99, 177 ));
   
   type IXmlDocumentIO2_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadXmlFromBuffer
   (
      This       : access IXmlDocumentIO2_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function LoadXmlFromBufferWithSettings
   (
      This       : access IXmlDocumentIO2_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXmlDocumentStatics : aliased constant Windows.IID := (1430508116, 55127, 19321, (149, 57, 35, 43, 24, 245, 11, 241 ));
   
   type IXmlDocumentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadFromUriAsync
   (
      This       : access IXmlDocumentStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromUriWithSettingsAsync
   (
      This       : access IXmlDocumentStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
      ; RetVal : access Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromFileAsync
   (
      This       : access IXmlDocumentStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromFileWithSettingsAsync
   (
      This       : access IXmlDocumentStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
      ; RetVal : access Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IXmlDocument : aliased constant Windows.IID := (4166574649, 6294, 22914, (132, 149, 20, 49, 104, 71, 142, 184 ));
   
   type IAsyncOperation_IXmlDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IXmlDocument_Interface
      ; handler : Windows.Data.Xml.Dom.AsyncOperationCompletedHandler_IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.AsyncOperationCompletedHandler_IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IXmlDocument_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IXmlDocument : aliased constant Windows.IID := (1592752151, 37853, 23563, (158, 90, 235, 73, 4, 8, 243, 169 ));
   
   type AsyncOperationCompletedHandler_IXmlDocument_Interface(Callback : access procedure (asyncInfo : Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IXmlDocument'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IXmlDocument_Interface
      ; asyncInfo : Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype XmlNodeList is Windows.Data.Xml.Dom.IXmlNodeList;
   subtype XmlNamedNodeMap is Windows.Data.Xml.Dom.IXmlNamedNodeMap;
   subtype XmlDocument is Windows.Data.Xml.Dom.IXmlDocument;
   function Create return Windows.Data.Xml.Dom.IXmlDocument;
   
   subtype XmlAttribute is Windows.Data.Xml.Dom.IXmlAttribute;
   subtype XmlDocumentType is Windows.Data.Xml.Dom.IXmlDocumentType;
   subtype XmlDomImplementation is Windows.Data.Xml.Dom.IXmlDomImplementation;
   subtype XmlElement is Windows.Data.Xml.Dom.IXmlElement;
   subtype XmlDocumentFragment is Windows.Data.Xml.Dom.IXmlDocumentFragment;
   subtype XmlText is Windows.Data.Xml.Dom.IXmlText;
   subtype XmlComment is Windows.Data.Xml.Dom.IXmlComment;
   subtype XmlProcessingInstruction is Windows.Data.Xml.Dom.IXmlProcessingInstruction;
   subtype XmlEntityReference is Windows.Data.Xml.Dom.IXmlEntityReference;
   subtype XmlCDataSection is Windows.Data.Xml.Dom.IXmlCDataSection;
   subtype XmlLoadSettings is Windows.Data.Xml.Dom.IXmlLoadSettings;
   function Create return Windows.Data.Xml.Dom.IXmlLoadSettings;
   
   subtype DtdNotation is Windows.Data.Xml.Dom.IDtdNotation;
   subtype DtdEntity is Windows.Data.Xml.Dom.IDtdEntity;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function LoadFromUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   
   function LoadFromUriWithSettingsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   
   function LoadFromFileWithSettingsAsync
   (
      file : Windows.Storage.IStorageFile
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   
end;
