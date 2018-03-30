--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows; use Windows;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Media.Core;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Media.Protection.PlayReady is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PlayReadyDecryptorSetup is (
      Uninitialized,
      OnDemand
   );
   for PlayReadyDecryptorSetup use (
      Uninitialized => 0,
      OnDemand => 1
   );
   for PlayReadyDecryptorSetup'Size use 32;
   
   type PlayReadyDecryptorSetup_Ptr is access PlayReadyDecryptorSetup;
   
   type PlayReadyEncryptionAlgorithm is (
      Unprotected,
      Aes128Ctr,
      Cocktail,
      Aes128Cbc,
      Unspecified,
      Uninitialized
   );
   for PlayReadyEncryptionAlgorithm use (
      Unprotected => 0,
      Aes128Ctr => 1,
      Cocktail => 4,
      Aes128Cbc => 5,
      Unspecified => 65535,
      Uninitialized => 2147483647
   );
   for PlayReadyEncryptionAlgorithm'Size use 32;
   
   type PlayReadyEncryptionAlgorithm_Ptr is access PlayReadyEncryptionAlgorithm;
   
   type PlayReadyHardwareDRMFeatures is (
      HardwareDRM,
      HEVC,
      Aes128Cbc
   );
   for PlayReadyHardwareDRMFeatures use (
      HardwareDRM => 1,
      HEVC => 2,
      Aes128Cbc => 3
   );
   for PlayReadyHardwareDRMFeatures'Size use 32;
   
   type PlayReadyHardwareDRMFeatures_Ptr is access PlayReadyHardwareDRMFeatures;
   
   type PlayReadyITADataFormat is (
      SerializedProperties,
      SerializedProperties_WithContentProtectionWrapper
   );
   for PlayReadyITADataFormat use (
      SerializedProperties => 0,
      SerializedProperties_WithContentProtectionWrapper => 1
   );
   for PlayReadyITADataFormat'Size use 32;
   
   type PlayReadyITADataFormat_Ptr is access PlayReadyITADataFormat;
   
   type NDCertificateType is (
      Unknown,
      PC,
      Device,
      Domain,
      Issuer,
      CrlSigner,
      Service,
      Silverlight,
      Application,
      Metering,
      KeyFileSigner,
      Server,
      LicenseSigner
   );
   for NDCertificateType use (
      Unknown => 0,
      PC => 1,
      Device => 2,
      Domain => 3,
      Issuer => 4,
      CrlSigner => 5,
      Service => 6,
      Silverlight => 7,
      Application => 8,
      Metering => 9,
      KeyFileSigner => 10,
      Server => 11,
      LicenseSigner => 12
   );
   for NDCertificateType'Size use 32;
   
   type NDCertificateType_Ptr is access NDCertificateType;
   
   type NDCertificatePlatformID is (
      Windows_x,
      OSX,
      WindowsOnARM,
      WindowsMobile7,
      iOSOnARM,
      XBoxOnPPC,
      WindowsPhone8OnARM,
      WindowsPhone8OnX86,
      XboxOne,
      AndroidOnARM,
      WindowsPhone81OnARM,
      WindowsPhone81OnX86
   );
   for NDCertificatePlatformID use (
      Windows_x => 0,
      OSX => 1,
      WindowsOnARM => 2,
      WindowsMobile7 => 5,
      iOSOnARM => 6,
      XBoxOnPPC => 7,
      WindowsPhone8OnARM => 8,
      WindowsPhone8OnX86 => 9,
      XboxOne => 10,
      AndroidOnARM => 11,
      WindowsPhone81OnARM => 12,
      WindowsPhone81OnX86 => 13
   );
   for NDCertificatePlatformID'Size use 32;
   
   type NDCertificatePlatformID_Ptr is access NDCertificatePlatformID;
   
   type NDCertificateFeature is (
      Transmitter,
      Receiver,
      SharedCertificate,
      SecureClock,
      AntiRollBackClock,
      CRLS,
      PlayReady3Features
   );
   for NDCertificateFeature use (
      Transmitter => 1,
      Receiver => 2,
      SharedCertificate => 3,
      SecureClock => 4,
      AntiRollBackClock => 5,
      CRLS => 9,
      PlayReady3Features => 13
   );
   for NDCertificateFeature'Size use 32;
   
   type NDCertificateFeature_Ptr is access NDCertificateFeature;
   
   type NDProximityDetectionType is (
      UDP,
      TCP,
      TransportAgnostic
   );
   for NDProximityDetectionType use (
      UDP => 1,
      TCP => 2,
      TransportAgnostic => 4
   );
   for NDProximityDetectionType'Size use 32;
   
   type NDProximityDetectionType_Ptr is access NDProximityDetectionType;
   
   type NDMediaStreamType is (
      Audio,
      Video
   );
   for NDMediaStreamType use (
      Audio => 1,
      Video => 2
   );
   for NDMediaStreamType'Size use 32;
   
   type NDMediaStreamType_Ptr is access NDMediaStreamType;
   
   type NDContentIDType is (
      KeyID,
      PlayReadyObject,
      Custom
   );
   for NDContentIDType use (
      KeyID => 1,
      PlayReadyObject => 2,
      Custom => 3
   );
   for NDContentIDType'Size use 32;
   
   type NDContentIDType_Ptr is access NDContentIDType;
   
   type NDClosedCaptionFormat is (
      ATSC,
      SCTE20,
      Unknown
   );
   for NDClosedCaptionFormat use (
      ATSC => 0,
      SCTE20 => 1,
      Unknown => 2
   );
   for NDClosedCaptionFormat'Size use 32;
   
   type NDClosedCaptionFormat_Ptr is access NDClosedCaptionFormat;
   
   type NDStartAsyncOptions is (
      MutualAuthentication,
      WaitForLicenseDescriptor
   );
   for NDStartAsyncOptions use (
      MutualAuthentication => 1,
      WaitForLicenseDescriptor => 2
   );
   for NDStartAsyncOptions'Size use 32;
   
   type NDStartAsyncOptions_Ptr is access NDStartAsyncOptions;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_INDSendResult_Interface;
   type AsyncOperationCompletedHandler_INDSendResult is access all AsyncOperationCompletedHandler_INDSendResult_Interface'Class;
   type AsyncOperationCompletedHandler_INDSendResult_Ptr is access all AsyncOperationCompletedHandler_INDSendResult;
   type TypedEventHandler_INDClient_add_RegistrationCompleted_Interface;
   type TypedEventHandler_INDClient_add_RegistrationCompleted is access all TypedEventHandler_INDClient_add_RegistrationCompleted_Interface'Class;
   type TypedEventHandler_INDClient_add_RegistrationCompleted_Ptr is access all TypedEventHandler_INDClient_add_RegistrationCompleted;
   type TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface;
   type TypedEventHandler_INDClient_add_ProximityDetectionCompleted is access all TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface'Class;
   type TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Ptr is access all TypedEventHandler_INDClient_add_ProximityDetectionCompleted;
   type TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface;
   type TypedEventHandler_INDClient_add_LicenseFetchCompleted is access all TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface'Class;
   type TypedEventHandler_INDClient_add_LicenseFetchCompleted_Ptr is access all TypedEventHandler_INDClient_add_LicenseFetchCompleted;
   type TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface;
   type TypedEventHandler_INDClient_add_ReRegistrationNeeded is access all TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface'Class;
   type TypedEventHandler_INDClient_add_ReRegistrationNeeded_Ptr is access all TypedEventHandler_INDClient_add_ReRegistrationNeeded;
   type TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface;
   type TypedEventHandler_INDClient_add_ClosedCaptionDataReceived is access all TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface'Class;
   type TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Ptr is access all TypedEventHandler_INDClient_add_ClosedCaptionDataReceived;
   type AsyncOperationCompletedHandler_INDStartResult_Interface;
   type AsyncOperationCompletedHandler_INDStartResult is access all AsyncOperationCompletedHandler_INDStartResult_Interface'Class;
   type AsyncOperationCompletedHandler_INDStartResult_Ptr is access all AsyncOperationCompletedHandler_INDStartResult;
   type AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface;
   type AsyncOperationCompletedHandler_INDLicenseFetchResult is access all AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface'Class;
   type AsyncOperationCompletedHandler_INDLicenseFetchResult_Ptr is access all AsyncOperationCompletedHandler_INDLicenseFetchResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPlayReadyContentHeader_Interface;
   type IPlayReadyContentHeader is access all IPlayReadyContentHeader_Interface'Class;
   type IPlayReadyContentHeader_Ptr is access all IPlayReadyContentHeader;
   type IPlayReadyContentHeaderFactory_Interface;
   type IPlayReadyContentHeaderFactory is access all IPlayReadyContentHeaderFactory_Interface'Class;
   type IPlayReadyContentHeaderFactory_Ptr is access all IPlayReadyContentHeaderFactory;
   type IPlayReadyContentHeader2_Interface;
   type IPlayReadyContentHeader2 is access all IPlayReadyContentHeader2_Interface'Class;
   type IPlayReadyContentHeader2_Ptr is access all IPlayReadyContentHeader2;
   type IPlayReadyContentHeaderFactory2_Interface;
   type IPlayReadyContentHeaderFactory2 is access all IPlayReadyContentHeaderFactory2_Interface'Class;
   type IPlayReadyContentHeaderFactory2_Ptr is access all IPlayReadyContentHeaderFactory2;
   type IPlayReadyContentResolver_Interface;
   type IPlayReadyContentResolver is access all IPlayReadyContentResolver_Interface'Class;
   type IPlayReadyContentResolver_Ptr is access all IPlayReadyContentResolver;
   type IIterable_IPlayReadyLicense_Interface;
   type IIterable_IPlayReadyLicense is access all IIterable_IPlayReadyLicense_Interface'Class;
   type IIterable_IPlayReadyLicense_Ptr is access all IIterable_IPlayReadyLicense;
   type IPlayReadyLicenseManagement_Interface;
   type IPlayReadyLicenseManagement is access all IPlayReadyLicenseManagement_Interface'Class;
   type IPlayReadyLicenseManagement_Ptr is access all IPlayReadyLicenseManagement;
   type IPlayReadyLicense_Interface;
   type IPlayReadyLicense is access all IPlayReadyLicense_Interface'Class;
   type IPlayReadyLicense_Ptr is access all IPlayReadyLicense;
   type IPlayReadyLicense2_Interface;
   type IPlayReadyLicense2 is access all IPlayReadyLicense2_Interface'Class;
   type IPlayReadyLicense2_Ptr is access all IPlayReadyLicense2;
   type IPlayReadyLicenseIterableFactory_Interface;
   type IPlayReadyLicenseIterableFactory is access all IPlayReadyLicenseIterableFactory_Interface'Class;
   type IPlayReadyLicenseIterableFactory_Ptr is access all IPlayReadyLicenseIterableFactory;
   type IIterator_IPlayReadyLicense_Interface;
   type IIterator_IPlayReadyLicense is access all IIterator_IPlayReadyLicense_Interface'Class;
   type IIterator_IPlayReadyLicense_Ptr is access all IIterator_IPlayReadyLicense;
   type IPlayReadyDomain_Interface;
   type IPlayReadyDomain is access all IPlayReadyDomain_Interface'Class;
   type IPlayReadyDomain_Ptr is access all IPlayReadyDomain;
   type IPlayReadyDomainIterableFactory_Interface;
   type IPlayReadyDomainIterableFactory is access all IPlayReadyDomainIterableFactory_Interface'Class;
   type IPlayReadyDomainIterableFactory_Ptr is access all IPlayReadyDomainIterableFactory;
   type IIterable_IPlayReadyDomain_Interface;
   type IIterable_IPlayReadyDomain is access all IIterable_IPlayReadyDomain_Interface'Class;
   type IIterable_IPlayReadyDomain_Ptr is access all IIterable_IPlayReadyDomain;
   type IIterator_IPlayReadyDomain_Interface;
   type IIterator_IPlayReadyDomain is access all IIterator_IPlayReadyDomain_Interface'Class;
   type IIterator_IPlayReadyDomain_Ptr is access all IIterator_IPlayReadyDomain;
   type IPlayReadyStatics_Interface;
   type IPlayReadyStatics is access all IPlayReadyStatics_Interface'Class;
   type IPlayReadyStatics_Ptr is access all IPlayReadyStatics;
   type IPlayReadyStatics2_Interface;
   type IPlayReadyStatics2 is access all IPlayReadyStatics2_Interface'Class;
   type IPlayReadyStatics2_Ptr is access all IPlayReadyStatics2;
   type IPlayReadyStatics3_Interface;
   type IPlayReadyStatics3 is access all IPlayReadyStatics3_Interface'Class;
   type IPlayReadyStatics3_Ptr is access all IPlayReadyStatics3;
   type IPlayReadyStatics4_Interface;
   type IPlayReadyStatics4 is access all IPlayReadyStatics4_Interface'Class;
   type IPlayReadyStatics4_Ptr is access all IPlayReadyStatics4;
   type IPlayReadySecureStopServiceRequestFactory_Interface;
   type IPlayReadySecureStopServiceRequestFactory is access all IPlayReadySecureStopServiceRequestFactory_Interface'Class;
   type IPlayReadySecureStopServiceRequestFactory_Ptr is access all IPlayReadySecureStopServiceRequestFactory;
   type IPlayReadySecureStopIterableFactory_Interface;
   type IPlayReadySecureStopIterableFactory is access all IPlayReadySecureStopIterableFactory_Interface'Class;
   type IPlayReadySecureStopIterableFactory_Ptr is access all IPlayReadySecureStopIterableFactory;
   type IIterable_IPlayReadySecureStopServiceRequest_Interface;
   type IIterable_IPlayReadySecureStopServiceRequest is access all IIterable_IPlayReadySecureStopServiceRequest_Interface'Class;
   type IIterable_IPlayReadySecureStopServiceRequest_Ptr is access all IIterable_IPlayReadySecureStopServiceRequest;
   type IIterator_IPlayReadySecureStopServiceRequest_Interface;
   type IIterator_IPlayReadySecureStopServiceRequest is access all IIterator_IPlayReadySecureStopServiceRequest_Interface'Class;
   type IIterator_IPlayReadySecureStopServiceRequest_Ptr is access all IIterator_IPlayReadySecureStopServiceRequest;
   type IPlayReadySoapMessage_Interface;
   type IPlayReadySoapMessage is access all IPlayReadySoapMessage_Interface'Class;
   type IPlayReadySoapMessage_Ptr is access all IPlayReadySoapMessage;
   type IPlayReadyITADataGenerator_Interface;
   type IPlayReadyITADataGenerator is access all IPlayReadyITADataGenerator_Interface'Class;
   type IPlayReadyITADataGenerator_Ptr is access all IPlayReadyITADataGenerator;
   type IPlayReadyLicenseSession_Interface;
   type IPlayReadyLicenseSession is access all IPlayReadyLicenseSession_Interface'Class;
   type IPlayReadyLicenseSession_Ptr is access all IPlayReadyLicenseSession;
   type IPlayReadyLicenseSession2_Interface;
   type IPlayReadyLicenseSession2 is access all IPlayReadyLicenseSession2_Interface'Class;
   type IPlayReadyLicenseSession2_Ptr is access all IPlayReadyLicenseSession2;
   type IPlayReadyLicenseSessionFactory_Interface;
   type IPlayReadyLicenseSessionFactory is access all IPlayReadyLicenseSessionFactory_Interface'Class;
   type IPlayReadyLicenseSessionFactory_Ptr is access all IPlayReadyLicenseSessionFactory;
   type INDDownloadEngine_Interface;
   type INDDownloadEngine is access all INDDownloadEngine_Interface'Class;
   type INDDownloadEngine_Ptr is access all INDDownloadEngine;
   type INDDownloadEngineNotifier_Interface;
   type INDDownloadEngineNotifier is access all INDDownloadEngineNotifier_Interface'Class;
   type INDDownloadEngineNotifier_Ptr is access all INDDownloadEngineNotifier;
   type INDLicenseFetchDescriptor_Interface;
   type INDLicenseFetchDescriptor is access all INDLicenseFetchDescriptor_Interface'Class;
   type INDLicenseFetchDescriptor_Ptr is access all INDLicenseFetchDescriptor;
   type INDCustomData_Interface;
   type INDCustomData is access all INDCustomData_Interface'Class;
   type INDCustomData_Ptr is access all INDCustomData;
   type INDStreamParser_Interface;
   type INDStreamParser is access all INDStreamParser_Interface'Class;
   type INDStreamParser_Ptr is access all INDStreamParser;
   type INDStreamParserNotifier_Interface;
   type INDStreamParserNotifier is access all INDStreamParserNotifier_Interface'Class;
   type INDStreamParserNotifier_Ptr is access all INDStreamParserNotifier;
   type INDSendResult_Interface;
   type INDSendResult is access all INDSendResult_Interface'Class;
   type INDSendResult_Ptr is access all INDSendResult;
   type INDMessenger_Interface;
   type INDMessenger is access all INDMessenger_Interface'Class;
   type INDMessenger_Ptr is access all INDMessenger;
   type INDTCPMessengerFactory_Interface;
   type INDTCPMessengerFactory is access all INDTCPMessengerFactory_Interface'Class;
   type INDTCPMessengerFactory_Ptr is access all INDTCPMessengerFactory;
   type INDTransmitterProperties_Interface;
   type INDTransmitterProperties is access all INDTransmitterProperties_Interface'Class;
   type INDTransmitterProperties_Ptr is access all INDTransmitterProperties;
   type INDStartResult_Interface;
   type INDStartResult is access all INDStartResult_Interface'Class;
   type INDStartResult_Ptr is access all INDStartResult;
   type INDLicenseFetchResult_Interface;
   type INDLicenseFetchResult is access all INDLicenseFetchResult_Interface'Class;
   type INDLicenseFetchResult_Ptr is access all INDLicenseFetchResult;
   type INDLicenseFetchDescriptorFactory_Interface;
   type INDLicenseFetchDescriptorFactory is access all INDLicenseFetchDescriptorFactory_Interface'Class;
   type INDLicenseFetchDescriptorFactory_Ptr is access all INDLicenseFetchDescriptorFactory;
   type INDRegistrationCompletedEventArgs_Interface;
   type INDRegistrationCompletedEventArgs is access all INDRegistrationCompletedEventArgs_Interface'Class;
   type INDRegistrationCompletedEventArgs_Ptr is access all INDRegistrationCompletedEventArgs;
   type INDCustomDataFactory_Interface;
   type INDCustomDataFactory is access all INDCustomDataFactory_Interface'Class;
   type INDCustomDataFactory_Ptr is access all INDCustomDataFactory;
   type INDProximityDetectionCompletedEventArgs_Interface;
   type INDProximityDetectionCompletedEventArgs is access all INDProximityDetectionCompletedEventArgs_Interface'Class;
   type INDProximityDetectionCompletedEventArgs_Ptr is access all INDProximityDetectionCompletedEventArgs;
   type INDLicenseFetchCompletedEventArgs_Interface;
   type INDLicenseFetchCompletedEventArgs is access all INDLicenseFetchCompletedEventArgs_Interface'Class;
   type INDLicenseFetchCompletedEventArgs_Ptr is access all INDLicenseFetchCompletedEventArgs;
   type INDClient_Interface;
   type INDClient is access all INDClient_Interface'Class;
   type INDClient_Ptr is access all INDClient;
   type INDClosedCaptionDataReceivedEventArgs_Interface;
   type INDClosedCaptionDataReceivedEventArgs is access all INDClosedCaptionDataReceivedEventArgs_Interface'Class;
   type INDClosedCaptionDataReceivedEventArgs_Ptr is access all INDClosedCaptionDataReceivedEventArgs;
   type INDClientFactory_Interface;
   type INDClientFactory is access all INDClientFactory_Interface'Class;
   type INDClientFactory_Ptr is access all INDClientFactory;
   type INDStorageFileHelper_Interface;
   type INDStorageFileHelper is access all INDStorageFileHelper_Interface'Class;
   type INDStorageFileHelper_Ptr is access all INDStorageFileHelper;
   type IPlayReadyServiceRequest_Interface;
   type IPlayReadyServiceRequest is access all IPlayReadyServiceRequest_Interface'Class;
   type IPlayReadyServiceRequest_Ptr is access all IPlayReadyServiceRequest;
   type IPlayReadyIndividualizationServiceRequest_Interface;
   type IPlayReadyIndividualizationServiceRequest is access all IPlayReadyIndividualizationServiceRequest_Interface'Class;
   type IPlayReadyIndividualizationServiceRequest_Ptr is access all IPlayReadyIndividualizationServiceRequest;
   type IPlayReadyDomainJoinServiceRequest_Interface;
   type IPlayReadyDomainJoinServiceRequest is access all IPlayReadyDomainJoinServiceRequest_Interface'Class;
   type IPlayReadyDomainJoinServiceRequest_Ptr is access all IPlayReadyDomainJoinServiceRequest;
   type IPlayReadyDomainLeaveServiceRequest_Interface;
   type IPlayReadyDomainLeaveServiceRequest is access all IPlayReadyDomainLeaveServiceRequest_Interface'Class;
   type IPlayReadyDomainLeaveServiceRequest_Ptr is access all IPlayReadyDomainLeaveServiceRequest;
   type IPlayReadyLicenseAcquisitionServiceRequest_Interface;
   type IPlayReadyLicenseAcquisitionServiceRequest is access all IPlayReadyLicenseAcquisitionServiceRequest_Interface'Class;
   type IPlayReadyLicenseAcquisitionServiceRequest_Ptr is access all IPlayReadyLicenseAcquisitionServiceRequest;
   type IPlayReadyLicenseAcquisitionServiceRequest2_Interface;
   type IPlayReadyLicenseAcquisitionServiceRequest2 is access all IPlayReadyLicenseAcquisitionServiceRequest2_Interface'Class;
   type IPlayReadyLicenseAcquisitionServiceRequest2_Ptr is access all IPlayReadyLicenseAcquisitionServiceRequest2;
   type IPlayReadyLicenseAcquisitionServiceRequest3_Interface;
   type IPlayReadyLicenseAcquisitionServiceRequest3 is access all IPlayReadyLicenseAcquisitionServiceRequest3_Interface'Class;
   type IPlayReadyLicenseAcquisitionServiceRequest3_Ptr is access all IPlayReadyLicenseAcquisitionServiceRequest3;
   type IPlayReadyMeteringReportServiceRequest_Interface;
   type IPlayReadyMeteringReportServiceRequest is access all IPlayReadyMeteringReportServiceRequest_Interface'Class;
   type IPlayReadyMeteringReportServiceRequest_Ptr is access all IPlayReadyMeteringReportServiceRequest;
   type IPlayReadyRevocationServiceRequest_Interface;
   type IPlayReadyRevocationServiceRequest is access all IPlayReadyRevocationServiceRequest_Interface'Class;
   type IPlayReadyRevocationServiceRequest_Ptr is access all IPlayReadyRevocationServiceRequest;
   type IPlayReadySecureStopServiceRequest_Interface;
   type IPlayReadySecureStopServiceRequest is access all IPlayReadySecureStopServiceRequest_Interface'Class;
   type IPlayReadySecureStopServiceRequest_Ptr is access all IPlayReadySecureStopServiceRequest;
   type IAsyncOperation_INDSendResult_Interface;
   type IAsyncOperation_INDSendResult is access all IAsyncOperation_INDSendResult_Interface'Class;
   type IAsyncOperation_INDSendResult_Ptr is access all IAsyncOperation_INDSendResult;
   type IAsyncOperation_INDStartResult_Interface;
   type IAsyncOperation_INDStartResult is access all IAsyncOperation_INDStartResult_Interface'Class;
   type IAsyncOperation_INDStartResult_Ptr is access all IAsyncOperation_INDStartResult;
   type IAsyncOperation_INDLicenseFetchResult_Interface;
   type IAsyncOperation_INDLicenseFetchResult is access all IAsyncOperation_INDLicenseFetchResult_Interface'Class;
   type IAsyncOperation_INDLicenseFetchResult_Ptr is access all IAsyncOperation_INDLicenseFetchResult;
   
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
   type IPlayReadyContentHeader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyId
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyIdString
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseAcquisitionUrl
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseAcquisitionUserInterfaceUrl
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainServiceId
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_EncryptionType
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomAttributes
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DecryptorSetup
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.PlayReadyDecryptorSetup
   )
   return Windows.HRESULT is abstract;
   
   function GetSerializedHeader
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderWithEmbeddedUpdates
   (
      This       : access IPlayReadyContentHeader_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyContentHeader : aliased constant Windows.IID := (2588117610, 32588, 17710, (136, 189, 1, 72, 198, 56, 122, 44 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyContentHeaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceFromWindowsMediaDrmHeader
   (
      This       : access IPlayReadyContentHeaderFactory_Interface
      ; headerBytes : Windows.UInt8_Ptr
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceFromComponents
   (
      This       : access IPlayReadyContentHeaderFactory_Interface
      ; contentKeyId : Windows.Guid
      ; contentKeyIdString : Windows.String
      ; contentEncryptionAlgorithm : Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceFromPlayReadyHeader
   (
      This       : access IPlayReadyContentHeaderFactory_Interface
      ; headerBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyContentHeaderFactory : aliased constant Windows.IID := (3415722239, 46936, 18294, (191, 1, 33, 122, 139, 81, 11, 44 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyContentHeader2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyIds
   (
      This       : access IPlayReadyContentHeader2_Interface
      ; RetVal : access Windows.Guid_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyIdStrings
   (
      This       : access IPlayReadyContentHeader2_Interface
      ; RetVal : access String_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyContentHeader2 : aliased constant Windows.IID := (899447284, 8576, 18828, (150, 91, 231, 84, 216, 117, 234, 178 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyContentHeaderFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceFromComponents2
   (
      This       : access IPlayReadyContentHeaderFactory2_Interface
      ; dwFlags : Windows.UInt32
      ; contentKeyIds : Windows.Guid_Ptr
      ; contentKeyIdStrings : Windows.String_Ptr
      ; contentEncryptionAlgorithm : Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyContentHeaderFactory2 : aliased constant Windows.IID := (3508772085, 44653, 18296, (151, 253, 110, 58, 46, 234, 219, 235 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyContentResolver_Interface is interface and Windows.IInspectable_Interface;
   
   function ServiceRequest
   (
      This       : access IPlayReadyContentResolver_Interface
      ; contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyContentResolver : aliased constant Windows.IID := (4227671331, 36973, 18818, (166, 184, 104, 73, 86, 90, 124, 232 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPlayReadyLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPlayReadyLicense_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyLicense
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPlayReadyLicense : aliased constant Windows.IID := (2670261943, 46570, 20595, (186, 61, 140, 178, 240, 114, 145, 161 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseManagement_Interface is interface and Windows.IInspectable_Interface;
   
   function DeleteLicenses
   (
      This       : access IPlayReadyLicenseManagement_Interface
      ; contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseManagement : aliased constant Windows.IID := (2867536193, 2391, 17413, (184, 146, 139, 243, 236, 93, 173, 217 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FullyEvaluated
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_UsableForPlay
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpireAfterFirstPlay
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainAccountID
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ChainDepth
   (
      This       : access IPlayReadyLicense_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetKIDAtChainDepth
   (
      This       : access IPlayReadyLicense_Interface
      ; chainDepth : Windows.UInt32
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicense : aliased constant Windows.IID := (3997649998, 64060, 16717, (169, 242, 63, 252, 30, 248, 50, 212 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicense2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SecureStopId
   (
      This       : access IPlayReadyLicense2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SecurityLevel
   (
      This       : access IPlayReadyLicense2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_InMemoryOnly
   (
      This       : access IPlayReadyLicense2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpiresInRealTime
   (
      This       : access IPlayReadyLicense2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicense2 : aliased constant Windows.IID := (821356455, 55523, 18592, (188, 218, 255, 159, 64, 83, 4, 54 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseIterableFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPlayReadyLicenseIterableFactory_Interface
      ; contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; fullyEvaluated : Windows.Boolean
      ; RetVal : access Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseIterableFactory : aliased constant Windows.IID := (3558317832, 2103, 18808, (142, 104, 190, 66, 147, 200, 215, 166 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPlayReadyLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPlayReadyLicense_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyLicense
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPlayReadyLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPlayReadyLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPlayReadyLicense_Interface
      ; items : Windows.Media.Protection.PlayReady.IPlayReadyLicense_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPlayReadyLicense : aliased constant Windows.IID := (1785528330, 52774, 21531, (161, 88, 132, 87, 64, 155, 38, 4 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyDomain_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccountId
   (
      This       : access IPlayReadyDomain_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceId
   (
      This       : access IPlayReadyDomain_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Revision
   (
      This       : access IPlayReadyDomain_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access IPlayReadyDomain_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainJoinUrl
   (
      This       : access IPlayReadyDomain_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyDomain : aliased constant Windows.IID := (2915865516, 38886, 17391, (149, 228, 215, 134, 143, 59, 22, 169 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyDomainIterableFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPlayReadyDomainIterableFactory_Interface
      ; domainAccountId : Windows.Guid
      ; RetVal : access Windows.Media.Protection.PlayReady.IIterable_IPlayReadyDomain
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyDomainIterableFactory : aliased constant Windows.IID := (1307804910, 12577, 19955, (165, 232, 208, 194, 76, 5, 0, 252 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPlayReadyDomain_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPlayReadyDomain_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyDomain
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPlayReadyDomain : aliased constant Windows.IID := (2229899142, 19438, 24385, (147, 161, 37, 88, 135, 18, 45, 159 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPlayReadyDomain_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPlayReadyDomain_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyDomain
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPlayReadyDomain_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPlayReadyDomain_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPlayReadyDomain_Interface
      ; items : Windows.Media.Protection.PlayReady.IPlayReadyDomain_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPlayReadyDomain : aliased constant Windows.IID := (1547036837, 19159, 24176, (190, 223, 145, 245, 213, 136, 141, 53 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DomainJoinServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainLeaveServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IndividualizationServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseAcquirerServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_MeteringReportServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RevocationServiceRequestType
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaProtectionSystemId
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PlayReadySecurityVersion
   (
      This       : access IPlayReadyStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyStatics : aliased constant Windows.IID := (1583988749, 9340, 18074, (143, 49, 92, 26, 21, 113, 217, 198 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlayReadyCertificateSecurityLevel
   (
      This       : access IPlayReadyStatics2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyStatics2 : aliased constant Windows.IID := (529361554, 24474, 16958, (148, 102, 179, 57, 105, 175, 122, 61 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SecureStopServiceRequestType
   (
      This       : access IPlayReadyStatics3_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function CheckSupportedHardware
   (
      This       : access IPlayReadyStatics3_Interface
      ; hwdrmFeature : Windows.Media.Protection.PlayReady.PlayReadyHardwareDRMFeatures
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyStatics3 : aliased constant Windows.IID := (1067663217, 11731, 19437, (174, 73, 247, 20, 142, 99, 231, 16 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputTrustAuthorityToCreate
   (
      This       : access IPlayReadyStatics4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionSystemId
   (
      This       : access IPlayReadyStatics4_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyStatics4 : aliased constant Windows.IID := (1353257728, 55332, 16945, (157, 94, 120, 239, 136, 68, 199, 215 ));
   
   ------------------------------------------------------------------------
   type IPlayReadySecureStopServiceRequestFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPlayReadySecureStopServiceRequestFactory_Interface
      ; publisherCertBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceFromSessionID
   (
      This       : access IPlayReadySecureStopServiceRequestFactory_Interface
      ; sessionID : Windows.Guid
      ; publisherCertBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadySecureStopServiceRequestFactory : aliased constant Windows.IID := (239373001, 59006, 18766, (159, 73, 98, 133, 67, 140, 118, 207 ));
   
   ------------------------------------------------------------------------
   type IPlayReadySecureStopIterableFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPlayReadySecureStopIterableFactory_Interface
      ; publisherCertBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IIterable_IPlayReadySecureStopServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadySecureStopIterableFactory : aliased constant Windows.IID := (1595867493, 16916, 19870, (129, 235, 232, 159, 157, 41, 74, 238 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPlayReadySecureStopServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPlayReadySecureStopServiceRequest : aliased constant Windows.IID := (2374681209, 45181, 21256, (156, 120, 28, 92, 153, 108, 160, 60 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPlayReadySecureStopServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPlayReadySecureStopServiceRequest_Interface
      ; items : Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPlayReadySecureStopServiceRequest : aliased constant Windows.IID := (2008039835, 16203, 24313, (174, 11, 136, 17, 67, 177, 114, 201 ));
   
   ------------------------------------------------------------------------
   type IPlayReadySoapMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMessageBody
   (
      This       : access IPlayReadySoapMessage_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageHeaders
   (
      This       : access IPlayReadySoapMessage_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IPlayReadySoapMessage_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadySoapMessage : aliased constant Windows.IID := (3059350709, 52801, 16826, (138, 13, 97, 223, 95, 255, 161, 57 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyITADataGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function GenerateData
   (
      This       : access IPlayReadyITADataGenerator_Interface
      ; guidCPSystemId : Windows.Guid
      ; countOfStreams : Windows.UInt32
      ; configuration : Windows.Foundation.Collections.IPropertySet
      ; format : Windows.Media.Protection.PlayReady.PlayReadyITADataFormat
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyITADataGenerator : aliased constant Windows.IID := (608463758, 4281, 17712, (178, 91, 144, 26, 128, 41, 169, 178 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseSession_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLAServiceRequest
   (
      This       : access IPlayReadyLicenseSession_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyLicenseAcquisitionServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureMediaProtectionManager
   (
      This       : access IPlayReadyLicenseSession_Interface
      ; mpm : Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseSession : aliased constant Windows.IID := (2708617785, 34810, 20445, (171, 187, 169, 114, 14, 132, 82, 89 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseSession2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLicenseIterable
   (
      This       : access IPlayReadyLicenseSession2_Interface
      ; contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; fullyEvaluated : Windows.Boolean
      ; RetVal : access Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseSession2 : aliased constant Windows.IID := (1225375290, 15085, 18006, (138, 215, 238, 15, 215, 121, 149, 16 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseSessionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPlayReadyLicenseSessionFactory_Interface
      ; configuration : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyLicenseSession
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseSessionFactory : aliased constant Windows.IID := (1648961177, 25895, 17054, (152, 190, 72, 215, 152, 172, 39, 57 ));
   
   ------------------------------------------------------------------------
   type INDDownloadEngine_Interface is interface and Windows.IInspectable_Interface;
   
   function Open
   (
      This       : access INDDownloadEngine_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; sessionIDBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access INDDownloadEngine_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access INDDownloadEngine_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access INDDownloadEngine_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access INDDownloadEngine_Interface
      ; startPosition : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSeek
   (
      This       : access INDDownloadEngine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferFullMinThresholdInSamples
   (
      This       : access INDDownloadEngine_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferFullMaxThresholdInSamples
   (
      This       : access INDDownloadEngine_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Notifier
   (
      This       : access INDDownloadEngine_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDDownloadEngineNotifier
   )
   return Windows.HRESULT is abstract;
   
   IID_INDDownloadEngine : aliased constant Windows.IID := (757218661, 50358, 17464, (141, 70, 185, 110, 109, 15, 178, 31 ));
   
   ------------------------------------------------------------------------
   type INDDownloadEngineNotifier_Interface is interface and Windows.IInspectable_Interface;
   
   function OnStreamOpened
   (
      This       : access INDDownloadEngineNotifier_Interface
   )
   return Windows.HRESULT is abstract;
   
   function OnPlayReadyObjectReceived
   (
      This       : access INDDownloadEngineNotifier_Interface
      ; dataBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function OnContentIDReceived
   (
      This       : access INDDownloadEngineNotifier_Interface
      ; licenseFetchDescriptor : Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function OnDataReceived
   (
      This       : access INDDownloadEngineNotifier_Interface
      ; dataBytes : Windows.UInt8_Ptr
      ; bytesReceived : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function OnEndOfStream
   (
      This       : access INDDownloadEngineNotifier_Interface
   )
   return Windows.HRESULT is abstract;
   
   function OnNetworkError
   (
      This       : access INDDownloadEngineNotifier_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_INDDownloadEngineNotifier : aliased constant Windows.IID := (3609244884, 62648, 17712, (168, 9, 145, 147, 165, 113, 231, 252 ));
   
   ------------------------------------------------------------------------
   type INDLicenseFetchDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentIDType
   (
      This       : access INDLicenseFetchDescriptor_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.NDContentIDType
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentID
   (
      This       : access INDLicenseFetchDescriptor_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseFetchChallengeCustomData
   (
      This       : access INDLicenseFetchDescriptor_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   function put_LicenseFetchChallengeCustomData
   (
      This       : access INDLicenseFetchDescriptor_Interface
      ; licenseFetchChallengeCustomData : Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   IID_INDLicenseFetchDescriptor : aliased constant Windows.IID := (1419301690, 59014, 18741, (165, 103, 124, 167, 122, 210, 15, 164 ));
   
   ------------------------------------------------------------------------
   type INDCustomData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CustomDataTypeID
   (
      This       : access INDCustomData_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomData
   (
      This       : access INDCustomData_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_INDCustomData : aliased constant Windows.IID := (4123725788, 11529, 20249, (181, 225, 118, 160, 179, 238, 146, 103 ));
   
   ------------------------------------------------------------------------
   type INDStreamParser_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseData
   (
      This       : access INDStreamParser_Interface
      ; dataBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetStreamInformation
   (
      This       : access INDStreamParser_Interface
      ; descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; streamType : access Windows.Media.Protection.PlayReady.NDMediaStreamType
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function BeginOfStream
   (
      This       : access INDStreamParser_Interface
   )
   return Windows.HRESULT is abstract;
   
   function EndOfStream
   (
      This       : access INDStreamParser_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Notifier
   (
      This       : access INDStreamParser_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDStreamParserNotifier
   )
   return Windows.HRESULT is abstract;
   
   IID_INDStreamParser : aliased constant Windows.IID := (3770327448, 38806, 16841, (134, 149, 89, 67, 126, 103, 230, 106 ));
   
   ------------------------------------------------------------------------
   type INDStreamParserNotifier_Interface is interface and Windows.IInspectable_Interface;
   
   function OnContentIDReceived
   (
      This       : access INDStreamParserNotifier_Interface
      ; licenseFetchDescriptor : Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function OnMediaStreamDescriptorCreated
   (
      This       : access INDStreamParserNotifier_Interface
      ; audioStreamDescriptors : Windows.Media.Core.IVector_IAudioStreamDescriptor
      ; videoStreamDescriptors : Windows.Media.Core.IVector_IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function OnSampleParsed
   (
      This       : access INDStreamParserNotifier_Interface
      ; streamID : Windows.UInt32
      ; streamType : Windows.Media.Protection.PlayReady.NDMediaStreamType
      ; streamSample : Windows.Media.Core.IMediaStreamSample
      ; pts : Windows.Int64
      ; ccFormat : Windows.Media.Protection.PlayReady.NDClosedCaptionFormat
      ; ccDataBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function OnBeginSetupDecryptor
   (
      This       : access INDStreamParserNotifier_Interface
      ; descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; keyID : Windows.Guid
      ; proBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_INDStreamParserNotifier : aliased constant Windows.IID := (3244797136, 11494, 17004, (172, 229, 94, 146, 117, 254, 167, 21 ));
   
   ------------------------------------------------------------------------
   type INDSendResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Response
   (
      This       : access INDSendResult_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_INDSendResult : aliased constant Windows.IID := (3815265559, 42372, 18333, (144, 183, 214, 137, 199, 191, 124, 128 ));
   
   ------------------------------------------------------------------------
   type INDMessenger_Interface is interface and Windows.IInspectable_Interface;
   
   function SendRegistrationRequestAsync
   (
      This       : access INDMessenger_Interface
      ; sessionIDBytes : Windows.UInt8_Ptr
      ; challengeDataBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendProximityDetectionStartAsync
   (
      This       : access INDMessenger_Interface
      ; pdType : Windows.Media.Protection.PlayReady.NDProximityDetectionType
      ; transmitterChannelBytes : Windows.UInt8_Ptr
      ; sessionIDBytes : Windows.UInt8_Ptr
      ; challengeDataBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendProximityDetectionResponseAsync
   (
      This       : access INDMessenger_Interface
      ; pdType : Windows.Media.Protection.PlayReady.NDProximityDetectionType
      ; transmitterChannelBytes : Windows.UInt8_Ptr
      ; sessionIDBytes : Windows.UInt8_Ptr
      ; responseDataBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendLicenseFetchRequestAsync
   (
      This       : access INDMessenger_Interface
      ; sessionIDBytes : Windows.UInt8_Ptr
      ; challengeDataBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_INDMessenger : aliased constant Windows.IID := (3559782749, 42843, 18367, (130, 73, 188, 131, 130, 13, 163, 138 ));
   
   ------------------------------------------------------------------------
   type INDTCPMessengerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access INDTCPMessengerFactory_Interface
      ; remoteHostName : Windows.String
      ; remoteHostPort : Windows.UInt32
      ; RetVal : access Windows.Media.Protection.PlayReady.INDMessenger
   )
   return Windows.HRESULT is abstract;
   
   IID_INDTCPMessengerFactory : aliased constant Windows.IID := (2111331582, 7065, 20328, (143, 130, 129, 119, 247, 206, 223, 43 ));
   
   ------------------------------------------------------------------------
   type INDTransmitterProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CertificateType
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.NDCertificateType
   )
   return Windows.HRESULT is abstract;
   
   function get_PlatformIdentifier
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.NDCertificatePlatformID
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFeatures
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.NDCertificateFeature_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_SecurityLevel
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SecurityVersion
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientID
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelDigest
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelManufacturerName
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelName
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelNumber
   (
      This       : access INDTransmitterProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_INDTransmitterProperties : aliased constant Windows.IID := (3845566243, 44111, 19164, (140, 102, 79, 247, 194, 112, 45, 214 ));
   
   ------------------------------------------------------------------------
   type INDStartResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaStreamSource
   (
      This       : access INDStartResult_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   IID_INDStartResult : aliased constant Windows.IID := (2046224750, 62735, 16405, (139, 164, 194, 188, 52, 78, 189, 78 ));
   
   ------------------------------------------------------------------------
   type INDLicenseFetchResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResponseCustomData
   (
      This       : access INDLicenseFetchResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   IID_INDLicenseFetchResult : aliased constant Windows.IID := (567514776, 43618, 17919, (165, 255, 128, 55, 229, 67, 56, 37 ));
   
   ------------------------------------------------------------------------
   type INDLicenseFetchDescriptorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access INDLicenseFetchDescriptorFactory_Interface
      ; contentIDType : Windows.Media.Protection.PlayReady.NDContentIDType
      ; contentIDBytes : Windows.UInt8_Ptr
      ; licenseFetchChallengeCustomData : Windows.Media.Protection.PlayReady.INDCustomData
      ; RetVal : access Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_INDLicenseFetchDescriptorFactory : aliased constant Windows.IID := (3489862146, 53164, 20224, (174, 106, 151, 175, 128, 184, 72, 242 ));
   
   ------------------------------------------------------------------------
   type INDRegistrationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResponseCustomData
   (
      This       : access INDRegistrationCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   function get_TransmitterProperties
   (
      This       : access INDRegistrationCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDTransmitterProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_TransmitterCertificateAccepted
   (
      This       : access INDRegistrationCompletedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TransmitterCertificateAccepted
   (
      This       : access INDRegistrationCompletedEventArgs_Interface
      ; accept_x : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_INDRegistrationCompletedEventArgs : aliased constant Windows.IID := (2654582349, 43867, 18693, (172, 220, 120, 122, 119, 198, 55, 77 ));
   
   ------------------------------------------------------------------------
   type INDCustomDataFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access INDCustomDataFactory_Interface
      ; customDataTypeIDBytes : Windows.UInt8_Ptr
      ; customDataBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   IID_INDCustomDataFactory : aliased constant Windows.IID := (3595830699, 13348, 18483, (140, 154, 175, 95, 222, 178, 40, 114 ));
   
   ------------------------------------------------------------------------
   type INDProximityDetectionCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProximityDetectionRetryCount
   (
      This       : access INDProximityDetectionCompletedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_INDProximityDetectionCompletedEventArgs : aliased constant Windows.IID := (712008488, 55845, 20364, (158, 183, 93, 15, 195, 101, 139, 202 ));
   
   ------------------------------------------------------------------------
   type INDLicenseFetchCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResponseCustomData
   (
      This       : access INDLicenseFetchCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.HRESULT is abstract;
   
   IID_INDLicenseFetchCompletedEventArgs : aliased constant Windows.IID := (518195738, 4530, 17752, (136, 101, 227, 165, 22, 146, 37, 23 ));
   
   ------------------------------------------------------------------------
   type INDClient_Interface is interface and Windows.IInspectable_Interface;
   
   function add_RegistrationCompleted
   (
      This       : access INDClient_Interface
      ; handler : TypedEventHandler_INDClient_add_RegistrationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RegistrationCompleted
   (
      This       : access INDClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProximityDetectionCompleted
   (
      This       : access INDClient_Interface
      ; handler : TypedEventHandler_INDClient_add_ProximityDetectionCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProximityDetectionCompleted
   (
      This       : access INDClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LicenseFetchCompleted
   (
      This       : access INDClient_Interface
      ; handler : TypedEventHandler_INDClient_add_LicenseFetchCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LicenseFetchCompleted
   (
      This       : access INDClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ReRegistrationNeeded
   (
      This       : access INDClient_Interface
      ; handler : TypedEventHandler_INDClient_add_ReRegistrationNeeded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReRegistrationNeeded
   (
      This       : access INDClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ClosedCaptionDataReceived
   (
      This       : access INDClient_Interface
      ; handler : TypedEventHandler_INDClient_add_ClosedCaptionDataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ClosedCaptionDataReceived
   (
      This       : access INDClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access INDClient_Interface
      ; contentUrl : Windows.Foundation.IUriRuntimeClass
      ; startAsyncOptions : Windows.UInt32
      ; registrationCustomData : Windows.Media.Protection.PlayReady.INDCustomData
      ; licenseFetchDescriptor : Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDStartResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LicenseFetchAsync
   (
      This       : access INDClient_Interface
      ; licenseFetchDescriptor : Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor
      ; RetVal : access Windows.Media.Protection.PlayReady.IAsyncOperation_INDLicenseFetchResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReRegistrationAsync
   (
      This       : access INDClient_Interface
      ; registrationCustomData : Windows.Media.Protection.PlayReady.INDCustomData
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access INDClient_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_INDClient : aliased constant Windows.IID := (1003911195, 25016, 18146, (153, 165, 138, 188, 182, 185, 247, 214 ));
   
   ------------------------------------------------------------------------
   type INDClosedCaptionDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClosedCaptionDataFormat
   (
      This       : access INDClosedCaptionDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.NDClosedCaptionFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationTimestamp
   (
      This       : access INDClosedCaptionDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedCaptionData
   (
      This       : access INDClosedCaptionDataReceivedEventArgs_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_INDClosedCaptionDataReceivedEventArgs : aliased constant Windows.IID := (1194906271, 49989, 17993, (132, 104, 184, 197, 252, 53, 113, 144 ));
   
   ------------------------------------------------------------------------
   type INDClientFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access INDClientFactory_Interface
      ; downloadEngine : Windows.Media.Protection.PlayReady.INDDownloadEngine
      ; streamParser : Windows.Media.Protection.PlayReady.INDStreamParser
      ; pMessenger : Windows.Media.Protection.PlayReady.INDMessenger
      ; RetVal : access Windows.Media.Protection.PlayReady.INDClient
   )
   return Windows.HRESULT is abstract;
   
   IID_INDClientFactory : aliased constant Windows.IID := (1045683554, 65256, 17695, (176, 212, 247, 6, 204, 163, 224, 55 ));
   
   ------------------------------------------------------------------------
   type INDStorageFileHelper_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFileURLs
   (
      This       : access INDStorageFileHelper_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_INDStorageFileHelper : aliased constant Windows.IID := (3639656184, 37330, 19783, (163, 249, 234, 255, 78, 219, 114, 159 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseCustomData
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ChallengeCustomData
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ChallengeCustomData
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function BeginServiceRequest
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function NextServiceRequest
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function GenerateManualEnablingChallenge
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadySoapMessage
   )
   return Windows.HRESULT is abstract;
   
   function ProcessManualEnablingResponse
   (
      This       : access IPlayReadyServiceRequest_Interface
      ; responseBytes : Windows.UInt8_Ptr
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyServiceRequest : aliased constant Windows.IID := (2343381046, 42755, 17830, (161, 128, 118, 243, 86, 90, 167, 37 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyIndividualizationServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPlayReadyIndividualizationServiceRequest : aliased constant Windows.IID := (569747563, 140, 17937, (171, 47, 170, 166, 198, 159, 14, 36 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyDomainJoinServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DomainAccountId
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainAccountId
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainFriendlyName
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainFriendlyName
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainServiceId
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainServiceId
   (
      This       : access IPlayReadyDomainJoinServiceRequest_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyDomainJoinServiceRequest : aliased constant Windows.IID := (387664474, 16479, 18233, (176, 64, 103, 185, 240, 195, 135, 88 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyDomainLeaveServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DomainAccountId
   (
      This       : access IPlayReadyDomainLeaveServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainAccountId
   (
      This       : access IPlayReadyDomainLeaveServiceRequest_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainServiceId
   (
      This       : access IPlayReadyDomainLeaveServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainServiceId
   (
      This       : access IPlayReadyDomainLeaveServiceRequest_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyDomainLeaveServiceRequest : aliased constant Windows.IID := (103635134, 38829, 18711, (170, 3, 70, 212, 194, 82, 212, 100 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseAcquisitionServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentHeader
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentHeader
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest_Interface
      ; value : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainServiceId
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainServiceId
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseAcquisitionServiceRequest : aliased constant Windows.IID := (1569062725, 16031, 20296, (147, 225, 149, 48, 200, 213, 140, 62 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseAcquisitionServiceRequest2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionId
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseAcquisitionServiceRequest2 : aliased constant Windows.IID := (3086638773, 65036, 45605, (188, 96, 90, 158, 221, 50, 206, 181 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyLicenseAcquisitionServiceRequest3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLicenseIterable
   (
      This       : access IPlayReadyLicenseAcquisitionServiceRequest3_Interface
      ; contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; fullyEvaluated : Windows.Boolean
      ; RetVal : access Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyLicenseAcquisitionServiceRequest3 : aliased constant Windows.IID := (961437517, 32629, 17165, (178, 231, 127, 117, 243, 75, 45, 117 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyMeteringReportServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MeteringCertificate
   (
      This       : access IPlayReadyMeteringReportServiceRequest_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function put_MeteringCertificate
   (
      This       : access IPlayReadyMeteringReportServiceRequest_Interface
      ; meteringCertBytes : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadyMeteringReportServiceRequest : aliased constant Windows.IID := (3240829724, 3789, 20241, (161, 133, 30, 36, 164, 166, 127, 183 ));
   
   ------------------------------------------------------------------------
   type IPlayReadyRevocationServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IPlayReadyRevocationServiceRequest : aliased constant Windows.IID := (1413310124, 64240, 17760, (132, 165, 14, 74, 206, 201, 57, 228 ));
   
   ------------------------------------------------------------------------
   type IPlayReadySecureStopServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionID
   (
      This       : access IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateTime
   (
      This       : access IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Stopped
   (
      This       : access IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PublisherCertificate
   (
      This       : access IPlayReadySecureStopServiceRequest_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlayReadySecureStopServiceRequest : aliased constant Windows.IID := (3041926885, 447, 17409, (150, 119, 5, 99, 10, 106, 76, 200 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_INDSendResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_INDSendResult_Interface
      ; handler : Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDSendResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_INDSendResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDSendResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_INDSendResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDSendResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_INDSendResult : aliased constant Windows.IID := (1815578792, 3693, 24105, (154, 209, 216, 138, 101, 235, 80, 11 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_INDStartResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_INDStartResult_Interface
      ; handler : Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDStartResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_INDStartResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDStartResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_INDStartResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDStartResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_INDStartResult : aliased constant Windows.IID := (33207870, 27307, 21666, (128, 247, 219, 237, 34, 245, 141, 86 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_INDLicenseFetchResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_INDLicenseFetchResult_Interface
      ; handler : Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDLicenseFetchResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_INDLicenseFetchResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.AsyncOperationCompletedHandler_INDLicenseFetchResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_INDLicenseFetchResult_Interface
      ; RetVal : access Windows.Media.Protection.PlayReady.INDLicenseFetchResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_INDLicenseFetchResult : aliased constant Windows.IID := (2610760808, 15058, 23297, (141, 199, 111, 127, 193, 238, 214, 246 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_INDSendResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_INDSendResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDSendResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_INDSendResult : aliased constant Windows.IID := (3334768080, 64939, 20802, (176, 121, 151, 175, 5, 103, 240, 182 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_INDClient_add_RegistrationCompleted_Interface(Callback : access procedure (sender : Windows.Media.Protection.PlayReady.INDClient ; args : Windows.Media.Protection.PlayReady.INDRegistrationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_INDClient_add_RegistrationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_RegistrationCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDRegistrationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_INDClient_add_RegistrationCompleted : aliased constant Windows.IID := (1186197590, 49568, 20928, (133, 33, 205, 226, 34, 21, 126, 255 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface(Callback : access procedure (sender : Windows.Media.Protection.PlayReady.INDClient ; args : Windows.Media.Protection.PlayReady.INDProximityDetectionCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDProximityDetectionCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_INDClient_add_ProximityDetectionCompleted : aliased constant Windows.IID := (3041207946, 51150, 20984, (189, 220, 2, 157, 44, 102, 182, 107 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface(Callback : access procedure (sender : Windows.Media.Protection.PlayReady.INDClient ; args : Windows.Media.Protection.PlayReady.INDLicenseFetchCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDLicenseFetchCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_INDClient_add_LicenseFetchCompleted : aliased constant Windows.IID := (2772439672, 58049, 21332, (133, 143, 111, 50, 203, 223, 190, 167 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface(Callback : access procedure (sender : Windows.Media.Protection.PlayReady.INDClient ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_INDClient_add_ReRegistrationNeeded : aliased constant Windows.IID := (3524211591, 46069, 20496, (155, 11, 232, 81, 174, 132, 148, 13 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface(Callback : access procedure (sender : Windows.Media.Protection.PlayReady.INDClient ; args : Windows.Media.Protection.PlayReady.INDClosedCaptionDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDClosedCaptionDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_INDClient_add_ClosedCaptionDataReceived : aliased constant Windows.IID := (921476676, 9718, 23869, (135, 238, 138, 209, 10, 51, 92, 131 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_INDStartResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDStartResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_INDStartResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDStartResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDStartResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_INDStartResult : aliased constant Windows.IID := (508442464, 45611, 24330, (144, 88, 71, 90, 255, 49, 13, 181 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDLicenseFetchResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDLicenseFetchResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_INDLicenseFetchResult : aliased constant Windows.IID := (4147109767, 36949, 22744, (150, 171, 44, 192, 77, 6, 204, 215 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PlayReadyContentHeader is Windows.Media.Protection.PlayReady.IPlayReadyContentHeader;
   
   function CreateInstanceFromWindowsMediaDrmHeader
   (
      headerBytes : Windows.UInt8_Ptr
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader;
   
   function CreateInstanceFromComponents
   (
      contentKeyId : Windows.Guid
      ; contentKeyIdString : Windows.String
      ; contentEncryptionAlgorithm : Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader;
   
   function CreateInstanceFromPlayReadyHeader
   (
      headerBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader;
   
   subtype PlayReadySoapMessage is Windows.Media.Protection.PlayReady.IPlayReadySoapMessage;
   subtype PlayReadyIndividualizationServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyIndividualizationServiceRequest;
   
   function CreatePlayReadyIndividualizationServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyIndividualizationServiceRequest;
   
   subtype PlayReadyDomainJoinServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyDomainJoinServiceRequest;
   
   function CreatePlayReadyDomainJoinServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyDomainJoinServiceRequest;
   
   subtype PlayReadyDomainLeaveServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyDomainLeaveServiceRequest;
   
   function CreatePlayReadyDomainLeaveServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyDomainLeaveServiceRequest;
   
   subtype PlayReadyLicenseIterable is Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense;
   
   function CreateInstance
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; fullyEvaluated : Windows.Boolean
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense;
   
   subtype PlayReadyLicenseAcquisitionServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyLicenseAcquisitionServiceRequest;
   
   function CreatePlayReadyLicenseAcquisitionServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyLicenseAcquisitionServiceRequest;
   
   subtype PlayReadyMeteringReportServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyMeteringReportServiceRequest;
   
   function CreatePlayReadyMeteringReportServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyMeteringReportServiceRequest;
   
   subtype PlayReadyRevocationServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadyRevocationServiceRequest;
   
   function CreatePlayReadyRevocationServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyRevocationServiceRequest;
   
   subtype PlayReadyLicense is Windows.Media.Protection.PlayReady.IPlayReadyLicense;
   subtype PlayReadyLicenseIterator is Windows.Media.Protection.PlayReady.IIterator_IPlayReadyLicense;
   subtype PlayReadyDomain is Windows.Media.Protection.PlayReady.IPlayReadyDomain;
   subtype PlayReadyDomainIterable is Windows.Media.Protection.PlayReady.IIterable_IPlayReadyDomain;
   
   function CreateInstance
   (
      domainAccountId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadyDomain;
   
   subtype PlayReadyDomainIterator is Windows.Media.Protection.PlayReady.IIterator_IPlayReadyDomain;
   subtype PlayReadySecureStopServiceRequest is Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest;
   
   function CreateInstance
   (
      publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest;
   
   function CreateInstanceFromSessionID
   (
      sessionID : Windows.Guid
      ; publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest;
   
   subtype PlayReadySecureStopIterable is Windows.Media.Protection.PlayReady.IIterable_IPlayReadySecureStopServiceRequest;
   
   function CreateInstance
   (
      publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadySecureStopServiceRequest;
   
   subtype PlayReadySecureStopIterator is Windows.Media.Protection.PlayReady.IIterator_IPlayReadySecureStopServiceRequest;
   subtype PlayReadyITADataGenerator is Windows.Media.Protection.PlayReady.IPlayReadyITADataGenerator;
   
   function CreatePlayReadyITADataGenerator return Windows.Media.Protection.PlayReady.IPlayReadyITADataGenerator;
   
   subtype PlayReadyLicenseSession is Windows.Media.Protection.PlayReady.IPlayReadyLicenseSession;
   
   function CreateInstance
   (
      configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyLicenseSession;
   
   subtype NDDownloadEngineNotifier is Windows.Media.Protection.PlayReady.INDDownloadEngineNotifier;
   
   function CreateNDDownloadEngineNotifier return Windows.Media.Protection.PlayReady.INDDownloadEngineNotifier;
   
   subtype NDStreamParserNotifier is Windows.Media.Protection.PlayReady.INDStreamParserNotifier;
   
   function CreateNDStreamParserNotifier return Windows.Media.Protection.PlayReady.INDStreamParserNotifier;
   
   subtype NDTCPMessenger is Windows.Media.Protection.PlayReady.INDMessenger;
   
   function CreateInstance
   (
      remoteHostName : Windows.String
      ; remoteHostPort : Windows.UInt32
   )
   return Windows.Media.Protection.PlayReady.INDMessenger;
   
   subtype NDLicenseFetchDescriptor is Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor;
   
   function CreateInstance
   (
      contentIDType : Windows.Media.Protection.PlayReady.NDContentIDType
      ; contentIDBytes : Windows.UInt8_Ptr
      ; licenseFetchChallengeCustomData : Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor;
   
   subtype NDCustomData is Windows.Media.Protection.PlayReady.INDCustomData;
   
   function CreateInstance
   (
      customDataTypeIDBytes : Windows.UInt8_Ptr
      ; customDataBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.INDCustomData;
   
   subtype NDClient is Windows.Media.Protection.PlayReady.INDClient;
   
   function CreateInstance
   (
      downloadEngine : Windows.Media.Protection.PlayReady.INDDownloadEngine
      ; streamParser : Windows.Media.Protection.PlayReady.INDStreamParser
      ; pMessenger : Windows.Media.Protection.PlayReady.INDMessenger
   )
   return Windows.Media.Protection.PlayReady.INDClient;
   
   subtype NDStorageFileHelper is Windows.Media.Protection.PlayReady.INDStorageFileHelper;
   
   function CreateNDStorageFileHelper return Windows.Media.Protection.PlayReady.INDStorageFileHelper;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function ServiceRequest
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyServiceRequest;
   
   function DeleteLicenses
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_DomainJoinServiceRequestType
   return Windows.Guid;
   
   function get_DomainLeaveServiceRequestType
   return Windows.Guid;
   
   function get_IndividualizationServiceRequestType
   return Windows.Guid;
   
   function get_LicenseAcquirerServiceRequestType
   return Windows.Guid;
   
   function get_MeteringReportServiceRequestType
   return Windows.Guid;
   
   function get_RevocationServiceRequestType
   return Windows.Guid;
   
   function get_MediaProtectionSystemId
   return Windows.Guid;
   
   function get_PlayReadySecurityVersion
   return Windows.UInt32;
   
   function get_SecureStopServiceRequestType
   return Windows.Guid;
   
   function CheckSupportedHardware
   (
      hwdrmFeature : Windows.Media.Protection.PlayReady.PlayReadyHardwareDRMFeatures
   )
   return Windows.Boolean;
   
   function get_PlayReadyCertificateSecurityLevel
   return Windows.UInt32;
   
   function get_InputTrustAuthorityToCreate
   return Windows.String;
   
   function get_ProtectionSystemId
   return Windows.Guid;

end;
