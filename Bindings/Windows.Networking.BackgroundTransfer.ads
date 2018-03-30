--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Security.Credentials;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage;
with Windows; use Windows;
limited with Windows.Storage.Streams;
limited with Windows.Web;
limited with Windows.UI.Notifications;
limited with Windows.ApplicationModel.Background;
--------------------------------------------------------------------------------
package Windows.Networking.BackgroundTransfer is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BackgroundTransferStatus is (
      Idle,
      Running,
      PausedByApplication,
      PausedCostedNetwork,
      PausedNoNetwork,
      Completed,
      Canceled,
      Error,
      PausedRecoverableWebErrorStatus,
      PausedSystemPolicy
   );
   for BackgroundTransferStatus use (
      Idle => 0,
      Running => 1,
      PausedByApplication => 2,
      PausedCostedNetwork => 3,
      PausedNoNetwork => 4,
      Completed => 5,
      Canceled => 6,
      Error => 7,
      PausedRecoverableWebErrorStatus => 8,
      PausedSystemPolicy => 32
   );
   for BackgroundTransferStatus'Size use 32;
   
   type BackgroundTransferStatus_Ptr is access BackgroundTransferStatus;
   
   type BackgroundTransferCostPolicy is (
      Default,
      UnrestrictedOnly,
      Always
   );
   for BackgroundTransferCostPolicy use (
      Default => 0,
      UnrestrictedOnly => 1,
      Always => 2
   );
   for BackgroundTransferCostPolicy'Size use 32;
   
   type BackgroundTransferCostPolicy_Ptr is access BackgroundTransferCostPolicy;
   
   type BackgroundTransferPriority is (
      Default,
      High
   );
   for BackgroundTransferPriority use (
      Default => 0,
      High => 1
   );
   for BackgroundTransferPriority'Size use 32;
   
   type BackgroundTransferPriority_Ptr is access BackgroundTransferPriority;
   
   type BackgroundTransferBehavior is (
      Parallel,
      Serialized
   );
   for BackgroundTransferBehavior use (
      Parallel => 0,
      Serialized => 1
   );
   for BackgroundTransferBehavior'Size use 32;
   
   type BackgroundTransferBehavior_Ptr is access BackgroundTransferBehavior;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type BackgroundDownloadProgress is record
      BytesReceived : Windows.UInt64;
      TotalBytesToReceive : Windows.UInt64;
      Status : Windows.Networking.BackgroundTransfer.BackgroundTransferStatus;
      HasResponseChanged : Windows.Boolean;
      HasRestarted : Windows.Boolean;
   end record;
   pragma Convention (C_Pass_By_Copy , BackgroundDownloadProgress);
   
   type BackgroundDownloadProgress_Ptr is access BackgroundDownloadProgress;
   
   type BackgroundUploadProgress is record
      BytesReceived : Windows.UInt64;
      BytesSent : Windows.UInt64;
      TotalBytesToReceive : Windows.UInt64;
      TotalBytesToSend : Windows.UInt64;
      Status : Windows.Networking.BackgroundTransfer.BackgroundTransferStatus;
      HasResponseChanged : Windows.Boolean;
      HasRestarted : Windows.Boolean;
   end record;
   pragma Convention (C_Pass_By_Copy , BackgroundUploadProgress);
   
   type BackgroundUploadProgress_Ptr is access BackgroundUploadProgress;
   
   type BackgroundTransferFileRange is record
      Offset : Windows.UInt64;
      Length : Windows.UInt64;
   end record;
   pragma Convention (C_Pass_By_Copy , BackgroundTransferFileRange);
   
   type BackgroundTransferFileRange_Ptr is access BackgroundTransferFileRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface;
   type AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult is access all AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface'Class;
   type AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Ptr is access all AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult;
   type AsyncOperationCompletedHandler_IDownloadOperation_Interface;
   type AsyncOperationCompletedHandler_IDownloadOperation is access all AsyncOperationCompletedHandler_IDownloadOperation_Interface'Class;
   type AsyncOperationCompletedHandler_IDownloadOperation_Ptr is access all AsyncOperationCompletedHandler_IDownloadOperation;
   type AsyncOperationCompletedHandler_IUploadOperation_Interface;
   type AsyncOperationCompletedHandler_IUploadOperation is access all AsyncOperationCompletedHandler_IUploadOperation_Interface'Class;
   type AsyncOperationCompletedHandler_IUploadOperation_Ptr is access all AsyncOperationCompletedHandler_IUploadOperation;
   type TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface;
   type TypedEventHandler_IDownloadOperation3_add_RangesDownloaded is access all TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface'Class;
   type TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Ptr is access all TypedEventHandler_IDownloadOperation3_add_RangesDownloaded;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBackgroundTransferBase_Interface;
   type IBackgroundTransferBase is access all IBackgroundTransferBase_Interface'Class;
   type IBackgroundTransferBase_Ptr is access all IBackgroundTransferBase;
   type IUnconstrainedTransferRequestResult_Interface;
   type IUnconstrainedTransferRequestResult is access all IUnconstrainedTransferRequestResult_Interface'Class;
   type IUnconstrainedTransferRequestResult_Ptr is access all IUnconstrainedTransferRequestResult;
   type IBackgroundDownloaderUserConsent_Interface;
   type IBackgroundDownloaderUserConsent is access all IBackgroundDownloaderUserConsent_Interface'Class;
   type IBackgroundDownloaderUserConsent_Ptr is access all IBackgroundDownloaderUserConsent;
   type IBackgroundUploaderUserConsent_Interface;
   type IBackgroundUploaderUserConsent is access all IBackgroundUploaderUserConsent_Interface'Class;
   type IBackgroundUploaderUserConsent_Ptr is access all IBackgroundUploaderUserConsent;
   type IBackgroundDownloader_Interface;
   type IBackgroundDownloader is access all IBackgroundDownloader_Interface'Class;
   type IBackgroundDownloader_Ptr is access all IBackgroundDownloader;
   type IBackgroundDownloader2_Interface;
   type IBackgroundDownloader2 is access all IBackgroundDownloader2_Interface'Class;
   type IBackgroundDownloader2_Ptr is access all IBackgroundDownloader2;
   type IBackgroundDownloader3_Interface;
   type IBackgroundDownloader3 is access all IBackgroundDownloader3_Interface'Class;
   type IBackgroundDownloader3_Ptr is access all IBackgroundDownloader3;
   type IBackgroundUploader_Interface;
   type IBackgroundUploader is access all IBackgroundUploader_Interface'Class;
   type IBackgroundUploader_Ptr is access all IBackgroundUploader;
   type IBackgroundUploader2_Interface;
   type IBackgroundUploader2 is access all IBackgroundUploader2_Interface'Class;
   type IBackgroundUploader2_Ptr is access all IBackgroundUploader2;
   type IBackgroundUploader3_Interface;
   type IBackgroundUploader3 is access all IBackgroundUploader3_Interface'Class;
   type IBackgroundUploader3_Ptr is access all IBackgroundUploader3;
   type IBackgroundTransferOperation_Interface;
   type IBackgroundTransferOperation is access all IBackgroundTransferOperation_Interface'Class;
   type IBackgroundTransferOperation_Ptr is access all IBackgroundTransferOperation;
   type IBackgroundTransferOperationPriority_Interface;
   type IBackgroundTransferOperationPriority is access all IBackgroundTransferOperationPriority_Interface'Class;
   type IBackgroundTransferOperationPriority_Ptr is access all IBackgroundTransferOperationPriority;
   type IDownloadOperation_Interface;
   type IDownloadOperation is access all IDownloadOperation_Interface'Class;
   type IDownloadOperation_Ptr is access all IDownloadOperation;
   type IDownloadOperation2_Interface;
   type IDownloadOperation2 is access all IDownloadOperation2_Interface'Class;
   type IDownloadOperation2_Ptr is access all IDownloadOperation2;
   type IBackgroundTransferRangesDownloadedEventArgs_Interface;
   type IBackgroundTransferRangesDownloadedEventArgs is access all IBackgroundTransferRangesDownloadedEventArgs_Interface'Class;
   type IBackgroundTransferRangesDownloadedEventArgs_Ptr is access all IBackgroundTransferRangesDownloadedEventArgs;
   type IDownloadOperation3_Interface;
   type IDownloadOperation3 is access all IDownloadOperation3_Interface'Class;
   type IDownloadOperation3_Ptr is access all IDownloadOperation3;
   type IUploadOperation_Interface;
   type IUploadOperation is access all IUploadOperation_Interface'Class;
   type IUploadOperation_Ptr is access all IUploadOperation;
   type IUploadOperation2_Interface;
   type IUploadOperation2 is access all IUploadOperation2_Interface'Class;
   type IUploadOperation2_Ptr is access all IUploadOperation2;
   type IBackgroundDownloaderFactory_Interface;
   type IBackgroundDownloaderFactory is access all IBackgroundDownloaderFactory_Interface'Class;
   type IBackgroundDownloaderFactory_Ptr is access all IBackgroundDownloaderFactory;
   type IBackgroundDownloaderStaticMethods_Interface;
   type IBackgroundDownloaderStaticMethods is access all IBackgroundDownloaderStaticMethods_Interface'Class;
   type IBackgroundDownloaderStaticMethods_Ptr is access all IBackgroundDownloaderStaticMethods;
   type IBackgroundDownloaderStaticMethods2_Interface;
   type IBackgroundDownloaderStaticMethods2 is access all IBackgroundDownloaderStaticMethods2_Interface'Class;
   type IBackgroundDownloaderStaticMethods2_Ptr is access all IBackgroundDownloaderStaticMethods2;
   type IBackgroundUploaderFactory_Interface;
   type IBackgroundUploaderFactory is access all IBackgroundUploaderFactory_Interface'Class;
   type IBackgroundUploaderFactory_Ptr is access all IBackgroundUploaderFactory;
   type IBackgroundUploaderStaticMethods_Interface;
   type IBackgroundUploaderStaticMethods is access all IBackgroundUploaderStaticMethods_Interface'Class;
   type IBackgroundUploaderStaticMethods_Ptr is access all IBackgroundUploaderStaticMethods;
   type IBackgroundUploaderStaticMethods2_Interface;
   type IBackgroundUploaderStaticMethods2 is access all IBackgroundUploaderStaticMethods2_Interface'Class;
   type IBackgroundUploaderStaticMethods2_Ptr is access all IBackgroundUploaderStaticMethods2;
   type IResponseInformation_Interface;
   type IResponseInformation is access all IResponseInformation_Interface'Class;
   type IResponseInformation_Ptr is access all IResponseInformation;
   type IBackgroundTransferErrorStaticMethods_Interface;
   type IBackgroundTransferErrorStaticMethods is access all IBackgroundTransferErrorStaticMethods_Interface'Class;
   type IBackgroundTransferErrorStaticMethods_Ptr is access all IBackgroundTransferErrorStaticMethods;
   type IBackgroundTransferContentPart_Interface;
   type IBackgroundTransferContentPart is access all IBackgroundTransferContentPart_Interface'Class;
   type IBackgroundTransferContentPart_Ptr is access all IBackgroundTransferContentPart;
   type IBackgroundTransferContentPartFactory_Interface;
   type IBackgroundTransferContentPartFactory is access all IBackgroundTransferContentPartFactory_Interface'Class;
   type IBackgroundTransferContentPartFactory_Ptr is access all IBackgroundTransferContentPartFactory;
   type IBackgroundTransferGroup_Interface;
   type IBackgroundTransferGroup is access all IBackgroundTransferGroup_Interface'Class;
   type IBackgroundTransferGroup_Ptr is access all IBackgroundTransferGroup;
   type IBackgroundTransferGroupStatics_Interface;
   type IBackgroundTransferGroupStatics is access all IBackgroundTransferGroupStatics_Interface'Class;
   type IBackgroundTransferGroupStatics_Ptr is access all IBackgroundTransferGroupStatics;
   type IContentPrefetcherTime_Interface;
   type IContentPrefetcherTime is access all IContentPrefetcherTime_Interface'Class;
   type IContentPrefetcherTime_Ptr is access all IContentPrefetcherTime;
   type IContentPrefetcher_Interface;
   type IContentPrefetcher is access all IContentPrefetcher_Interface'Class;
   type IContentPrefetcher_Ptr is access all IContentPrefetcher;
   type IBackgroundTransferCompletionGroup_Interface;
   type IBackgroundTransferCompletionGroup is access all IBackgroundTransferCompletionGroup_Interface'Class;
   type IBackgroundTransferCompletionGroup_Ptr is access all IBackgroundTransferCompletionGroup;
   type IBackgroundTransferCompletionGroupTriggerDetails_Interface;
   type IBackgroundTransferCompletionGroupTriggerDetails is access all IBackgroundTransferCompletionGroupTriggerDetails_Interface'Class;
   type IBackgroundTransferCompletionGroupTriggerDetails_Ptr is access all IBackgroundTransferCompletionGroupTriggerDetails;
   type IAsyncOperation_IUnconstrainedTransferRequestResult_Interface;
   type IAsyncOperation_IUnconstrainedTransferRequestResult is access all IAsyncOperation_IUnconstrainedTransferRequestResult_Interface'Class;
   type IAsyncOperation_IUnconstrainedTransferRequestResult_Ptr is access all IAsyncOperation_IUnconstrainedTransferRequestResult;
   type IIterator_IDownloadOperation_Interface;
   type IIterator_IDownloadOperation is access all IIterator_IDownloadOperation_Interface'Class;
   type IIterator_IDownloadOperation_Ptr is access all IIterator_IDownloadOperation;
   type IIterable_IDownloadOperation_Interface;
   type IIterable_IDownloadOperation is access all IIterable_IDownloadOperation_Interface'Class;
   type IIterable_IDownloadOperation_Ptr is access all IIterable_IDownloadOperation;
   type IIterator_IUploadOperation_Interface;
   type IIterator_IUploadOperation is access all IIterator_IUploadOperation_Interface'Class;
   type IIterator_IUploadOperation_Ptr is access all IIterator_IUploadOperation;
   type IIterable_IUploadOperation_Interface;
   type IIterable_IUploadOperation is access all IIterable_IUploadOperation_Interface'Class;
   type IIterable_IUploadOperation_Ptr is access all IIterable_IUploadOperation;
   type IAsyncOperation_IDownloadOperation_Interface;
   type IAsyncOperation_IDownloadOperation is access all IAsyncOperation_IDownloadOperation_Interface'Class;
   type IAsyncOperation_IDownloadOperation_Ptr is access all IAsyncOperation_IDownloadOperation;
   type IAsyncOperation_IUploadOperation_Interface;
   type IAsyncOperation_IUploadOperation is access all IAsyncOperation_IUploadOperation_Interface'Class;
   type IAsyncOperation_IUploadOperation_Ptr is access all IAsyncOperation_IUploadOperation;
   type IIterator_IBackgroundTransferContentPart_Interface;
   type IIterator_IBackgroundTransferContentPart is access all IIterator_IBackgroundTransferContentPart_Interface'Class;
   type IIterator_IBackgroundTransferContentPart_Ptr is access all IIterator_IBackgroundTransferContentPart;
   type IIterable_IBackgroundTransferContentPart_Interface;
   type IIterable_IBackgroundTransferContentPart is access all IIterable_IBackgroundTransferContentPart_Interface'Class;
   type IIterable_IBackgroundTransferContentPart_Ptr is access all IIterable_IBackgroundTransferContentPart;
   type IIterator_BackgroundTransferFileRange_Interface;
   type IIterator_BackgroundTransferFileRange is access all IIterator_BackgroundTransferFileRange_Interface'Class;
   type IIterator_BackgroundTransferFileRange_Ptr is access all IIterator_BackgroundTransferFileRange;
   type IIterable_BackgroundTransferFileRange_Interface;
   type IIterable_BackgroundTransferFileRange is access all IIterable_BackgroundTransferFileRange_Interface'Class;
   type IIterable_BackgroundTransferFileRange_Ptr is access all IIterable_BackgroundTransferFileRange;
   type IVectorView_BackgroundTransferFileRange_Interface;
   type IVectorView_BackgroundTransferFileRange is access all IVectorView_BackgroundTransferFileRange_Interface'Class;
   type IVectorView_BackgroundTransferFileRange_Ptr is access all IVectorView_BackgroundTransferFileRange;
   type IVector_BackgroundTransferFileRange_Interface;
   type IVector_BackgroundTransferFileRange is access all IVector_BackgroundTransferFileRange_Interface'Class;
   type IVector_BackgroundTransferFileRange_Ptr is access all IVector_BackgroundTransferFileRange;
   type IVectorView_IDownloadOperation_Interface;
   type IVectorView_IDownloadOperation is access all IVectorView_IDownloadOperation_Interface'Class;
   type IVectorView_IDownloadOperation_Ptr is access all IVectorView_IDownloadOperation;
   type IVectorView_IUploadOperation_Interface;
   type IVectorView_IUploadOperation is access all IVectorView_IUploadOperation_Interface'Class;
   type IVectorView_IUploadOperation_Ptr is access all IVectorView_IUploadOperation;
   
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
   type IBackgroundTransferBase_Interface is interface and Windows.IInspectable_Interface;
   
   function SetRequestHeader
   (
      This       : access IBackgroundTransferBase_Interface
      ; headerName : Windows.String
      ; headerValue : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCredential
   (
      This       : access IBackgroundTransferBase_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerCredential
   (
      This       : access IBackgroundTransferBase_Interface
      ; credential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyCredential
   (
      This       : access IBackgroundTransferBase_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyCredential
   (
      This       : access IBackgroundTransferBase_Interface
      ; credential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_Method
   (
      This       : access IBackgroundTransferBase_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Method
   (
      This       : access IBackgroundTransferBase_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Group
   (
      This       : access IBackgroundTransferBase_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Group
   (
      This       : access IBackgroundTransferBase_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CostPolicy
   (
      This       : access IBackgroundTransferBase_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferCostPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_CostPolicy
   (
      This       : access IBackgroundTransferBase_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferCostPolicy
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferBase : aliased constant Windows.IID := (714973776, 51049, 17804, (175, 232, 254, 184, 212, 211, 178, 239 ));
   
   ------------------------------------------------------------------------
   type IUnconstrainedTransferRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsUnconstrained
   (
      This       : access IUnconstrainedTransferRequestResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IUnconstrainedTransferRequestResult : aliased constant Windows.IID := (1277474847, 55620, 16658, (169, 142, 106, 105, 82, 43, 126, 187 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloaderUserConsent_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestUnconstrainedDownloadsAsync
   (
      This       : access IBackgroundDownloaderUserConsent_Interface
      ; operations : Windows.Networking.BackgroundTransfer.IIterable_IDownloadOperation
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloaderUserConsent : aliased constant Windows.IID := (1561651462, 37478, 18440, (189, 113, 89, 37, 242, 163, 19, 10 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploaderUserConsent_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestUnconstrainedUploadsAsync
   (
      This       : access IBackgroundUploaderUserConsent_Interface
      ; operations : Windows.Networking.BackgroundTransfer.IIterable_IUploadOperation
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploaderUserConsent : aliased constant Windows.IID := (1001620683, 1888, 17949, (144, 127, 81, 56, 248, 77, 68, 193 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloader_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDownload
   (
      This       : access IBackgroundDownloader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; resultFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Networking.BackgroundTransfer.IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function CreateDownloadFromFile
   (
      This       : access IBackgroundDownloader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; resultFile : Windows.Storage.IStorageFile
      ; requestBodyFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Networking.BackgroundTransfer.IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function CreateDownloadAsync
   (
      This       : access IBackgroundDownloader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; resultFile : Windows.Storage.IStorageFile
      ; requestBodyStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IDownloadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloader : aliased constant Windows.IID := (3251082035, 26185, 19229, (168, 38, 164, 179, 221, 35, 77, 11 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloader2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransferGroup
   (
      This       : access IBackgroundDownloader2_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   function put_TransferGroup
   (
      This       : access IBackgroundDownloader2_Interface
      ; value : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_SuccessToastNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_SuccessToastNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; value : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_FailureToastNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_FailureToastNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; value : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_SuccessTileNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_SuccessTileNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; value : Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_FailureTileNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_FailureTileNotification
   (
      This       : access IBackgroundDownloader2_Interface
      ; value : Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloader2 : aliased constant Windows.IID := (2840221767, 13453, 18997, (137, 14, 138, 30, 243, 121, 132, 121 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloader3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompletionGroup
   (
      This       : access IBackgroundDownloader3_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloader3 : aliased constant Windows.IID := (3508177992, 34536, 18658, (182, 21, 105, 118, 170, 191, 134, 29 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploader_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateUpload
   (
      This       : access IBackgroundUploader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; sourceFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Networking.BackgroundTransfer.IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   function CreateUploadFromStreamAsync
   (
      This       : access IBackgroundUploader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; sourceStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateUploadWithFormDataAndAutoBoundaryAsync
   (
      This       : access IBackgroundUploader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; parts : Windows.Networking.BackgroundTransfer.IIterable_IBackgroundTransferContentPart
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateUploadWithSubTypeAsync
   (
      This       : access IBackgroundUploader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; parts : Windows.Networking.BackgroundTransfer.IIterable_IBackgroundTransferContentPart
      ; subType_x : Windows.String
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateUploadWithSubTypeAndBoundaryAsync
   (
      This       : access IBackgroundUploader_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; parts : Windows.Networking.BackgroundTransfer.IIterable_IBackgroundTransferContentPart
      ; subType_x : Windows.String
      ; boundary : Windows.String
      ; RetVal : access Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploader : aliased constant Windows.IID := (3314928046, 52909, 18011, (136, 1, 197, 90, 201, 10, 1, 206 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploader2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransferGroup
   (
      This       : access IBackgroundUploader2_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   function put_TransferGroup
   (
      This       : access IBackgroundUploader2_Interface
      ; value : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_SuccessToastNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_SuccessToastNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; value : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_FailureToastNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_FailureToastNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; value : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_SuccessTileNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_SuccessTileNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; value : Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_FailureTileNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function put_FailureTileNotification
   (
      This       : access IBackgroundUploader2_Interface
      ; value : Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploader2 : aliased constant Windows.IID := (2382762702, 3124, 17507, (128, 127, 25, 138, 27, 139, 212, 173 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploader3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompletionGroup
   (
      This       : access IBackgroundUploader3_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploader3 : aliased constant Windows.IID := (3109983289, 23536, 19258, (140, 71, 44, 97, 153, 168, 84, 185 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Guid
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedUri
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Method
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Group
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CostPolicy
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferCostPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_CostPolicy
   (
      This       : access IBackgroundTransferOperation_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferCostPolicy
   )
   return Windows.HRESULT is abstract;
   
   function GetResultStreamAt
   (
      This       : access IBackgroundTransferOperation_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetResponseInformation
   (
      This       : access IBackgroundTransferOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IResponseInformation
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferOperation : aliased constant Windows.IID := (3738200134, 37066, 17659, (143, 177, 18, 65, 84, 192, 213, 57 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferOperationPriority_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Priority
   (
      This       : access IBackgroundTransferOperationPriority_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferPriority
   )
   return Windows.HRESULT is abstract;
   
   function put_Priority
   (
      This       : access IBackgroundTransferOperationPriority_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferPriority
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferOperationPriority : aliased constant Windows.IID := (75842343, 21076, 19258, (145, 94, 10, 164, 146, 117, 192, 249 ));
   
   ------------------------------------------------------------------------
   type IDownloadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResultFile
   (
      This       : access IDownloadOperation_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IDownloadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundDownloadProgress
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IDownloadOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AttachAsync
   (
      This       : access IDownloadOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IDownloadOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access IDownloadOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IDownloadOperation : aliased constant Windows.IID := (3179801520, 22292, 19977, (186, 104, 190, 247, 57, 3, 176, 215 ));
   
   ------------------------------------------------------------------------
   type IDownloadOperation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransferGroup
   (
      This       : access IDownloadOperation2_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IDownloadOperation2 : aliased constant Windows.IID := (2748116288, 36764, 17235, (156, 212, 41, 13, 238, 56, 124, 56 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferRangesDownloadedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WasDownloadRestarted
   (
      This       : access IBackgroundTransferRangesDownloadedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AddedRanges
   (
      This       : access IBackgroundTransferRangesDownloadedEventArgs_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IVector_BackgroundTransferFileRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBackgroundTransferRangesDownloadedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferRangesDownloadedEventArgs : aliased constant Windows.IID := (1052537939, 48968, 19080, (146, 72, 176, 193, 101, 24, 79, 92 ));
   
   ------------------------------------------------------------------------
   type IDownloadOperation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsRandomAccessRequired
   (
      This       : access IDownloadOperation3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRandomAccessRequired
   (
      This       : access IDownloadOperation3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetResultRandomAccessStreamReference
   (
      This       : access IDownloadOperation3_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function GetDownloadedRanges
   (
      This       : access IDownloadOperation3_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IVector_BackgroundTransferFileRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_RangesDownloaded
   (
      This       : access IDownloadOperation3_Interface
      ; eventHandler : TypedEventHandler_IDownloadOperation3_add_RangesDownloaded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RangesDownloaded
   (
      This       : access IDownloadOperation3_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestedUri
   (
      This       : access IDownloadOperation3_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_RecoverableWebErrorStatuses
   (
      This       : access IDownloadOperation3_Interface
      ; RetVal : access Windows.Web.IVector_WebErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentWebErrorStatus
   (
      This       : access IDownloadOperation3_Interface
      ; RetVal : access Windows.Web.IReference_WebErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDownloadOperation3 : aliased constant Windows.IID := (1344746780, 32094, 19164, (184, 211, 223, 92, 96, 49, 185, 204 ));
   
   ------------------------------------------------------------------------
   type IUploadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceFile
   (
      This       : access IUploadOperation_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IUploadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundUploadProgress
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IUploadOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AttachAsync
   (
      This       : access IUploadOperation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUploadOperation : aliased constant Windows.IID := (1045832928, 29577, 17228, (139, 53, 66, 127, 211, 107, 189, 174 ));
   
   ------------------------------------------------------------------------
   type IUploadOperation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransferGroup
   (
      This       : access IUploadOperation2_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IUploadOperation2 : aliased constant Windows.IID := (1432455666, 10100, 19958, (159, 165, 32, 159, 43, 251, 18, 247 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithCompletionGroup
   (
      This       : access IBackgroundDownloaderFactory_Interface
      ; completionGroup : Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundDownloader
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloaderFactory : aliased constant Windows.IID := (646147108, 55454, 18164, (162, 154, 79, 77, 79, 20, 65, 85 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloaderStaticMethods_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentDownloadsAsync
   (
      This       : access IBackgroundDownloaderStaticMethods_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentDownloadsForGroupAsync
   (
      This       : access IBackgroundDownloaderStaticMethods_Interface
      ; group : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloaderStaticMethods : aliased constant Windows.IID := (1386633781, 50766, 17004, (153, 25, 84, 13, 13, 33, 166, 80 ));
   
   ------------------------------------------------------------------------
   type IBackgroundDownloaderStaticMethods2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentDownloadsForTransferGroupAsync
   (
      This       : access IBackgroundDownloaderStaticMethods2_Interface
      ; group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundDownloaderStaticMethods2 : aliased constant Windows.IID := (799675175, 6868, 19621, (178, 205, 8, 219, 240, 116, 106, 254 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithCompletionGroup
   (
      This       : access IBackgroundUploaderFactory_Interface
      ; completionGroup : Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundUploader
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploaderFactory : aliased constant Windows.IID := (1935803335, 4327, 18592, (172, 60, 26, 199, 16, 149, 236, 87 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploaderStaticMethods_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentUploadsAsync
   (
      This       : access IBackgroundUploaderStaticMethods_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentUploadsForGroupAsync
   (
      This       : access IBackgroundUploaderStaticMethods_Interface
      ; group : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploaderStaticMethods : aliased constant Windows.IID := (4068957435, 39685, 18241, (145, 33, 116, 10, 131, 226, 71, 223 ));
   
   ------------------------------------------------------------------------
   type IBackgroundUploaderStaticMethods2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentUploadsForTransferGroupAsync
   (
      This       : access IBackgroundUploaderStaticMethods2_Interface
      ; group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundUploaderStaticMethods2 : aliased constant Windows.IID := (3910773858, 59912, 17136, (162, 172, 7, 228, 103, 84, 144, 128 ));
   
   ------------------------------------------------------------------------
   type IResponseInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsResumable
   (
      This       : access IResponseInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualUri
   (
      This       : access IResponseInformation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_StatusCode
   (
      This       : access IResponseInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Headers
   (
      This       : access IResponseInformation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IResponseInformation : aliased constant Windows.IID := (4173044242, 63251, 18322, (139, 104, 217, 210, 151, 249, 29, 46 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferErrorStaticMethods_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access IBackgroundTransferErrorStaticMethods_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferErrorStaticMethods : aliased constant Windows.IID := (2865969924, 4498, 19444, (139, 104, 57, 197, 173, 210, 68, 226 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferContentPart_Interface is interface and Windows.IInspectable_Interface;
   
   function SetHeader
   (
      This       : access IBackgroundTransferContentPart_Interface
      ; headerName : Windows.String
      ; headerValue : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetText
   (
      This       : access IBackgroundTransferContentPart_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetFile
   (
      This       : access IBackgroundTransferContentPart_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferContentPart : aliased constant Windows.IID := (3907081815, 55249, 20184, (131, 142, 103, 74, 194, 23, 172, 230 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferContentPartFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithName
   (
      This       : access IBackgroundTransferContentPartFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithNameAndFileName
   (
      This       : access IBackgroundTransferContentPartFactory_Interface
      ; name : Windows.String
      ; fileName : Windows.String
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferContentPartFactory : aliased constant Windows.IID := (2431621289, 31233, 18955, (159, 128, 160, 176, 187, 55, 15, 141 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IBackgroundTransferGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransferBehavior
   (
      This       : access IBackgroundTransferGroup_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_TransferBehavior
   (
      This       : access IBackgroundTransferGroup_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferBehavior
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferGroup : aliased constant Windows.IID := (3636716516, 25689, 17728, (133, 235, 170, 161, 200, 144, 54, 119 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateGroup
   (
      This       : access IBackgroundTransferGroupStatics_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferGroupStatics : aliased constant Windows.IID := (49041586, 32024, 18779, (170, 34, 50, 169, 125, 69, 211, 226 ));
   
   ------------------------------------------------------------------------
   type IContentPrefetcherTime_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LastSuccessfulPrefetchTime
   (
      This       : access IContentPrefetcherTime_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentPrefetcherTime : aliased constant Windows.IID := (3814849800, 4906, 20446, (167, 204, 252, 176, 230, 101, 35, 175 ));
   
   ------------------------------------------------------------------------
   type IContentPrefetcher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentUris
   (
      This       : access IContentPrefetcher_Interface
      ; RetVal : access Windows.Foundation.IVector_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IndirectContentUri
   (
      This       : access IContentPrefetcher_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_IndirectContentUri
   (
      This       : access IContentPrefetcher_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentPrefetcher : aliased constant Windows.IID := (2832660308, 32193, 19673, (136, 16, 42, 106, 169, 65, 126, 17 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferCompletionGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Trigger
   (
      This       : access IBackgroundTransferCompletionGroup_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IBackgroundTransferCompletionGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Enable
   (
      This       : access IBackgroundTransferCompletionGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferCompletionGroup : aliased constant Windows.IID := (764609061, 39019, 22349, (121, 80, 10, 221, 71, 245, 215, 6 ));
   
   ------------------------------------------------------------------------
   type IBackgroundTransferCompletionGroupTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Downloads
   (
      This       : access IBackgroundTransferCompletionGroupTriggerDetails_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IVectorView_IDownloadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Uploads
   (
      This       : access IBackgroundTransferCompletionGroupTriggerDetails_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IVectorView_IUploadOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundTransferCompletionGroupTriggerDetails : aliased constant Windows.IID := (2070667910, 28231, 20790, (127, 203, 250, 67, 137, 244, 111, 91 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IUnconstrainedTransferRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUnconstrainedTransferRequestResult_Interface
      ; handler : Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUnconstrainedTransferRequestResult_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUnconstrainedTransferRequestResult_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IUnconstrainedTransferRequestResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IUnconstrainedTransferRequestResult : aliased constant Windows.IID := (2833000964, 16196, 20550, (129, 130, 205, 14, 193, 71, 225, 125 ));
   
   ------------------------------------------------------------------------
   type IIterator_IDownloadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDownloadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDownloadOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDownloadOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDownloadOperation_Interface
      ; items : Windows.Networking.BackgroundTransfer.IDownloadOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IDownloadOperation : aliased constant Windows.IID := (716574805, 11530, 22987, (140, 189, 5, 111, 45, 127, 180, 84 ));
   
   ------------------------------------------------------------------------
   type IIterable_IDownloadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDownloadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IIterator_IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IDownloadOperation : aliased constant Windows.IID := (4143802827, 59111, 22229, (155, 230, 224, 220, 70, 131, 250, 128 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUploadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUploadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUploadOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUploadOperation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUploadOperation_Interface
      ; items : Windows.Networking.BackgroundTransfer.IUploadOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUploadOperation : aliased constant Windows.IID := (3400028467, 29655, 24470, (171, 45, 251, 180, 250, 0, 247, 21 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUploadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUploadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IIterator_IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUploadOperation : aliased constant Windows.IID := (2037876633, 14540, 23399, (156, 208, 4, 63, 196, 122, 158, 247 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IDownloadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDownloadOperation_Interface
      ; handler : Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDownloadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDownloadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IDownloadOperation : aliased constant Windows.IID := (1139751519, 52349, 22125, (169, 42, 76, 170, 118, 185, 42, 31 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IUploadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUploadOperation_Interface
      ; handler : Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUploadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.AsyncOperationCompletedHandler_IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUploadOperation_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IUploadOperation : aliased constant Windows.IID := (1143025313, 46372, 23278, (163, 32, 113, 153, 34, 83, 129, 209 ));
   
   ------------------------------------------------------------------------
   type IIterator_IBackgroundTransferContentPart_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBackgroundTransferContentPart_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBackgroundTransferContentPart_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBackgroundTransferContentPart_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBackgroundTransferContentPart_Interface
      ; items : Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IBackgroundTransferContentPart : aliased constant Windows.IID := (133940049, 30749, 21191, (149, 88, 164, 83, 229, 112, 63, 41 ));
   
   ------------------------------------------------------------------------
   type IIterable_IBackgroundTransferContentPart_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBackgroundTransferContentPart_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IIterator_IBackgroundTransferContentPart
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IBackgroundTransferContentPart : aliased constant Windows.IID := (3476042137, 56891, 23980, (167, 3, 108, 87, 216, 8, 33, 196 ));
   
   ------------------------------------------------------------------------
   type IIterator_BackgroundTransferFileRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_BackgroundTransferFileRange_Interface
      ; items : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_BackgroundTransferFileRange : aliased constant Windows.IID := (2807289720, 36027, 21066, (184, 196, 112, 197, 21, 164, 39, 130 ));
   
   ------------------------------------------------------------------------
   type IIterable_BackgroundTransferFileRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IIterator_BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_BackgroundTransferFileRange : aliased constant Windows.IID := (750965913, 38732, 20600, (137, 174, 45, 78, 225, 19, 151, 33 ));
   
   ------------------------------------------------------------------------
   type IVectorView_BackgroundTransferFileRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_BackgroundTransferFileRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_BackgroundTransferFileRange_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_BackgroundTransferFileRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_BackgroundTransferFileRange : aliased constant Windows.IID := (1541903179, 55804, 21514, (143, 254, 95, 185, 200, 140, 101, 88 ));
   
   ------------------------------------------------------------------------
   type IVector_BackgroundTransferFileRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; RetVal : access Windows.Networking.BackgroundTransfer.IVectorView_BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; value : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_BackgroundTransferFileRange_Interface
      ; items : Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_BackgroundTransferFileRange : aliased constant Windows.IID := (3342659312, 34122, 22855, (158, 124, 82, 126, 57, 21, 211, 53 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IDownloadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IDownloadOperation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.BackgroundTransfer.IDownloadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IDownloadOperation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IDownloadOperation_Interface
      ; value : Windows.Networking.BackgroundTransfer.IDownloadOperation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IDownloadOperation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.BackgroundTransfer.IDownloadOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IDownloadOperation : aliased constant Windows.IID := (4168980309, 10877, 23036, (188, 146, 180, 134, 54, 244, 217, 85 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUploadOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUploadOperation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.BackgroundTransfer.IUploadOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUploadOperation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUploadOperation_Interface
      ; value : Windows.Networking.BackgroundTransfer.IUploadOperation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUploadOperation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.BackgroundTransfer.IUploadOperation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUploadOperation : aliased constant Windows.IID := (2392249520, 61614, 20939, (183, 196, 2, 66, 81, 189, 22, 216 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult : aliased constant Windows.IID := (1330823144, 39694, 23330, (145, 107, 131, 68, 37, 180, 171, 151 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IDownloadOperation_Interface(Callback : access procedure (asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IDownloadOperation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IDownloadOperation_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDownloadOperation_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IDownloadOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IDownloadOperation : aliased constant Windows.IID := (715536471, 65455, 23798, (155, 44, 13, 197, 151, 182, 10, 96 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUploadOperation_Interface(Callback : access procedure (asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUploadOperation_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUploadOperation_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUploadOperation : aliased constant Windows.IID := (3939928088, 3128, 23774, (174, 193, 198, 167, 97, 135, 17, 247 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface(Callback : access procedure (sender : Windows.Networking.BackgroundTransfer.IDownloadOperation ; args : Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface
      ; sender : Windows.Networking.BackgroundTransfer.IDownloadOperation
      ; args : Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDownloadOperation3_add_RangesDownloaded : aliased constant Windows.IID := (2476871045, 48636, 20885, (144, 217, 140, 181, 108, 188, 179, 216 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DownloadOperation is Windows.Networking.BackgroundTransfer.IDownloadOperation;
   subtype UnconstrainedTransferRequestResult is Windows.Networking.BackgroundTransfer.IUnconstrainedTransferRequestResult;
   subtype UploadOperation is Windows.Networking.BackgroundTransfer.IUploadOperation;
   subtype BackgroundTransferGroup is Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup;
   subtype BackgroundTransferCompletionGroup is Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup;
   
   function CreateBackgroundTransferCompletionGroup return Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup;
   
   subtype BackgroundTransferContentPart is Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart;
   
   function CreateBackgroundTransferContentPart return Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart;
   
   subtype ResponseInformation is Windows.Networking.BackgroundTransfer.IResponseInformation;
   subtype BackgroundTransferRangesDownloadedEventArgs is Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs;
   subtype BackgroundDownloader is Windows.Networking.BackgroundTransfer.IBackgroundDownloader;
   
   function CreateBackgroundDownloader return Windows.Networking.BackgroundTransfer.IBackgroundDownloader;
   
   subtype BackgroundUploader is Windows.Networking.BackgroundTransfer.IBackgroundUploader;
   
   function CreateWithCompletionGroup
   (
      completionGroup : Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
   )
   return Windows.Networking.BackgroundTransfer.IBackgroundUploader;
   
   subtype BackgroundTransferCompletionGroupTriggerDetails is Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroupTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateGroup
   (
      name : Windows.String
   )
   return Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup;
   
   function GetCurrentDownloadsAsync
   return Windows.Address;
   
   function GetCurrentDownloadsForGroupAsync
   (
      group : Windows.String
   )
   return Windows.Address;
   
   function RequestUnconstrainedDownloadsAsync
   (
      operations : Windows.Networking.BackgroundTransfer.IIterable_IDownloadOperation
   )
   return Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult;
   
   function GetCurrentDownloadsForTransferGroupAsync
   (
      group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.Address;
   
   function GetCurrentUploadsAsync
   return Windows.Address;
   
   function GetCurrentUploadsForGroupAsync
   (
      group : Windows.String
   )
   return Windows.Address;
   
   function RequestUnconstrainedUploadsAsync
   (
      operations : Windows.Networking.BackgroundTransfer.IIterable_IUploadOperation
   )
   return Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult;
   
   function GetCurrentUploadsForTransferGroupAsync
   (
      group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.Address;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus;
   
   function get_ContentUris
   return Windows.Foundation.IVector_IUriRuntimeClass;
   
   procedure put_IndirectContentUri
   (
      value : Windows.Foundation.IUriRuntimeClass
   )
   ;
   
   function get_IndirectContentUri
   return Windows.Foundation.IUriRuntimeClass;
   
   function get_LastSuccessfulPrefetchTime
   return Windows.Foundation.IReference_DateTime;

end;
