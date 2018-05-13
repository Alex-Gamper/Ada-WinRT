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
with Windows.Foundation.Collections;
package Windows.ApplicationModel.Resources.Management is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type IndexedResourceType is (
      String,
      Path,
      EmbeddedData
   );
   for IndexedResourceType use (
      String => 0,
      Path => 1,
      EmbeddedData => 2
   );
   for IndexedResourceType'Size use 32;
   
   type IndexedResourceType_Ptr is access IndexedResourceType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ResourceIndexerContract is null record;
   pragma Convention (C_Pass_By_Copy , ResourceIndexerContract);
   
   type ResourceIndexerContract_Ptr is access ResourceIndexerContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IResourceIndexer_Interface;
   type IResourceIndexer is access all IResourceIndexer_Interface'Class;
   type IResourceIndexer_Ptr is access all IResourceIndexer;
   type IResourceIndexerFactory_Interface;
   type IResourceIndexerFactory is access all IResourceIndexerFactory_Interface'Class;
   type IResourceIndexerFactory_Ptr is access all IResourceIndexerFactory;
   type IResourceIndexerFactory2_Interface;
   type IResourceIndexerFactory2 is access all IResourceIndexerFactory2_Interface'Class;
   type IResourceIndexerFactory2_Ptr is access all IResourceIndexerFactory2;
   type IIndexedResourceQualifier_Interface;
   type IIndexedResourceQualifier is access all IIndexedResourceQualifier_Interface'Class;
   type IIndexedResourceQualifier_Ptr is access all IIndexedResourceQualifier;
   type IIndexedResourceCandidate_Interface;
   type IIndexedResourceCandidate is access all IIndexedResourceCandidate_Interface'Class;
   type IIndexedResourceCandidate_Ptr is access all IIndexedResourceCandidate;
   type IIterator_IIndexedResourceQualifier_Interface;
   type IIterator_IIndexedResourceQualifier is access all IIterator_IIndexedResourceQualifier_Interface'Class;
   type IIterator_IIndexedResourceQualifier_Ptr is access all IIterator_IIndexedResourceQualifier;
   type IIterable_IIndexedResourceQualifier_Interface;
   type IIterable_IIndexedResourceQualifier is access all IIterable_IIndexedResourceQualifier_Interface'Class;
   type IIterable_IIndexedResourceQualifier_Ptr is access all IIterable_IIndexedResourceQualifier;
   type IVectorView_IIndexedResourceQualifier_Interface;
   type IVectorView_IIndexedResourceQualifier is access all IVectorView_IIndexedResourceQualifier_Interface'Class;
   type IVectorView_IIndexedResourceQualifier_Ptr is access all IVectorView_IIndexedResourceQualifier;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IResourceIndexer : aliased constant Windows.IID := (760019365, 58159, 19122, (135, 72, 150, 53, 10, 1, 109, 163 ));
   
   type IResourceIndexer_Interface is interface and Windows.IInspectable_Interface;
   
   function IndexFilePath
   (
      This       : access IResourceIndexer_Interface
      ; filePath : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IIndexedResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function IndexFileContentsAsync
   (
      This       : access IResourceIndexer_Interface
      ; file : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceIndexerFactory : aliased constant Windows.IID := (3101572873, 12749, 19863, (189, 48, 141, 57, 247, 66, 188, 97 ));
   
   type IResourceIndexerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateResourceIndexer
   (
      This       : access IResourceIndexerFactory_Interface
      ; projectRoot : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IResourceIndexer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceIndexerFactory2 : aliased constant Windows.IID := (1614868877, 54757, 19296, (146, 1, 205, 39, 156, 188, 254, 217 ));
   
   type IResourceIndexerFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateResourceIndexerWithExtension
   (
      This       : access IResourceIndexerFactory2_Interface
      ; projectRoot : Windows.Foundation.IUriRuntimeClass
      ; extensionDllPath : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IResourceIndexer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIndexedResourceQualifier : aliased constant Windows.IID := (3672357787, 54020, 18815, (161, 104, 163, 64, 4, 44, 138, 219 ));
   
   type IIndexedResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QualifierName
   (
      This       : access IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_QualifierValue
   (
      This       : access IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIndexedResourceCandidate : aliased constant Windows.IID := (241278707, 64236, 17428, (169, 215, 84, 172, 213, 149, 63, 41 ));
   
   type IIndexedResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IIndexedResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IndexedResourceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IIndexedResourceCandidate_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Metadata
   (
      This       : access IIndexedResourceCandidate_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Qualifiers
   (
      This       : access IIndexedResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IVectorView_IIndexedResourceQualifier -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueAsString
   (
      This       : access IIndexedResourceCandidate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetQualifierValue
   (
      This       : access IIndexedResourceCandidate_Interface
      ; qualifierName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IIndexedResourceQualifier : aliased constant Windows.IID := (438496238, 31122, 20888, (151, 43, 5, 69, 128, 148, 87, 65 ));
   
   type IIterator_IIndexedResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IIndexedResourceQualifier_Interface
      ; items : Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IIndexedResourceQualifier : aliased constant Windows.IID := (3782083669, 29505, 21952, (160, 36, 38, 217, 173, 67, 200, 204 ));
   
   type IIterable_IIndexedResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IIterator_IIndexedResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IIndexedResourceQualifier : aliased constant Windows.IID := (597552456, 52740, 20978, (178, 201, 165, 229, 171, 103, 27, 141 ));
   
   type IVectorView_IIndexedResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IIndexedResourceQualifier_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IIndexedResourceQualifier_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IIndexedResourceQualifier_Interface
      ; value : Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IIndexedResourceQualifier_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype IndexedResourceCandidate is Windows.ApplicationModel.Resources.Management.IIndexedResourceCandidate;
   subtype ResourceIndexer is Windows.ApplicationModel.Resources.Management.IResourceIndexer;
   function CreateResourceIndexerWithExtension
   (
      projectRoot : Windows.Foundation.IUriRuntimeClass
      ; extensionDllPath : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.Resources.Management.IResourceIndexer;
   
   function CreateResourceIndexer
   (
      projectRoot : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.Resources.Management.IResourceIndexer;
   
   subtype IndexedResourceQualifier is Windows.ApplicationModel.Resources.Management.IIndexedResourceQualifier;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
