--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.System;
limited with Windows.Storage.FileProperties;
limited with Windows.Storage.Search;
limited with Windows.Storage.Streams;
limited with Windows.Storage.Provider;
--------------------------------------------------------------------------------
package Windows.Storage is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type KnownLibraryId is (
      Music,
      Pictures,
      Videos,
      Documents
   );
   for KnownLibraryId use (
      Music => 0,
      Pictures => 1,
      Videos => 2,
      Documents => 3
   );
   for KnownLibraryId'Size use 32;
   
   type KnownLibraryId_Ptr is access KnownLibraryId;
   
   type KnownFolderId is (
      AppCaptures,
      CameraRoll,
      DocumentsLibrary,
      HomeGroup,
      MediaServerDevices,
      MusicLibrary,
      Objects3D,
      PicturesLibrary,
      Playlists,
      RecordedCalls,
      RemovableDevices,
      SavedPictures,
      Screenshots,
      VideosLibrary,
      AllAppMods,
      CurrentAppMods
   );
   for KnownFolderId use (
      AppCaptures => 0,
      CameraRoll => 1,
      DocumentsLibrary => 2,
      HomeGroup => 3,
      MediaServerDevices => 4,
      MusicLibrary => 5,
      Objects3D => 6,
      PicturesLibrary => 7,
      Playlists => 8,
      RecordedCalls => 9,
      RemovableDevices => 10,
      SavedPictures => 11,
      Screenshots => 12,
      VideosLibrary => 13,
      AllAppMods => 14,
      CurrentAppMods => 15
   );
   for KnownFolderId'Size use 32;
   
   type KnownFolderId_Ptr is access KnownFolderId;
   
   type CreationCollisionOption is (
      GenerateUniqueName,
      ReplaceExisting,
      FailIfExists,
      OpenIfExists
   );
   for CreationCollisionOption use (
      GenerateUniqueName => 0,
      ReplaceExisting => 1,
      FailIfExists => 2,
      OpenIfExists => 3
   );
   for CreationCollisionOption'Size use 32;
   
   type CreationCollisionOption_Ptr is access CreationCollisionOption;
   
   type NameCollisionOption is (
      GenerateUniqueName,
      ReplaceExisting,
      FailIfExists
   );
   for NameCollisionOption use (
      GenerateUniqueName => 0,
      ReplaceExisting => 1,
      FailIfExists => 2
   );
   for NameCollisionOption'Size use 32;
   
   type NameCollisionOption_Ptr is access NameCollisionOption;
   
   type StorageDeleteOption is (
      Default,
      PermanentDelete
   );
   for StorageDeleteOption use (
      Default => 0,
      PermanentDelete => 1
   );
   for StorageDeleteOption'Size use 32;
   
   type StorageDeleteOption_Ptr is access StorageDeleteOption;
   
   type StorageItemTypes is (
      None,
      File,
      Folder
   );
   for StorageItemTypes use (
      None => 0,
      File => 1,
      Folder => 2
   );
   for StorageItemTypes'Size use 32;
   
   type StorageItemTypes_Ptr is access StorageItemTypes;
   
   type FileAttributes is (
      Normal,
      ReadOnly,
      Directory,
      Archive,
      Temporary,
      LocallyIncomplete
   );
   for FileAttributes use (
      Normal => 0,
      ReadOnly => 1,
      Directory => 16,
      Archive => 32,
      Temporary => 256,
      LocallyIncomplete => 512
   );
   for FileAttributes'Size use 32;
   
   type FileAttributes_Ptr is access FileAttributes;
   
   type FileAccessMode is (
      Read,
      ReadWrite
   );
   for FileAccessMode use (
      Read => 0,
      ReadWrite => 1
   );
   for FileAccessMode'Size use 32;
   
   type FileAccessMode_Ptr is access FileAccessMode;
   
   type StorageLibraryChangeType is (
      Created,
      Deleted,
      MovedOrRenamed,
      ContentsChanged,
      MovedOutOfLibrary,
      MovedIntoLibrary,
      ContentsReplaced,
      IndexingStatusChanged,
      EncryptionChanged,
      ChangeTrackingLost
   );
   for StorageLibraryChangeType use (
      Created => 0,
      Deleted => 1,
      MovedOrRenamed => 2,
      ContentsChanged => 3,
      MovedOutOfLibrary => 4,
      MovedIntoLibrary => 5,
      ContentsReplaced => 6,
      IndexingStatusChanged => 7,
      EncryptionChanged => 8,
      ChangeTrackingLost => 9
   );
   for StorageLibraryChangeType'Size use 32;
   
   type StorageLibraryChangeType_Ptr is access StorageLibraryChangeType;
   
   type StreamedFileFailureMode is (
      Failed,
      CurrentlyUnavailable,
      Incomplete
   );
   for StreamedFileFailureMode use (
      Failed => 0,
      CurrentlyUnavailable => 1,
      Incomplete => 2
   );
   for StreamedFileFailureMode'Size use 32;
   
   type StreamedFileFailureMode_Ptr is access StreamedFileFailureMode;
   
   type StorageOpenOptions is (
      None,
      AllowOnlyReaders,
      AllowReadersAndWriters
   );
   for StorageOpenOptions use (
      None => 0,
      AllowOnlyReaders => 1,
      AllowReadersAndWriters => 2
   );
   for StorageOpenOptions'Size use 32;
   
   type StorageOpenOptions_Ptr is access StorageOpenOptions;
   
   type ApplicationDataLocality is (
      Local,
      Roaming,
      Temporary,
      LocalCache
   );
   for ApplicationDataLocality use (
      Local => 0,
      Roaming => 1,
      Temporary => 2,
      LocalCache => 3
   );
   for ApplicationDataLocality'Size use 32;
   
   type ApplicationDataLocality_Ptr is access ApplicationDataLocality;
   
   type ApplicationDataCreateDisposition is (
      Always,
      Existing
   );
   for ApplicationDataCreateDisposition use (
      Always => 0,
      Existing => 1
   );
   for ApplicationDataCreateDisposition'Size use 32;
   
   type ApplicationDataCreateDisposition_Ptr is access ApplicationDataCreateDisposition;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type StreamedFileDataRequestedHandler_Interface;
   type StreamedFileDataRequestedHandler is access all StreamedFileDataRequestedHandler_Interface'Class;
   type StreamedFileDataRequestedHandler_Ptr is access all StreamedFileDataRequestedHandler;
   type ApplicationDataSetVersionHandler_Interface;
   type ApplicationDataSetVersionHandler is access all ApplicationDataSetVersionHandler_Interface'Class;
   type ApplicationDataSetVersionHandler_Ptr is access all ApplicationDataSetVersionHandler;
   type AsyncOperationCompletedHandler_IStorageLibrary_Interface;
   type AsyncOperationCompletedHandler_IStorageLibrary is access all AsyncOperationCompletedHandler_IStorageLibrary_Interface'Class;
   type AsyncOperationCompletedHandler_IStorageLibrary_Ptr is access all AsyncOperationCompletedHandler_IStorageLibrary;
   type AsyncOperationCompletedHandler_IStorageFolder_Interface;
   type AsyncOperationCompletedHandler_IStorageFolder is access all AsyncOperationCompletedHandler_IStorageFolder_Interface'Class;
   type AsyncOperationCompletedHandler_IStorageFolder_Ptr is access all AsyncOperationCompletedHandler_IStorageFolder;
   type VectorChangedEventHandler_IStorageFolder_Interface;
   type VectorChangedEventHandler_IStorageFolder is access all VectorChangedEventHandler_IStorageFolder_Interface'Class;
   type VectorChangedEventHandler_IStorageFolder_Ptr is access all VectorChangedEventHandler_IStorageFolder;
   type TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface;
   type TypedEventHandler_IStorageLibrary_add_DefinitionChanged is access all TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface'Class;
   type TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Ptr is access all TypedEventHandler_IStorageLibrary_add_DefinitionChanged;
   type AsyncOperationCompletedHandler_IStorageFile_Interface;
   type AsyncOperationCompletedHandler_IStorageFile is access all AsyncOperationCompletedHandler_IStorageFile_Interface'Class;
   type AsyncOperationCompletedHandler_IStorageFile_Ptr is access all AsyncOperationCompletedHandler_IStorageFile;
   type AsyncOperationCompletedHandler_IStorageItem_Interface;
   type AsyncOperationCompletedHandler_IStorageItem is access all AsyncOperationCompletedHandler_IStorageItem_Interface'Class;
   type AsyncOperationCompletedHandler_IStorageItem_Ptr is access all AsyncOperationCompletedHandler_IStorageItem;
   type AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface;
   type AsyncOperationCompletedHandler_IStorageStreamTransaction is access all AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface'Class;
   type AsyncOperationCompletedHandler_IStorageStreamTransaction_Ptr is access all AsyncOperationCompletedHandler_IStorageStreamTransaction;
   type AsyncOperationCompletedHandler_IApplicationData_Interface;
   type AsyncOperationCompletedHandler_IApplicationData is access all AsyncOperationCompletedHandler_IApplicationData_Interface'Class;
   type AsyncOperationCompletedHandler_IApplicationData_Ptr is access all AsyncOperationCompletedHandler_IApplicationData;
   type TypedEventHandler_IApplicationData_add_DataChanged_Interface;
   type TypedEventHandler_IApplicationData_add_DataChanged is access all TypedEventHandler_IApplicationData_add_DataChanged_Interface'Class;
   type TypedEventHandler_IApplicationData_add_DataChanged_Ptr is access all TypedEventHandler_IApplicationData_add_DataChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStorageLibraryStatics_Interface;
   type IStorageLibraryStatics is access all IStorageLibraryStatics_Interface'Class;
   type IStorageLibraryStatics_Ptr is access all IStorageLibraryStatics;
   type IStorageLibraryStatics2_Interface;
   type IStorageLibraryStatics2 is access all IStorageLibraryStatics2_Interface'Class;
   type IStorageLibraryStatics2_Ptr is access all IStorageLibraryStatics2;
   type IStorageLibrary_Interface;
   type IStorageLibrary is access all IStorageLibrary_Interface'Class;
   type IStorageLibrary_Ptr is access all IStorageLibrary;
   type IStorageLibrary2_Interface;
   type IStorageLibrary2 is access all IStorageLibrary2_Interface'Class;
   type IStorageLibrary2_Ptr is access all IStorageLibrary2;
   type IStorageLibrary3_Interface;
   type IStorageLibrary3 is access all IStorageLibrary3_Interface'Class;
   type IStorageLibrary3_Ptr is access all IStorageLibrary3;
   type IKnownFoldersStatics_Interface;
   type IKnownFoldersStatics is access all IKnownFoldersStatics_Interface'Class;
   type IKnownFoldersStatics_Ptr is access all IKnownFoldersStatics;
   type IKnownFoldersStatics2_Interface;
   type IKnownFoldersStatics2 is access all IKnownFoldersStatics2_Interface'Class;
   type IKnownFoldersStatics2_Ptr is access all IKnownFoldersStatics2;
   type IKnownFoldersStatics3_Interface;
   type IKnownFoldersStatics3 is access all IKnownFoldersStatics3_Interface'Class;
   type IKnownFoldersStatics3_Ptr is access all IKnownFoldersStatics3;
   type IKnownFoldersPlaylistsStatics_Interface;
   type IKnownFoldersPlaylistsStatics is access all IKnownFoldersPlaylistsStatics_Interface'Class;
   type IKnownFoldersPlaylistsStatics_Ptr is access all IKnownFoldersPlaylistsStatics;
   type IKnownFoldersCameraRollStatics_Interface;
   type IKnownFoldersCameraRollStatics is access all IKnownFoldersCameraRollStatics_Interface'Class;
   type IKnownFoldersCameraRollStatics_Ptr is access all IKnownFoldersCameraRollStatics;
   type IKnownFoldersSavedPicturesStatics_Interface;
   type IKnownFoldersSavedPicturesStatics is access all IKnownFoldersSavedPicturesStatics_Interface'Class;
   type IKnownFoldersSavedPicturesStatics_Ptr is access all IKnownFoldersSavedPicturesStatics;
   type IUserDataPathsStatics_Interface;
   type IUserDataPathsStatics is access all IUserDataPathsStatics_Interface'Class;
   type IUserDataPathsStatics_Ptr is access all IUserDataPathsStatics;
   type IUserDataPaths_Interface;
   type IUserDataPaths is access all IUserDataPaths_Interface'Class;
   type IUserDataPaths_Ptr is access all IUserDataPaths;
   type IAppDataPathsStatics_Interface;
   type IAppDataPathsStatics is access all IAppDataPathsStatics_Interface'Class;
   type IAppDataPathsStatics_Ptr is access all IAppDataPathsStatics;
   type IAppDataPaths_Interface;
   type IAppDataPaths is access all IAppDataPaths_Interface'Class;
   type IAppDataPaths_Ptr is access all IAppDataPaths;
   type ISystemDataPathsStatics_Interface;
   type ISystemDataPathsStatics is access all ISystemDataPathsStatics_Interface'Class;
   type ISystemDataPathsStatics_Ptr is access all ISystemDataPathsStatics;
   type ISystemDataPaths_Interface;
   type ISystemDataPaths is access all ISystemDataPaths_Interface'Class;
   type ISystemDataPaths_Ptr is access all ISystemDataPaths;
   type IDownloadsFolderStatics_Interface;
   type IDownloadsFolderStatics is access all IDownloadsFolderStatics_Interface'Class;
   type IDownloadsFolderStatics_Ptr is access all IDownloadsFolderStatics;
   type IDownloadsFolderStatics2_Interface;
   type IDownloadsFolderStatics2 is access all IDownloadsFolderStatics2_Interface'Class;
   type IDownloadsFolderStatics2_Ptr is access all IDownloadsFolderStatics2;
   type IStorageLibraryChange_Interface;
   type IStorageLibraryChange is access all IStorageLibraryChange_Interface'Class;
   type IStorageLibraryChange_Ptr is access all IStorageLibraryChange;
   type IStorageItem_Interface;
   type IStorageItem is access all IStorageItem_Interface'Class;
   type IStorageItem_Ptr is access all IStorageItem;
   type IStorageLibraryChangeReader_Interface;
   type IStorageLibraryChangeReader is access all IStorageLibraryChangeReader_Interface'Class;
   type IStorageLibraryChangeReader_Ptr is access all IStorageLibraryChangeReader;
   type IStorageLibraryChangeTracker_Interface;
   type IStorageLibraryChangeTracker is access all IStorageLibraryChangeTracker_Interface'Class;
   type IStorageLibraryChangeTracker_Ptr is access all IStorageLibraryChangeTracker;
   type IStreamedFileDataRequest_Interface;
   type IStreamedFileDataRequest is access all IStreamedFileDataRequest_Interface'Class;
   type IStreamedFileDataRequest_Ptr is access all IStreamedFileDataRequest;
   type IStorageFileStatics_Interface;
   type IStorageFileStatics is access all IStorageFileStatics_Interface'Class;
   type IStorageFileStatics_Ptr is access all IStorageFileStatics;
   type IStorageFolder_Interface;
   type IStorageFolder is access all IStorageFolder_Interface'Class;
   type IStorageFolder_Ptr is access all IStorageFolder;
   type IStorageFile_Interface;
   type IStorageFile is access all IStorageFile_Interface'Class;
   type IStorageFile_Ptr is access all IStorageFile;
   type IStorageFolderStatics_Interface;
   type IStorageFolderStatics is access all IStorageFolderStatics_Interface'Class;
   type IStorageFolderStatics_Ptr is access all IStorageFolderStatics;
   type IStorageItem2_Interface;
   type IStorageItem2 is access all IStorageItem2_Interface'Class;
   type IStorageItem2_Ptr is access all IStorageItem2;
   type IStorageItemProperties_Interface;
   type IStorageItemProperties is access all IStorageItemProperties_Interface'Class;
   type IStorageItemProperties_Ptr is access all IStorageItemProperties;
   type IStorageItemProperties2_Interface;
   type IStorageItemProperties2 is access all IStorageItemProperties2_Interface'Class;
   type IStorageItemProperties2_Ptr is access all IStorageItemProperties2;
   type IStorageItemPropertiesWithProvider_Interface;
   type IStorageItemPropertiesWithProvider is access all IStorageItemPropertiesWithProvider_Interface'Class;
   type IStorageItemPropertiesWithProvider_Ptr is access all IStorageItemPropertiesWithProvider;
   type IStorageFilePropertiesWithAvailability_Interface;
   type IStorageFilePropertiesWithAvailability is access all IStorageFilePropertiesWithAvailability_Interface'Class;
   type IStorageFilePropertiesWithAvailability_Ptr is access all IStorageFilePropertiesWithAvailability;
   type IStorageProvider_Interface;
   type IStorageProvider is access all IStorageProvider_Interface'Class;
   type IStorageProvider_Ptr is access all IStorageProvider;
   type IStorageProvider2_Interface;
   type IStorageProvider2 is access all IStorageProvider2_Interface'Class;
   type IStorageProvider2_Ptr is access all IStorageProvider2;
   type IStorageFolder2_Interface;
   type IStorageFolder2 is access all IStorageFolder2_Interface'Class;
   type IStorageFolder2_Ptr is access all IStorageFolder2;
   type IStorageStreamTransaction_Interface;
   type IStorageStreamTransaction is access all IStorageStreamTransaction_Interface'Class;
   type IStorageStreamTransaction_Ptr is access all IStorageStreamTransaction;
   type IStorageFile2_Interface;
   type IStorageFile2 is access all IStorageFile2_Interface'Class;
   type IStorageFile2_Ptr is access all IStorageFile2;
   type IFileIOStatics_Interface;
   type IFileIOStatics is access all IFileIOStatics_Interface'Class;
   type IFileIOStatics_Ptr is access all IFileIOStatics;
   type IPathIOStatics_Interface;
   type IPathIOStatics is access all IPathIOStatics_Interface'Class;
   type IPathIOStatics_Ptr is access all IPathIOStatics;
   type ICachedFileManagerStatics_Interface;
   type ICachedFileManagerStatics is access all ICachedFileManagerStatics_Interface'Class;
   type ICachedFileManagerStatics_Ptr is access all ICachedFileManagerStatics;
   type ISystemAudioProperties_Interface;
   type ISystemAudioProperties is access all ISystemAudioProperties_Interface'Class;
   type ISystemAudioProperties_Ptr is access all ISystemAudioProperties;
   type ISystemGPSProperties_Interface;
   type ISystemGPSProperties is access all ISystemGPSProperties_Interface'Class;
   type ISystemGPSProperties_Ptr is access all ISystemGPSProperties;
   type ISystemImageProperties_Interface;
   type ISystemImageProperties is access all ISystemImageProperties_Interface'Class;
   type ISystemImageProperties_Ptr is access all ISystemImageProperties;
   type ISystemMediaProperties_Interface;
   type ISystemMediaProperties is access all ISystemMediaProperties_Interface'Class;
   type ISystemMediaProperties_Ptr is access all ISystemMediaProperties;
   type ISystemMusicProperties_Interface;
   type ISystemMusicProperties is access all ISystemMusicProperties_Interface'Class;
   type ISystemMusicProperties_Ptr is access all ISystemMusicProperties;
   type ISystemPhotoProperties_Interface;
   type ISystemPhotoProperties is access all ISystemPhotoProperties_Interface'Class;
   type ISystemPhotoProperties_Ptr is access all ISystemPhotoProperties;
   type ISystemVideoProperties_Interface;
   type ISystemVideoProperties is access all ISystemVideoProperties_Interface'Class;
   type ISystemVideoProperties_Ptr is access all ISystemVideoProperties;
   type ISystemProperties_Interface;
   type ISystemProperties is access all ISystemProperties_Interface'Class;
   type ISystemProperties_Ptr is access all ISystemProperties;
   type IApplicationDataStatics_Interface;
   type IApplicationDataStatics is access all IApplicationDataStatics_Interface'Class;
   type IApplicationDataStatics_Ptr is access all IApplicationDataStatics;
   type IApplicationDataStatics2_Interface;
   type IApplicationDataStatics2 is access all IApplicationDataStatics2_Interface'Class;
   type IApplicationDataStatics2_Ptr is access all IApplicationDataStatics2;
   type IApplicationData_Interface;
   type IApplicationData is access all IApplicationData_Interface'Class;
   type IApplicationData_Ptr is access all IApplicationData;
   type IApplicationData2_Interface;
   type IApplicationData2 is access all IApplicationData2_Interface'Class;
   type IApplicationData2_Ptr is access all IApplicationData2;
   type IApplicationData3_Interface;
   type IApplicationData3 is access all IApplicationData3_Interface'Class;
   type IApplicationData3_Ptr is access all IApplicationData3;
   type ISetVersionRequest_Interface;
   type ISetVersionRequest is access all ISetVersionRequest_Interface'Class;
   type ISetVersionRequest_Ptr is access all ISetVersionRequest;
   type ISetVersionDeferral_Interface;
   type ISetVersionDeferral is access all ISetVersionDeferral_Interface'Class;
   type ISetVersionDeferral_Ptr is access all ISetVersionDeferral;
   type IApplicationDataContainer_Interface;
   type IApplicationDataContainer is access all IApplicationDataContainer_Interface'Class;
   type IApplicationDataContainer_Ptr is access all IApplicationDataContainer;
   type IObservableMap_String_Object_Interface;
   type IObservableMap_String_Object is access all IObservableMap_String_Object_Interface'Class;
   type IObservableMap_String_Object_Ptr is access all IObservableMap_String_Object;
   type IMap_String_Object_Interface;
   type IMap_String_Object is access all IMap_String_Object_Interface'Class;
   type IMap_String_Object_Ptr is access all IMap_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IStorageFolderQueryOperations_Imported_Interface;
   type IStorageFolderQueryOperations_Imported is access all IStorageFolderQueryOperations_Imported_Interface'Class;
   type IStorageFolderQueryOperations_Imported_Ptr is access all IStorageFolderQueryOperations_Imported;
   type IInputStreamReference_Imported_Interface;
   type IInputStreamReference_Imported is access all IInputStreamReference_Imported_Interface'Class;
   type IInputStreamReference_Imported_Ptr is access all IInputStreamReference_Imported;
   type IRandomAccessStreamReference_Imported_Interface;
   type IRandomAccessStreamReference_Imported is access all IRandomAccessStreamReference_Imported_Interface'Class;
   type IRandomAccessStreamReference_Imported_Ptr is access all IRandomAccessStreamReference_Imported;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IPropertySet_Imported_Interface;
   type IPropertySet_Imported is access all IPropertySet_Imported_Interface'Class;
   type IPropertySet_Imported_Ptr is access all IPropertySet_Imported;
   type IIterator_IStorageFile_Interface;
   type IIterator_IStorageFile is access all IIterator_IStorageFile_Interface'Class;
   type IIterator_IStorageFile_Ptr is access all IIterator_IStorageFile;
   type IIterable_IStorageFile_Interface;
   type IIterable_IStorageFile is access all IIterable_IStorageFile_Interface'Class;
   type IIterable_IStorageFile_Ptr is access all IIterable_IStorageFile;
   type IVectorView_IStorageFile_Interface;
   type IVectorView_IStorageFile is access all IVectorView_IStorageFile_Interface'Class;
   type IVectorView_IStorageFile_Ptr is access all IVectorView_IStorageFile;
   type IIterator_IStorageItem_Interface;
   type IIterator_IStorageItem is access all IIterator_IStorageItem_Interface'Class;
   type IIterator_IStorageItem_Ptr is access all IIterator_IStorageItem;
   type IIterable_IStorageItem_Interface;
   type IIterable_IStorageItem is access all IIterable_IStorageItem_Interface'Class;
   type IIterable_IStorageItem_Ptr is access all IIterable_IStorageItem;
   type IIterator_IStorageFolder_Interface;
   type IIterator_IStorageFolder is access all IIterator_IStorageFolder_Interface'Class;
   type IIterator_IStorageFolder_Ptr is access all IIterator_IStorageFolder;
   type IIterable_IStorageFolder_Interface;
   type IIterable_IStorageFolder is access all IIterable_IStorageFolder_Interface'Class;
   type IIterable_IStorageFolder_Ptr is access all IIterable_IStorageFolder;
   type IVectorView_IStorageFolder_Interface;
   type IVectorView_IStorageFolder is access all IVectorView_IStorageFolder_Interface'Class;
   type IVectorView_IStorageFolder_Ptr is access all IVectorView_IStorageFolder;
   type IVector_IStorageFolder_Interface;
   type IVector_IStorageFolder is access all IVector_IStorageFolder_Interface'Class;
   type IVector_IStorageFolder_Ptr is access all IVector_IStorageFolder;
   type IAsyncOperation_IStorageLibrary_Interface;
   type IAsyncOperation_IStorageLibrary is access all IAsyncOperation_IStorageLibrary_Interface'Class;
   type IAsyncOperation_IStorageLibrary_Ptr is access all IAsyncOperation_IStorageLibrary;
   type IAsyncOperation_IStorageFolder_Interface;
   type IAsyncOperation_IStorageFolder is access all IAsyncOperation_IStorageFolder_Interface'Class;
   type IAsyncOperation_IStorageFolder_Ptr is access all IAsyncOperation_IStorageFolder;
   type IObservableVector_IStorageFolder_Interface;
   type IObservableVector_IStorageFolder is access all IObservableVector_IStorageFolder_Interface'Class;
   type IObservableVector_IStorageFolder_Ptr is access all IObservableVector_IStorageFolder;
   type IAsyncOperation_IStorageFile_Interface;
   type IAsyncOperation_IStorageFile is access all IAsyncOperation_IStorageFile_Interface'Class;
   type IAsyncOperation_IStorageFile_Ptr is access all IAsyncOperation_IStorageFile;
   type IAsyncOperation_IStorageItem_Interface;
   type IAsyncOperation_IStorageItem is access all IAsyncOperation_IStorageItem_Interface'Class;
   type IAsyncOperation_IStorageItem_Ptr is access all IAsyncOperation_IStorageItem;
   type IAsyncOperation_IStorageStreamTransaction_Interface;
   type IAsyncOperation_IStorageStreamTransaction is access all IAsyncOperation_IStorageStreamTransaction_Interface'Class;
   type IAsyncOperation_IStorageStreamTransaction_Ptr is access all IAsyncOperation_IStorageStreamTransaction;
   type IIterator_IStorageLibrary_Interface;
   type IIterator_IStorageLibrary is access all IIterator_IStorageLibrary_Interface'Class;
   type IIterator_IStorageLibrary_Ptr is access all IIterator_IStorageLibrary;
   type IIterable_IStorageLibrary_Interface;
   type IIterable_IStorageLibrary is access all IIterable_IStorageLibrary_Interface'Class;
   type IIterable_IStorageLibrary_Ptr is access all IIterable_IStorageLibrary;
   type IVectorView_IStorageItem_Interface;
   type IVectorView_IStorageItem is access all IVectorView_IStorageItem_Interface'Class;
   type IVectorView_IStorageItem_Ptr is access all IVectorView_IStorageItem;
   type IAsyncOperation_IApplicationData_Interface;
   type IAsyncOperation_IApplicationData is access all IAsyncOperation_IApplicationData_Interface'Class;
   type IAsyncOperation_IApplicationData_Ptr is access all IAsyncOperation_IApplicationData;
   type IVector_IStorageItem_Interface;
   type IVector_IStorageItem is access all IVector_IStorageItem_Interface'Class;
   type IVector_IStorageItem_Ptr is access all IVector_IStorageItem;
   type IVector_IStorageFile_Interface;
   type IVector_IStorageFile is access all IVector_IStorageFile_Interface'Class;
   type IVector_IStorageFile_Ptr is access all IVector_IStorageFile;
   
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
   type IStorageLibraryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLibraryAsync
   (
      This       : access IStorageLibraryStatics_Interface
      ; libraryId : Windows.Storage.KnownLibraryId
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageLibrary -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryStatics : aliased constant Windows.IID := (1107863259, 26698, 18886, (158, 89, 144, 18, 30, 224, 80, 214 ));
   
   ------------------------------------------------------------------------
   type IStorageLibraryStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLibraryForUserAsync
   (
      This       : access IStorageLibraryStatics2_Interface
      ; user : Windows.System.IUser
      ; libraryId : Windows.Storage.KnownLibraryId
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageLibrary -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryStatics2 : aliased constant Windows.IID := (4289760732, 64117, 18069, (185, 209, 127, 129, 249, 120, 50, 227 ));
   
   ------------------------------------------------------------------------
   type IStorageLibrary_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAddFolderAsync
   (
      This       : access IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestRemoveFolderAsync
   (
      This       : access IStorageLibrary_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Folders
   (
      This       : access IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IObservableVector_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SaveFolder
   (
      This       : access IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function add_DefinitionChanged
   (
      This       : access IStorageLibrary_Interface
      ; handler : TypedEventHandler_IStorageLibrary_add_DefinitionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DefinitionChanged
   (
      This       : access IStorageLibrary_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibrary : aliased constant Windows.IID := (517828867, 3678, 19820, (181, 232, 147, 24, 152, 61, 106, 3 ));
   
   ------------------------------------------------------------------------
   type IStorageLibrary2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeTracker
   (
      This       : access IStorageLibrary2_Interface
      ; RetVal : access Windows.Storage.IStorageLibraryChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibrary2 : aliased constant Windows.IID := (1527571272, 64691, 16433, (175, 176, 166, 141, 123, 212, 69, 52 ));
   
   ------------------------------------------------------------------------
   type IStorageLibrary3_Interface is interface and Windows.IInspectable_Interface;
   
   function AreFolderSuggestionsAvailableAsync
   (
      This       : access IStorageLibrary3_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibrary3 : aliased constant Windows.IID := (2317882001, 8532, 16897, (129, 19, 210, 192, 92, 225, 173, 35 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MusicLibrary
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_PicturesLibrary
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_VideosLibrary
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentsLibrary
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_HomeGroup
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_RemovableDevices
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaServerDevices
   (
      This       : access IKnownFoldersStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersStatics : aliased constant Windows.IID := (1512731936, 18434, 17709, (154, 217, 67, 81, 173, 167, 236, 53 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Objects3D
   (
      This       : access IKnownFoldersStatics2_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_AppCaptures
   (
      This       : access IKnownFoldersStatics2_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordedCalls
   (
      This       : access IKnownFoldersStatics2_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersStatics2 : aliased constant Windows.IID := (424399053, 53102, 19719, (157, 83, 233, 22, 58, 37, 54, 233 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFolderForUserAsync
   (
      This       : access IKnownFoldersStatics3_Interface
      ; user : Windows.System.IUser
      ; folderId : Windows.Storage.KnownFolderId
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersStatics3 : aliased constant Windows.IID := (3306767169, 38722, 20181, (130, 61, 252, 20, 1, 20, 135, 100 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersPlaylistsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Playlists
   (
      This       : access IKnownFoldersPlaylistsStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersPlaylistsStatics : aliased constant Windows.IID := (3671452886, 12399, 19818, (180, 150, 70, 186, 142, 177, 6, 206 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersCameraRollStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CameraRoll
   (
      This       : access IKnownFoldersCameraRollStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersCameraRollStatics : aliased constant Windows.IID := (1561419366, 10216, 18735, (184, 229, 47, 144, 137, 108, 212, 205 ));
   
   ------------------------------------------------------------------------
   type IKnownFoldersSavedPicturesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SavedPictures
   (
      This       : access IKnownFoldersSavedPicturesStatics_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownFoldersSavedPicturesStatics : aliased constant Windows.IID := (89953258, 9533, 18044, (182, 202, 169, 125, 161, 233, 161, 141 ));
   
   ------------------------------------------------------------------------
   type IUserDataPathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IUserDataPathsStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Storage.IUserDataPaths
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access IUserDataPathsStatics_Interface
      ; RetVal : access Windows.Storage.IUserDataPaths
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataPathsStatics : aliased constant Windows.IID := (28483055, 57442, 18593, (139, 12, 242, 199, 169, 202, 86, 192 ));
   
   ------------------------------------------------------------------------
   type IUserDataPaths_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CameraRoll
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Cookies
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Desktop
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Documents
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Downloads
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Favorites
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_History
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InternetCache
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalAppData
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalAppDataLow
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Music
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pictures
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Profile
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Recent
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingAppData
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SavedPictures
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Screenshots
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Templates
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Videos
   (
      This       : access IUserDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataPaths : aliased constant Windows.IID := (4190451986, 43972, 18175, (138, 43, 220, 157, 127, 166, 229, 47 ));
   
   ------------------------------------------------------------------------
   type IAppDataPathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IAppDataPathsStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Storage.IAppDataPaths
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access IAppDataPathsStatics_Interface
      ; RetVal : access Windows.Storage.IAppDataPaths
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppDataPathsStatics : aliased constant Windows.IID := (3639290622, 43481, 19220, (185, 153, 227, 146, 19, 121, 217, 3 ));
   
   ------------------------------------------------------------------------
   type IAppDataPaths_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cookies
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Desktop
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Documents
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Favorites
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_History
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InternetCache
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalAppData
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProgramData
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingAppData
   (
      This       : access IAppDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppDataPaths : aliased constant Windows.IID := (1929500170, 31138, 18633, (158, 192, 63, 218, 9, 47, 121, 225 ));
   
   ------------------------------------------------------------------------
   type ISystemDataPathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ISystemDataPathsStatics_Interface
      ; RetVal : access Windows.Storage.ISystemDataPaths
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemDataPathsStatics : aliased constant Windows.IID := (3774443472, 39200, 19402, (179, 121, 249, 111, 223, 124, 170, 216 ));
   
   ------------------------------------------------------------------------
   type ISystemDataPaths_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Fonts
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProgramData
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Public
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicDesktop
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicDocuments
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicDownloads
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicMusic
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicPictures
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicVideos
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_System
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemHost
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemX86
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemX64
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemArm
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserProfiles
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Windows
   (
      This       : access ISystemDataPaths_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemDataPaths : aliased constant Windows.IID := (3811229552, 55546, 17900, (169, 66, 210, 226, 111, 182, 11, 165 ));
   
   ------------------------------------------------------------------------
   type IDownloadsFolderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFileAsync
   (
      This       : access IDownloadsFolderStatics_Interface
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderAsync
   (
      This       : access IDownloadsFolderStatics_Interface
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileWithCollisionOptionAsync
   (
      This       : access IDownloadsFolderStatics_Interface
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderWithCollisionOptionAsync
   (
      This       : access IDownloadsFolderStatics_Interface
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDownloadsFolderStatics : aliased constant Windows.IID := (663105232, 16462, 18399, (161, 226, 227, 115, 8, 190, 123, 55 ));
   
   ------------------------------------------------------------------------
   type IDownloadsFolderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFileForUserAsync
   (
      This       : access IDownloadsFolderStatics2_Interface
      ; user : Windows.System.IUser
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderForUserAsync
   (
      This       : access IDownloadsFolderStatics2_Interface
      ; user : Windows.System.IUser
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileForUserWithCollisionOptionAsync
   (
      This       : access IDownloadsFolderStatics2_Interface
      ; user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderForUserWithCollisionOptionAsync
   (
      This       : access IDownloadsFolderStatics2_Interface
      ; user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDownloadsFolderStatics2 : aliased constant Windows.IID := (3912254909, 36600, 20366, (141, 21, 172, 14, 38, 95, 57, 13 ));
   
   ------------------------------------------------------------------------
   type IStorageLibraryChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeType
   (
      This       : access IStorageLibraryChange_Interface
      ; RetVal : access Windows.Storage.StorageLibraryChangeType
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IStorageLibraryChange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousPath
   (
      This       : access IStorageLibraryChange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function IsOfType
   (
      This       : access IStorageLibraryChange_Interface
      ; type_x : Windows.Storage.StorageItemTypes
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetStorageItemAsync
   (
      This       : access IStorageLibraryChange_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryChange : aliased constant Windows.IID := (9964323, 11234, 18697, (170, 72, 21, 159, 82, 3, 165, 30 ));
   
   ------------------------------------------------------------------------
   type IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function RenameAsyncOverloadDefaultOptions
   (
      This       : access IStorageItem_Interface
      ; desiredName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RenameAsync
   (
      This       : access IStorageItem_Interface
      ; desiredName : Windows.String
      ; option : Windows.Storage.NameCollisionOption
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsyncOverloadDefaultOptions
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IStorageItem_Interface
      ; option : Windows.Storage.StorageDeleteOption
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetBasicPropertiesAsync
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.Storage.FileProperties.IAsyncOperation_IBasicProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Attributes
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.Storage.FileAttributes
   )
   return Windows.HRESULT is abstract;
   
   function get_DateCreated
   (
      This       : access IStorageItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function IsOfType
   (
      This       : access IStorageItem_Interface
      ; type_x : Windows.Storage.StorageItemTypes
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItem : aliased constant Windows.IID := (1107798422, 51759, 17143, (189, 232, 139, 16, 69, 122, 127, 48 ));
   
   ------------------------------------------------------------------------
   type IStorageLibraryChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IStorageLibraryChangeReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChangesAsync
   (
      This       : access IStorageLibraryChangeReader_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryChangeReader : aliased constant Windows.IID := (4060462211, 64674, 16889, (137, 84, 238, 46, 153, 30, 185, 111 ));
   
   ------------------------------------------------------------------------
   type IStorageLibraryChangeTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChangeReader
   (
      This       : access IStorageLibraryChangeTracker_Interface
      ; RetVal : access Windows.Storage.IStorageLibraryChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function Enable
   (
      This       : access IStorageLibraryChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IStorageLibraryChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryChangeTracker : aliased constant Windows.IID := (2652205846, 24691, 17654, (150, 129, 116, 146, 209, 40, 108, 144 ));
   
   ------------------------------------------------------------------------
   type IStreamedFileDataRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function FailAndClose
   (
      This       : access IStreamedFileDataRequest_Interface
      ; failureMode : Windows.Storage.StreamedFileFailureMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IStreamedFileDataRequest : aliased constant Windows.IID := (376700110, 55997, 19792, (190, 238, 24, 11, 138, 129, 145, 182 ));
   
   ------------------------------------------------------------------------
   type IStorageFileStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFileFromPathAsync
   (
      This       : access IStorageFileStatics_Interface
      ; path : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFileFromApplicationUriAsync
   (
      This       : access IStorageFileStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateStreamedFileAsync
   (
      This       : access IStorageFileStatics_Interface
      ; displayNameWithExtension : Windows.String
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceWithStreamedFileAsync
   (
      This       : access IStorageFileStatics_Interface
      ; fileToReplace : Windows.Storage.IStorageFile
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateStreamedFileFromUriAsync
   (
      This       : access IStorageFileStatics_Interface
      ; displayNameWithExtension : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceWithStreamedFileFromUriAsync
   (
      This       : access IStorageFileStatics_Interface
      ; fileToReplace : Windows.Storage.IStorageFile
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFileStatics : aliased constant Windows.IID := (1501873936, 56050, 17352, (139, 180, 164, 211, 234, 207, 208, 63 ));
   
   ------------------------------------------------------------------------
   type IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFileAsyncOverloadDefaultOptions
   (
      This       : access IStorageFolder_Interface
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileAsync
   (
      This       : access IStorageFolder_Interface
      ; desiredName : Windows.String
      ; options : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderAsyncOverloadDefaultOptions
   (
      This       : access IStorageFolder_Interface
      ; desiredName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderAsync
   (
      This       : access IStorageFolder_Interface
      ; desiredName : Windows.String
      ; options : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFileAsync
   (
      This       : access IStorageFolder_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFolderAsync
   (
      This       : access IStorageFolder_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemAsync
   (
      This       : access IStorageFolder_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsyncOverloadDefaultOptionsStartAndCount
   (
      This       : access IStorageFolder_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsyncOverloadDefaultOptionsStartAndCount
   (
      This       : access IStorageFolder_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsyncOverloadDefaultStartAndCount
   (
      This       : access IStorageFolder_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFolder : aliased constant Windows.IID := (1926351736, 46063, 20341, (168, 11, 111, 217, 218, 226, 148, 75 ));
   
   ------------------------------------------------------------------------
   type IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileType
   (
      This       : access IStorageFile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access IStorageFile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function OpenAsync
   (
      This       : access IStorageFile_Interface
      ; accessMode : Windows.Storage.FileAccessMode
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteAsync
   (
      This       : access IStorageFile_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyOverloadDefaultNameAndOptions
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyOverloadDefaultOptions
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; desiredNewName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyOverload
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; desiredNewName : Windows.String
      ; option : Windows.Storage.NameCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyAndReplaceAsync
   (
      This       : access IStorageFile_Interface
      ; fileToReplace : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MoveOverloadDefaultNameAndOptions
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MoveOverloadDefaultOptions
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; desiredNewName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MoveOverload
   (
      This       : access IStorageFile_Interface
      ; destinationFolder : Windows.Storage.IStorageFolder
      ; desiredNewName : Windows.String
      ; option : Windows.Storage.NameCollisionOption
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MoveAndReplaceAsync
   (
      This       : access IStorageFile_Interface
      ; fileToReplace : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFile : aliased constant Windows.IID := (4198457734, 16916, 17036, (166, 76, 20, 201, 172, 115, 21, 234 ));
   
   ------------------------------------------------------------------------
   type IStorageFolderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFolderFromPathAsync
   (
      This       : access IStorageFolderStatics_Interface
      ; path : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFolderStatics : aliased constant Windows.IID := (150153215, 34261, 18617, (174, 233, 40, 81, 30, 51, 159, 159 ));
   
   ------------------------------------------------------------------------
   type IStorageItem2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetParentAsync
   (
      This       : access IStorageItem2_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access IStorageItem2_Interface
      ; item : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItem2 : aliased constant Windows.IID := (1408837330, 2108, 17027, (180, 91, 129, 192, 7, 35, 126, 68 ));
   
   ------------------------------------------------------------------------
   type IStorageItemProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function GetThumbnailAsyncOverloadDefaultSizeDefaultOptions
   (
      This       : access IStorageItemProperties_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailAsyncOverloadDefaultOptions
   (
      This       : access IStorageItemProperties_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedSize : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailAsync
   (
      This       : access IStorageItemProperties_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedSize : Windows.UInt32
      ; options : Windows.Storage.FileProperties.ThumbnailOptions
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IStorageItemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayType
   (
      This       : access IStorageItemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FolderRelativeId
   (
      This       : access IStorageItemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IStorageItemProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IStorageItemContentProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItemProperties : aliased constant Windows.IID := (2254849144, 32809, 18174, (167, 137, 28, 47, 62, 47, 251, 92 ));
   
   ------------------------------------------------------------------------
   type IStorageItemProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetScaledImageAsThumbnailAsyncOverloadDefaultSizeDefaultOptions
   (
      This       : access IStorageItemProperties2_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetScaledImageAsThumbnailAsyncOverloadDefaultOptions
   (
      This       : access IStorageItemProperties2_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedSize : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetScaledImageAsThumbnailAsync
   (
      This       : access IStorageItemProperties2_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedSize : Windows.UInt32
      ; options : Windows.Storage.FileProperties.ThumbnailOptions
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItemProperties2 : aliased constant Windows.IID := (2391189841, 1209, 19410, (146, 157, 254, 243, 247, 22, 33, 208 ));
   
   ------------------------------------------------------------------------
   type IStorageItemPropertiesWithProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Provider
   (
      This       : access IStorageItemPropertiesWithProvider_Interface
      ; RetVal : access Windows.Storage.IStorageProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItemPropertiesWithProvider : aliased constant Windows.IID := (2249978779, 25448, 19950, (180, 14, 116, 104, 74, 92, 231, 20 ));
   
   ------------------------------------------------------------------------
   type IStorageFilePropertiesWithAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAvailable
   (
      This       : access IStorageFilePropertiesWithAvailability_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFilePropertiesWithAvailability : aliased constant Windows.IID := (2949365403, 22571, 16691, (150, 72, 228, 76, 164, 110, 228, 145 ));
   
   ------------------------------------------------------------------------
   type IStorageProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IStorageProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IStorageProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProvider : aliased constant Windows.IID := (3875925716, 54392, 18390, (186, 70, 26, 142, 190, 17, 74, 32 ));
   
   ------------------------------------------------------------------------
   type IStorageProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsPropertySupportedForPartialFileAsync
   (
      This       : access IStorageProvider2_Interface
      ; propertyCanonicalName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProvider2 : aliased constant Windows.IID := (17635607, 13316, 16715, (159, 215, 205, 68, 71, 46, 170, 57 ));
   
   ------------------------------------------------------------------------
   type IStorageFolder2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetItemAsync
   (
      This       : access IStorageFolder2_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFolder2 : aliased constant Windows.IID := (3894929593, 2265, 19086, (160, 172, 254, 94, 211, 203, 187, 211 ));
   
   ------------------------------------------------------------------------
   type IStorageStreamTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Stream
   (
      This       : access IStorageStreamTransaction_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function CommitAsync
   (
      This       : access IStorageStreamTransaction_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageStreamTransaction : aliased constant Windows.IID := (4135383907, 42301, 19860, (174, 44, 103, 35, 45, 147, 172, 221 ));
   
   ------------------------------------------------------------------------
   type IStorageFile2_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenWithOptionsAsync
   (
      This       : access IStorageFile2_Interface
      ; accessMode : Windows.Storage.FileAccessMode
      ; options : Windows.Storage.StorageOpenOptions
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteWithOptionsAsync
   (
      This       : access IStorageFile2_Interface
      ; options : Windows.Storage.StorageOpenOptions
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFile2 : aliased constant Windows.IID := (2504936399, 2679, 17147, (183, 119, 194, 237, 88, 165, 46, 68 ));
   
   ------------------------------------------------------------------------
   type IFileIOStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadTextAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadTextWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteTextAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteTextWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendTextAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendTextWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReadLinesAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadLinesWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteLinesAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteLinesWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendLinesAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendLinesWithEncodingAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReadBufferAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteBufferAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteBytesAsync
   (
      This       : access IFileIOStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileIOStatics : aliased constant Windows.IID := (2289308139, 32596, 18226, (165, 240, 94, 67, 227, 184, 194, 245 ));
   
   ------------------------------------------------------------------------
   type IPathIOStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadTextAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadTextWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteTextAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; contents : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteTextWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendTextAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; contents : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendTextWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReadLinesAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadLinesWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteLinesAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteLinesWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendLinesAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AppendLinesWithEncodingAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReadBufferAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteBufferAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function WriteBytesAsync
   (
      This       : access IPathIOStatics_Interface
      ; absolutePath : Windows.String
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPathIOStatics : aliased constant Windows.IID := (254752600, 36551, 17281, (146, 43, 143, 108, 7, 210, 136, 243 ));
   
   ------------------------------------------------------------------------
   type ICachedFileManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function DeferUpdates
   (
      This       : access ICachedFileManagerStatics_Interface
      ; file : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function CompleteUpdatesAsync
   (
      This       : access ICachedFileManagerStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ICachedFileManagerStatics : aliased constant Windows.IID := (2415665738, 59266, 18781, (182, 20, 101, 76, 79, 11, 35, 112 ));
   
   ------------------------------------------------------------------------
   type ISystemAudioProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncodingBitrate
   (
      This       : access ISystemAudioProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemAudioProperties : aliased constant Windows.IID := (1066350775, 12428, 18401, (146, 77, 134, 69, 52, 142, 93, 183 ));
   
   ------------------------------------------------------------------------
   type ISystemGPSProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LatitudeDecimal
   (
      This       : access ISystemGPSProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LongitudeDecimal
   (
      This       : access ISystemGPSProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemGPSProperties : aliased constant Windows.IID := (3237244596, 49524, 18458, (188, 37, 146, 25, 134, 246, 166, 243 ));
   
   ------------------------------------------------------------------------
   type ISystemImageProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalSize
   (
      This       : access ISystemImageProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalSize
   (
      This       : access ISystemImageProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemImageProperties : aliased constant Windows.IID := (18558512, 35641, 17160, (190, 161, 232, 170, 97, 228, 120, 38 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Duration
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Producer
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Publisher
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubTitle
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Writer
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Year
   (
      This       : access ISystemMediaProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaProperties : aliased constant Windows.IID := (2754294550, 33813, 16604, (140, 68, 152, 54, 29, 35, 84, 48 ));
   
   ------------------------------------------------------------------------
   type ISystemMusicProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlbumArtist
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AlbumTitle
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Artist
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Composer
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Conductor
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayArtist
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Genre
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackNumber
   (
      This       : access ISystemMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMusicProperties : aliased constant Windows.IID := (3027863765, 26543, 19395, (141, 57, 91, 137, 2, 32, 38, 161 ));
   
   ------------------------------------------------------------------------
   type ISystemPhotoProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CameraManufacturer
   (
      This       : access ISystemPhotoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraModel
   (
      This       : access ISystemPhotoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTaken
   (
      This       : access ISystemPhotoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access ISystemPhotoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PeopleNames
   (
      This       : access ISystemPhotoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemPhotoProperties : aliased constant Windows.IID := (1194654781, 43809, 17444, (183, 53, 244, 53, 58, 86, 200, 252 ));
   
   ------------------------------------------------------------------------
   type ISystemVideoProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Director
   (
      This       : access ISystemVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameHeight
   (
      This       : access ISystemVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameWidth
   (
      This       : access ISystemVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access ISystemVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalBitrate
   (
      This       : access ISystemVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemVideoProperties : aliased constant Windows.IID := (541128469, 26616, 17186, (155, 128, 79, 169, 254, 251, 131, 232 ));
   
   ------------------------------------------------------------------------
   type ISystemProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Author
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemNameDisplay
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rating
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Audio
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemAudioProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_GPS
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemGPSProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Media
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemMediaProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Music
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemMusicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Photo
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemPhotoProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Video
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemVideoProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access ISystemProperties_Interface
      ; RetVal : access Windows.Storage.ISystemImageProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemProperties : aliased constant Windows.IID := (2440720833, 34291, 19921, (176, 1, 165, 11, 253, 33, 200, 210 ));
   
   ------------------------------------------------------------------------
   type IApplicationDataStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IApplicationDataStatics_Interface
      ; RetVal : access Windows.Storage.IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationDataStatics : aliased constant Windows.IID := (1444025467, 59459, 17891, (148, 216, 6, 22, 158, 60, 142, 23 ));
   
   ------------------------------------------------------------------------
   type IApplicationDataStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUserAsync
   (
      This       : access IApplicationDataStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Storage.IAsyncOperation_IApplicationData -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationDataStatics2 : aliased constant Windows.IID := (3445645841, 53065, 16548, (164, 124, 199, 240, 219, 186, 129, 7 ));
   
   ------------------------------------------------------------------------
   type IApplicationData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Version
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetVersionAsync
   (
      This       : access IApplicationData_Interface
      ; desiredVersion : Windows.UInt32
      ; handler : Windows.Storage.ApplicationDataSetVersionHandler
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearAllAsync
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearAsync
   (
      This       : access IApplicationData_Interface
      ; locality : Windows.Storage.ApplicationDataLocality
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalSettings
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Storage.IApplicationDataContainer
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingSettings
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Storage.IApplicationDataContainer
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalFolder
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingFolder
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_TemporaryFolder
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function add_DataChanged
   (
      This       : access IApplicationData_Interface
      ; handler : TypedEventHandler_IApplicationData_add_DataChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataChanged
   (
      This       : access IApplicationData_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SignalDataChanged
   (
      This       : access IApplicationData_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingStorageQuota
   (
      This       : access IApplicationData_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationData : aliased constant Windows.IID := (3285872567, 46916, 19269, (176, 184, 34, 58, 9, 56, 208, 220 ));
   
   ------------------------------------------------------------------------
   type IApplicationData2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalCacheFolder
   (
      This       : access IApplicationData2_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationData2 : aliased constant Windows.IID := (2657471849, 2979, 20018, (190, 41, 176, 45, 230, 96, 118, 56 ));
   
   ------------------------------------------------------------------------
   type IApplicationData3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPublisherCacheFolder
   (
      This       : access IApplicationData3_Interface
      ; folderName : Windows.String
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function ClearPublisherCacheFolderAsync
   (
      This       : access IApplicationData3_Interface
      ; folderName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_SharedLocalFolder
   (
      This       : access IApplicationData3_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationData3 : aliased constant Windows.IID := (3693227252, 10098, 19485, (170, 44, 201, 247, 67, 173, 232, 209 ));
   
   ------------------------------------------------------------------------
   type ISetVersionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentVersion
   (
      This       : access ISetVersionRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredVersion
   (
      This       : access ISetVersionRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISetVersionRequest_Interface
      ; RetVal : access Windows.Storage.ISetVersionDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_ISetVersionRequest : aliased constant Windows.IID := (3116854171, 4182, 20073, (131, 48, 22, 38, 25, 149, 111, 155 ));
   
   ------------------------------------------------------------------------
   type ISetVersionDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISetVersionDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ISetVersionDeferral : aliased constant Windows.IID := (53807266, 30746, 17274, (176, 120, 63, 50, 186, 220, 254, 71 ));
   
   ------------------------------------------------------------------------
   type IApplicationDataContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IApplicationDataContainer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Locality
   (
      This       : access IApplicationDataContainer_Interface
      ; RetVal : access Windows.Storage.ApplicationDataLocality
   )
   return Windows.HRESULT is abstract;
   
   function get_Values
   (
      This       : access IApplicationDataContainer_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Containers
   (
      This       : access IApplicationDataContainer_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateContainer
   (
      This       : access IApplicationDataContainer_Interface
      ; name : Windows.String
      ; disposition : Windows.Storage.ApplicationDataCreateDisposition
      ; RetVal : access Windows.Storage.IApplicationDataContainer
   )
   return Windows.HRESULT is abstract;
   
   function DeleteContainer
   (
      This       : access IApplicationDataContainer_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationDataContainer : aliased constant Windows.IID := (3316579614, 62567, 16570, (133, 102, 171, 100, 10, 68, 30, 29 ));
   
   ------------------------------------------------------------------------
   type IObservableMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; vhnd : Windows.Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableMap_String_Object : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMap_String_Object : aliased constant Windows.IID := (453850480, 2167, 24258, (138, 44, 59, 149, 57, 80, 106, 202 ));
   
   ------------------------------------------------------------------------
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
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
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IPropertySet_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   type IIterator_IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageFile_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageFile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageFile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageFile_Interface
      ; items : Windows.Storage.IStorageFile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageFile : aliased constant Windows.IID := (827138840, 29934, 21340, (179, 97, 33, 68, 219, 197, 115, 160 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageFile_Interface
      ; RetVal : access Windows.Storage.IIterator_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageFile : aliased constant Windows.IID := (1993620606, 64777, 22792, (162, 185, 164, 155, 72, 72, 41, 75 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorageFile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorageFile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorageFile_Interface
      ; value : Windows.Storage.IStorageFile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorageFile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageFile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStorageFile : aliased constant Windows.IID := (2154063129, 24106, 22877, (168, 205, 42, 36, 180, 6, 127, 27 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageItem_Interface
      ; RetVal : access Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageItem_Interface
      ; items : Windows.Storage.IStorageItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageItem : aliased constant Windows.IID := (95717314, 14384, 23868, (152, 218, 37, 250, 17, 84, 45, 189 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageItem_Interface
      ; RetVal : access Windows.Storage.IIterator_IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageItem : aliased constant Windows.IID := (3146482712, 26065, 21579, (176, 131, 109, 23, 47, 86, 140, 115 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageFolder_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageFolder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageFolder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageFolder_Interface
      ; items : Windows.Storage.IStorageFolder_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageFolder : aliased constant Windows.IID := (1521260283, 46009, 23167, (169, 32, 75, 90, 141, 248, 17, 104 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageFolder_Interface
      ; RetVal : access Windows.Storage.IIterator_IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageFolder : aliased constant Windows.IID := (1181335292, 44636, 21169, (138, 151, 84, 102, 206, 97, 233, 78 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorageFolder_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorageFolder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorageFolder_Interface
      ; value : Windows.Storage.IStorageFolder
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorageFolder_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageFolder_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStorageFolder : aliased constant Windows.IID := (3792563142, 56398, 21550, (162, 231, 162, 77, 25, 200, 221, 98 ));
   
   ------------------------------------------------------------------------
   type IVector_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IStorageFolder_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IStorageFolder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IStorageFolder_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IStorageFolder_Interface
      ; value : Windows.Storage.IStorageFolder
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IStorageFolder_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IStorageFolder_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IStorageFolder_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IStorageFolder_Interface
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IStorageFolder_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IStorageFolder_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IStorageFolder_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageFolder_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IStorageFolder_Interface
      ; items : Windows.Storage.IStorageFolder_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IStorageFolder : aliased constant Windows.IID := (1814476734, 24321, 23136, (157, 215, 253, 23, 190, 58, 157, 214 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorageLibrary_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorageLibrary_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IStorageLibrary
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IStorageLibrary
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IStorageLibrary
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorageLibrary : aliased constant Windows.IID := (789973529, 39361, 21177, (141, 202, 20, 228, 171, 121, 242, 135 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorageFolder_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorageFolder_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorageFolder_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorageFolder : aliased constant Windows.IID := (1810491351, 59450, 23740, (128, 44, 23, 104, 150, 11, 82, 195 ));
   
   ------------------------------------------------------------------------
   type IObservableVector_IStorageFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_IStorageFolder_Interface
      ; vhnd : Windows.Storage.VectorChangedEventHandler_IStorageFolder
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_IStorageFolder_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableVector_IStorageFolder : aliased constant Windows.IID := (898581727, 10821, 23736, (147, 133, 31, 246, 104, 8, 205, 224 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorageFile_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorageFile_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorageFile_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorageFile : aliased constant Windows.IID := (1582495950, 44269, 23106, (149, 180, 246, 116, 221, 132, 136, 94 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorageItem_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorageItem_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorageItem_Interface
      ; RetVal : access Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorageItem : aliased constant Windows.IID := (1607057719, 60343, 24172, (156, 186, 104, 111, 46, 194, 176, 187 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorageStreamTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorageStreamTransaction_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IStorageStreamTransaction
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorageStreamTransaction_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IStorageStreamTransaction
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorageStreamTransaction_Interface
      ; RetVal : access Windows.Storage.IStorageStreamTransaction
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorageStreamTransaction : aliased constant Windows.IID := (226574426, 39891, 24199, (130, 244, 155, 65, 40, 168, 135, 235 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageLibrary_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IStorageLibrary
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageLibrary_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageLibrary_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageLibrary_Interface
      ; items : Windows.Storage.IStorageLibrary_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageLibrary : aliased constant Windows.IID := (169632777, 64467, 22728, (154, 243, 98, 98, 204, 86, 229, 179 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageLibrary_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageLibrary_Interface
      ; RetVal : access Windows.Storage.IIterator_IStorageLibrary
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageLibrary : aliased constant Windows.IID := (2233351421, 12395, 23694, (174, 60, 168, 216, 60, 98, 54, 4 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorageItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorageItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorageItem_Interface
      ; value : Windows.Storage.IStorageItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorageItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStorageItem : aliased constant Windows.IID := (2237094465, 1739, 22736, (185, 138, 124, 143, 6, 230, 233, 215 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IApplicationData_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IApplicationData_Interface
      ; handler : Windows.Storage.AsyncOperationCompletedHandler_IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IApplicationData_Interface
      ; RetVal : access Windows.Storage.AsyncOperationCompletedHandler_IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IApplicationData_Interface
      ; RetVal : access Windows.Storage.IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IApplicationData : aliased constant Windows.IID := (826633048, 42443, 23643, (189, 110, 204, 206, 58, 123, 244, 180 ));
   
   ------------------------------------------------------------------------
   type IVector_IStorageItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IStorageItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IStorageItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IStorageItem_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IStorageItem_Interface
      ; value : Windows.Storage.IStorageItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IStorageItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IStorageItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IStorageItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IStorageItem_Interface
      ; value : Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IStorageItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IStorageItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IStorageItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IStorageItem_Interface
      ; items : Windows.Storage.IStorageItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IStorageItem : aliased constant Windows.IID := (2149910754, 39980, 23441, (137, 168, 57, 188, 247, 34, 51, 68 ));
   
   ------------------------------------------------------------------------
   type IVector_IStorageFile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IStorageFile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IStorageFile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IStorageFile_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IStorageFile_Interface
      ; value : Windows.Storage.IStorageFile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IStorageFile_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IStorageFile_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IStorageFile_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IStorageFile_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IStorageFile_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IStorageFile_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IStorageFile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.IStorageFile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IStorageFile_Interface
      ; items : Windows.Storage.IStorageFile_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IStorageFile : aliased constant Windows.IID := (4240214923, 24835, 23374, (186, 0, 75, 194, 206, 219, 106, 53 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type StreamedFileDataRequestedHandler_Interface(Callback : access procedure (stream : Windows.Storage.Streams.IOutputStream)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access StreamedFileDataRequestedHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access StreamedFileDataRequestedHandler_Interface
      ; stream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT;
   
   IID_StreamedFileDataRequestedHandler : aliased constant Windows.IID := (4277577764, 12257, 19719, (163, 91, 183, 124, 80, 181, 244, 204 ));
   
   ------------------------------------------------------------------------
   type ApplicationDataSetVersionHandler_Interface(Callback : access procedure (setVersionRequest : Windows.Storage.ISetVersionRequest)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access ApplicationDataSetVersionHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access ApplicationDataSetVersionHandler_Interface
      ; setVersionRequest : Windows.Storage.ISetVersionRequest
   )
   return Windows.HRESULT;
   
   IID_ApplicationDataSetVersionHandler : aliased constant Windows.IID := (2690093542, 52383, 18055, (172, 171, 163, 100, 253, 120, 84, 99 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorageLibrary_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IStorageLibrary ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorageLibrary_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorageLibrary_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageLibrary
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorageLibrary : aliased constant Windows.IID := (919953603, 29471, 23664, (185, 7, 48, 188, 153, 188, 48, 15 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorageFolder_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IStorageFolder ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorageFolder_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorageFolder_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageFolder
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorageFolder : aliased constant Windows.IID := (3255894638, 40547, 21586, (186, 84, 58, 7, 214, 169, 104, 116 ));
   
   ------------------------------------------------------------------------
   type VectorChangedEventHandler_IStorageFolder_Interface(Callback : access procedure (sender : Windows.Storage.IObservableVector_IStorageFolder ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access VectorChangedEventHandler_IStorageFolder_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_IStorageFolder_Interface
      ; sender : Windows.Storage.IObservableVector_IStorageFolder
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_VectorChangedEventHandler_IStorageFolder : aliased constant Windows.IID := (542619201, 19355, 21304, (161, 154, 233, 169, 81, 145, 103, 117 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface(Callback : access procedure (sender : Windows.Storage.IStorageLibrary ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface
      ; sender : Windows.Storage.IStorageLibrary
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IStorageLibrary_add_DefinitionChanged : aliased constant Windows.IID := (3988821304, 48046, 23339, (158, 129, 180, 73, 234, 126, 72, 254 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorageFile_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IStorageFile ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorageFile_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorageFile_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageFile
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorageFile : aliased constant Windows.IID := (3844196500, 11302, 22854, (158, 97, 43, 94, 24, 141, 1, 237 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorageItem_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IStorageItem ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorageItem_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorageItem_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageItem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorageItem : aliased constant Windows.IID := (2462257199, 41767, 21272, (166, 193, 118, 246, 178, 160, 171, 251 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IStorageStreamTransaction ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageStreamTransaction
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorageStreamTransaction : aliased constant Windows.IID := (3507960294, 10645, 23859, (191, 255, 81, 182, 4, 31, 104, 193 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IApplicationData_Interface(Callback : access procedure (asyncInfo : Windows.Storage.IAsyncOperation_IApplicationData ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IApplicationData_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IApplicationData_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IApplicationData
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IApplicationData : aliased constant Windows.IID := (2880431504, 26110, 21002, (157, 124, 106, 181, 241, 136, 34, 55 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IApplicationData_add_DataChanged_Interface(Callback : access procedure (sender : Windows.Storage.IApplicationData ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IApplicationData_add_DataChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IApplicationData_add_DataChanged_Interface
      ; sender : Windows.Storage.IApplicationData
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IApplicationData_add_DataChanged : aliased constant Windows.IID := (3040119611, 20609, 23273, (143, 163, 77, 34, 214, 143, 176, 234 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype StorageLibrary is Windows.Storage.IStorageLibrary;
   subtype StorageFolder is Windows.Storage.IStorageFolder;
   subtype StorageLibraryChangeTracker is Windows.Storage.IStorageLibraryChangeTracker;
   subtype UserDataPaths is Windows.Storage.IUserDataPaths;
   subtype AppDataPaths is Windows.Storage.IAppDataPaths;
   subtype SystemDataPaths is Windows.Storage.ISystemDataPaths;
   subtype StorageFile is Windows.Storage.IStorageFile;
   subtype StorageLibraryChange is Windows.Storage.IStorageLibraryChange;
   subtype StorageLibraryChangeReader is Windows.Storage.IStorageLibraryChangeReader;
   subtype StreamedFileDataRequest is Windows.Storage.Streams.IOutputStream;
   subtype StorageStreamTransaction is Windows.Storage.IStorageStreamTransaction;
   subtype StorageProvider is Windows.Storage.IStorageProvider;
   subtype SystemAudioProperties is Windows.Storage.ISystemAudioProperties;
   subtype SystemGPSProperties is Windows.Storage.ISystemGPSProperties;
   subtype SystemImageProperties is Windows.Storage.ISystemImageProperties;
   subtype SystemMediaProperties is Windows.Storage.ISystemMediaProperties;
   subtype SystemMusicProperties is Windows.Storage.ISystemMusicProperties;
   subtype SystemPhotoProperties is Windows.Storage.ISystemPhotoProperties;
   subtype SystemVideoProperties is Windows.Storage.ISystemVideoProperties;
   subtype ApplicationData is Windows.Storage.IApplicationData;
   subtype SetVersionRequest is Windows.Storage.ISetVersionRequest;
   subtype ApplicationDataContainer is Windows.Storage.IApplicationDataContainer;
   subtype SetVersionDeferral is Windows.Storage.ISetVersionDeferral;
   subtype ApplicationDataContainerSettings is Windows.Foundation.Collections.IPropertySet;
   subtype ApplicationDataCompositeValue is Windows.Foundation.Collections.IPropertySet;
   
   function CreateApplicationDataCompositeValue return Windows.Foundation.Collections.IPropertySet;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetLibraryAsync
   (
      libraryId : Windows.Storage.KnownLibraryId
   )
   return Windows.Storage.IAsyncOperation_IStorageLibrary;
   
   function GetLibraryForUserAsync
   (
      user : Windows.System.IUser
      ; libraryId : Windows.Storage.KnownLibraryId
   )
   return Windows.Storage.IAsyncOperation_IStorageLibrary;
   
   function GetFolderFromPathAsync
   (
      path : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function get_Objects3D
   return Windows.Storage.IStorageFolder;
   
   function get_AppCaptures
   return Windows.Storage.IStorageFolder;
   
   function get_RecordedCalls
   return Windows.Storage.IStorageFolder;
   
   function get_MusicLibrary
   return Windows.Storage.IStorageFolder;
   
   function get_PicturesLibrary
   return Windows.Storage.IStorageFolder;
   
   function get_VideosLibrary
   return Windows.Storage.IStorageFolder;
   
   function get_DocumentsLibrary
   return Windows.Storage.IStorageFolder;
   
   function get_HomeGroup
   return Windows.Storage.IStorageFolder;
   
   function get_RemovableDevices
   return Windows.Storage.IStorageFolder;
   
   function get_MediaServerDevices
   return Windows.Storage.IStorageFolder;
   
   function get_CameraRoll
   return Windows.Storage.IStorageFolder;
   
   function get_SavedPictures
   return Windows.Storage.IStorageFolder;
   
   function GetFolderForUserAsync
   (
      user : Windows.System.IUser
      ; folderId : Windows.Storage.KnownFolderId
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function get_Playlists
   return Windows.Storage.IStorageFolder;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IUserDataPaths;
   
   function GetDefault
   return Windows.Storage.IUserDataPaths;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IAppDataPaths;
   
   function GetDefault
   return Windows.Storage.IAppDataPaths;
   
   function GetDefault
   return Windows.Storage.ISystemDataPaths;
   
   function GetFileFromPathAsync
   (
      path : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function GetFileFromApplicationUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateStreamedFileAsync
   (
      displayNameWithExtension : Windows.String
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function ReplaceWithStreamedFileAsync
   (
      fileToReplace : Windows.Storage.IStorageFile
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateStreamedFileFromUriAsync
   (
      displayNameWithExtension : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function ReplaceWithStreamedFileFromUriAsync
   (
      fileToReplace : Windows.Storage.IStorageFile
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateFileForUserAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateFolderForUserAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function CreateFileForUserWithCollisionOptionAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateFolderForUserWithCollisionOptionAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function CreateFileAsync
   (
      desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateFolderAsync
   (
      desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function CreateFileWithCollisionOptionAsync
   (
      desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   function CreateFolderWithCollisionOptionAsync
   (
      desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder;
   
   function ReadTextAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ReadTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function WriteTextAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendTextAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function ReadLinesAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Address;
   
   function ReadLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Address;
   
   function WriteLinesAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendLinesAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function ReadBufferAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function WriteBufferAsync
   (
      file : Windows.Storage.IStorageFile
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteBytesAsync
   (
      file : Windows.Storage.IStorageFile
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.Foundation.IAsyncAction;
   
   function ReadTextAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ReadTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function WriteTextAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendTextAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function ReadLinesAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Address;
   
   function ReadLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Address;
   
   function WriteLinesAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendLinesAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction;
   
   function AppendLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction;
   
   function ReadBufferAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function WriteBufferAsync
   (
      absolutePath : Windows.String
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction;
   
   function WriteBytesAsync
   (
      absolutePath : Windows.String
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.Foundation.IAsyncAction;
   
   procedure DeferUpdates
   (
      file : Windows.Storage.IStorageFile
   )
   ;
   
   function CompleteUpdatesAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus;
   
   function get_Author
   return Windows.String;
   
   function get_Comment
   return Windows.String;
   
   function get_ItemNameDisplay
   return Windows.String;
   
   function get_Keywords
   return Windows.String;
   
   function get_Rating
   return Windows.String;
   
   function get_Title
   return Windows.String;
   
   function get_Audio
   return Windows.Storage.ISystemAudioProperties;
   
   function get_GPS
   return Windows.Storage.ISystemGPSProperties;
   
   function get_Media
   return Windows.Storage.ISystemMediaProperties;
   
   function get_Music
   return Windows.Storage.ISystemMusicProperties;
   
   function get_Photo
   return Windows.Storage.ISystemPhotoProperties;
   
   function get_Video
   return Windows.Storage.ISystemVideoProperties;
   
   function get_Image
   return Windows.Storage.ISystemImageProperties;
   
   function get_Current
   return Windows.Storage.IApplicationData;
   
   function GetForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IAsyncOperation_IApplicationData;

end;
