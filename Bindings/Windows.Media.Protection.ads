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
limited with Windows.Media.Playback;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.Media.Protection is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type RevocationAndRenewalReasons is (
      UserModeComponentLoad,
      KernelModeComponentLoad,
      AppComponent,
      GlobalRevocationListLoadFailed,
      InvalidGlobalRevocationListSignature,
      GlobalRevocationListAbsent,
      ComponentRevoked,
      InvalidComponentCertificateExtendedKeyUse,
      ComponentCertificateRevoked,
      InvalidComponentCertificateRoot,
      ComponentHighSecurityCertificateRevoked,
      ComponentLowSecurityCertificateRevoked,
      BootDriverVerificationFailed,
      ComponentSignedWithTestCertificate,
      EncryptionFailure
   );
   for RevocationAndRenewalReasons use (
      UserModeComponentLoad => 1,
      KernelModeComponentLoad => 2,
      AppComponent => 4,
      GlobalRevocationListLoadFailed => 16,
      InvalidGlobalRevocationListSignature => 32,
      GlobalRevocationListAbsent => 4096,
      ComponentRevoked => 8192,
      InvalidComponentCertificateExtendedKeyUse => 16384,
      ComponentCertificateRevoked => 32768,
      InvalidComponentCertificateRoot => 65536,
      ComponentHighSecurityCertificateRevoked => 131072,
      ComponentLowSecurityCertificateRevoked => 262144,
      BootDriverVerificationFailed => 1048576,
      ComponentSignedWithTestCertificate => 16777216,
      EncryptionFailure => 268435456
   );
   for RevocationAndRenewalReasons'Size use 32;
   
   type RevocationAndRenewalReasons_Ptr is access RevocationAndRenewalReasons;
   
   type GraphicsTrustStatus is (
      TrustNotRequired,
      TrustEstablished,
      EnvironmentNotSupported,
      DriverNotSupported,
      DriverSigningFailure,
      UnknownFailure
   );
   for GraphicsTrustStatus use (
      TrustNotRequired => 0,
      TrustEstablished => 1,
      EnvironmentNotSupported => 2,
      DriverNotSupported => 3,
      DriverSigningFailure => 4,
      UnknownFailure => 5
   );
   for GraphicsTrustStatus'Size use 32;
   
   type GraphicsTrustStatus_Ptr is access GraphicsTrustStatus;
   
   type ProtectionCapabilityResult is (
      NotSupported,
      Maybe,
      Probably
   );
   for ProtectionCapabilityResult use (
      NotSupported => 0,
      Maybe => 1,
      Probably => 2
   );
   for ProtectionCapabilityResult'Size use 32;
   
   type ProtectionCapabilityResult_Ptr is access ProtectionCapabilityResult;
   
   type HdcpProtection is (
      Off,
      On,
      OnWithTypeEnforcement
   );
   for HdcpProtection use (
      Off => 0,
      On => 1,
      OnWithTypeEnforcement => 2
   );
   for HdcpProtection'Size use 32;
   
   type HdcpProtection_Ptr is access HdcpProtection;
   
   type HdcpSetProtectionResult is (
      Success,
      TimedOut,
      NotSupported,
      UnknownFailure
   );
   for HdcpSetProtectionResult use (
      Success => 0,
      TimedOut => 1,
      NotSupported => 2,
      UnknownFailure => 3
   );
   for HdcpSetProtectionResult'Size use 32;
   
   type HdcpSetProtectionResult_Ptr is access HdcpSetProtectionResult;
   
   type RenewalStatus is (
      NotStarted,
      UpdatesInProgress,
      UserCancelled,
      AppComponentsMayNeedUpdating,
      NoComponentsFound
   );
   for RenewalStatus use (
      NotStarted => 0,
      UpdatesInProgress => 1,
      UserCancelled => 2,
      AppComponentsMayNeedUpdating => 3,
      NoComponentsFound => 4
   );
   for RenewalStatus'Size use 32;
   
   type RenewalStatus_Ptr is access RenewalStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ProtectionRenewalContract is null record;
   pragma Convention (C_Pass_By_Copy , ProtectionRenewalContract);
   
   type ProtectionRenewalContract_Ptr is access ProtectionRenewalContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type ServiceRequestedEventHandler_Interface;
   type ServiceRequestedEventHandler is access all ServiceRequestedEventHandler_Interface'Class;
   type ServiceRequestedEventHandler_Ptr is access all ServiceRequestedEventHandler;
   type RebootNeededEventHandler_Interface;
   type RebootNeededEventHandler is access all RebootNeededEventHandler_Interface'Class;
   type RebootNeededEventHandler_Ptr is access all RebootNeededEventHandler;
   type ComponentLoadFailedEventHandler_Interface;
   type ComponentLoadFailedEventHandler is access all ComponentLoadFailedEventHandler_Interface'Class;
   type ComponentLoadFailedEventHandler_Ptr is access all ComponentLoadFailedEventHandler;
   type AsyncOperationCompletedHandler_HdcpSetProtectionResult_Interface;
   type AsyncOperationCompletedHandler_HdcpSetProtectionResult is access all AsyncOperationCompletedHandler_HdcpSetProtectionResult_Interface'Class;
   type AsyncOperationCompletedHandler_HdcpSetProtectionResult_Ptr is access all AsyncOperationCompletedHandler_HdcpSetProtectionResult;
   type TypedEventHandler_IHdcpSession_add_ProtectionChanged_Interface;
   type TypedEventHandler_IHdcpSession_add_ProtectionChanged is access all TypedEventHandler_IHdcpSession_add_ProtectionChanged_Interface'Class;
   type TypedEventHandler_IHdcpSession_add_ProtectionChanged_Ptr is access all TypedEventHandler_IHdcpSession_add_ProtectionChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaProtectionManager_Interface;
   type IMediaProtectionManager is access all IMediaProtectionManager_Interface'Class;
   type IMediaProtectionManager_Ptr is access all IMediaProtectionManager;
   type IMediaProtectionServiceCompletion_Interface;
   type IMediaProtectionServiceCompletion is access all IMediaProtectionServiceCompletion_Interface'Class;
   type IMediaProtectionServiceCompletion_Ptr is access all IMediaProtectionServiceCompletion;
   type IServiceRequestedEventArgs_Interface;
   type IServiceRequestedEventArgs is access all IServiceRequestedEventArgs_Interface'Class;
   type IServiceRequestedEventArgs_Ptr is access all IServiceRequestedEventArgs;
   type IMediaProtectionServiceRequest_Interface;
   type IMediaProtectionServiceRequest is access all IMediaProtectionServiceRequest_Interface'Class;
   type IMediaProtectionServiceRequest_Ptr is access all IMediaProtectionServiceRequest;
   type IServiceRequestedEventArgs2_Interface;
   type IServiceRequestedEventArgs2 is access all IServiceRequestedEventArgs2_Interface'Class;
   type IServiceRequestedEventArgs2_Ptr is access all IServiceRequestedEventArgs2;
   type IComponentLoadFailedEventArgs_Interface;
   type IComponentLoadFailedEventArgs is access all IComponentLoadFailedEventArgs_Interface'Class;
   type IComponentLoadFailedEventArgs_Ptr is access all IComponentLoadFailedEventArgs;
   type IRevocationAndRenewalInformation_Interface;
   type IRevocationAndRenewalInformation is access all IRevocationAndRenewalInformation_Interface'Class;
   type IRevocationAndRenewalInformation_Ptr is access all IRevocationAndRenewalInformation;
   type IRevocationAndRenewalItem_Interface;
   type IRevocationAndRenewalItem is access all IRevocationAndRenewalItem_Interface'Class;
   type IRevocationAndRenewalItem_Ptr is access all IRevocationAndRenewalItem;
   type IMediaProtectionPMPServerFactory_Interface;
   type IMediaProtectionPMPServerFactory is access all IMediaProtectionPMPServerFactory_Interface'Class;
   type IMediaProtectionPMPServerFactory_Ptr is access all IMediaProtectionPMPServerFactory;
   type IMediaProtectionPMPServer_Interface;
   type IMediaProtectionPMPServer is access all IMediaProtectionPMPServer_Interface'Class;
   type IMediaProtectionPMPServer_Ptr is access all IMediaProtectionPMPServer;
   type IProtectionCapabilities_Interface;
   type IProtectionCapabilities is access all IProtectionCapabilities_Interface'Class;
   type IProtectionCapabilities_Ptr is access all IProtectionCapabilities;
   type IHdcpSession_Interface;
   type IHdcpSession is access all IHdcpSession_Interface'Class;
   type IHdcpSession_Ptr is access all IHdcpSession;
   type IComponentRenewalStatics_Interface;
   type IComponentRenewalStatics is access all IComponentRenewalStatics_Interface'Class;
   type IComponentRenewalStatics_Ptr is access all IComponentRenewalStatics;
   type IIterator_IRevocationAndRenewalItem_Interface;
   type IIterator_IRevocationAndRenewalItem is access all IIterator_IRevocationAndRenewalItem_Interface'Class;
   type IIterator_IRevocationAndRenewalItem_Ptr is access all IIterator_IRevocationAndRenewalItem;
   type IIterable_IRevocationAndRenewalItem_Interface;
   type IIterable_IRevocationAndRenewalItem is access all IIterable_IRevocationAndRenewalItem_Interface'Class;
   type IIterable_IRevocationAndRenewalItem_Ptr is access all IIterable_IRevocationAndRenewalItem;
   type IVectorView_IRevocationAndRenewalItem_Interface;
   type IVectorView_IRevocationAndRenewalItem is access all IVectorView_IRevocationAndRenewalItem_Interface'Class;
   type IVectorView_IRevocationAndRenewalItem_Ptr is access all IVectorView_IRevocationAndRenewalItem;
   type IVector_IRevocationAndRenewalItem_Interface;
   type IVector_IRevocationAndRenewalItem is access all IVector_IRevocationAndRenewalItem_Interface'Class;
   type IVector_IRevocationAndRenewalItem_Ptr is access all IVector_IRevocationAndRenewalItem;
   type IReference_HdcpProtection_Interface;
   type IReference_HdcpProtection is access all IReference_HdcpProtection_Interface'Class;
   type IReference_HdcpProtection_Ptr is access all IReference_HdcpProtection;
   type IAsyncOperation_HdcpSetProtectionResult_Interface;
   type IAsyncOperation_HdcpSetProtectionResult is access all IAsyncOperation_HdcpSetProtectionResult_Interface'Class;
   type IAsyncOperation_HdcpSetProtectionResult_Ptr is access all IAsyncOperation_HdcpSetProtectionResult;
   
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
   
   IID_IMediaProtectionManager : aliased constant Windows.IID := (1164527943, 51009, 17227, (167, 158, 71, 76, 18, 217, 61, 47 ));
   
   type IMediaProtectionManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ServiceRequested
   (
      This       : access IMediaProtectionManager_Interface
      ; handler : Windows.Media.Protection.ServiceRequestedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServiceRequested
   (
      This       : access IMediaProtectionManager_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RebootNeeded
   (
      This       : access IMediaProtectionManager_Interface
      ; handler : Windows.Media.Protection.RebootNeededEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RebootNeeded
   (
      This       : access IMediaProtectionManager_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ComponentLoadFailed
   (
      This       : access IMediaProtectionManager_Interface
      ; handler : Windows.Media.Protection.ComponentLoadFailedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ComponentLoadFailed
   (
      This       : access IMediaProtectionManager_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMediaProtectionManager_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaProtectionServiceCompletion : aliased constant Windows.IID := (2338114072, 53205, 17646, (162, 237, 223, 118, 1, 12, 20, 181 ));
   
   type IMediaProtectionServiceCompletion_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMediaProtectionServiceCompletion_Interface
      ; success : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IServiceRequestedEventArgs : aliased constant Windows.IID := (875051951, 43956, 20417, (189, 137, 147, 241, 6, 87, 58, 73 ));
   
   type IServiceRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IServiceRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.IMediaProtectionServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_Completion
   (
      This       : access IServiceRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.IMediaProtectionServiceCompletion
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaProtectionServiceRequest : aliased constant Windows.IID := (2984119974, 8340, 18317, (135, 164, 139, 149, 32, 15, 133, 198 ));
   
   type IMediaProtectionServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtectionSystem
   (
      This       : access IMediaProtectionServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IMediaProtectionServiceRequest_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IServiceRequestedEventArgs2 : aliased constant Windows.IID := (1430022614, 64254, 16680, (141, 250, 19, 14, 57, 138, 19, 167 ));
   
   type IServiceRequestedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaPlaybackItem
   (
      This       : access IServiceRequestedEventArgs2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IComponentLoadFailedEventArgs : aliased constant Windows.IID := (2509713043, 30534, 16766, (132, 149, 240, 49, 187, 197, 134, 44 ));
   
   type IComponentLoadFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Information
   (
      This       : access IComponentLoadFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.IRevocationAndRenewalInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completion
   (
      This       : access IComponentLoadFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Protection.IMediaProtectionServiceCompletion
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRevocationAndRenewalInformation : aliased constant Windows.IID := (4087452539, 9473, 17310, (166, 231, 111, 201, 94, 23, 95, 207 ));
   
   type IRevocationAndRenewalInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Items
   (
      This       : access IRevocationAndRenewalInformation_Interface
      ; RetVal : access Windows.Media.Protection.IVector_IRevocationAndRenewalItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRevocationAndRenewalItem : aliased constant Windows.IID := (815383052, 15600, 18922, (144, 45, 202, 243, 45, 45, 222, 44 ));
   
   type IRevocationAndRenewalItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reasons
   (
      This       : access IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Media.Protection.RevocationAndRenewalReasons
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderHash
   (
      This       : access IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicKeyHash
   (
      This       : access IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RenewalId
   (
      This       : access IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaProtectionPMPServerFactory : aliased constant Windows.IID := (1613532766, 63442, 18558, (175, 145, 219, 196, 37, 43, 33, 130 ));
   
   type IMediaProtectionPMPServerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePMPServer
   (
      This       : access IMediaProtectionPMPServerFactory_Interface
      ; pProperties : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Protection.IMediaProtectionPMPServer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaProtectionPMPServer : aliased constant Windows.IID := (202445350, 31526, 19761, (149, 187, 156, 27, 8, 239, 127, 192 ));
   
   type IMediaProtectionPMPServer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IMediaProtectionPMPServer_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProtectionCapabilities : aliased constant Windows.IID := (3349962110, 29824, 19753, (164, 100, 123, 205, 145, 61, 216, 228 ));
   
   type IProtectionCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function IsTypeSupported
   (
      This       : access IProtectionCapabilities_Interface
      ; type_x : Windows.String
      ; keySystem : Windows.String
      ; RetVal : access Windows.Media.Protection.ProtectionCapabilityResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IHdcpSession : aliased constant Windows.IID := (1904756201, 25815, 17005, (128, 155, 27, 228, 97, 148, 26, 42 ));
   
   type IHdcpSession_Interface is interface and Windows.IInspectable_Interface;
   
   function IsEffectiveProtectionAtLeast
   (
      This       : access IHdcpSession_Interface
      ; protection : Windows.Media.Protection.HdcpProtection
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetEffectiveProtection
   (
      This       : access IHdcpSession_Interface
      ; RetVal : access Windows.Media.Protection.IReference_HdcpProtection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetDesiredMinProtectionAsync
   (
      This       : access IHdcpSession_Interface
      ; protection : Windows.Media.Protection.HdcpProtection
      ; RetVal : access Windows.Media.Protection.IAsyncOperation_HdcpSetProtectionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ProtectionChanged
   (
      This       : access IHdcpSession_Interface
      ; handler : TypedEventHandler_IHdcpSession_add_ProtectionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProtectionChanged
   (
      This       : access IHdcpSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IComponentRenewalStatics : aliased constant Windows.IID := (1878773095, 46997, 18629, (139, 123, 167, 196, 239, 226, 2, 227 ));
   
   type IComponentRenewalStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RenewSystemComponentsAsync
   (
      This       : access IComponentRenewalStatics_Interface
      ; information : Windows.Media.Protection.IRevocationAndRenewalInformation
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IRevocationAndRenewalItem : aliased constant Windows.IID := (3753469276, 35618, 20767, (142, 175, 58, 234, 117, 33, 128, 43 ));
   
   type IIterator_IRevocationAndRenewalItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRevocationAndRenewalItem_Interface
      ; items : Windows.Media.Protection.IRevocationAndRenewalItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IRevocationAndRenewalItem : aliased constant Windows.IID := (117528680, 22412, 21867, (138, 53, 64, 57, 163, 93, 29, 146 ));
   
   type IIterable_IRevocationAndRenewalItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Media.Protection.IIterator_IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IRevocationAndRenewalItem : aliased constant Windows.IID := (1250399202, 13240, 22608, (153, 67, 106, 148, 55, 92, 170, 137 ));
   
   type IVectorView_IRevocationAndRenewalItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRevocationAndRenewalItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRevocationAndRenewalItem_Interface
      ; value : Windows.Media.Protection.IRevocationAndRenewalItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRevocationAndRenewalItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Protection.IRevocationAndRenewalItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVector_IRevocationAndRenewalItem : aliased constant Windows.IID := (908315660, 51045, 22523, (150, 125, 199, 203, 96, 151, 189, 120 ));
   
   type IVector_IRevocationAndRenewalItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; RetVal : access Windows.Media.Protection.IVectorView_IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; value : Windows.Media.Protection.IRevocationAndRenewalItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; value : Windows.Media.Protection.IRevocationAndRenewalItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Protection.IRevocationAndRenewalItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IRevocationAndRenewalItem_Interface
      ; items : Windows.Media.Protection.IRevocationAndRenewalItem_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IReference_HdcpProtection : aliased constant Windows.IID := (2385709433, 12271, 23912, (136, 170, 169, 238, 102, 151, 209, 23 ));
   
   type IReference_HdcpProtection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_HdcpProtection_Interface
      ; RetVal : access Windows.Media.Protection.HdcpProtection
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_HdcpSetProtectionResult : aliased constant Windows.IID := (1348595215, 35226, 22172, (160, 163, 194, 86, 110, 184, 129, 66 ));
   
   type IAsyncOperation_HdcpSetProtectionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_HdcpSetProtectionResult_Interface
      ; handler : Windows.Media.Protection.AsyncOperationCompletedHandler_HdcpSetProtectionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_HdcpSetProtectionResult_Interface
      ; RetVal : access Windows.Media.Protection.AsyncOperationCompletedHandler_HdcpSetProtectionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_HdcpSetProtectionResult_Interface
      ; RetVal : access Windows.Media.Protection.HdcpSetProtectionResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ServiceRequestedEventHandler : aliased constant Windows.IID := (3537277114, 51913, 18657, (149, 192, 211, 132, 149, 168, 64, 85 ));
   
   type ServiceRequestedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Protection.IMediaProtectionManager ; e : Windows.Media.Protection.IServiceRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ServiceRequestedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access ServiceRequestedEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
      ; e : Windows.Media.Protection.IServiceRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_RebootNeededEventHandler : aliased constant Windows.IID := (1692478021, 38715, 19002, (178, 96, 145, 137, 138, 73, 168, 44 ));
   
   type RebootNeededEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Protection.IMediaProtectionManager)) is new Windows.IMulticastDelegate_Interface(IID_RebootNeededEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access RebootNeededEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ComponentLoadFailedEventHandler : aliased constant Windows.IID := (2514117692, 28089, 16971, (134, 202, 9, 26, 244, 50, 8, 28 ));
   
   type ComponentLoadFailedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Protection.IMediaProtectionManager ; e : Windows.Media.Protection.IComponentLoadFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ComponentLoadFailedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access ComponentLoadFailedEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
      ; e : Windows.Media.Protection.IComponentLoadFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_HdcpSetProtectionResult : aliased constant Windows.IID := (422857304, 42433, 20840, (128, 62, 99, 39, 113, 98, 129, 67 ));
   
   type AsyncOperationCompletedHandler_HdcpSetProtectionResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Protection.IAsyncOperation_HdcpSetProtectionResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_HdcpSetProtectionResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_HdcpSetProtectionResult_Interface
      ; asyncInfo : Windows.Media.Protection.IAsyncOperation_HdcpSetProtectionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHdcpSession_add_ProtectionChanged : aliased constant Windows.IID := (4163559491, 21755, 21350, (166, 7, 25, 182, 142, 107, 171, 140 ));
   
   type TypedEventHandler_IHdcpSession_add_ProtectionChanged_Interface(Callback : access procedure (sender : Windows.Media.Protection.IHdcpSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHdcpSession_add_ProtectionChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHdcpSession_add_ProtectionChanged_Interface
      ; sender : Windows.Media.Protection.IHdcpSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MediaProtectionManager is Windows.Media.Protection.IMediaProtectionManager;
   
   function CreateMediaProtectionManager return Windows.Media.Protection.IMediaProtectionManager;
   
   subtype ServiceRequestedEventArgs is Windows.Media.Protection.IServiceRequestedEventArgs;
   subtype ComponentLoadFailedEventArgs is Windows.Media.Protection.IComponentLoadFailedEventArgs;
   subtype MediaProtectionServiceCompletion is Windows.Media.Protection.IMediaProtectionServiceCompletion;
   subtype RevocationAndRenewalInformation is Windows.Media.Protection.IRevocationAndRenewalInformation;
   subtype RevocationAndRenewalItem is Windows.Media.Protection.IRevocationAndRenewalItem;
   subtype MediaProtectionPMPServer is Windows.Media.Protection.IMediaProtectionPMPServer;
   
   function CreatePMPServer
   (
      pProperties : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Protection.IMediaProtectionPMPServer;
   
   subtype ProtectionCapabilities is Windows.Media.Protection.IProtectionCapabilities;
   
   function CreateProtectionCapabilities return Windows.Media.Protection.IProtectionCapabilities;
   
   subtype HdcpSession is Windows.Media.Protection.IHdcpSession;
   
   function CreateHdcpSession return Windows.Media.Protection.IHdcpSession;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RenewSystemComponentsAsync
   (
      information : Windows.Media.Protection.IRevocationAndRenewalInformation
   )
   return Windows.Address;

end;
