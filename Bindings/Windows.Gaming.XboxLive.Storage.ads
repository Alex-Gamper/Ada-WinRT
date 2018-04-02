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
limited with Windows.System;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Gaming.XboxLive.Storage is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GameSaveErrorStatus is (
      Abort_x,
      InvalidContainerName,
      NoAccess,
      OutOfLocalStorage,
      UserCanceled,
      UpdateTooBig,
      QuotaExceeded,
      ProvidedBufferTooSmall,
      BlobNotFound,
      NoXboxLiveInfo,
      ContainerNotInSync,
      ContainerSyncFailed,
      UserHasNoXboxLiveInfo,
      ObjectExpired,
      Ok
   );
   for GameSaveErrorStatus use (
      Abort_x => -2147467260,
      InvalidContainerName => -2138898431,
      NoAccess => -2138898430,
      OutOfLocalStorage => -2138898429,
      UserCanceled => -2138898428,
      UpdateTooBig => -2138898427,
      QuotaExceeded => -2138898426,
      ProvidedBufferTooSmall => -2138898425,
      BlobNotFound => -2138898424,
      NoXboxLiveInfo => -2138898423,
      ContainerNotInSync => -2138898422,
      ContainerSyncFailed => -2138898421,
      UserHasNoXboxLiveInfo => -2138898420,
      ObjectExpired => -2138898419,
      Ok => 0
   );
   for GameSaveErrorStatus'Size use 32;
   
   type GameSaveErrorStatus_Ptr is access GameSaveErrorStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface;
   type AsyncOperationCompletedHandler_IGameSaveOperationResult is access all AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGameSaveOperationResult_Ptr is access all AsyncOperationCompletedHandler_IGameSaveOperationResult;
   type AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface;
   type AsyncOperationCompletedHandler_IGameSaveProviderGetResult is access all AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Ptr is access all AsyncOperationCompletedHandler_IGameSaveProviderGetResult;
   type AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface;
   type AsyncOperationCompletedHandler_IGameSaveBlobGetResult is access all AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Ptr is access all AsyncOperationCompletedHandler_IGameSaveBlobGetResult;
   type AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface;
   type AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult is access all AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Ptr is access all AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult;
   type AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface;
   type AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult is access all AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Ptr is access all AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameSaveProvider_Interface;
   type IGameSaveProvider is access all IGameSaveProvider_Interface'Class;
   type IGameSaveProvider_Ptr is access all IGameSaveProvider;
   type IGameSaveProviderStatics_Interface;
   type IGameSaveProviderStatics is access all IGameSaveProviderStatics_Interface'Class;
   type IGameSaveProviderStatics_Ptr is access all IGameSaveProviderStatics;
   type IGameSaveProviderGetResult_Interface;
   type IGameSaveProviderGetResult is access all IGameSaveProviderGetResult_Interface'Class;
   type IGameSaveProviderGetResult_Ptr is access all IGameSaveProviderGetResult;
   type IGameSaveContainer_Interface;
   type IGameSaveContainer is access all IGameSaveContainer_Interface'Class;
   type IGameSaveContainer_Ptr is access all IGameSaveContainer;
   type IGameSaveBlobGetResult_Interface;
   type IGameSaveBlobGetResult is access all IGameSaveBlobGetResult_Interface'Class;
   type IGameSaveBlobGetResult_Ptr is access all IGameSaveBlobGetResult;
   type IGameSaveContainerInfo_Interface;
   type IGameSaveContainerInfo is access all IGameSaveContainerInfo_Interface'Class;
   type IGameSaveContainerInfo_Ptr is access all IGameSaveContainerInfo;
   type IGameSaveBlobInfo_Interface;
   type IGameSaveBlobInfo is access all IGameSaveBlobInfo_Interface'Class;
   type IGameSaveBlobInfo_Ptr is access all IGameSaveBlobInfo;
   type IGameSaveContainerInfoQuery_Interface;
   type IGameSaveContainerInfoQuery is access all IGameSaveContainerInfoQuery_Interface'Class;
   type IGameSaveContainerInfoQuery_Ptr is access all IGameSaveContainerInfoQuery;
   type IGameSaveContainerInfoGetResult_Interface;
   type IGameSaveContainerInfoGetResult is access all IGameSaveContainerInfoGetResult_Interface'Class;
   type IGameSaveContainerInfoGetResult_Ptr is access all IGameSaveContainerInfoGetResult;
   type IGameSaveBlobInfoQuery_Interface;
   type IGameSaveBlobInfoQuery is access all IGameSaveBlobInfoQuery_Interface'Class;
   type IGameSaveBlobInfoQuery_Ptr is access all IGameSaveBlobInfoQuery;
   type IGameSaveBlobInfoGetResult_Interface;
   type IGameSaveBlobInfoGetResult is access all IGameSaveBlobInfoGetResult_Interface'Class;
   type IGameSaveBlobInfoGetResult_Ptr is access all IGameSaveBlobInfoGetResult;
   type IGameSaveOperationResult_Interface;
   type IGameSaveOperationResult is access all IGameSaveOperationResult_Interface'Class;
   type IGameSaveOperationResult_Ptr is access all IGameSaveOperationResult;
   type IAsyncOperation_IGameSaveOperationResult_Interface;
   type IAsyncOperation_IGameSaveOperationResult is access all IAsyncOperation_IGameSaveOperationResult_Interface'Class;
   type IAsyncOperation_IGameSaveOperationResult_Ptr is access all IAsyncOperation_IGameSaveOperationResult;
   type IAsyncOperation_IGameSaveProviderGetResult_Interface;
   type IAsyncOperation_IGameSaveProviderGetResult is access all IAsyncOperation_IGameSaveProviderGetResult_Interface'Class;
   type IAsyncOperation_IGameSaveProviderGetResult_Ptr is access all IAsyncOperation_IGameSaveProviderGetResult;
   type IIterable_IGameSaveContainer_SubmitUpdatesAsync_Interface;
   type IIterable_IGameSaveContainer_SubmitUpdatesAsync is access all IIterable_IGameSaveContainer_SubmitUpdatesAsync_Interface'Class;
   type IIterable_IGameSaveContainer_SubmitUpdatesAsync_Ptr is access all IIterable_IGameSaveContainer_SubmitUpdatesAsync;
   type IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface;
   type IMapView_IGameSaveContainer_SubmitUpdatesAsync is access all IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface'Class;
   type IMapView_IGameSaveContainer_SubmitUpdatesAsync_Ptr is access all IMapView_IGameSaveContainer_SubmitUpdatesAsync;
   type IIterable_IGameSaveContainer_ReadAsync_Interface;
   type IIterable_IGameSaveContainer_ReadAsync is access all IIterable_IGameSaveContainer_ReadAsync_Interface'Class;
   type IIterable_IGameSaveContainer_ReadAsync_Ptr is access all IIterable_IGameSaveContainer_ReadAsync;
   type IMapView_IGameSaveContainer_ReadAsync_Interface;
   type IMapView_IGameSaveContainer_ReadAsync is access all IMapView_IGameSaveContainer_ReadAsync_Interface'Class;
   type IMapView_IGameSaveContainer_ReadAsync_Ptr is access all IMapView_IGameSaveContainer_ReadAsync;
   type IAsyncOperation_IGameSaveBlobGetResult_Interface;
   type IAsyncOperation_IGameSaveBlobGetResult is access all IAsyncOperation_IGameSaveBlobGetResult_Interface'Class;
   type IAsyncOperation_IGameSaveBlobGetResult_Ptr is access all IAsyncOperation_IGameSaveBlobGetResult;
   type IAsyncOperation_IGameSaveContainerInfoGetResult_Interface;
   type IAsyncOperation_IGameSaveContainerInfoGetResult is access all IAsyncOperation_IGameSaveContainerInfoGetResult_Interface'Class;
   type IAsyncOperation_IGameSaveContainerInfoGetResult_Ptr is access all IAsyncOperation_IGameSaveContainerInfoGetResult;
   type IIterator_IGameSaveContainerInfo_Interface;
   type IIterator_IGameSaveContainerInfo is access all IIterator_IGameSaveContainerInfo_Interface'Class;
   type IIterator_IGameSaveContainerInfo_Ptr is access all IIterator_IGameSaveContainerInfo;
   type IIterable_IGameSaveContainerInfo_Interface;
   type IIterable_IGameSaveContainerInfo is access all IIterable_IGameSaveContainerInfo_Interface'Class;
   type IIterable_IGameSaveContainerInfo_Ptr is access all IIterable_IGameSaveContainerInfo;
   type IVectorView_IGameSaveContainerInfo_Interface;
   type IVectorView_IGameSaveContainerInfo is access all IVectorView_IGameSaveContainerInfo_Interface'Class;
   type IVectorView_IGameSaveContainerInfo_Ptr is access all IVectorView_IGameSaveContainerInfo;
   type IAsyncOperation_IGameSaveBlobInfoGetResult_Interface;
   type IAsyncOperation_IGameSaveBlobInfoGetResult is access all IAsyncOperation_IGameSaveBlobInfoGetResult_Interface'Class;
   type IAsyncOperation_IGameSaveBlobInfoGetResult_Ptr is access all IAsyncOperation_IGameSaveBlobInfoGetResult;
   type IIterator_IGameSaveBlobInfo_Interface;
   type IIterator_IGameSaveBlobInfo is access all IIterator_IGameSaveBlobInfo_Interface'Class;
   type IIterator_IGameSaveBlobInfo_Ptr is access all IIterator_IGameSaveBlobInfo;
   type IIterable_IGameSaveBlobInfo_Interface;
   type IIterable_IGameSaveBlobInfo is access all IIterable_IGameSaveBlobInfo_Interface'Class;
   type IIterable_IGameSaveBlobInfo_Ptr is access all IIterable_IGameSaveBlobInfo;
   type IVectorView_IGameSaveBlobInfo_Interface;
   type IVectorView_IGameSaveBlobInfo is access all IVectorView_IGameSaveBlobInfo_Interface'Class;
   type IVectorView_IGameSaveBlobInfo_Ptr is access all IVectorView_IGameSaveBlobInfo;
   
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
   type IGameSaveProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IGameSaveProvider_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function CreateContainer
   (
      This       : access IGameSaveProvider_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainer
   )
   return Windows.HRESULT is abstract;
   
   function DeleteContainerAsync
   (
      This       : access IGameSaveProvider_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateContainerInfoQuery
   (
      This       : access IGameSaveProvider_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfoQuery
   )
   return Windows.HRESULT is abstract;
   
   function CreateContainerInfoQueryWithName
   (
      This       : access IGameSaveProvider_Interface
      ; containerNamePrefix : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfoQuery
   )
   return Windows.HRESULT is abstract;
   
   function GetRemainingBytesInQuotaAsync
   (
      This       : access IGameSaveProvider_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Int64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainersChangedSinceLastSync
   (
      This       : access IGameSaveProvider_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveProvider : aliased constant Windows.IID := (2426798996, 33022, 16913, (151, 248, 165, 222, 20, 221, 149, 210 ));
   
   ------------------------------------------------------------------------
   type IGameSaveProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUserAsync
   (
      This       : access IGameSaveProviderStatics_Interface
      ; user : Windows.System.IUser
      ; serviceConfigId : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSyncOnDemandForUserAsync
   (
      This       : access IGameSaveProviderStatics_Interface
      ; user : Windows.System.IUser
      ; serviceConfigId : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveProviderStatics : aliased constant Windows.IID := (3491577552, 31491, 17565, (140, 189, 52, 2, 132, 42, 16, 72 ));
   
   ------------------------------------------------------------------------
   type IGameSaveProviderGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGameSaveProviderGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGameSaveProviderGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveProviderGetResult : aliased constant Windows.IID := (985204758, 54163, 19813, (172, 22, 65, 195, 230, 122, 185, 69 ));
   
   ------------------------------------------------------------------------
   type IGameSaveContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGameSaveContainer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Provider
   (
      This       : access IGameSaveContainer_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveProvider
   )
   return Windows.HRESULT is abstract;
   
   function SubmitUpdatesAsync
   (
      This       : access IGameSaveContainer_Interface
      ; blobsToWrite : IMapView_IGameSaveContainer_SubmitUpdatesAsync
      ; blobsToDelete : Windows.Foundation.Collections.IIterable_String
      ; displayName : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadAsync
   (
      This       : access IGameSaveContainer_Interface
      ; blobsToRead : IMapView_IGameSaveContainer_ReadAsync
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAsync
   (
      This       : access IGameSaveContainer_Interface
      ; blobsToRead : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SubmitPropertySetUpdatesAsync
   (
      This       : access IGameSaveContainer_Interface
      ; blobsToWrite : Windows.Foundation.Collections.IPropertySet
      ; blobsToDelete : Windows.Foundation.Collections.IIterable_String
      ; displayName : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateBlobInfoQuery
   (
      This       : access IGameSaveContainer_Interface
      ; blobNamePrefix : Windows.String
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfoQuery
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveContainer : aliased constant Windows.IID := (3284176777, 22079, 20173, (156, 111, 51, 253, 14, 50, 61, 16 ));
   
   ------------------------------------------------------------------------
   type IGameSaveBlobGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGameSaveBlobGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGameSaveBlobGetResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveBlobGetResult : aliased constant Windows.IID := (2440200672, 29185, 18771, (170, 44, 64, 8, 240, 58, 239, 69 ));
   
   ------------------------------------------------------------------------
   type IGameSaveContainerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalSize
   (
      This       : access IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastModifiedTime
   (
      This       : access IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_NeedsSync
   (
      This       : access IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveContainerInfo : aliased constant Windows.IID := (3085071104, 5469, 19380, (178, 186, 147, 3, 6, 243, 145, 181 ));
   
   ------------------------------------------------------------------------
   type IGameSaveBlobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveBlobInfo : aliased constant Windows.IID := (2916319284, 47856, 17989, (182, 208, 70, 237, 175, 251, 60, 43 ));
   
   ------------------------------------------------------------------------
   type IGameSaveContainerInfoQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function GetContainerInfoAsync
   (
      This       : access IGameSaveContainerInfoQuery_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveContainerInfoGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContainerInfoWithIndexAndMaxAsync
   (
      This       : access IGameSaveContainerInfoQuery_Interface
      ; startIndex : Windows.UInt32
      ; maxNumberOfItems : Windows.UInt32
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveContainerInfoGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemCountAsync
   (
      This       : access IGameSaveContainerInfoQuery_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveContainerInfoQuery : aliased constant Windows.IID := (1016391779, 28544, 17191, (147, 39, 255, 193, 26, 253, 66, 179 ));
   
   ------------------------------------------------------------------------
   type IGameSaveContainerInfoGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGameSaveContainerInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGameSaveContainerInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IVectorView_IGameSaveContainerInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveContainerInfoGetResult : aliased constant Windows.IID := (4291104116, 50561, 20381, (158, 57, 48, 161, 12, 30, 76, 80 ));
   
   ------------------------------------------------------------------------
   type IGameSaveBlobInfoQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function GetBlobInfoAsync
   (
      This       : access IGameSaveBlobInfoQuery_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobInfoGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBlobInfoWithIndexAndMaxAsync
   (
      This       : access IGameSaveBlobInfoQuery_Interface
      ; startIndex : Windows.UInt32
      ; maxNumberOfItems : Windows.UInt32
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobInfoGetResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemCountAsync
   (
      This       : access IGameSaveBlobInfoQuery_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveBlobInfoQuery : aliased constant Windows.IID := (2682090674, 61166, 17531, (169, 210, 127, 150, 192, 248, 50, 8 ));
   
   ------------------------------------------------------------------------
   type IGameSaveBlobInfoGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGameSaveBlobInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGameSaveBlobInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IVectorView_IGameSaveBlobInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveBlobInfoGetResult : aliased constant Windows.IID := (3344401794, 13975, 17087, (152, 156, 102, 93, 146, 59, 82, 49 ));
   
   ------------------------------------------------------------------------
   type IGameSaveOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGameSaveOperationResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameSaveOperationResult : aliased constant Windows.IID := (3473873413, 9376, 17794, (154, 85, 177, 187, 187, 147, 136, 216 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGameSaveOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameSaveOperationResult_Interface
      ; handler : Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameSaveOperationResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameSaveOperationResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveOperationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGameSaveOperationResult : aliased constant Windows.IID := (472382359, 7706, 20847, (171, 178, 18, 193, 142, 24, 33, 141 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGameSaveProviderGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameSaveProviderGetResult_Interface
      ; handler : Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveProviderGetResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameSaveProviderGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveProviderGetResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameSaveProviderGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveProviderGetResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGameSaveProviderGetResult : aliased constant Windows.IID := (1036214405, 24556, 21531, (150, 207, 98, 123, 42, 216, 13, 54 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGameSaveContainer_SubmitUpdatesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGameSaveContainer_SubmitUpdatesAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGameSaveContainer_SubmitUpdatesAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IGameSaveContainer_SubmitUpdatesAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_IGameSaveContainer_SubmitUpdatesAsync : aliased constant Windows.IID := (754904143, 57953, 24396, (174, 225, 199, 133, 24, 233, 213, 185 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGameSaveContainer_ReadAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGameSaveContainer_ReadAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGameSaveContainer_ReadAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMapView_IGameSaveContainer_ReadAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IGameSaveContainer_ReadAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IGameSaveContainer_ReadAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IGameSaveContainer_ReadAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IGameSaveContainer_ReadAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_IGameSaveContainer_ReadAsync : aliased constant Windows.IID := (754904143, 57953, 24396, (174, 225, 199, 133, 24, 233, 213, 185 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGameSaveBlobGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameSaveBlobGetResult_Interface
      ; handler : Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveBlobGetResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameSaveBlobGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveBlobGetResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameSaveBlobGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveBlobGetResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGameSaveBlobGetResult : aliased constant Windows.IID := (1881387043, 31469, 21100, (179, 188, 190, 18, 227, 92, 225, 207 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGameSaveContainerInfoGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameSaveContainerInfoGetResult_Interface
      ; handler : Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameSaveContainerInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameSaveContainerInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGameSaveContainerInfoGetResult : aliased constant Windows.IID := (3489181675, 23064, 24401, (182, 27, 148, 56, 135, 247, 41, 238 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGameSaveContainerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGameSaveContainerInfo_Interface
      ; items : Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGameSaveContainerInfo : aliased constant Windows.IID := (248354646, 15885, 21055, (165, 73, 43, 101, 4, 219, 82, 2 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGameSaveContainerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IIterator_IGameSaveContainerInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGameSaveContainerInfo : aliased constant Windows.IID := (1441061263, 2185, 23558, (168, 87, 125, 209, 104, 194, 216, 82 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGameSaveContainerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGameSaveContainerInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGameSaveContainerInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGameSaveContainerInfo_Interface
      ; value : Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGameSaveContainerInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGameSaveContainerInfo : aliased constant Windows.IID := (2622031252, 2118, 20725, (178, 239, 198, 240, 62, 230, 134, 138 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGameSaveBlobInfoGetResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameSaveBlobInfoGetResult_Interface
      ; handler : Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameSaveBlobInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameSaveBlobInfoGetResult_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfoGetResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGameSaveBlobInfoGetResult : aliased constant Windows.IID := (3619156916, 24616, 21039, (132, 157, 166, 148, 149, 228, 220, 208 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGameSaveBlobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGameSaveBlobInfo_Interface
      ; items : Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGameSaveBlobInfo : aliased constant Windows.IID := (2863617115, 62953, 23974, (175, 112, 157, 144, 76, 122, 77, 55 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGameSaveBlobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IIterator_IGameSaveBlobInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGameSaveBlobInfo : aliased constant Windows.IID := (2814662359, 64159, 21359, (142, 210, 69, 149, 69, 129, 30, 212 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGameSaveBlobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGameSaveBlobInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGameSaveBlobInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGameSaveBlobInfo_Interface
      ; value : Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGameSaveBlobInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGameSaveBlobInfo : aliased constant Windows.IID := (3116656288, 10815, 24360, (161, 193, 156, 177, 146, 246, 199, 134 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGameSaveOperationResult : aliased constant Windows.IID := (3998475855, 21273, 22269, (162, 138, 44, 71, 79, 196, 46, 72 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGameSaveProviderGetResult : aliased constant Windows.IID := (1981240461, 36448, 20683, (161, 30, 18, 15, 162, 8, 46, 91 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobGetResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGameSaveBlobGetResult : aliased constant Windows.IID := (2643863596, 46763, 23763, (153, 27, 163, 88, 197, 49, 188, 182 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveContainerInfoGetResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveContainerInfoGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult : aliased constant Windows.IID := (100166272, 48731, 24190, (185, 119, 130, 87, 197, 228, 138, 204 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobInfoGetResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobInfoGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult : aliased constant Windows.IID := (2469520698, 42004, 20967, (191, 188, 119, 132, 223, 131, 220, 142 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GameSaveContainer is Windows.Gaming.XboxLive.Storage.IGameSaveContainer;
   subtype GameSaveOperationResult is Windows.Gaming.XboxLive.Storage.IGameSaveOperationResult;
   subtype GameSaveContainerInfoQuery is Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfoQuery;
   subtype GameSaveProviderGetResult is Windows.Gaming.XboxLive.Storage.IGameSaveProviderGetResult;
   subtype GameSaveProvider is Windows.Gaming.XboxLive.Storage.IGameSaveProvider;
   subtype GameSaveBlobGetResult is Windows.Gaming.XboxLive.Storage.IGameSaveBlobGetResult;
   subtype GameSaveBlobInfoQuery is Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfoQuery;
   subtype GameSaveContainerInfo is Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfo;
   subtype GameSaveBlobInfo is Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfo;
   subtype GameSaveContainerInfoGetResult is Windows.Gaming.XboxLive.Storage.IGameSaveContainerInfoGetResult;
   subtype GameSaveBlobInfoGetResult is Windows.Gaming.XboxLive.Storage.IGameSaveBlobInfoGetResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForUserAsync
   (
      user : Windows.System.IUser
      ; serviceConfigId : Windows.String
   )
   return Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult;
   
   function GetSyncOnDemandForUserAsync
   (
      user : Windows.System.IUser
      ; serviceConfigId : Windows.String
   )
   return Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult;

end;
