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
limited with Windows.Storage.FileProperties;
with Windows.Foundation;
limited with Windows.Storage.Search;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Storage.BulkAccess is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface;
   type TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated is access all TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface'Class;
   type TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Ptr is access all TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated;
   type TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface;
   type TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated is access all TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface'Class;
   type TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Ptr is access all TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStorageItemInformation_Interface;
   type IStorageItemInformation is access all IStorageItemInformation_Interface'Class;
   type IStorageItemInformation_Ptr is access all IStorageItemInformation;
   type IFileInformationFactoryFactory_Interface;
   type IFileInformationFactoryFactory is access all IFileInformationFactoryFactory_Interface'Class;
   type IFileInformationFactoryFactory_Ptr is access all IFileInformationFactoryFactory;
   type IFileInformationFactory_Interface;
   type IFileInformationFactory is access all IFileInformationFactory_Interface'Class;
   type IFileInformationFactory_Ptr is access all IFileInformationFactory;
   type IInputStreamReference_Imported_Interface;
   type IInputStreamReference_Imported is access all IInputStreamReference_Imported_Interface'Class;
   type IInputStreamReference_Imported_Ptr is access all IInputStreamReference_Imported;
   type IRandomAccessStreamReference_Imported_Interface;
   type IRandomAccessStreamReference_Imported is access all IRandomAccessStreamReference_Imported_Interface'Class;
   type IRandomAccessStreamReference_Imported_Ptr is access all IRandomAccessStreamReference_Imported;
   type IStorageFolderQueryOperations_Imported_Interface;
   type IStorageFolderQueryOperations_Imported is access all IStorageFolderQueryOperations_Imported_Interface'Class;
   type IStorageFolderQueryOperations_Imported_Ptr is access all IStorageFolderQueryOperations_Imported;
   
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
   
   IID_IStorageItemInformation : aliased constant Windows.IID := (2275789707, 35186, 20288, (141, 224, 216, 111, 177, 121, 216, 250 ));
   
   type IStorageItemInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MusicProperties
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.FileProperties.IMusicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProperties
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.FileProperties.IVideoProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageProperties
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.FileProperties.IImageProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentProperties
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.FileProperties.IDocumentProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_BasicProperties
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.FileProperties.IBasicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IStorageItemInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function add_ThumbnailUpdated
   (
      This       : access IStorageItemInformation_Interface
      ; changedHandler : TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ThumbnailUpdated
   (
      This       : access IStorageItemInformation_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PropertiesUpdated
   (
      This       : access IStorageItemInformation_Interface
      ; changedHandler : TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertiesUpdated
   (
      This       : access IStorageItemInformation_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileInformationFactoryFactory : aliased constant Windows.IID := (2229931645, 58530, 20224, (138, 250, 175, 94, 15, 130, 107, 213 ));
   
   type IFileInformationFactoryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithMode
   (
      This       : access IFileInformationFactoryFactory_Interface
      ; queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; RetVal : access Windows.Storage.BulkAccess.IFileInformationFactory
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithModeAndSize
   (
      This       : access IFileInformationFactoryFactory_Interface
      ; queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; RetVal : access Windows.Storage.BulkAccess.IFileInformationFactory
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithModeAndSizeAndOptions
   (
      This       : access IFileInformationFactoryFactory_Interface
      ; queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
      ; RetVal : access Windows.Storage.BulkAccess.IFileInformationFactory
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithModeAndSizeAndOptionsAndFlags
   (
      This       : access IFileInformationFactoryFactory_Interface
      ; queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
      ; delayLoad : Windows.Boolean
      ; RetVal : access Windows.Storage.BulkAccess.IFileInformationFactory
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileInformationFactory : aliased constant Windows.IID := (1075677374, 38415, 19821, (167, 208, 26, 56, 97, 231, 108, 131 ));
   
   type IFileInformationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemsAsync
   (
      This       : access IFileInformationFactory_Interface
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsyncDefaultStartAndCount
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsync
   (
      This       : access IFileInformationFactory_Interface
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsyncDefaultStartAndCount
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsync
   (
      This       : access IFileInformationFactory_Interface
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsyncDefaultStartAndCount
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetVirtualizedItemsVector
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetVirtualizedFilesVector
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetVirtualizedFoldersVector
   (
      This       : access IFileInformationFactory_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IInputStreamReference_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenSequentialReadAsync
   (
      This       : access IInputStreamReference_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IInputStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IRandomAccessStreamReference_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenReadAsync
   (
      This       : access IRandomAccessStreamReference_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IStorageFolderQueryOperations_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function GetIndexedStateAsync
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; RetVal : access Windows.Storage.Search.IAsyncOperation_IndexedState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQueryOverloadDefault
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQuery
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQueryOverloadDefault
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQuery
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateItemQuery
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; RetVal : access Windows.Storage.Search.IStorageItemQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateItemQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageItemQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsync
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsyncOverloadDefaultStartAndCount
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsync
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsyncOverloadDefaultStartAndCount
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsync
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AreQueryOptionsSupported
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCommonFolderQuerySupported
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCommonFileQuerySupported
   (
      This       : access IStorageFolderQueryOperations_Imported_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated : aliased constant Windows.IID := (1536734034, 57551, 22750, (178, 236, 79, 215, 134, 187, 181, 167 ));
   
   type TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface(Callback : access procedure (sender : Windows.Storage.BulkAccess.IStorageItemInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface
      ; sender : Windows.Storage.BulkAccess.IStorageItemInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated : aliased constant Windows.IID := (1536734034, 57551, 22750, (178, 236, 79, 215, 134, 187, 181, 167 ));
   
   type TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface(Callback : access procedure (sender : Windows.Storage.BulkAccess.IStorageItemInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface
      ; sender : Windows.Storage.BulkAccess.IStorageItemInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype FileInformationFactory is Windows.Storage.BulkAccess.IFileInformationFactory;
   function CreateWithMode
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory;
   
   function CreateWithModeAndSize
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory;
   
   function CreateWithModeAndSizeAndOptions
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory;
   
   function CreateWithModeAndSizeAndOptionsAndFlags
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
      ; delayLoad : Windows.Boolean
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory;
   
   
   subtype FileInformation is Windows.Storage.BulkAccess.IStorageItemInformation;
   subtype FolderInformation is Windows.Storage.BulkAccess.IStorageItemInformation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
