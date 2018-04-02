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
with Windows.Foundation.Collections;
limited with Windows.Data.Xml.Dom;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Web.Syndication is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SyndicationFormat is (
      Atom10,
      Rss20,
      Rss10,
      Rss092,
      Rss091,
      Atom03
   );
   for SyndicationFormat use (
      Atom10 => 0,
      Rss20 => 1,
      Rss10 => 2,
      Rss092 => 3,
      Rss091 => 4,
      Atom03 => 5
   );
   for SyndicationFormat'Size use 32;
   
   type SyndicationFormat_Ptr is access SyndicationFormat;
   
   type SyndicationErrorStatus is (
      Unknown,
      MissingRequiredElement,
      MissingRequiredAttribute,
      InvalidXml,
      UnexpectedContent,
      UnsupportedFormat
   );
   for SyndicationErrorStatus use (
      Unknown => 0,
      MissingRequiredElement => 1,
      MissingRequiredAttribute => 2,
      InvalidXml => 3,
      UnexpectedContent => 4,
      UnsupportedFormat => 5
   );
   for SyndicationErrorStatus'Size use 32;
   
   type SyndicationErrorStatus_Ptr is access SyndicationErrorStatus;
   
   type SyndicationTextType is (
      Text,
      Html,
      Xhtml
   );
   for SyndicationTextType use (
      Text => 0,
      Html => 1,
      Xhtml => 2
   );
   for SyndicationTextType'Size use 32;
   
   type SyndicationTextType_Ptr is access SyndicationTextType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type RetrievalProgress is record
      BytesRetrieved : Windows.UInt32;
      TotalBytesToRetrieve : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , RetrievalProgress);
   
   type RetrievalProgress_Ptr is access RetrievalProgress;
   
   type TransferProgress is record
      BytesSent : Windows.UInt32;
      TotalBytesToSend : Windows.UInt32;
      BytesRetrieved : Windows.UInt32;
      TotalBytesToRetrieve : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , TransferProgress);
   
   type TransferProgress_Ptr is access TransferProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncActionProgressHandler_TransferProgress_Interface;
   type AsyncActionProgressHandler_TransferProgress is access all AsyncActionProgressHandler_TransferProgress_Interface'Class;
   type AsyncActionProgressHandler_TransferProgress_Ptr is access all AsyncActionProgressHandler_TransferProgress;
   type AsyncActionWithProgressCompletedHandler_TransferProgress_Interface;
   type AsyncActionWithProgressCompletedHandler_TransferProgress is access all AsyncActionWithProgressCompletedHandler_TransferProgress_Interface'Class;
   type AsyncActionWithProgressCompletedHandler_TransferProgress_Ptr is access all AsyncActionWithProgressCompletedHandler_TransferProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISyndicationAttribute_Interface;
   type ISyndicationAttribute is access all ISyndicationAttribute_Interface'Class;
   type ISyndicationAttribute_Ptr is access all ISyndicationAttribute;
   type ISyndicationAttributeFactory_Interface;
   type ISyndicationAttributeFactory is access all ISyndicationAttributeFactory_Interface'Class;
   type ISyndicationAttributeFactory_Ptr is access all ISyndicationAttributeFactory;
   type ISyndicationNode_Interface;
   type ISyndicationNode is access all ISyndicationNode_Interface'Class;
   type ISyndicationNode_Ptr is access all ISyndicationNode;
   type ISyndicationNodeFactory_Interface;
   type ISyndicationNodeFactory is access all ISyndicationNodeFactory_Interface'Class;
   type ISyndicationNodeFactory_Ptr is access all ISyndicationNodeFactory;
   type ISyndicationGenerator_Interface;
   type ISyndicationGenerator is access all ISyndicationGenerator_Interface'Class;
   type ISyndicationGenerator_Ptr is access all ISyndicationGenerator;
   type ISyndicationGeneratorFactory_Interface;
   type ISyndicationGeneratorFactory is access all ISyndicationGeneratorFactory_Interface'Class;
   type ISyndicationGeneratorFactory_Ptr is access all ISyndicationGeneratorFactory;
   type ISyndicationText_Interface;
   type ISyndicationText is access all ISyndicationText_Interface'Class;
   type ISyndicationText_Ptr is access all ISyndicationText;
   type ISyndicationTextFactory_Interface;
   type ISyndicationTextFactory is access all ISyndicationTextFactory_Interface'Class;
   type ISyndicationTextFactory_Ptr is access all ISyndicationTextFactory;
   type ISyndicationContent_Interface;
   type ISyndicationContent is access all ISyndicationContent_Interface'Class;
   type ISyndicationContent_Ptr is access all ISyndicationContent;
   type ISyndicationContentFactory_Interface;
   type ISyndicationContentFactory is access all ISyndicationContentFactory_Interface'Class;
   type ISyndicationContentFactory_Ptr is access all ISyndicationContentFactory;
   type ISyndicationLink_Interface;
   type ISyndicationLink is access all ISyndicationLink_Interface'Class;
   type ISyndicationLink_Ptr is access all ISyndicationLink;
   type ISyndicationLinkFactory_Interface;
   type ISyndicationLinkFactory is access all ISyndicationLinkFactory_Interface'Class;
   type ISyndicationLinkFactory_Ptr is access all ISyndicationLinkFactory;
   type ISyndicationPerson_Interface;
   type ISyndicationPerson is access all ISyndicationPerson_Interface'Class;
   type ISyndicationPerson_Ptr is access all ISyndicationPerson;
   type ISyndicationPersonFactory_Interface;
   type ISyndicationPersonFactory is access all ISyndicationPersonFactory_Interface'Class;
   type ISyndicationPersonFactory_Ptr is access all ISyndicationPersonFactory;
   type ISyndicationCategory_Interface;
   type ISyndicationCategory is access all ISyndicationCategory_Interface'Class;
   type ISyndicationCategory_Ptr is access all ISyndicationCategory;
   type ISyndicationCategoryFactory_Interface;
   type ISyndicationCategoryFactory is access all ISyndicationCategoryFactory_Interface'Class;
   type ISyndicationCategoryFactory_Ptr is access all ISyndicationCategoryFactory;
   type ISyndicationItem_Interface;
   type ISyndicationItem is access all ISyndicationItem_Interface'Class;
   type ISyndicationItem_Ptr is access all ISyndicationItem;
   type ISyndicationItemFactory_Interface;
   type ISyndicationItemFactory is access all ISyndicationItemFactory_Interface'Class;
   type ISyndicationItemFactory_Ptr is access all ISyndicationItemFactory;
   type ISyndicationFeed_Interface;
   type ISyndicationFeed is access all ISyndicationFeed_Interface'Class;
   type ISyndicationFeed_Ptr is access all ISyndicationFeed;
   type ISyndicationFeedFactory_Interface;
   type ISyndicationFeedFactory is access all ISyndicationFeedFactory_Interface'Class;
   type ISyndicationFeedFactory_Ptr is access all ISyndicationFeedFactory;
   type ISyndicationClient_Interface;
   type ISyndicationClient is access all ISyndicationClient_Interface'Class;
   type ISyndicationClient_Ptr is access all ISyndicationClient;
   type ISyndicationClientFactory_Interface;
   type ISyndicationClientFactory is access all ISyndicationClientFactory_Interface'Class;
   type ISyndicationClientFactory_Ptr is access all ISyndicationClientFactory;
   type ISyndicationErrorStatics_Interface;
   type ISyndicationErrorStatics is access all ISyndicationErrorStatics_Interface'Class;
   type ISyndicationErrorStatics_Ptr is access all ISyndicationErrorStatics;
   type IIterator_ISyndicationAttribute_Interface;
   type IIterator_ISyndicationAttribute is access all IIterator_ISyndicationAttribute_Interface'Class;
   type IIterator_ISyndicationAttribute_Ptr is access all IIterator_ISyndicationAttribute;
   type IIterable_ISyndicationAttribute_Interface;
   type IIterable_ISyndicationAttribute is access all IIterable_ISyndicationAttribute_Interface'Class;
   type IIterable_ISyndicationAttribute_Ptr is access all IIterable_ISyndicationAttribute;
   type IVectorView_ISyndicationAttribute_Interface;
   type IVectorView_ISyndicationAttribute is access all IVectorView_ISyndicationAttribute_Interface'Class;
   type IVectorView_ISyndicationAttribute_Ptr is access all IVectorView_ISyndicationAttribute;
   type IVector_ISyndicationAttribute_Interface;
   type IVector_ISyndicationAttribute is access all IVector_ISyndicationAttribute_Interface'Class;
   type IVector_ISyndicationAttribute_Ptr is access all IVector_ISyndicationAttribute;
   type IIterator_ISyndicationNode_Interface;
   type IIterator_ISyndicationNode is access all IIterator_ISyndicationNode_Interface'Class;
   type IIterator_ISyndicationNode_Ptr is access all IIterator_ISyndicationNode;
   type IIterable_ISyndicationNode_Interface;
   type IIterable_ISyndicationNode is access all IIterable_ISyndicationNode_Interface'Class;
   type IIterable_ISyndicationNode_Ptr is access all IIterable_ISyndicationNode;
   type IVectorView_ISyndicationNode_Interface;
   type IVectorView_ISyndicationNode is access all IVectorView_ISyndicationNode_Interface'Class;
   type IVectorView_ISyndicationNode_Ptr is access all IVectorView_ISyndicationNode;
   type IVector_ISyndicationNode_Interface;
   type IVector_ISyndicationNode is access all IVector_ISyndicationNode_Interface'Class;
   type IVector_ISyndicationNode_Ptr is access all IVector_ISyndicationNode;
   type IIterator_ISyndicationPerson_Interface;
   type IIterator_ISyndicationPerson is access all IIterator_ISyndicationPerson_Interface'Class;
   type IIterator_ISyndicationPerson_Ptr is access all IIterator_ISyndicationPerson;
   type IIterable_ISyndicationPerson_Interface;
   type IIterable_ISyndicationPerson is access all IIterable_ISyndicationPerson_Interface'Class;
   type IIterable_ISyndicationPerson_Ptr is access all IIterable_ISyndicationPerson;
   type IVectorView_ISyndicationPerson_Interface;
   type IVectorView_ISyndicationPerson is access all IVectorView_ISyndicationPerson_Interface'Class;
   type IVectorView_ISyndicationPerson_Ptr is access all IVectorView_ISyndicationPerson;
   type IVector_ISyndicationPerson_Interface;
   type IVector_ISyndicationPerson is access all IVector_ISyndicationPerson_Interface'Class;
   type IVector_ISyndicationPerson_Ptr is access all IVector_ISyndicationPerson;
   type IIterator_ISyndicationCategory_Interface;
   type IIterator_ISyndicationCategory is access all IIterator_ISyndicationCategory_Interface'Class;
   type IIterator_ISyndicationCategory_Ptr is access all IIterator_ISyndicationCategory;
   type IIterable_ISyndicationCategory_Interface;
   type IIterable_ISyndicationCategory is access all IIterable_ISyndicationCategory_Interface'Class;
   type IIterable_ISyndicationCategory_Ptr is access all IIterable_ISyndicationCategory;
   type IVectorView_ISyndicationCategory_Interface;
   type IVectorView_ISyndicationCategory is access all IVectorView_ISyndicationCategory_Interface'Class;
   type IVectorView_ISyndicationCategory_Ptr is access all IVectorView_ISyndicationCategory;
   type IVector_ISyndicationCategory_Interface;
   type IVector_ISyndicationCategory is access all IVector_ISyndicationCategory_Interface'Class;
   type IVector_ISyndicationCategory_Ptr is access all IVector_ISyndicationCategory;
   type IIterator_ISyndicationLink_Interface;
   type IIterator_ISyndicationLink is access all IIterator_ISyndicationLink_Interface'Class;
   type IIterator_ISyndicationLink_Ptr is access all IIterator_ISyndicationLink;
   type IIterable_ISyndicationLink_Interface;
   type IIterable_ISyndicationLink is access all IIterable_ISyndicationLink_Interface'Class;
   type IIterable_ISyndicationLink_Ptr is access all IIterable_ISyndicationLink;
   type IVectorView_ISyndicationLink_Interface;
   type IVectorView_ISyndicationLink is access all IVectorView_ISyndicationLink_Interface'Class;
   type IVectorView_ISyndicationLink_Ptr is access all IVectorView_ISyndicationLink;
   type IVector_ISyndicationLink_Interface;
   type IVector_ISyndicationLink is access all IVector_ISyndicationLink_Interface'Class;
   type IVector_ISyndicationLink_Ptr is access all IVector_ISyndicationLink;
   type IIterator_ISyndicationItem_Interface;
   type IIterator_ISyndicationItem is access all IIterator_ISyndicationItem_Interface'Class;
   type IIterator_ISyndicationItem_Ptr is access all IIterator_ISyndicationItem;
   type IIterable_ISyndicationItem_Interface;
   type IIterable_ISyndicationItem is access all IIterable_ISyndicationItem_Interface'Class;
   type IIterable_ISyndicationItem_Ptr is access all IIterable_ISyndicationItem;
   type IVectorView_ISyndicationItem_Interface;
   type IVectorView_ISyndicationItem is access all IVectorView_ISyndicationItem_Interface'Class;
   type IVectorView_ISyndicationItem_Ptr is access all IVectorView_ISyndicationItem;
   type IVector_ISyndicationItem_Interface;
   type IVector_ISyndicationItem is access all IVector_ISyndicationItem_Interface'Class;
   type IVector_ISyndicationItem_Ptr is access all IVector_ISyndicationItem;
   type IAsyncActionWithProgress_TransferProgress_Interface;
   type IAsyncActionWithProgress_TransferProgress is access all IAsyncActionWithProgress_TransferProgress_Interface'Class;
   type IAsyncActionWithProgress_TransferProgress_Ptr is access all IAsyncActionWithProgress_TransferProgress;
   
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
   type ISyndicationAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ISyndicationAttribute_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ISyndicationAttribute_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Namespace
   (
      This       : access ISyndicationAttribute_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Namespace
   (
      This       : access ISyndicationAttribute_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ISyndicationAttribute_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access ISyndicationAttribute_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationAttribute : aliased constant Windows.IID := (1911093609, 21102, 16385, (154, 145, 232, 79, 131, 22, 26, 177 ));
   
   ------------------------------------------------------------------------
   type ISyndicationAttributeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationAttribute
   (
      This       : access ISyndicationAttributeFactory_Interface
      ; attributeName : Windows.String
      ; attributeNamespace : Windows.String
      ; attributeValue : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationAttributeFactory : aliased constant Windows.IID := (1649350041, 60734, 16911, (190, 134, 100, 4, 20, 136, 110, 75 ));
   
   ------------------------------------------------------------------------
   type ISyndicationNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NodeName
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeName
   (
      This       : access ISyndicationNode_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeNamespace
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeNamespace
   (
      This       : access ISyndicationNode_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeValue
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeValue
   (
      This       : access ISyndicationNode_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access ISyndicationNode_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseUri
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_BaseUri
   (
      This       : access ISyndicationNode_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeExtensions
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationAttribute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementExtensions
   (
      This       : access ISyndicationNode_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationNode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetXmlDocument
   (
      This       : access ISyndicationNode_Interface
      ; format : Windows.Web.Syndication.SyndicationFormat
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationNode : aliased constant Windows.IID := (1966927736, 20984, 17856, (169, 245, 241, 113, 157, 236, 63, 178 ));
   
   ------------------------------------------------------------------------
   type ISyndicationNodeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationNode
   (
      This       : access ISyndicationNodeFactory_Interface
      ; nodeName : Windows.String
      ; nodeNamespace : Windows.String
      ; nodeValue : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationNodeFactory : aliased constant Windows.IID := (311435656, 19147, 18856, (183, 119, 165, 235, 146, 225, 138, 121 ));
   
   ------------------------------------------------------------------------
   type ISyndicationGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ISyndicationGenerator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ISyndicationGenerator_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access ISyndicationGenerator_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access ISyndicationGenerator_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access ISyndicationGenerator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Version
   (
      This       : access ISyndicationGenerator_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationGenerator : aliased constant Windows.IID := (2540221305, 64299, 20333, (180, 28, 8, 138, 88, 104, 130, 92 ));
   
   ------------------------------------------------------------------------
   type ISyndicationGeneratorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationGenerator
   (
      This       : access ISyndicationGeneratorFactory_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationGenerator
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationGeneratorFactory : aliased constant Windows.IID := (2738914275, 7718, 19900, (186, 157, 26, 184, 75, 239, 249, 123 ));
   
   ------------------------------------------------------------------------
   type ISyndicationText_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ISyndicationText_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ISyndicationText_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ISyndicationText_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access ISyndicationText_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Xml
   (
      This       : access ISyndicationText_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function put_Xml
   (
      This       : access ISyndicationText_Interface
      ; value : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationText : aliased constant Windows.IID := (3117178496, 12602, 16529, (162, 166, 36, 62, 14, 233, 35, 249 ));
   
   ------------------------------------------------------------------------
   type ISyndicationTextFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationText
   (
      This       : access ISyndicationTextFactory_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function CreateSyndicationTextEx
   (
      This       : access ISyndicationTextFactory_Interface
      ; text : Windows.String
      ; type_x : Windows.Web.Syndication.SyndicationTextType
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationTextFactory : aliased constant Windows.IID := (4000531191, 4550, 19237, (171, 98, 229, 150, 189, 22, 41, 70 ));
   
   ------------------------------------------------------------------------
   type ISyndicationContent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceUri
   (
      This       : access ISyndicationContent_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceUri
   (
      This       : access ISyndicationContent_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationContent : aliased constant Windows.IID := (1178730238, 3669, 16592, (184, 208, 106, 44, 203, 169, 252, 124 ));
   
   ------------------------------------------------------------------------
   type ISyndicationContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationContent
   (
      This       : access ISyndicationContentFactory_Interface
      ; text : Windows.String
      ; type_x : Windows.Web.Syndication.SyndicationTextType
      ; RetVal : access Windows.Web.Syndication.ISyndicationContent
   )
   return Windows.HRESULT is abstract;
   
   function CreateSyndicationContentWithSourceUri
   (
      This       : access ISyndicationContentFactory_Interface
      ; sourceUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.ISyndicationContent
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationContentFactory : aliased constant Windows.IID := (1026538387, 38176, 16755, (147, 136, 126, 45, 243, 36, 168, 160 ));
   
   ------------------------------------------------------------------------
   type ISyndicationLink_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Length
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MediaType
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Relationship
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Relationship
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceLanguage
   (
      This       : access ISyndicationLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ResourceLanguage
   (
      This       : access ISyndicationLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationLink : aliased constant Windows.IID := (659897021, 41230, 16821, (134, 189, 151, 89, 8, 110, 176, 197 ));
   
   ------------------------------------------------------------------------
   type ISyndicationLinkFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationLink
   (
      This       : access ISyndicationLinkFactory_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function CreateSyndicationLinkEx
   (
      This       : access ISyndicationLinkFactory_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; relationship : Windows.String
      ; title : Windows.String
      ; mediaType : Windows.String
      ; length : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationLinkFactory : aliased constant Windows.IID := (1591239636, 21813, 18604, (152, 212, 193, 144, 153, 80, 128, 179 ));
   
   ------------------------------------------------------------------------
   type ISyndicationPerson_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Email
   (
      This       : access ISyndicationPerson_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Email
   (
      This       : access ISyndicationPerson_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ISyndicationPerson_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ISyndicationPerson_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access ISyndicationPerson_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access ISyndicationPerson_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationPerson : aliased constant Windows.IID := (4196328922, 42950, 17687, (160, 150, 1, 67, 250, 242, 147, 39 ));
   
   ------------------------------------------------------------------------
   type ISyndicationPersonFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationPerson
   (
      This       : access ISyndicationPersonFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function CreateSyndicationPersonEx
   (
      This       : access ISyndicationPersonFactory_Interface
      ; name : Windows.String
      ; email : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationPersonFactory : aliased constant Windows.IID := (3707013229, 8861, 19288, (164, 155, 243, 210, 240, 245, 201, 159 ));
   
   ------------------------------------------------------------------------
   type ISyndicationCategory_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access ISyndicationCategory_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access ISyndicationCategory_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Scheme
   (
      This       : access ISyndicationCategory_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Scheme
   (
      This       : access ISyndicationCategory_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Term
   (
      This       : access ISyndicationCategory_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Term
   (
      This       : access ISyndicationCategory_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationCategory : aliased constant Windows.IID := (2266325615, 3258, 19071, (137, 255, 236, 181, 40, 20, 35, 182 ));
   
   ------------------------------------------------------------------------
   type ISyndicationCategoryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationCategory
   (
      This       : access ISyndicationCategoryFactory_Interface
      ; term : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function CreateSyndicationCategoryEx
   (
      This       : access ISyndicationCategoryFactory_Interface
      ; term : Windows.String
      ; scheme : Windows.String
      ; label : Windows.String
      ; RetVal : access Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationCategoryFactory : aliased constant Windows.IID := (2873262127, 18912, 17701, (138, 178, 171, 69, 192, 37, 40, 255 ));
   
   ------------------------------------------------------------------------
   type ISyndicationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Authors
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationPerson -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Categories
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationCategory -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Contributors
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationPerson -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationContent
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastUpdatedTime
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastUpdatedTime
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Links
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationLink -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PublishedDate
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_PublishedDate
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Rights
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Rights
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationFeed
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationFeed
   )
   return Windows.HRESULT is abstract;
   
   function get_Summary
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Summary
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_CommentsUri
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_CommentsUri
   (
      This       : access ISyndicationItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_EditUri
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_EditMediaUri
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ETag
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemUri
   (
      This       : access ISyndicationItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function Load
   (
      This       : access ISyndicationItem_Interface
      ; item : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromXml
   (
      This       : access ISyndicationItem_Interface
      ; itemDocument : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationItem : aliased constant Windows.IID := (1418573955, 50052, 17857, (138, 232, 163, 120, 196, 236, 72, 108 ));
   
   ------------------------------------------------------------------------
   type ISyndicationItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationItem
   (
      This       : access ISyndicationItemFactory_Interface
      ; title : Windows.String
      ; content : Windows.Web.Syndication.ISyndicationContent
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationItemFactory : aliased constant Windows.IID := (622674767, 32184, 18554, (133, 228, 16, 209, 145, 230, 110, 187 ));
   
   ------------------------------------------------------------------------
   type ISyndicationFeed_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Authors
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationPerson -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Categories
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationCategory -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Contributors
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationPerson -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Generator
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationGenerator
   )
   return Windows.HRESULT is abstract;
   
   function put_Generator
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Web.Syndication.ISyndicationGenerator
   )
   return Windows.HRESULT is abstract;
   
   function get_IconUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_IconUri
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LastUpdatedTime
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastUpdatedTime
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Links
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationLink -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ImageUri
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Rights
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Rights
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtitle
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ISyndicationFeed_Interface
      ; value : Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_LastUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_NextUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousUri
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceFormat
   (
      This       : access ISyndicationFeed_Interface
      ; RetVal : access Windows.Web.Syndication.SyndicationFormat
   )
   return Windows.HRESULT is abstract;
   
   function Load
   (
      This       : access ISyndicationFeed_Interface
      ; feed : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromXml
   (
      This       : access ISyndicationFeed_Interface
      ; feedDocument : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationFeed : aliased constant Windows.IID := (2147368146, 23398, 19810, (132, 3, 27, 193, 13, 145, 13, 107 ));
   
   ------------------------------------------------------------------------
   type ISyndicationFeedFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationFeed
   (
      This       : access ISyndicationFeedFactory_Interface
      ; title : Windows.String
      ; subtitle : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.ISyndicationFeed
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationFeedFactory : aliased constant Windows.IID := (591864370, 35817, 18615, (137, 52, 98, 5, 19, 29, 147, 87 ));
   
   ------------------------------------------------------------------------
   type ISyndicationClient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCredential
   (
      This       : access ISyndicationClient_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerCredential
   (
      This       : access ISyndicationClient_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyCredential
   (
      This       : access ISyndicationClient_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyCredential
   (
      This       : access ISyndicationClient_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxResponseBufferSize
   (
      This       : access ISyndicationClient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxResponseBufferSize
   (
      This       : access ISyndicationClient_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Timeout
   (
      This       : access ISyndicationClient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Timeout
   (
      This       : access ISyndicationClient_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BypassCacheOnRetrieve
   (
      This       : access ISyndicationClient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BypassCacheOnRetrieve
   (
      This       : access ISyndicationClient_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetRequestHeader
   (
      This       : access ISyndicationClient_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveFeedAsync
   (
      This       : access ISyndicationClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationClient : aliased constant Windows.IID := (2652416439, 29257, 19269, (178, 41, 125, 248, 149, 165, 161, 245 ));
   
   ------------------------------------------------------------------------
   type ISyndicationClientFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSyndicationClient
   (
      This       : access ISyndicationClientFactory_Interface
      ; serverCredential : Windows.Security.Credentials.IPasswordCredential
      ; RetVal : access Windows.Web.Syndication.ISyndicationClient
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationClientFactory : aliased constant Windows.IID := (784642860, 42907, 16660, (178, 154, 5, 223, 251, 175, 185, 164 ));
   
   ------------------------------------------------------------------------
   type ISyndicationErrorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access ISyndicationErrorStatics_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Web.Syndication.SyndicationErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ISyndicationErrorStatics : aliased constant Windows.IID := (532357985, 17863, 18483, (138, 160, 190, 95, 59, 88, 167, 244 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationAttribute_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationAttribute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationAttribute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationAttribute_Interface
      ; items : Windows.Web.Syndication.ISyndicationAttribute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationAttribute : aliased constant Windows.IID := (2809122280, 63599, 23413, (170, 125, 87, 135, 70, 122, 49, 157 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationAttribute_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationAttribute : aliased constant Windows.IID := (849259489, 61388, 21406, (150, 186, 246, 164, 79, 34, 29, 189 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationAttribute_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationAttribute_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationAttribute_Interface
      ; value : Windows.Web.Syndication.ISyndicationAttribute
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationAttribute_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationAttribute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationAttribute : aliased constant Windows.IID := (3252081100, 27086, 21638, (159, 53, 200, 126, 19, 17, 19, 135 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationAttribute_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; value : Windows.Web.Syndication.ISyndicationAttribute
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; value : Windows.Web.Syndication.ISyndicationAttribute
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationAttribute_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationAttribute_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationAttribute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationAttribute_Interface
      ; items : Windows.Web.Syndication.ISyndicationAttribute_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationAttribute : aliased constant Windows.IID := (803753595, 9040, 22849, (148, 181, 166, 70, 119, 181, 133, 209 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationNode_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationNode_Interface
      ; items : Windows.Web.Syndication.ISyndicationNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationNode : aliased constant Windows.IID := (768137686, 3908, 22162, (147, 62, 248, 144, 42, 183, 251, 148 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationNode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationNode_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationNode : aliased constant Windows.IID := (3028702874, 29363, 22442, (153, 80, 206, 160, 179, 228, 252, 88 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationNode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationNode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationNode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationNode_Interface
      ; value : Windows.Web.Syndication.ISyndicationNode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationNode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationNode : aliased constant Windows.IID := (1800131745, 46326, 21555, (175, 215, 189, 46, 80, 26, 16, 65 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationNode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationNode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationNode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationNode_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationNode_Interface
      ; value : Windows.Web.Syndication.ISyndicationNode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationNode_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationNode_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationNode_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationNode_Interface
      ; value : Windows.Web.Syndication.ISyndicationNode
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationNode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationNode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationNode_Interface
      ; items : Windows.Web.Syndication.ISyndicationNode_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationNode : aliased constant Windows.IID := (4098919162, 40706, 24248, (163, 137, 20, 187, 229, 25, 58, 192 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationPerson_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationPerson_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationPerson_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationPerson_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationPerson_Interface
      ; items : Windows.Web.Syndication.ISyndicationPerson_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationPerson : aliased constant Windows.IID := (390457351, 61961, 23974, (136, 85, 127, 153, 226, 94, 177, 252 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationPerson_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationPerson_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationPerson : aliased constant Windows.IID := (3851319364, 60212, 21124, (176, 158, 222, 103, 98, 213, 72, 202 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationPerson_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationPerson_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationPerson_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationPerson_Interface
      ; value : Windows.Web.Syndication.ISyndicationPerson
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationPerson_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationPerson_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationPerson : aliased constant Windows.IID := (239406397, 59216, 22407, (136, 91, 72, 138, 188, 114, 181, 185 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationPerson_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; value : Windows.Web.Syndication.ISyndicationPerson
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; value : Windows.Web.Syndication.ISyndicationPerson
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationPerson_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationPerson_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationPerson_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationPerson_Interface
      ; items : Windows.Web.Syndication.ISyndicationPerson_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationPerson : aliased constant Windows.IID := (2876714198, 36071, 23993, (131, 172, 13, 185, 228, 74, 27, 12 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationCategory_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationCategory_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationCategory_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationCategory_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationCategory_Interface
      ; items : Windows.Web.Syndication.ISyndicationCategory_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationCategory : aliased constant Windows.IID := (714221818, 45192, 22160, (187, 56, 183, 4, 78, 11, 80, 43 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationCategory_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationCategory_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationCategory : aliased constant Windows.IID := (3511810001, 60093, 21248, (181, 92, 20, 158, 178, 137, 204, 113 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationCategory_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationCategory_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationCategory_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationCategory_Interface
      ; value : Windows.Web.Syndication.ISyndicationCategory
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationCategory_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationCategory_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationCategory : aliased constant Windows.IID := (2712404092, 40340, 21806, (132, 14, 19, 159, 16, 154, 155, 136 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationCategory_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; value : Windows.Web.Syndication.ISyndicationCategory
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; value : Windows.Web.Syndication.ISyndicationCategory
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationCategory_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationCategory_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationCategory_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationCategory_Interface
      ; items : Windows.Web.Syndication.ISyndicationCategory_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationCategory : aliased constant Windows.IID := (1927567076, 3666, 21195, (179, 99, 243, 88, 19, 39, 240, 51 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationLink_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationLink_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationLink_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationLink_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationLink_Interface
      ; items : Windows.Web.Syndication.ISyndicationLink_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationLink : aliased constant Windows.IID := (2417377975, 27812, 23383, (184, 241, 115, 32, 131, 66, 186, 74 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationLink_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationLink_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationLink : aliased constant Windows.IID := (3331432298, 26329, 21866, (150, 50, 135, 211, 154, 241, 70, 56 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationLink_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationLink_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationLink_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationLink_Interface
      ; value : Windows.Web.Syndication.ISyndicationLink
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationLink_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationLink_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationLink : aliased constant Windows.IID := (3951788022, 64100, 22378, (139, 228, 160, 85, 247, 160, 74, 115 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationLink_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationLink_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationLink_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationLink_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationLink_Interface
      ; value : Windows.Web.Syndication.ISyndicationLink
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationLink_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationLink_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationLink_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationLink_Interface
      ; value : Windows.Web.Syndication.ISyndicationLink
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationLink_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationLink_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationLink_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationLink_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationLink_Interface
      ; items : Windows.Web.Syndication.ISyndicationLink_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationLink : aliased constant Windows.IID := (3103466917, 451, 20999, (129, 78, 137, 43, 43, 83, 67, 247 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISyndicationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISyndicationItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISyndicationItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISyndicationItem_Interface
      ; items : Windows.Web.Syndication.ISyndicationItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISyndicationItem : aliased constant Windows.IID := (3580439203, 55173, 23988, (172, 92, 179, 131, 32, 130, 230, 41 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISyndicationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IIterator_ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISyndicationItem : aliased constant Windows.IID := (1430666991, 60600, 22989, (141, 107, 116, 218, 172, 190, 125, 25 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISyndicationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISyndicationItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISyndicationItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISyndicationItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISyndicationItem : aliased constant Windows.IID := (2492868507, 22142, 22098, (185, 66, 246, 251, 112, 195, 65, 115 ));
   
   ------------------------------------------------------------------------
   type IVector_ISyndicationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISyndicationItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISyndicationItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISyndicationItem_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISyndicationItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISyndicationItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISyndicationItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISyndicationItem_Interface
      ; value : Windows.Web.Syndication.ISyndicationItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISyndicationItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISyndicationItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISyndicationItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Syndication.ISyndicationItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISyndicationItem_Interface
      ; items : Windows.Web.Syndication.ISyndicationItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISyndicationItem : aliased constant Windows.IID := (2852197131, 17969, 20759, (140, 72, 220, 33, 176, 41, 80, 150 ));
   
   ------------------------------------------------------------------------
   type IAsyncActionWithProgress_TransferProgress_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Progress
   (
      This       : access IAsyncActionWithProgress_TransferProgress_Interface
      ; handler : Windows.Web.Syndication.AsyncActionProgressHandler_TransferProgress
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IAsyncActionWithProgress_TransferProgress_Interface
      ; RetVal : access Windows.Web.Syndication.AsyncActionProgressHandler_TransferProgress
   )
   return Windows.HRESULT is abstract;
   
   function put_Completed
   (
      This       : access IAsyncActionWithProgress_TransferProgress_Interface
      ; handler : Windows.Web.Syndication.AsyncActionWithProgressCompletedHandler_TransferProgress
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncActionWithProgress_TransferProgress_Interface
      ; RetVal : access Windows.Web.Syndication.AsyncActionWithProgressCompletedHandler_TransferProgress
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncActionWithProgress_TransferProgress_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncActionWithProgress_TransferProgress : aliased constant Windows.IID := (3085665269, 42822, 20722, (185, 31, 49, 128, 49, 97, 204, 199 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncActionProgressHandler_TransferProgress_Interface(Callback : access procedure (asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress ; progressInfo : Windows.Web.Syndication.TransferProgress)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncActionProgressHandler_TransferProgress_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncActionProgressHandler_TransferProgress_Interface
      ; asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress
      ; progressInfo : Windows.Web.Syndication.TransferProgress
   )
   return Windows.HRESULT;
   
   IID_AsyncActionProgressHandler_TransferProgress : aliased constant Windows.IID := (3244359813, 38096, 22278, (154, 198, 16, 23, 157, 125, 235, 146 ));
   
   ------------------------------------------------------------------------
   type AsyncActionWithProgressCompletedHandler_TransferProgress_Interface(Callback : access procedure (asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncActionWithProgressCompletedHandler_TransferProgress_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncActionWithProgressCompletedHandler_TransferProgress_Interface
      ; asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncActionWithProgressCompletedHandler_TransferProgress : aliased constant Windows.IID := (4055904712, 37055, 23726, (173, 246, 21, 91, 74, 237, 251, 96 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SyndicationAttribute is Windows.Web.Syndication.ISyndicationAttribute;
   
   function CreateSyndicationAttribute return Windows.Web.Syndication.ISyndicationAttribute;
   
   subtype SyndicationNode is Windows.Web.Syndication.ISyndicationNode;
   
   function CreateSyndicationNode
   (
      nodeName : Windows.String
      ; nodeNamespace : Windows.String
      ; nodeValue : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationNode;
   
   subtype SyndicationGenerator is Windows.Web.Syndication.ISyndicationGenerator;
   
   function CreateSyndicationGenerator
   (
      text : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationGenerator;
   
   subtype SyndicationText is Windows.Web.Syndication.ISyndicationText;
   
   function CreateSyndicationText return Windows.Web.Syndication.ISyndicationText;
   
   subtype SyndicationContent is Windows.Web.Syndication.ISyndicationContent;
   
   function CreateSyndicationContent
   (
      text : Windows.String
      ; type_x : Windows.Web.Syndication.SyndicationTextType
   )
   return Windows.Web.Syndication.ISyndicationContent;
   
   function CreateSyndicationContentWithSourceUri
   (
      sourceUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationContent;
   
   subtype SyndicationLink is Windows.Web.Syndication.ISyndicationLink;
   
   function CreateSyndicationLink return Windows.Web.Syndication.ISyndicationLink;
   
   subtype SyndicationPerson is Windows.Web.Syndication.ISyndicationPerson;
   
   function CreateSyndicationPerson
   (
      name : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationPerson;
   
   function CreateSyndicationPersonEx
   (
      name : Windows.String
      ; email : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationPerson;
   
   subtype SyndicationCategory is Windows.Web.Syndication.ISyndicationCategory;
   
   function CreateSyndicationCategory
   (
      term : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationCategory;
   
   function CreateSyndicationCategoryEx
   (
      term : Windows.String
      ; scheme : Windows.String
      ; label : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationCategory;
   
   subtype SyndicationFeed is Windows.Web.Syndication.ISyndicationFeed;
   
   function CreateSyndicationFeed return Windows.Web.Syndication.ISyndicationFeed;
   
   subtype SyndicationItem is Windows.Web.Syndication.ISyndicationItem;
   
   function CreateSyndicationItem
   (
      title : Windows.String
      ; content : Windows.Web.Syndication.ISyndicationContent
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationItem;
   
   subtype SyndicationClient is Windows.Web.Syndication.ISyndicationClient;
   
   function CreateSyndicationClient return Windows.Web.Syndication.ISyndicationClient;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.Syndication.SyndicationErrorStatus;

end;
