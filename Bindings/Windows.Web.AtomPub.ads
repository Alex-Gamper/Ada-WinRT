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
limited with Windows.Web.Syndication;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Data.Xml.Dom;
limited with Windows.Storage.Streams;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Web.AtomPub is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IResourceCollection_Interface;
   type IResourceCollection is access all IResourceCollection_Interface'Class;
   type IResourceCollection_Ptr is access all IResourceCollection;
   type IWorkspace_Interface;
   type IWorkspace is access all IWorkspace_Interface'Class;
   type IWorkspace_Ptr is access all IWorkspace;
   type IServiceDocument_Interface;
   type IServiceDocument is access all IServiceDocument_Interface'Class;
   type IServiceDocument_Ptr is access all IServiceDocument;
   type IAtomPubClient_Interface;
   type IAtomPubClient is access all IAtomPubClient_Interface'Class;
   type IAtomPubClient_Ptr is access all IAtomPubClient;
   type IAtomPubClientFactory_Interface;
   type IAtomPubClientFactory is access all IAtomPubClientFactory_Interface'Class;
   type IAtomPubClientFactory_Ptr is access all IAtomPubClientFactory;
   type ISyndicationNode_Imported_Interface;
   type ISyndicationNode_Imported is access all ISyndicationNode_Imported_Interface'Class;
   type ISyndicationNode_Imported_Ptr is access all ISyndicationNode_Imported;
   type ISyndicationClient_Imported_Interface;
   type ISyndicationClient_Imported is access all ISyndicationClient_Imported_Interface'Class;
   type ISyndicationClient_Imported_Ptr is access all ISyndicationClient_Imported;
   type IIterator_IResourceCollection_Interface;
   type IIterator_IResourceCollection is access all IIterator_IResourceCollection_Interface'Class;
   type IIterator_IResourceCollection_Ptr is access all IIterator_IResourceCollection;
   type IIterable_IResourceCollection_Interface;
   type IIterable_IResourceCollection is access all IIterable_IResourceCollection_Interface'Class;
   type IIterable_IResourceCollection_Ptr is access all IIterable_IResourceCollection;
   type IVectorView_IResourceCollection_Interface;
   type IVectorView_IResourceCollection is access all IVectorView_IResourceCollection_Interface'Class;
   type IVectorView_IResourceCollection_Ptr is access all IVectorView_IResourceCollection;
   type IIterator_IWorkspace_Interface;
   type IIterator_IWorkspace is access all IIterator_IWorkspace_Interface'Class;
   type IIterator_IWorkspace_Ptr is access all IIterator_IWorkspace;
   type IIterable_IWorkspace_Interface;
   type IIterable_IWorkspace is access all IIterable_IWorkspace_Interface'Class;
   type IIterable_IWorkspace_Ptr is access all IIterable_IWorkspace;
   type IVectorView_IWorkspace_Interface;
   type IVectorView_IWorkspace is access all IVectorView_IWorkspace_Interface'Class;
   type IVectorView_IWorkspace_Ptr is access all IVectorView_IWorkspace;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IResourceCollection : aliased constant Windows.IID := (2136987145, 48264, 16852, (136, 250, 61, 230, 112, 77, 66, 142 ));
   
   type IResourceCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IResourceCollection_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IResourceCollection_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Categories
   (
      This       : access IResourceCollection_Interface
      ; RetVal : access Windows.Web.Syndication.IVectorView_ISyndicationCategory -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Accepts
   (
      This       : access IResourceCollection_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWorkspace : aliased constant Windows.IID := (3021841979, 42168, 16438, (137, 197, 131, 195, 18, 102, 186, 73 ));
   
   type IWorkspace_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IWorkspace_Interface
      ; RetVal : access Windows.Web.Syndication.ISyndicationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Collections
   (
      This       : access IWorkspace_Interface
      ; RetVal : access Windows.Web.AtomPub.IVectorView_IResourceCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IServiceDocument : aliased constant Windows.IID := (2340341617, 10931, 19902, (139, 204, 119, 143, 146, 183, 94, 81 ));
   
   type IServiceDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Workspaces
   (
      This       : access IServiceDocument_Interface
      ; RetVal : access Windows.Web.AtomPub.IVectorView_IWorkspace -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAtomPubClient : aliased constant Windows.IID := (892939320, 52717, 19788, (150, 55, 5, 241, 92, 28, 148, 6 ));
   
   type IAtomPubClient_Interface is interface and Windows.IInspectable_Interface;
   
   function RetrieveServiceDocumentAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveMediaResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; description : Windows.String
      ; item : Windows.Web.Syndication.ISyndicationItem
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateMediaResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; mediaType : Windows.String
      ; description : Windows.String
      ; mediaStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateMediaResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; mediaType : Windows.String
      ; mediaStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; item : Windows.Web.Syndication.ISyndicationItem
      ; RetVal : access Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateResourceItemAsync
   (
      This       : access IAtomPubClient_Interface
      ; item : Windows.Web.Syndication.ISyndicationItem
      ; RetVal : access Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteResourceAsync
   (
      This       : access IAtomPubClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteResourceItemAsync
   (
      This       : access IAtomPubClient_Interface
      ; item : Windows.Web.Syndication.ISyndicationItem
      ; RetVal : access Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CancelAsyncOperations
   (
      This       : access IAtomPubClient_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAtomPubClientFactory : aliased constant Windows.IID := (1238716434, 22475, 19422, (171, 159, 38, 16, 177, 114, 119, 123 ));
   
   type IAtomPubClientFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAtomPubClientWithCredentials
   (
      This       : access IAtomPubClientFactory_Interface
      ; serverCredential : Windows.Security.Credentials.IPasswordCredential
      ; RetVal : access Windows.Web.AtomPub.IAtomPubClient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ISyndicationNode_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NodeName
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeName
   (
      This       : access ISyndicationNode_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeNamespace
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeNamespace
   (
      This       : access ISyndicationNode_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NodeValue
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NodeValue
   (
      This       : access ISyndicationNode_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access ISyndicationNode_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseUri
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_BaseUri
   (
      This       : access ISyndicationNode_Imported_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeExtensions
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationAttribute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementExtensions
   (
      This       : access ISyndicationNode_Imported_Interface
      ; RetVal : access Windows.Web.Syndication.IVector_ISyndicationNode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetXmlDocument
   (
      This       : access ISyndicationNode_Imported_Interface
      ; format : Windows.Web.Syndication.SyndicationFormat
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ISyndicationClient_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCredential
   (
      This       : access ISyndicationClient_Imported_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerCredential
   (
      This       : access ISyndicationClient_Imported_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyCredential
   (
      This       : access ISyndicationClient_Imported_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyCredential
   (
      This       : access ISyndicationClient_Imported_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxResponseBufferSize
   (
      This       : access ISyndicationClient_Imported_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxResponseBufferSize
   (
      This       : access ISyndicationClient_Imported_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Timeout
   (
      This       : access ISyndicationClient_Imported_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Timeout
   (
      This       : access ISyndicationClient_Imported_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BypassCacheOnRetrieve
   (
      This       : access ISyndicationClient_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BypassCacheOnRetrieve
   (
      This       : access ISyndicationClient_Imported_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetRequestHeader
   (
      This       : access ISyndicationClient_Imported_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveFeedAsync
   (
      This       : access ISyndicationClient_Imported_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IResourceCollection : aliased constant Windows.IID := (722950262, 2336, 21232, (128, 191, 223, 231, 151, 68, 18, 141 ));
   
   type IIterator_IResourceCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IResourceCollection_Interface
      ; RetVal : access Windows.Web.AtomPub.IResourceCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IResourceCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IResourceCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IResourceCollection_Interface
      ; items : Windows.Web.AtomPub.IResourceCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IResourceCollection : aliased constant Windows.IID := (3560385069, 31408, 23950, (189, 92, 110, 156, 10, 103, 168, 216 ));
   
   type IIterable_IResourceCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IResourceCollection_Interface
      ; RetVal : access Windows.Web.AtomPub.IIterator_IResourceCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IResourceCollection : aliased constant Windows.IID := (854598087, 13963, 23802, (130, 156, 74, 207, 138, 54, 200, 16 ));
   
   type IVectorView_IResourceCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IResourceCollection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.AtomPub.IResourceCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IResourceCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IResourceCollection_Interface
      ; value : Windows.Web.AtomPub.IResourceCollection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IResourceCollection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.AtomPub.IResourceCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWorkspace : aliased constant Windows.IID := (214484006, 54922, 20790, (151, 65, 222, 50, 103, 100, 202, 50 ));
   
   type IIterator_IWorkspace_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWorkspace_Interface
      ; RetVal : access Windows.Web.AtomPub.IWorkspace
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWorkspace_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWorkspace_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWorkspace_Interface
      ; items : Windows.Web.AtomPub.IWorkspace_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWorkspace : aliased constant Windows.IID := (4029484734, 60098, 20527, (152, 54, 28, 84, 130, 51, 59, 254 ));
   
   type IIterable_IWorkspace_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWorkspace_Interface
      ; RetVal : access Windows.Web.AtomPub.IIterator_IWorkspace
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWorkspace : aliased constant Windows.IID := (3503797645, 55678, 22369, (190, 102, 66, 184, 91, 61, 25, 200 ));
   
   type IVectorView_IWorkspace_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWorkspace_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.AtomPub.IWorkspace
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWorkspace_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWorkspace_Interface
      ; value : Windows.Web.AtomPub.IWorkspace
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWorkspace_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.AtomPub.IWorkspace_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ResourceCollection is Windows.Web.AtomPub.IResourceCollection;
   subtype Workspace is Windows.Web.AtomPub.IWorkspace;
   subtype ServiceDocument is Windows.Web.AtomPub.IServiceDocument;
   subtype AtomPubClient is Windows.Web.AtomPub.IAtomPubClient;
   function Create return Windows.Web.AtomPub.IAtomPubClient;
   
   function CreateAtomPubClientWithCredentials
   (
      serverCredential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.Web.AtomPub.IAtomPubClient;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
