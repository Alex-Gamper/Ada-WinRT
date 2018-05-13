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
with Windows.Media.Protection;
with Windows.Media.Core;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Protection.PlayReady is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDSendResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDSendResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_RegistrationCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDRegistrationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.PlayReady.INDClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ProximityDetectionCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDProximityDetectionCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.PlayReady.INDClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_LicenseFetchCompleted_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDLicenseFetchCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.PlayReady.INDClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ReRegistrationNeeded_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.PlayReady.INDClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INDClient_add_ClosedCaptionDataReceived_Interface
      ; sender : Windows.Media.Protection.PlayReady.INDClient
      ; args : Windows.Media.Protection.PlayReady.INDClosedCaptionDataReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.PlayReady.INDClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDStartResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDStartResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INDLicenseFetchResult_Interface
      ; asyncInfo : Windows.Media.Protection.PlayReady.IAsyncOperation_INDLicenseFetchResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstanceFromWindowsMediaDrmHeader
   (
      headerBytes : Windows.UInt8_Ptr
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyContentHeader");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyContentHeaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyContentHeader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyContentHeaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromWindowsMediaDrmHeader(headerBytes, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
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
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyContentHeader");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyContentHeaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyContentHeader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyContentHeaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromComponents(contentKeyId, contentKeyIdString, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceFromPlayReadyHeader
   (
      headerBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyContentHeader");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyContentHeaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyContentHeader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyContentHeaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromPlayReadyHeader(headerBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceFromComponents2
   (
      dwFlags : Windows.UInt32
      ; contentKeyIds : Windows.Guid_Ptr
      ; contentKeyIdStrings : Windows.String_Ptr
      ; contentEncryptionAlgorithm : Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
      ; licenseAcquisitionUrl : Windows.Foundation.IUriRuntimeClass
      ; licenseAcquisitionUserInterfaceUrl : Windows.Foundation.IUriRuntimeClass
      ; customAttributes : Windows.String
      ; domainServiceId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyContentHeader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyContentHeader");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyContentHeaderFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyContentHeader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyContentHeaderFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromComponents2(dwFlags, contentKeyIds, contentKeyIdStrings, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePlayReadyIndividualizationServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyIndividualizationServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyIndividualizationServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyIndividualizationServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyIndividualizationServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlayReadyDomainJoinServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyDomainJoinServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyDomainJoinServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyDomainJoinServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyDomainJoinServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlayReadyDomainLeaveServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyDomainLeaveServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyDomainLeaveServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyDomainLeaveServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyDomainLeaveServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlayReadyLicenseIterable return Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyLicenseIterable");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IIterable_IPlayReadyLicense'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
      ; fullyEvaluated : Windows.Boolean
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyLicenseIterable");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyLicenseIterableFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IIterable_IPlayReadyLicense := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyLicenseIterableFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(contentHeader, fullyEvaluated, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePlayReadyLicenseAcquisitionServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyLicenseAcquisitionServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyLicenseAcquisitionServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyLicenseAcquisitionServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyLicenseAcquisitionServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlayReadyMeteringReportServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyMeteringReportServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyMeteringReportServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyMeteringReportServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyMeteringReportServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlayReadyRevocationServiceRequest return Windows.Media.Protection.PlayReady.IPlayReadyRevocationServiceRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyRevocationServiceRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyRevocationServiceRequest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyRevocationServiceRequest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      domainAccountId : Windows.Guid
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadyDomain is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyDomainIterable");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyDomainIterableFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IIterable_IPlayReadyDomain := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyDomainIterableFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(domainAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadySecureStopServiceRequest");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadySecureStopServiceRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(publisherCertBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceFromSessionID
   (
      sessionID : Windows.Guid
      ; publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadySecureStopServiceRequest");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadySecureStopServiceRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadySecureStopServiceRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromSessionID(sessionID, publisherCertBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      publisherCertBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.IIterable_IPlayReadySecureStopServiceRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadySecureStopIterable");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadySecureStopIterableFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IIterable_IPlayReadySecureStopServiceRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadySecureStopIterableFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(publisherCertBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePlayReadyITADataGenerator return Windows.Media.Protection.PlayReady.IPlayReadyITADataGenerator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyITADataGenerator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.IPlayReadyITADataGenerator) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_IPlayReadyITADataGenerator'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyLicenseSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyLicenseSession");
      m_Factory     : Windows.Media.Protection.PlayReady.IPlayReadyLicenseSessionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyLicenseSession := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyLicenseSessionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(configuration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNDDownloadEngineNotifier return Windows.Media.Protection.PlayReady.INDDownloadEngineNotifier is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDDownloadEngineNotifier");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.INDDownloadEngineNotifier) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_INDDownloadEngineNotifier'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateNDStreamParserNotifier return Windows.Media.Protection.PlayReady.INDStreamParserNotifier is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDStreamParserNotifier");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.INDStreamParserNotifier) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_INDStreamParserNotifier'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      remoteHostName : Windows.String
      ; remoteHostPort : Windows.UInt32
   )
   return Windows.Media.Protection.PlayReady.INDMessenger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDTCPMessenger");
      m_Factory     : Windows.Media.Protection.PlayReady.INDTCPMessengerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.INDMessenger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INDTCPMessengerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(remoteHostName, remoteHostPort, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      contentIDType : Windows.Media.Protection.PlayReady.NDContentIDType
      ; contentIDBytes : Windows.UInt8_Ptr
      ; licenseFetchChallengeCustomData : Windows.Media.Protection.PlayReady.INDCustomData
   )
   return Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDLicenseFetchDescriptor");
      m_Factory     : Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.INDLicenseFetchDescriptor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INDLicenseFetchDescriptorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(contentIDType, contentIDBytes, licenseFetchChallengeCustomData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      customDataTypeIDBytes : Windows.UInt8_Ptr
      ; customDataBytes : Windows.UInt8_Ptr
   )
   return Windows.Media.Protection.PlayReady.INDCustomData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDCustomData");
      m_Factory     : Windows.Media.Protection.PlayReady.INDCustomDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.INDCustomData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INDCustomDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(customDataTypeIDBytes, customDataBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      downloadEngine : Windows.Media.Protection.PlayReady.INDDownloadEngine
      ; streamParser : Windows.Media.Protection.PlayReady.INDStreamParser
      ; pMessenger : Windows.Media.Protection.PlayReady.INDMessenger
   )
   return Windows.Media.Protection.PlayReady.INDClient is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDClient");
      m_Factory     : Windows.Media.Protection.PlayReady.INDClientFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.INDClient := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INDClientFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(downloadEngine, streamParser, pMessenger, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNDStorageFileHelper return Windows.Media.Protection.PlayReady.INDStorageFileHelper is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.NDStorageFileHelper");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.PlayReady.INDStorageFileHelper) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.PlayReady.IID_INDStorageFileHelper'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function ServiceRequest
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.Media.Protection.PlayReady.IPlayReadyServiceRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyContentResolver");
      m_Factory     : IPlayReadyContentResolver := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.PlayReady.IPlayReadyServiceRequest;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyContentResolver'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ServiceRequest(contentHeader, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeleteLicenses
   (
      contentHeader : Windows.Media.Protection.PlayReady.IPlayReadyContentHeader
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyLicenseManagement");
      m_Factory     : IPlayReadyLicenseManagement := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyLicenseManagement'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteLicenses(contentHeader, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DomainJoinServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DomainJoinServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DomainLeaveServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DomainLeaveServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IndividualizationServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IndividualizationServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LicenseAcquirerServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LicenseAcquirerServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MeteringReportServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MeteringReportServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RevocationServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RevocationServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediaProtectionSystemId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediaProtectionSystemId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PlayReadySecurityVersion
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PlayReadySecurityVersion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecureStopServiceRequestType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecureStopServiceRequestType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CheckSupportedHardware
   (
      hwdrmFeature : Windows.Media.Protection.PlayReady.PlayReadyHardwareDRMFeatures
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CheckSupportedHardware(hwdrmFeature, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InputTrustAuthorityToCreate
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InputTrustAuthorityToCreate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProtectionSystemId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProtectionSystemId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PlayReadyCertificateSecurityLevel
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.PlayReady.PlayReadyStatics");
      m_Factory     : IPlayReadyStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlayReadyStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PlayReadyCertificateSecurityLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
