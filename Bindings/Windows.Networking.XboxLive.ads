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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Networking.XboxLive is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type XboxLiveNetworkAccessKind is (
      Open,
      Moderate,
      Strict
   );
   for XboxLiveNetworkAccessKind use (
      Open => 0,
      Moderate => 1,
      Strict => 2
   );
   for XboxLiveNetworkAccessKind'Size use 32;
   
   type XboxLiveNetworkAccessKind_Ptr is access XboxLiveNetworkAccessKind;
   
   type XboxLiveSocketKind is (
      None,
      Datagram,
      Stream
   );
   for XboxLiveSocketKind use (
      None => 0,
      Datagram => 1,
      Stream => 2
   );
   for XboxLiveSocketKind'Size use 32;
   
   type XboxLiveSocketKind_Ptr is access XboxLiveSocketKind;
   
   type XboxLiveEndpointPairCreationBehaviors is (
      None,
      ReevaluatePath
   );
   for XboxLiveEndpointPairCreationBehaviors use (
      None => 0,
      ReevaluatePath => 1
   );
   for XboxLiveEndpointPairCreationBehaviors'Size use 32;
   
   type XboxLiveEndpointPairCreationBehaviors_Ptr is access XboxLiveEndpointPairCreationBehaviors;
   
   type XboxLiveEndpointPairCreationStatus is (
      Succeeded,
      NoLocalNetworks,
      NoCompatibleNetworkPaths,
      LocalSystemNotAuthorized,
      Canceled,
      TimedOut,
      RemoteSystemNotAuthorized,
      RefusedDueToConfiguration,
      UnexpectedInternalError
   );
   for XboxLiveEndpointPairCreationStatus use (
      Succeeded => 0,
      NoLocalNetworks => 1,
      NoCompatibleNetworkPaths => 2,
      LocalSystemNotAuthorized => 3,
      Canceled => 4,
      TimedOut => 5,
      RemoteSystemNotAuthorized => 6,
      RefusedDueToConfiguration => 7,
      UnexpectedInternalError => 8
   );
   for XboxLiveEndpointPairCreationStatus'Size use 32;
   
   type XboxLiveEndpointPairCreationStatus_Ptr is access XboxLiveEndpointPairCreationStatus;
   
   type XboxLiveEndpointPairState is (
      Invalid,
      CreatingOutbound,
      CreatingInbound,
      Ready,
      DeletingLocally,
      RemoteEndpointTerminating,
      Deleted
   );
   for XboxLiveEndpointPairState use (
      Invalid => 0,
      CreatingOutbound => 1,
      CreatingInbound => 2,
      Ready => 3,
      DeletingLocally => 4,
      RemoteEndpointTerminating => 5,
      Deleted => 6
   );
   for XboxLiveEndpointPairState'Size use 32;
   
   type XboxLiveEndpointPairState_Ptr is access XboxLiveEndpointPairState;
   
   type XboxLiveQualityOfServiceMetric is (
      AverageLatencyInMilliseconds,
      MinLatencyInMilliseconds,
      MaxLatencyInMilliseconds,
      AverageOutboundBitsPerSecond,
      MinOutboundBitsPerSecond,
      MaxOutboundBitsPerSecond,
      AverageInboundBitsPerSecond,
      MinInboundBitsPerSecond,
      MaxInboundBitsPerSecond
   );
   for XboxLiveQualityOfServiceMetric use (
      AverageLatencyInMilliseconds => 0,
      MinLatencyInMilliseconds => 1,
      MaxLatencyInMilliseconds => 2,
      AverageOutboundBitsPerSecond => 3,
      MinOutboundBitsPerSecond => 4,
      MaxOutboundBitsPerSecond => 5,
      AverageInboundBitsPerSecond => 6,
      MinInboundBitsPerSecond => 7,
      MaxInboundBitsPerSecond => 8
   );
   for XboxLiveQualityOfServiceMetric'Size use 32;
   
   type XboxLiveQualityOfServiceMetric_Ptr is access XboxLiveQualityOfServiceMetric;
   
   type XboxLiveQualityOfServiceMeasurementStatus is (
      NotStarted,
      InProgress,
      InProgressWithProvisionalResults,
      Succeeded,
      NoLocalNetworks,
      NoCompatibleNetworkPaths,
      LocalSystemNotAuthorized,
      Canceled,
      TimedOut,
      RemoteSystemNotAuthorized,
      RefusedDueToConfiguration,
      UnexpectedInternalError
   );
   for XboxLiveQualityOfServiceMeasurementStatus use (
      NotStarted => 0,
      InProgress => 1,
      InProgressWithProvisionalResults => 2,
      Succeeded => 3,
      NoLocalNetworks => 4,
      NoCompatibleNetworkPaths => 5,
      LocalSystemNotAuthorized => 6,
      Canceled => 7,
      TimedOut => 8,
      RemoteSystemNotAuthorized => 9,
      RefusedDueToConfiguration => 10,
      UnexpectedInternalError => 11
   );
   for XboxLiveQualityOfServiceMeasurementStatus'Size use 32;
   
   type XboxLiveQualityOfServiceMeasurementStatus_Ptr is access XboxLiveQualityOfServiceMeasurementStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type XboxLiveSecureSocketsContract is null record;
   pragma Convention (C_Pass_By_Copy , XboxLiveSecureSocketsContract);
   
   type XboxLiveSecureSocketsContract_Ptr is access XboxLiveSecureSocketsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface;
   type TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged is access all TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface'Class;
   type TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Ptr is access all TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged;
   type TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface;
   type TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated is access all TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface'Class;
   type TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Ptr is access all TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated;
   type AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface;
   type AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult is access all AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Ptr is access all AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult;
   type TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface;
   type TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged is access all TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface'Class;
   type TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Ptr is access all TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IXboxLiveDeviceAddressStatics_Interface;
   type IXboxLiveDeviceAddressStatics is access all IXboxLiveDeviceAddressStatics_Interface'Class;
   type IXboxLiveDeviceAddressStatics_Ptr is access all IXboxLiveDeviceAddressStatics;
   type IXboxLiveDeviceAddress_Interface;
   type IXboxLiveDeviceAddress is access all IXboxLiveDeviceAddress_Interface'Class;
   type IXboxLiveDeviceAddress_Ptr is access all IXboxLiveDeviceAddress;
   type IXboxLiveInboundEndpointPairCreatedEventArgs_Interface;
   type IXboxLiveInboundEndpointPairCreatedEventArgs is access all IXboxLiveInboundEndpointPairCreatedEventArgs_Interface'Class;
   type IXboxLiveInboundEndpointPairCreatedEventArgs_Ptr is access all IXboxLiveInboundEndpointPairCreatedEventArgs;
   type IXboxLiveEndpointPairCreationResult_Interface;
   type IXboxLiveEndpointPairCreationResult is access all IXboxLiveEndpointPairCreationResult_Interface'Class;
   type IXboxLiveEndpointPairCreationResult_Ptr is access all IXboxLiveEndpointPairCreationResult;
   type IXboxLiveEndpointPairTemplateStatics_Interface;
   type IXboxLiveEndpointPairTemplateStatics is access all IXboxLiveEndpointPairTemplateStatics_Interface'Class;
   type IXboxLiveEndpointPairTemplateStatics_Ptr is access all IXboxLiveEndpointPairTemplateStatics;
   type IXboxLiveEndpointPairTemplate_Interface;
   type IXboxLiveEndpointPairTemplate is access all IXboxLiveEndpointPairTemplate_Interface'Class;
   type IXboxLiveEndpointPairTemplate_Ptr is access all IXboxLiveEndpointPairTemplate;
   type IXboxLiveEndpointPairStateChangedEventArgs_Interface;
   type IXboxLiveEndpointPairStateChangedEventArgs is access all IXboxLiveEndpointPairStateChangedEventArgs_Interface'Class;
   type IXboxLiveEndpointPairStateChangedEventArgs_Ptr is access all IXboxLiveEndpointPairStateChangedEventArgs;
   type IXboxLiveEndpointPairStatics_Interface;
   type IXboxLiveEndpointPairStatics is access all IXboxLiveEndpointPairStatics_Interface'Class;
   type IXboxLiveEndpointPairStatics_Ptr is access all IXboxLiveEndpointPairStatics;
   type IXboxLiveEndpointPair_Interface;
   type IXboxLiveEndpointPair is access all IXboxLiveEndpointPair_Interface'Class;
   type IXboxLiveEndpointPair_Ptr is access all IXboxLiveEndpointPair;
   type IXboxLiveQualityOfServiceMetricResult_Interface;
   type IXboxLiveQualityOfServiceMetricResult is access all IXboxLiveQualityOfServiceMetricResult_Interface'Class;
   type IXboxLiveQualityOfServiceMetricResult_Ptr is access all IXboxLiveQualityOfServiceMetricResult;
   type IXboxLiveQualityOfServicePrivatePayloadResult_Interface;
   type IXboxLiveQualityOfServicePrivatePayloadResult is access all IXboxLiveQualityOfServicePrivatePayloadResult_Interface'Class;
   type IXboxLiveQualityOfServicePrivatePayloadResult_Ptr is access all IXboxLiveQualityOfServicePrivatePayloadResult;
   type IXboxLiveQualityOfServiceMeasurementStatics_Interface;
   type IXboxLiveQualityOfServiceMeasurementStatics is access all IXboxLiveQualityOfServiceMeasurementStatics_Interface'Class;
   type IXboxLiveQualityOfServiceMeasurementStatics_Ptr is access all IXboxLiveQualityOfServiceMeasurementStatics;
   type IXboxLiveQualityOfServiceMeasurement_Interface;
   type IXboxLiveQualityOfServiceMeasurement is access all IXboxLiveQualityOfServiceMeasurement_Interface'Class;
   type IXboxLiveQualityOfServiceMeasurement_Ptr is access all IXboxLiveQualityOfServiceMeasurement;
   type IIterator_IXboxLiveEndpointPairTemplate_Interface;
   type IIterator_IXboxLiveEndpointPairTemplate is access all IIterator_IXboxLiveEndpointPairTemplate_Interface'Class;
   type IIterator_IXboxLiveEndpointPairTemplate_Ptr is access all IIterator_IXboxLiveEndpointPairTemplate;
   type IIterable_IXboxLiveEndpointPairTemplate_Interface;
   type IIterable_IXboxLiveEndpointPairTemplate is access all IIterable_IXboxLiveEndpointPairTemplate_Interface'Class;
   type IIterable_IXboxLiveEndpointPairTemplate_Ptr is access all IIterable_IXboxLiveEndpointPairTemplate;
   type IVectorView_IXboxLiveEndpointPairTemplate_Interface;
   type IVectorView_IXboxLiveEndpointPairTemplate is access all IVectorView_IXboxLiveEndpointPairTemplate_Interface'Class;
   type IVectorView_IXboxLiveEndpointPairTemplate_Ptr is access all IVectorView_IXboxLiveEndpointPairTemplate;
   type IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface;
   type IAsyncOperation_IXboxLiveEndpointPairCreationResult is access all IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface'Class;
   type IAsyncOperation_IXboxLiveEndpointPairCreationResult_Ptr is access all IAsyncOperation_IXboxLiveEndpointPairCreationResult;
   type IIterator_IXboxLiveEndpointPair_Interface;
   type IIterator_IXboxLiveEndpointPair is access all IIterator_IXboxLiveEndpointPair_Interface'Class;
   type IIterator_IXboxLiveEndpointPair_Ptr is access all IIterator_IXboxLiveEndpointPair;
   type IIterable_IXboxLiveEndpointPair_Interface;
   type IIterable_IXboxLiveEndpointPair is access all IIterable_IXboxLiveEndpointPair_Interface'Class;
   type IIterable_IXboxLiveEndpointPair_Ptr is access all IIterable_IXboxLiveEndpointPair;
   type IVectorView_IXboxLiveEndpointPair_Interface;
   type IVectorView_IXboxLiveEndpointPair is access all IVectorView_IXboxLiveEndpointPair_Interface'Class;
   type IVectorView_IXboxLiveEndpointPair_Ptr is access all IVectorView_IXboxLiveEndpointPair;
   type IIterator_IXboxLiveQualityOfServiceMetricResult_Interface;
   type IIterator_IXboxLiveQualityOfServiceMetricResult is access all IIterator_IXboxLiveQualityOfServiceMetricResult_Interface'Class;
   type IIterator_IXboxLiveQualityOfServiceMetricResult_Ptr is access all IIterator_IXboxLiveQualityOfServiceMetricResult;
   type IIterable_IXboxLiveQualityOfServiceMetricResult_Interface;
   type IIterable_IXboxLiveQualityOfServiceMetricResult is access all IIterable_IXboxLiveQualityOfServiceMetricResult_Interface'Class;
   type IIterable_IXboxLiveQualityOfServiceMetricResult_Ptr is access all IIterable_IXboxLiveQualityOfServiceMetricResult;
   type IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface;
   type IVectorView_IXboxLiveQualityOfServiceMetricResult is access all IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface'Class;
   type IVectorView_IXboxLiveQualityOfServiceMetricResult_Ptr is access all IVectorView_IXboxLiveQualityOfServiceMetricResult;
   type IIterator_XboxLiveQualityOfServiceMetric_Interface;
   type IIterator_XboxLiveQualityOfServiceMetric is access all IIterator_XboxLiveQualityOfServiceMetric_Interface'Class;
   type IIterator_XboxLiveQualityOfServiceMetric_Ptr is access all IIterator_XboxLiveQualityOfServiceMetric;
   type IIterable_XboxLiveQualityOfServiceMetric_Interface;
   type IIterable_XboxLiveQualityOfServiceMetric is access all IIterable_XboxLiveQualityOfServiceMetric_Interface'Class;
   type IIterable_XboxLiveQualityOfServiceMetric_Ptr is access all IIterable_XboxLiveQualityOfServiceMetric;
   type IVectorView_XboxLiveQualityOfServiceMetric_Interface;
   type IVectorView_XboxLiveQualityOfServiceMetric is access all IVectorView_XboxLiveQualityOfServiceMetric_Interface'Class;
   type IVectorView_XboxLiveQualityOfServiceMetric_Ptr is access all IVectorView_XboxLiveQualityOfServiceMetric;
   type IVector_XboxLiveQualityOfServiceMetric_Interface;
   type IVector_XboxLiveQualityOfServiceMetric is access all IVector_XboxLiveQualityOfServiceMetric_Interface'Class;
   type IVector_XboxLiveQualityOfServiceMetric_Ptr is access all IVector_XboxLiveQualityOfServiceMetric;
   type IIterator_IXboxLiveDeviceAddress_Interface;
   type IIterator_IXboxLiveDeviceAddress is access all IIterator_IXboxLiveDeviceAddress_Interface'Class;
   type IIterator_IXboxLiveDeviceAddress_Ptr is access all IIterator_IXboxLiveDeviceAddress;
   type IIterable_IXboxLiveDeviceAddress_Interface;
   type IIterable_IXboxLiveDeviceAddress is access all IIterable_IXboxLiveDeviceAddress_Interface'Class;
   type IIterable_IXboxLiveDeviceAddress_Ptr is access all IIterable_IXboxLiveDeviceAddress;
   type IVectorView_IXboxLiveDeviceAddress_Interface;
   type IVectorView_IXboxLiveDeviceAddress is access all IVectorView_IXboxLiveDeviceAddress_Interface'Class;
   type IVectorView_IXboxLiveDeviceAddress_Ptr is access all IVectorView_IXboxLiveDeviceAddress;
   type IVector_IXboxLiveDeviceAddress_Interface;
   type IVector_IXboxLiveDeviceAddress is access all IVector_IXboxLiveDeviceAddress_Interface'Class;
   type IVector_IXboxLiveDeviceAddress_Ptr is access all IVector_IXboxLiveDeviceAddress;
   type IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface;
   type IIterator_IXboxLiveQualityOfServicePrivatePayloadResult is access all IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface'Class;
   type IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Ptr is access all IIterator_IXboxLiveQualityOfServicePrivatePayloadResult;
   type IIterable_IXboxLiveQualityOfServicePrivatePayloadResult_Interface;
   type IIterable_IXboxLiveQualityOfServicePrivatePayloadResult is access all IIterable_IXboxLiveQualityOfServicePrivatePayloadResult_Interface'Class;
   type IIterable_IXboxLiveQualityOfServicePrivatePayloadResult_Ptr is access all IIterable_IXboxLiveQualityOfServicePrivatePayloadResult;
   type IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface;
   type IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult is access all IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface'Class;
   type IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Ptr is access all IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveDeviceAddressStatics : aliased constant Windows.IID := (1498720281, 19065, 18737, (130, 124, 127, 80, 62, 150, 50, 99 ));
   
   type IXboxLiveDeviceAddressStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromSnapshotBase64
   (
      This       : access IXboxLiveDeviceAddressStatics_Interface
      ; base64 : Windows.String
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromSnapshotBuffer
   (
      This       : access IXboxLiveDeviceAddressStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromSnapshotBytes
   (
      This       : access IXboxLiveDeviceAddressStatics_Interface
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function GetLocal
   (
      This       : access IXboxLiveDeviceAddressStatics_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSnapshotBytesSize
   (
      This       : access IXboxLiveDeviceAddressStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveDeviceAddress : aliased constant Windows.IID := (4122727033, 15494, 19287, (163, 26, 185, 70, 36, 8, 253, 1 ));
   
   type IXboxLiveDeviceAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SnapshotChanged
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; handler : TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SnapshotChanged
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetSnapshotAsBase64
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetSnapshotAsBuffer
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetSnapshotAsBytes
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; buffer : Windows.UInt8_Ptr
      ; bytesWritten : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Compare
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; otherDeviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsValid
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLocal
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAccessKind
   (
      This       : access IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveNetworkAccessKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveInboundEndpointPairCreatedEventArgs : aliased constant Windows.IID := (3692575586, 8890, 18642, (128, 222, 194, 57, 104, 189, 25, 139 ));
   
   type IXboxLiveInboundEndpointPairCreatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointPair
   (
      This       : access IXboxLiveInboundEndpointPairCreatedEventArgs_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPairCreationResult : aliased constant Windows.IID := (3651713941, 10923, 19742, (151, 148, 51, 236, 192, 220, 240, 254 ));
   
   type IXboxLiveEndpointPairCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceAddress
   (
      This       : access IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveEndpointPairCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_IsExistingPathEvaluation
   (
      This       : access IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointPair
   (
      This       : access IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPairTemplateStatics : aliased constant Windows.IID := (504566651, 29563, 18979, (188, 100, 8, 112, 247, 86, 85, 186 ));
   
   type IXboxLiveEndpointPairTemplateStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTemplateByName
   (
      This       : access IXboxLiveEndpointPairTemplateStatics_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
   )
   return Windows.HRESULT is abstract;
   
   function get_Templates
   (
      This       : access IXboxLiveEndpointPairTemplateStatics_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPairTemplate : aliased constant Windows.IID := (1797811919, 13399, 16590, (185, 161, 192, 207, 224, 33, 62, 167 ));
   
   type IXboxLiveEndpointPairTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function add_InboundEndpointPairCreated
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; handler : TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InboundEndpointPairCreated
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateEndpointPairDefaultAsync
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; RetVal : access Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateEndpointPairWithBehaviorsAsync
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; behaviors : Windows.Networking.XboxLive.XboxLiveEndpointPairCreationBehaviors
      ; RetVal : access Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateEndpointPairForPortsDefaultAsync
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; initiatorPort : Windows.String
      ; acceptorPort : Windows.String
      ; RetVal : access Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateEndpointPairForPortsWithBehaviorsAsync
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; initiatorPort : Windows.String
      ; acceptorPort : Windows.String
      ; behaviors : Windows.Networking.XboxLive.XboxLiveEndpointPairCreationBehaviors
      ; RetVal : access Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SocketKind
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveSocketKind
   )
   return Windows.HRESULT is abstract;
   
   function get_InitiatorBoundPortRangeLower
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_InitiatorBoundPortRangeUpper
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_AcceptorBoundPortRangeLower
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_AcceptorBoundPortRangeUpper
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointPairs
   (
      This       : access IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPair -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPairStateChangedEventArgs : aliased constant Windows.IID := (1496202069, 56840, 17639, (172, 59, 185, 185, 161, 105, 88, 58 ));
   
   type IXboxLiveEndpointPairStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldState
   (
      This       : access IXboxLiveEndpointPairStateChangedEventArgs_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveEndpointPairState
   )
   return Windows.HRESULT is abstract;
   
   function get_NewState
   (
      This       : access IXboxLiveEndpointPairStateChangedEventArgs_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveEndpointPairState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPairStatics : aliased constant Windows.IID := (1680960304, 8570, 16963, (142, 225, 103, 41, 40, 29, 39, 219 ));
   
   type IXboxLiveEndpointPairStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindEndpointPairBySocketAddressBytes
   (
      This       : access IXboxLiveEndpointPairStatics_Interface
      ; localSocketAddress : Windows.UInt8_Ptr
      ; remoteSocketAddress : Windows.UInt8_Ptr
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   function FindEndpointPairByHostNamesAndPorts
   (
      This       : access IXboxLiveEndpointPairStatics_Interface
      ; localHostName : Windows.Networking.IHostName
      ; localPort : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remotePort : Windows.String
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveEndpointPair : aliased constant Windows.IID := (513442715, 33086, 17632, (184, 127, 200, 122, 9, 52, 117, 228 ));
   
   type IXboxLiveEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function add_StateChanged
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; handler : TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetRemoteSocketAddressBytes
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; socketAddress : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalSocketAddressBytes
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; socketAddress : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveEndpointPairState
   )
   return Windows.HRESULT is abstract;
   
   function get_Template
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteDeviceAddress
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteHostName
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemotePort
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalHostName
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalPort
   (
      This       : access IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveQualityOfServiceMetricResult : aliased constant Windows.IID := (2934723537, 13665, 18306, (176, 207, 211, 174, 41, 217, 250, 135 ));
   
   type IXboxLiveQualityOfServiceMetricResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurementStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAddress
   (
      This       : access IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Metric
   (
      This       : access IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveQualityOfServicePrivatePayloadResult : aliased constant Windows.IID := (1516438190, 28472, 16832, (159, 204, 234, 108, 185, 120, 202, 252 ));
   
   type IXboxLiveQualityOfServicePrivatePayloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurementStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAddress
   (
      This       : access IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveQualityOfServiceMeasurementStatics : aliased constant Windows.IID := (1848978890, 9167, 17418, (176, 119, 94, 48, 133, 122, 130, 52 ));
   
   type IXboxLiveQualityOfServiceMeasurementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function PublishPrivatePayloadBytes
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; payload : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function ClearPrivatePayload
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSimultaneousProbeConnections
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxSimultaneousProbeConnections
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSystemOutboundBandwidthConstrained
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSystemOutboundBandwidthConstrained
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSystemInboundBandwidthConstrained
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSystemInboundBandwidthConstrained
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PublishedPrivatePayload
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_PublishedPrivatePayload
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPrivatePayloadSize
   (
      This       : access IXboxLiveQualityOfServiceMeasurementStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXboxLiveQualityOfServiceMeasurement : aliased constant Windows.IID := (1298672590, 42454, 18406, (162, 54, 207, 222, 95, 189, 242, 237 ));
   
   type IXboxLiveQualityOfServiceMeasurement_Interface is interface and Windows.IInspectable_Interface;
   
   function MeasureAsync
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetMetricResultsForDevice
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveQualityOfServiceMetricResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMetricResultsForMetric
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; metric : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveQualityOfServiceMetricResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMetricResult
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; metric : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
   )
   return Windows.HRESULT is abstract;
   
   function GetPrivatePayloadResult
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; deviceAddress : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Metrics
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVector_XboxLiveQualityOfServiceMetric -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAddresses
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVector_IXboxLiveDeviceAddress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldRequestPrivatePayloads
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldRequestPrivatePayloads
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeoutInMilliseconds
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TimeoutInMilliseconds
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfProbesToAttempt
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_NumberOfProbesToAttempt
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfResultsPending
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MetricResults
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveQualityOfServiceMetricResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrivatePayloadResults
   (
      This       : access IXboxLiveQualityOfServiceMeasurement_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IXboxLiveEndpointPairTemplate : aliased constant Windows.IID := (1364406726, 14817, 23751, (132, 84, 127, 28, 139, 203, 161, 142 ));
   
   type IIterator_IXboxLiveEndpointPairTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXboxLiveEndpointPairTemplate_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXboxLiveEndpointPairTemplate : aliased constant Windows.IID := (2681099715, 21888, 22554, (133, 181, 136, 221, 94, 157, 79, 247 ));
   
   type IIterable_IXboxLiveEndpointPairTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_IXboxLiveEndpointPairTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXboxLiveEndpointPairTemplate : aliased constant Windows.IID := (287880459, 15044, 21566, (157, 126, 215, 150, 198, 34, 102, 105 ));
   
   type IVectorView_IXboxLiveEndpointPairTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXboxLiveEndpointPairTemplate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXboxLiveEndpointPairTemplate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXboxLiveEndpointPairTemplate_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXboxLiveEndpointPairTemplate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IXboxLiveEndpointPairCreationResult : aliased constant Windows.IID := (2763641886, 19244, 23545, (161, 157, 237, 57, 91, 35, 130, 60 ));
   
   type IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface
      ; handler : Windows.Networking.XboxLive.AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IXboxLiveEndpointPairCreationResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IXboxLiveEndpointPair : aliased constant Windows.IID := (3885410667, 39072, 21154, (187, 84, 157, 186, 91, 182, 79, 196 ));
   
   type IIterator_IXboxLiveEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXboxLiveEndpointPair_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveEndpointPair_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXboxLiveEndpointPair : aliased constant Windows.IID := (2144007782, 56768, 20700, (167, 111, 155, 182, 5, 139, 227, 201 ));
   
   type IIterable_IXboxLiveEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXboxLiveEndpointPair : aliased constant Windows.IID := (3364661783, 44618, 24140, (132, 53, 214, 219, 107, 18, 4, 100 ));
   
   type IVectorView_IXboxLiveEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXboxLiveEndpointPair_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXboxLiveEndpointPair_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXboxLiveEndpointPair_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveEndpointPair
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXboxLiveEndpointPair_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveEndpointPair_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IXboxLiveQualityOfServiceMetricResult : aliased constant Windows.IID := (3765004326, 105, 22486, (154, 216, 208, 179, 104, 98, 158, 46 ));
   
   type IIterator_IXboxLiveQualityOfServiceMetricResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXboxLiveQualityOfServiceMetricResult_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXboxLiveQualityOfServiceMetricResult : aliased constant Windows.IID := (1707907564, 38777, 22154, (137, 130, 174, 228, 57, 250, 36, 206 ));
   
   type IIterable_IXboxLiveQualityOfServiceMetricResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_IXboxLiveQualityOfServiceMetricResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXboxLiveQualityOfServiceMetricResult : aliased constant Windows.IID := (4250428975, 53766, 23895, (166, 173, 168, 69, 103, 24, 127, 48 ));
   
   type IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXboxLiveQualityOfServiceMetricResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_XboxLiveQualityOfServiceMetric : aliased constant Windows.IID := (2994859802, 22204, 23978, (187, 226, 101, 230, 23, 180, 153, 37 ));
   
   type IIterator_XboxLiveQualityOfServiceMetric_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_XboxLiveQualityOfServiceMetric_Interface
      ; items : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_XboxLiveQualityOfServiceMetric : aliased constant Windows.IID := (3791843062, 37821, 24482, (145, 252, 124, 166, 164, 237, 195, 138 ));
   
   type IIterable_XboxLiveQualityOfServiceMetric_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_XboxLiveQualityOfServiceMetric : aliased constant Windows.IID := (95512799, 38520, 20637, (144, 87, 167, 159, 216, 75, 84, 191 ));
   
   type IVectorView_XboxLiveQualityOfServiceMetric_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_XboxLiveQualityOfServiceMetric_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_XboxLiveQualityOfServiceMetric_Interface
      ; value : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_XboxLiveQualityOfServiceMetric_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_XboxLiveQualityOfServiceMetric : aliased constant Windows.IID := (2402355669, 56427, 22737, (159, 112, 96, 204, 71, 191, 28, 237 ));
   
   type IVector_XboxLiveQualityOfServiceMetric_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; value : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; value : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_XboxLiveQualityOfServiceMetric_Interface
      ; items : Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IXboxLiveDeviceAddress : aliased constant Windows.IID := (2247848195, 61278, 22342, (147, 65, 29, 251, 178, 29, 114, 13 ));
   
   type IIterator_IXboxLiveDeviceAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXboxLiveDeviceAddress_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveDeviceAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXboxLiveDeviceAddress : aliased constant Windows.IID := (1155498364, 46197, 24539, (134, 42, 74, 150, 237, 29, 173, 92 ));
   
   type IIterable_IXboxLiveDeviceAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXboxLiveDeviceAddress : aliased constant Windows.IID := (2690206303, 26189, 21234, (164, 239, 83, 162, 60, 13, 234, 61 ));
   
   type IVectorView_IXboxLiveDeviceAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXboxLiveDeviceAddress_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXboxLiveDeviceAddress_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXboxLiveDeviceAddress_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveDeviceAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IXboxLiveDeviceAddress : aliased constant Windows.IID := (2326573786, 50046, 23520, (171, 70, 186, 68, 89, 16, 185, 203 ));
   
   type IVector_IXboxLiveDeviceAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; RetVal : access Windows.Networking.XboxLive.IVectorView_IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveDeviceAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IXboxLiveDeviceAddress_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveDeviceAddress_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IXboxLiveQualityOfServicePrivatePayloadResult : aliased constant Windows.IID := (3948674548, 30871, 23743, (170, 165, 53, 130, 250, 251, 77, 120 ));
   
   type IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; items : Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IXboxLiveQualityOfServicePrivatePayloadResult : aliased constant Windows.IID := (973479380, 989, 21243, (154, 131, 6, 125, 226, 124, 43, 177 ));
   
   type IIterable_IXboxLiveQualityOfServicePrivatePayloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.Networking.XboxLive.IIterator_IXboxLiveQualityOfServicePrivatePayloadResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult : aliased constant Windows.IID := (2182840629, 30721, 23733, (186, 164, 253, 116, 119, 47, 185, 28 ));
   
   type IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; value : Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IXboxLiveQualityOfServicePrivatePayloadResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged : aliased constant Windows.IID := (2141675929, 53688, 21652, (160, 66, 112, 2, 164, 22, 173, 195 ));
   
   type TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface(Callback : access procedure (sender : Windows.Networking.XboxLive.IXboxLiveDeviceAddress ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated : aliased constant Windows.IID := (720326966, 28282, 20984, (136, 83, 204, 12, 228, 102, 254, 249 ));
   
   type TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface(Callback : access procedure (sender : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate ; args : Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
      ; args : Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult : aliased constant Windows.IID := (2908224029, 56091, 24053, (150, 148, 247, 27, 155, 213, 98, 91 ));
   
   type AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface
      ; asyncInfo : Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged : aliased constant Windows.IID := (1359180384, 17929, 22721, (173, 179, 6, 24, 184, 155, 153, 117 ));
   
   type TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Networking.XboxLive.IXboxLiveEndpointPair ; args : Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPair
      ; args : Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype XboxLiveDeviceAddress is Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   subtype XboxLiveEndpointPair is Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   subtype XboxLiveEndpointPairTemplate is Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate;
   subtype XboxLiveInboundEndpointPairCreatedEventArgs is Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs;
   subtype XboxLiveEndpointPairCreationResult is Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult;
   subtype XboxLiveEndpointPairStateChangedEventArgs is Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs;
   subtype XboxLiveQualityOfServiceMetricResult is Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult;
   subtype XboxLiveQualityOfServicePrivatePayloadResult is Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult;
   subtype XboxLiveQualityOfServiceMeasurement is Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement;
   function Create return Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateFromSnapshotBase64
   (
      base64 : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   
   function CreateFromSnapshotBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   
   function CreateFromSnapshotBytes
   (
      buffer : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   
   function GetLocal
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   
   function get_MaxSnapshotBytesSize
   return Windows.UInt32;
   
   function FindEndpointPairBySocketAddressBytes
   (
      localSocketAddress : Windows.UInt8_Ptr
      ; remoteSocketAddress : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   
   function FindEndpointPairByHostNamesAndPorts
   (
      localHostName : Windows.Networking.IHostName
      ; localPort : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remotePort : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   
   function GetTemplateByName
   (
      name : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate;
   
   function get_Templates
   return Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate;
   
   procedure PublishPrivatePayloadBytes
   (
      payload : Windows.UInt8_Ptr
   )
   ;
   
   procedure ClearPrivatePayload
   ;
   
   function get_MaxSimultaneousProbeConnections
   return Windows.UInt32;
   
   procedure put_MaxSimultaneousProbeConnections
   (
      value : Windows.UInt32
   )
   ;
   
   function get_IsSystemOutboundBandwidthConstrained
   return Windows.Boolean;
   
   procedure put_IsSystemOutboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   ;
   
   function get_IsSystemInboundBandwidthConstrained
   return Windows.Boolean;
   
   procedure put_IsSystemInboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   ;
   
   function get_PublishedPrivatePayload
   return Windows.Storage.Streams.IBuffer;
   
   procedure put_PublishedPrivatePayload
   (
      value : Windows.Storage.Streams.IBuffer
   )
   ;
   
   function get_MaxPrivatePayloadSize
   return Windows.UInt32;
   
end;
