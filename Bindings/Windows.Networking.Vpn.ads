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
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Security.Credentials;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.Storage.Streams;
limited with Windows.Networking.Sockets;
--------------------------------------------------------------------------------
package Windows.Networking.Vpn is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type VpnDataPathType is (
      Send,
      Receive
   );
   for VpnDataPathType use (
      Send => 0,
      Receive => 1
   );
   for VpnDataPathType'Size use 32;
   
   type VpnDataPathType_Ptr is access VpnDataPathType;
   
   type VpnChannelActivityEventType is (
      Idle,
      Active
   );
   for VpnChannelActivityEventType use (
      Idle => 0,
      Active => 1
   );
   for VpnChannelActivityEventType'Size use 32;
   
   type VpnChannelActivityEventType_Ptr is access VpnChannelActivityEventType;
   
   type VpnCredentialType is (
      UsernamePassword,
      UsernameOtpPin,
      UsernamePasswordAndPin,
      UsernamePasswordChange,
      SmartCard,
      ProtectedCertificate,
      UnProtectedCertificate
   );
   for VpnCredentialType use (
      UsernamePassword => 0,
      UsernameOtpPin => 1,
      UsernamePasswordAndPin => 2,
      UsernamePasswordChange => 3,
      SmartCard => 4,
      ProtectedCertificate => 5,
      UnProtectedCertificate => 6
   );
   for VpnCredentialType'Size use 32;
   
   type VpnCredentialType_Ptr is access VpnCredentialType;
   
   type VpnPacketBufferStatus is (
      Ok,
      InvalidBufferSize
   );
   for VpnPacketBufferStatus use (
      Ok => 0,
      InvalidBufferSize => 1
   );
   for VpnPacketBufferStatus'Size use 32;
   
   type VpnPacketBufferStatus_Ptr is access VpnPacketBufferStatus;
   
   type VpnChannelRequestCredentialsOptions is (
      None,
      Retrying,
      UseForSingleSignIn
   );
   for VpnChannelRequestCredentialsOptions use (
      None => 0,
      Retrying => 1,
      UseForSingleSignIn => 2
   );
   for VpnChannelRequestCredentialsOptions'Size use 32;
   
   type VpnChannelRequestCredentialsOptions_Ptr is access VpnChannelRequestCredentialsOptions;
   
   type VpnDomainNameType is (
      Suffix,
      FullyQualified,
      Reserved
   );
   for VpnDomainNameType use (
      Suffix => 0,
      FullyQualified => 1,
      Reserved => 65535
   );
   for VpnDomainNameType'Size use 32;
   
   type VpnDomainNameType_Ptr is access VpnDomainNameType;
   
   type VpnAppIdType is (
      PackageFamilyName,
      FullyQualifiedBinaryName,
      FilePath
   );
   for VpnAppIdType use (
      PackageFamilyName => 0,
      FullyQualifiedBinaryName => 1,
      FilePath => 2
   );
   for VpnAppIdType'Size use 32;
   
   type VpnAppIdType_Ptr is access VpnAppIdType;
   
   type VpnIPProtocol is (
      None,
      Icmp,
      Igmp,
      Tcp,
      Udp,
      Ipv6Icmp,
      Pgm
   );
   for VpnIPProtocol use (
      None => 0,
      Icmp => 1,
      Igmp => 2,
      Tcp => 6,
      Udp => 17,
      Ipv6Icmp => 58,
      Pgm => 113
   );
   for VpnIPProtocol'Size use 32;
   
   type VpnIPProtocol_Ptr is access VpnIPProtocol;
   
   type VpnRoutingPolicyType is (
      SplitRouting,
      ForceAllTrafficOverVpn
   );
   for VpnRoutingPolicyType use (
      SplitRouting => 0,
      ForceAllTrafficOverVpn => 1
   );
   for VpnRoutingPolicyType'Size use 32;
   
   type VpnRoutingPolicyType_Ptr is access VpnRoutingPolicyType;
   
   type VpnManagementConnectionStatus is (
      Disconnected,
      Disconnecting,
      Connected,
      Connecting
   );
   for VpnManagementConnectionStatus use (
      Disconnected => 0,
      Disconnecting => 1,
      Connected => 2,
      Connecting => 3
   );
   for VpnManagementConnectionStatus'Size use 32;
   
   type VpnManagementConnectionStatus_Ptr is access VpnManagementConnectionStatus;
   
   type VpnNativeProtocolType is (
      Pptp,
      L2tp,
      IpsecIkev2
   );
   for VpnNativeProtocolType use (
      Pptp => 0,
      L2tp => 1,
      IpsecIkev2 => 2
   );
   for VpnNativeProtocolType'Size use 32;
   
   type VpnNativeProtocolType_Ptr is access VpnNativeProtocolType;
   
   type VpnAuthenticationMethod is (
      Mschapv2,
      Eap,
      Certificate,
      PresharedKey
   );
   for VpnAuthenticationMethod use (
      Mschapv2 => 0,
      Eap => 1,
      Certificate => 2,
      PresharedKey => 3
   );
   for VpnAuthenticationMethod'Size use 32;
   
   type VpnAuthenticationMethod_Ptr is access VpnAuthenticationMethod;
   
   type VpnManagementErrorStatus is (
      Ok,
      Other,
      InvalidXmlSyntax,
      ProfileNameTooLong,
      ProfileInvalidAppId,
      AccessDenied,
      CannotFindProfile,
      AlreadyDisconnecting,
      AlreadyConnected,
      GeneralAuthenticationFailure,
      EapFailure,
      SmartCardFailure,
      CertificateFailure,
      ServerConfiguration,
      NoConnection,
      ServerConnection,
      UserNamePassword,
      DnsNotResolvable,
      InvalidIP
   );
   for VpnManagementErrorStatus use (
      Ok => 0,
      Other => 1,
      InvalidXmlSyntax => 2,
      ProfileNameTooLong => 3,
      ProfileInvalidAppId => 4,
      AccessDenied => 5,
      CannotFindProfile => 6,
      AlreadyDisconnecting => 7,
      AlreadyConnected => 8,
      GeneralAuthenticationFailure => 9,
      EapFailure => 10,
      SmartCardFailure => 11,
      CertificateFailure => 12,
      ServerConfiguration => 13,
      NoConnection => 14,
      ServerConnection => 15,
      UserNamePassword => 16,
      DnsNotResolvable => 17,
      InvalidIP => 18
   );
   for VpnManagementErrorStatus'Size use 32;
   
   type VpnManagementErrorStatus_Ptr is access VpnManagementErrorStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IVpnChannel_add_ActivityChange_Interface;
   type TypedEventHandler_IVpnChannel_add_ActivityChange is access all TypedEventHandler_IVpnChannel_add_ActivityChange_Interface'Class;
   type TypedEventHandler_IVpnChannel_add_ActivityChange_Ptr is access all TypedEventHandler_IVpnChannel_add_ActivityChange;
   type TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface;
   type TypedEventHandler_IVpnChannel2_add_ActivityStateChange is access all TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface'Class;
   type TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Ptr is access all TypedEventHandler_IVpnChannel2_add_ActivityStateChange;
   type AsyncOperationCompletedHandler_IVpnCredential_Interface;
   type AsyncOperationCompletedHandler_IVpnCredential is access all AsyncOperationCompletedHandler_IVpnCredential_Interface'Class;
   type AsyncOperationCompletedHandler_IVpnCredential_Ptr is access all AsyncOperationCompletedHandler_IVpnCredential;
   type AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface;
   type AsyncOperationCompletedHandler_VpnManagementErrorStatus is access all AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface'Class;
   type AsyncOperationCompletedHandler_VpnManagementErrorStatus_Ptr is access all AsyncOperationCompletedHandler_VpnManagementErrorStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVpnPlugIn_Interface;
   type IVpnPlugIn is access all IVpnPlugIn_Interface'Class;
   type IVpnPlugIn_Ptr is access all IVpnPlugIn;
   type IVpnCustomPrompt_Interface;
   type IVpnCustomPrompt is access all IVpnCustomPrompt_Interface'Class;
   type IVpnCustomPrompt_Ptr is access all IVpnCustomPrompt;
   type IVpnCustomEditBox_Interface;
   type IVpnCustomEditBox is access all IVpnCustomEditBox_Interface'Class;
   type IVpnCustomEditBox_Ptr is access all IVpnCustomEditBox;
   type IVpnCustomComboBox_Interface;
   type IVpnCustomComboBox is access all IVpnCustomComboBox_Interface'Class;
   type IVpnCustomComboBox_Ptr is access all IVpnCustomComboBox;
   type IVpnCustomTextBox_Interface;
   type IVpnCustomTextBox is access all IVpnCustomTextBox_Interface'Class;
   type IVpnCustomTextBox_Ptr is access all IVpnCustomTextBox;
   type IVpnCustomCheckBox_Interface;
   type IVpnCustomCheckBox is access all IVpnCustomCheckBox_Interface'Class;
   type IVpnCustomCheckBox_Ptr is access all IVpnCustomCheckBox;
   type IVpnCustomErrorBox_Interface;
   type IVpnCustomErrorBox is access all IVpnCustomErrorBox_Interface'Class;
   type IVpnCustomErrorBox_Ptr is access all IVpnCustomErrorBox;
   type IVpnRouteFactory_Interface;
   type IVpnRouteFactory is access all IVpnRouteFactory_Interface'Class;
   type IVpnRouteFactory_Ptr is access all IVpnRouteFactory;
   type IVpnRoute_Interface;
   type IVpnRoute is access all IVpnRoute_Interface'Class;
   type IVpnRoute_Ptr is access all IVpnRoute;
   type IVpnRouteAssignment_Interface;
   type IVpnRouteAssignment is access all IVpnRouteAssignment_Interface'Class;
   type IVpnRouteAssignment_Ptr is access all IVpnRouteAssignment;
   type IVpnNamespaceInfoFactory_Interface;
   type IVpnNamespaceInfoFactory is access all IVpnNamespaceInfoFactory_Interface'Class;
   type IVpnNamespaceInfoFactory_Ptr is access all IVpnNamespaceInfoFactory;
   type IVpnNamespaceInfo_Interface;
   type IVpnNamespaceInfo is access all IVpnNamespaceInfo_Interface'Class;
   type IVpnNamespaceInfo_Ptr is access all IVpnNamespaceInfo;
   type IVpnNamespaceAssignment_Interface;
   type IVpnNamespaceAssignment is access all IVpnNamespaceAssignment_Interface'Class;
   type IVpnNamespaceAssignment_Ptr is access all IVpnNamespaceAssignment;
   type IVpnInterfaceIdFactory_Interface;
   type IVpnInterfaceIdFactory is access all IVpnInterfaceIdFactory_Interface'Class;
   type IVpnInterfaceIdFactory_Ptr is access all IVpnInterfaceIdFactory;
   type IVpnInterfaceId_Interface;
   type IVpnInterfaceId is access all IVpnInterfaceId_Interface'Class;
   type IVpnInterfaceId_Ptr is access all IVpnInterfaceId;
   type IVpnPickedCredential_Interface;
   type IVpnPickedCredential is access all IVpnPickedCredential_Interface'Class;
   type IVpnPickedCredential_Ptr is access all IVpnPickedCredential;
   type IVpnCredential_Interface;
   type IVpnCredential is access all IVpnCredential_Interface'Class;
   type IVpnCredential_Ptr is access all IVpnCredential;
   type IVpnSystemHealth_Interface;
   type IVpnSystemHealth is access all IVpnSystemHealth_Interface'Class;
   type IVpnSystemHealth_Ptr is access all IVpnSystemHealth;
   type IVpnChannelConfiguration_Interface;
   type IVpnChannelConfiguration is access all IVpnChannelConfiguration_Interface'Class;
   type IVpnChannelConfiguration_Ptr is access all IVpnChannelConfiguration;
   type IVpnChannelConfiguration2_Interface;
   type IVpnChannelConfiguration2 is access all IVpnChannelConfiguration2_Interface'Class;
   type IVpnChannelConfiguration2_Ptr is access all IVpnChannelConfiguration2;
   type IVpnChannelActivityEventArgs_Interface;
   type IVpnChannelActivityEventArgs is access all IVpnChannelActivityEventArgs_Interface'Class;
   type IVpnChannelActivityEventArgs_Ptr is access all IVpnChannelActivityEventArgs;
   type IVpnChannel_Interface;
   type IVpnChannel is access all IVpnChannel_Interface'Class;
   type IVpnChannel_Ptr is access all IVpnChannel;
   type IVpnChannel2_Interface;
   type IVpnChannel2 is access all IVpnChannel2_Interface'Class;
   type IVpnChannel2_Ptr is access all IVpnChannel2;
   type IVpnCustomPromptElement_Interface;
   type IVpnCustomPromptElement is access all IVpnCustomPromptElement_Interface'Class;
   type IVpnCustomPromptElement_Ptr is access all IVpnCustomPromptElement;
   type IVpnChannel4_Interface;
   type IVpnChannel4 is access all IVpnChannel4_Interface'Class;
   type IVpnChannel4_Ptr is access all IVpnChannel4;
   type IVpnChannelStatics_Interface;
   type IVpnChannelStatics is access all IVpnChannelStatics_Interface'Class;
   type IVpnChannelStatics_Ptr is access all IVpnChannelStatics;
   type IVpnPacketBufferFactory_Interface;
   type IVpnPacketBufferFactory is access all IVpnPacketBufferFactory_Interface'Class;
   type IVpnPacketBufferFactory_Ptr is access all IVpnPacketBufferFactory;
   type IVpnPacketBuffer_Interface;
   type IVpnPacketBuffer is access all IVpnPacketBuffer_Interface'Class;
   type IVpnPacketBuffer_Ptr is access all IVpnPacketBuffer;
   type IVpnPacketBuffer2_Interface;
   type IVpnPacketBuffer2 is access all IVpnPacketBuffer2_Interface'Class;
   type IVpnPacketBuffer2_Ptr is access all IVpnPacketBuffer2;
   type IVpnPacketBuffer3_Interface;
   type IVpnPacketBuffer3 is access all IVpnPacketBuffer3_Interface'Class;
   type IVpnPacketBuffer3_Ptr is access all IVpnPacketBuffer3;
   type IVpnPacketBufferList_Interface;
   type IVpnPacketBufferList is access all IVpnPacketBufferList_Interface'Class;
   type IVpnPacketBufferList_Ptr is access all IVpnPacketBufferList;
   type IVpnPacketBufferList2_Interface;
   type IVpnPacketBufferList2 is access all IVpnPacketBufferList2_Interface'Class;
   type IVpnPacketBufferList2_Ptr is access all IVpnPacketBufferList2;
   type IVpnCustomPromptTextInput_Interface;
   type IVpnCustomPromptTextInput is access all IVpnCustomPromptTextInput_Interface'Class;
   type IVpnCustomPromptTextInput_Ptr is access all IVpnCustomPromptTextInput;
   type IVpnCustomPromptOptionSelector_Interface;
   type IVpnCustomPromptOptionSelector is access all IVpnCustomPromptOptionSelector_Interface'Class;
   type IVpnCustomPromptOptionSelector_Ptr is access all IVpnCustomPromptOptionSelector;
   type IVpnCustomPromptBooleanInput_Interface;
   type IVpnCustomPromptBooleanInput is access all IVpnCustomPromptBooleanInput_Interface'Class;
   type IVpnCustomPromptBooleanInput_Ptr is access all IVpnCustomPromptBooleanInput;
   type IVpnCustomPromptText_Interface;
   type IVpnCustomPromptText is access all IVpnCustomPromptText_Interface'Class;
   type IVpnCustomPromptText_Ptr is access all IVpnCustomPromptText;
   type IVpnChannelActivityStateChangedArgs_Interface;
   type IVpnChannelActivityStateChangedArgs is access all IVpnChannelActivityStateChangedArgs_Interface'Class;
   type IVpnChannelActivityStateChangedArgs_Ptr is access all IVpnChannelActivityStateChangedArgs;
   type IVpnDomainNameInfoFactory_Interface;
   type IVpnDomainNameInfoFactory is access all IVpnDomainNameInfoFactory_Interface'Class;
   type IVpnDomainNameInfoFactory_Ptr is access all IVpnDomainNameInfoFactory;
   type IVpnDomainNameInfo_Interface;
   type IVpnDomainNameInfo is access all IVpnDomainNameInfo_Interface'Class;
   type IVpnDomainNameInfo_Ptr is access all IVpnDomainNameInfo;
   type IVpnDomainNameInfo2_Interface;
   type IVpnDomainNameInfo2 is access all IVpnDomainNameInfo2_Interface'Class;
   type IVpnDomainNameInfo2_Ptr is access all IVpnDomainNameInfo2;
   type IVpnDomainNameAssignment_Interface;
   type IVpnDomainNameAssignment is access all IVpnDomainNameAssignment_Interface'Class;
   type IVpnDomainNameAssignment_Ptr is access all IVpnDomainNameAssignment;
   type IVpnAppIdFactory_Interface;
   type IVpnAppIdFactory is access all IVpnAppIdFactory_Interface'Class;
   type IVpnAppIdFactory_Ptr is access all IVpnAppIdFactory;
   type IVpnAppId_Interface;
   type IVpnAppId is access all IVpnAppId_Interface'Class;
   type IVpnAppId_Ptr is access all IVpnAppId;
   type IVpnTrafficFilterFactory_Interface;
   type IVpnTrafficFilterFactory is access all IVpnTrafficFilterFactory_Interface'Class;
   type IVpnTrafficFilterFactory_Ptr is access all IVpnTrafficFilterFactory;
   type IVpnTrafficFilter_Interface;
   type IVpnTrafficFilter is access all IVpnTrafficFilter_Interface'Class;
   type IVpnTrafficFilter_Ptr is access all IVpnTrafficFilter;
   type IVpnTrafficFilterAssignment_Interface;
   type IVpnTrafficFilterAssignment is access all IVpnTrafficFilterAssignment_Interface'Class;
   type IVpnTrafficFilterAssignment_Ptr is access all IVpnTrafficFilterAssignment;
   type IVpnProfile_Interface;
   type IVpnProfile is access all IVpnProfile_Interface'Class;
   type IVpnProfile_Ptr is access all IVpnProfile;
   type IVpnPlugInProfile_Interface;
   type IVpnPlugInProfile is access all IVpnPlugInProfile_Interface'Class;
   type IVpnPlugInProfile_Ptr is access all IVpnPlugInProfile;
   type IVpnPlugInProfile2_Interface;
   type IVpnPlugInProfile2 is access all IVpnPlugInProfile2_Interface'Class;
   type IVpnPlugInProfile2_Ptr is access all IVpnPlugInProfile2;
   type IVpnNativeProfile_Interface;
   type IVpnNativeProfile is access all IVpnNativeProfile_Interface'Class;
   type IVpnNativeProfile_Ptr is access all IVpnNativeProfile;
   type IVpnNativeProfile2_Interface;
   type IVpnNativeProfile2 is access all IVpnNativeProfile2_Interface'Class;
   type IVpnNativeProfile2_Ptr is access all IVpnNativeProfile2;
   type IVpnManagementAgent_Interface;
   type IVpnManagementAgent is access all IVpnManagementAgent_Interface'Class;
   type IVpnManagementAgent_Ptr is access all IVpnManagementAgent;
   type IIterable_VpnPacketBuffer_Interface;
   type IIterable_VpnPacketBuffer is access all IIterable_VpnPacketBuffer_Interface'Class;
   type IIterable_VpnPacketBuffer_Ptr is access all IIterable_VpnPacketBuffer;
   type IIterator_IVpnRoute_Interface;
   type IIterator_IVpnRoute is access all IIterator_IVpnRoute_Interface'Class;
   type IIterator_IVpnRoute_Ptr is access all IIterator_IVpnRoute;
   type IIterable_IVpnRoute_Interface;
   type IIterable_IVpnRoute is access all IIterable_IVpnRoute_Interface'Class;
   type IIterable_IVpnRoute_Ptr is access all IIterable_IVpnRoute;
   type IVectorView_IVpnRoute_Interface;
   type IVectorView_IVpnRoute is access all IVectorView_IVpnRoute_Interface'Class;
   type IVectorView_IVpnRoute_Ptr is access all IVectorView_IVpnRoute;
   type IVector_IVpnRoute_Interface;
   type IVector_IVpnRoute is access all IVector_IVpnRoute_Interface'Class;
   type IVector_IVpnRoute_Ptr is access all IVector_IVpnRoute;
   type IIterator_IVpnNamespaceInfo_Interface;
   type IIterator_IVpnNamespaceInfo is access all IIterator_IVpnNamespaceInfo_Interface'Class;
   type IIterator_IVpnNamespaceInfo_Ptr is access all IIterator_IVpnNamespaceInfo;
   type IIterable_IVpnNamespaceInfo_Interface;
   type IIterable_IVpnNamespaceInfo is access all IIterable_IVpnNamespaceInfo_Interface'Class;
   type IIterable_IVpnNamespaceInfo_Ptr is access all IIterable_IVpnNamespaceInfo;
   type IVectorView_IVpnNamespaceInfo_Interface;
   type IVectorView_IVpnNamespaceInfo is access all IVectorView_IVpnNamespaceInfo_Interface'Class;
   type IVectorView_IVpnNamespaceInfo_Ptr is access all IVectorView_IVpnNamespaceInfo;
   type IVector_IVpnNamespaceInfo_Interface;
   type IVector_IVpnNamespaceInfo is access all IVector_IVpnNamespaceInfo_Interface'Class;
   type IVector_IVpnNamespaceInfo_Ptr is access all IVector_IVpnNamespaceInfo;
   type IIterator_IVpnCustomPrompt_Interface;
   type IIterator_IVpnCustomPrompt is access all IIterator_IVpnCustomPrompt_Interface'Class;
   type IIterator_IVpnCustomPrompt_Ptr is access all IIterator_IVpnCustomPrompt;
   type IIterable_IVpnCustomPrompt_Interface;
   type IIterable_IVpnCustomPrompt is access all IIterable_IVpnCustomPrompt_Interface'Class;
   type IIterable_IVpnCustomPrompt_Ptr is access all IIterable_IVpnCustomPrompt;
   type IVectorView_IVpnCustomPrompt_Interface;
   type IVectorView_IVpnCustomPrompt is access all IVectorView_IVpnCustomPrompt_Interface'Class;
   type IVectorView_IVpnCustomPrompt_Ptr is access all IVectorView_IVpnCustomPrompt;
   type IIterator_IVpnCustomPromptElement_Interface;
   type IIterator_IVpnCustomPromptElement is access all IIterator_IVpnCustomPromptElement_Interface'Class;
   type IIterator_IVpnCustomPromptElement_Ptr is access all IIterator_IVpnCustomPromptElement;
   type IIterable_IVpnCustomPromptElement_Interface;
   type IIterable_IVpnCustomPromptElement is access all IIterable_IVpnCustomPromptElement_Interface'Class;
   type IIterable_IVpnCustomPromptElement_Ptr is access all IIterable_IVpnCustomPromptElement;
   type IVectorView_IVpnCustomPromptElement_Interface;
   type IVectorView_IVpnCustomPromptElement is access all IVectorView_IVpnCustomPromptElement_Interface'Class;
   type IVectorView_IVpnCustomPromptElement_Ptr is access all IVectorView_IVpnCustomPromptElement;
   type IAsyncOperation_IVpnCredential_Interface;
   type IAsyncOperation_IVpnCredential is access all IAsyncOperation_IVpnCredential_Interface'Class;
   type IAsyncOperation_IVpnCredential_Ptr is access all IAsyncOperation_IVpnCredential;
   type IIterator_IVpnDomainNameInfo_Interface;
   type IIterator_IVpnDomainNameInfo is access all IIterator_IVpnDomainNameInfo_Interface'Class;
   type IIterator_IVpnDomainNameInfo_Ptr is access all IIterator_IVpnDomainNameInfo;
   type IIterable_IVpnDomainNameInfo_Interface;
   type IIterable_IVpnDomainNameInfo is access all IIterable_IVpnDomainNameInfo_Interface'Class;
   type IIterable_IVpnDomainNameInfo_Ptr is access all IIterable_IVpnDomainNameInfo;
   type IVectorView_IVpnDomainNameInfo_Interface;
   type IVectorView_IVpnDomainNameInfo is access all IVectorView_IVpnDomainNameInfo_Interface'Class;
   type IVectorView_IVpnDomainNameInfo_Ptr is access all IVectorView_IVpnDomainNameInfo;
   type IVector_IVpnDomainNameInfo_Interface;
   type IVector_IVpnDomainNameInfo is access all IVector_IVpnDomainNameInfo_Interface'Class;
   type IVector_IVpnDomainNameInfo_Ptr is access all IVector_IVpnDomainNameInfo;
   type IIterator_IVpnTrafficFilter_Interface;
   type IIterator_IVpnTrafficFilter is access all IIterator_IVpnTrafficFilter_Interface'Class;
   type IIterator_IVpnTrafficFilter_Ptr is access all IIterator_IVpnTrafficFilter;
   type IIterable_IVpnTrafficFilter_Interface;
   type IIterable_IVpnTrafficFilter is access all IIterable_IVpnTrafficFilter_Interface'Class;
   type IIterable_IVpnTrafficFilter_Ptr is access all IIterable_IVpnTrafficFilter;
   type IVectorView_IVpnTrafficFilter_Interface;
   type IVectorView_IVpnTrafficFilter is access all IVectorView_IVpnTrafficFilter_Interface'Class;
   type IVectorView_IVpnTrafficFilter_Ptr is access all IVectorView_IVpnTrafficFilter;
   type IVector_IVpnTrafficFilter_Interface;
   type IVector_IVpnTrafficFilter is access all IVector_IVpnTrafficFilter_Interface'Class;
   type IVector_IVpnTrafficFilter_Ptr is access all IVector_IVpnTrafficFilter;
   type IIterator_IVpnAppId_Interface;
   type IIterator_IVpnAppId is access all IIterator_IVpnAppId_Interface'Class;
   type IIterator_IVpnAppId_Ptr is access all IIterator_IVpnAppId;
   type IIterable_IVpnAppId_Interface;
   type IIterable_IVpnAppId is access all IIterable_IVpnAppId_Interface'Class;
   type IIterable_IVpnAppId_Ptr is access all IIterable_IVpnAppId;
   type IVectorView_IVpnAppId_Interface;
   type IVectorView_IVpnAppId is access all IVectorView_IVpnAppId_Interface'Class;
   type IVectorView_IVpnAppId_Ptr is access all IVectorView_IVpnAppId;
   type IVector_IVpnAppId_Interface;
   type IVector_IVpnAppId is access all IVector_IVpnAppId_Interface'Class;
   type IVector_IVpnAppId_Ptr is access all IVector_IVpnAppId;
   type IAsyncOperation_VpnManagementErrorStatus_Interface;
   type IAsyncOperation_VpnManagementErrorStatus is access all IAsyncOperation_VpnManagementErrorStatus_Interface'Class;
   type IAsyncOperation_VpnManagementErrorStatus_Ptr is access all IAsyncOperation_VpnManagementErrorStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVpnPlugIn : aliased constant Windows.IID := (3468135687, 53416, 18179, (160, 145, 200, 194, 192, 145, 91, 196 ));
   
   type IVpnPlugIn_Interface is interface and Windows.IInspectable_Interface;
   
   function Connect
   (
      This       : access IVpnPlugIn_Interface
      ; channel : Windows.Networking.Vpn.IVpnChannel
   )
   return Windows.HRESULT is abstract;
   
   function Disconnect
   (
      This       : access IVpnPlugIn_Interface
      ; channel : Windows.Networking.Vpn.IVpnChannel
   )
   return Windows.HRESULT is abstract;
   
   function GetKeepAlivePayload
   (
      This       : access IVpnPlugIn_Interface
      ; channel : Windows.Networking.Vpn.IVpnChannel
      ; keepAlivePacket : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function Encapsulate
   (
      This       : access IVpnPlugIn_Interface
      ; channel : Windows.Networking.Vpn.IVpnChannel
      ; packets : Windows.Networking.Vpn.IVpnPacketBufferList
      ; encapulatedPackets : Windows.Networking.Vpn.IVpnPacketBufferList
   )
   return Windows.HRESULT is abstract;
   
   function Decapsulate
   (
      This       : access IVpnPlugIn_Interface
      ; channel : Windows.Networking.Vpn.IVpnChannel
      ; encapBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
      ; decapsulatedPackets : Windows.Networking.Vpn.IVpnPacketBufferList
      ; controlPacketsToSend : Windows.Networking.Vpn.IVpnPacketBufferList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPrompt : aliased constant Windows.IID := (2603531899, 34773, 17212, (180, 246, 238, 230, 170, 104, 162, 68 ));
   
   type IVpnCustomPrompt_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Label
   (
      This       : access IVpnCustomPrompt_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Label
   (
      This       : access IVpnCustomPrompt_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Compulsory
   (
      This       : access IVpnCustomPrompt_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Compulsory
   (
      This       : access IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Bordered
   (
      This       : access IVpnCustomPrompt_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Bordered
   (
      This       : access IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomEditBox : aliased constant Windows.IID := (805493152, 53183, 19467, (143, 60, 102, 245, 3, 194, 11, 57 ));
   
   type IVpnCustomEditBox_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DefaultText
   (
      This       : access IVpnCustomEditBox_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultText
   (
      This       : access IVpnCustomEditBox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NoEcho
   (
      This       : access IVpnCustomEditBox_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NoEcho
   (
      This       : access IVpnCustomEditBox_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IVpnCustomEditBox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomComboBox : aliased constant Windows.IID := (2586056078, 56225, 19567, (130, 112, 220, 243, 201, 118, 28, 76 ));
   
   type IVpnCustomComboBox_Interface is interface and Windows.IInspectable_Interface;
   
   function put_OptionsText
   (
      This       : access IVpnCustomComboBox_Interface
      ; value : Windows.Foundation.Collections.IVectorView_String
   )
   return Windows.HRESULT is abstract;
   
   function get_OptionsText
   (
      This       : access IVpnCustomComboBox_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Selected
   (
      This       : access IVpnCustomComboBox_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomTextBox : aliased constant Windows.IID := (3668231114, 36643, 19766, (145, 241, 118, 217, 55, 130, 121, 66 ));
   
   type IVpnCustomTextBox_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DisplayText
   (
      This       : access IVpnCustomTextBox_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayText
   (
      This       : access IVpnCustomTextBox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomCheckBox : aliased constant Windows.IID := (1132955475, 965, 20065, (147, 215, 169, 87, 113, 76, 66, 130 ));
   
   type IVpnCustomCheckBox_Interface is interface and Windows.IInspectable_Interface;
   
   function put_InitialCheckState
   (
      This       : access IVpnCustomCheckBox_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialCheckState
   (
      This       : access IVpnCustomCheckBox_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Checked
   (
      This       : access IVpnCustomCheckBox_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomErrorBox : aliased constant Windows.IID := (2663706546, 51522, 17071, (178, 35, 88, 139, 72, 50, 135, 33 ));
   
   type IVpnCustomErrorBox_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVpnRouteFactory : aliased constant Windows.IID := (3186275839, 17871, 19353, (131, 251, 219, 59, 194, 103, 43, 2 ));
   
   type IVpnRouteFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateVpnRoute
   (
      This       : access IVpnRouteFactory_Interface
      ; address : Windows.Networking.IHostName
      ; prefixSize : Windows.UInt8
      ; RetVal : access Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnRoute : aliased constant Windows.IID := (3044219779, 2409, 18073, (147, 142, 119, 118, 219, 41, 207, 179 ));
   
   type IVpnRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Address
   (
      This       : access IVpnRoute_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IVpnRoute_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_PrefixSize
   (
      This       : access IVpnRoute_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PrefixSize
   (
      This       : access IVpnRoute_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnRouteAssignment : aliased constant Windows.IID := (3680820770, 52793, 19062, (149, 80, 246, 16, 57, 248, 14, 72 ));
   
   type IVpnRouteAssignment_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Ipv4InclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; value : Windows.Networking.Vpn.IVector_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function put_Ipv6InclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; value : Windows.Networking.Vpn.IVector_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Ipv4InclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Ipv6InclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Ipv4ExclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; value : Windows.Networking.Vpn.IVector_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function put_Ipv6ExclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; value : Windows.Networking.Vpn.IVector_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Ipv4ExclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Ipv6ExclusionRoutes
   (
      This       : access IVpnRouteAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ExcludeLocalSubnets
   (
      This       : access IVpnRouteAssignment_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExcludeLocalSubnets
   (
      This       : access IVpnRouteAssignment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnNamespaceInfoFactory : aliased constant Windows.IID := (3409876250, 45262, 17451, (172, 187, 95, 153, 178, 2, 195, 28 ));
   
   type IVpnNamespaceInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateVpnNamespaceInfo
   (
      This       : access IVpnNamespaceInfoFactory_Interface
      ; name : Windows.String
      ; dnsServerList : Windows.Networking.IVector_IHostName
      ; proxyServerList : Windows.Networking.IVector_IHostName
      ; RetVal : access Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnNamespaceInfo : aliased constant Windows.IID := (820902723, 17487, 17605, (129, 103, 163, 90, 145, 241, 175, 148 ));
   
   type IVpnNamespaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Namespace
   (
      This       : access IVpnNamespaceInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Namespace
   (
      This       : access IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DnsServers
   (
      This       : access IVpnNamespaceInfo_Interface
      ; value : Windows.Networking.IVector_IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_DnsServers
   (
      This       : access IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Networking.IVector_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_WebProxyServers
   (
      This       : access IVpnNamespaceInfo_Interface
      ; value : Windows.Networking.IVector_IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_WebProxyServers
   (
      This       : access IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Networking.IVector_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnNamespaceAssignment : aliased constant Windows.IID := (3623344920, 12413, 19470, (189, 98, 143, 162, 112, 187, 173, 214 ));
   
   type IVpnNamespaceAssignment_Interface is interface and Windows.IInspectable_Interface;
   
   function put_NamespaceList
   (
      This       : access IVpnNamespaceAssignment_Interface
      ; value : Windows.Networking.Vpn.IVector_IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_NamespaceList
   (
      This       : access IVpnNamespaceAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnNamespaceInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyAutoConfigUri
   (
      This       : access IVpnNamespaceAssignment_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyAutoConfigUri
   (
      This       : access IVpnNamespaceAssignment_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnInterfaceIdFactory : aliased constant Windows.IID := (2653805730, 5906, 19684, (177, 121, 140, 101, 44, 109, 16, 0 ));
   
   type IVpnInterfaceIdFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateVpnInterfaceId
   (
      This       : access IVpnInterfaceIdFactory_Interface
      ; address : Windows.UInt8_Ptr
      ; RetVal : access Windows.Networking.Vpn.IVpnInterfaceId
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnInterfaceId : aliased constant Windows.IID := (2653805730, 5906, 19684, (177, 121, 140, 101, 44, 109, 16, 17 ));
   
   type IVpnInterfaceId_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAddressInfo
   (
      This       : access IVpnInterfaceId_Interface
      ; id : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPickedCredential : aliased constant Windows.IID := (2591636167, 34900, 20050, (173, 151, 36, 221, 154, 132, 43, 206 ));
   
   type IVpnPickedCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PasskeyCredential
   (
      This       : access IVpnPickedCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalPin
   (
      This       : access IVpnPickedCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OldPasswordCredential
   (
      This       : access IVpnPickedCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCredential : aliased constant Windows.IID := (3085404915, 42093, 16459, (135, 41, 24, 50, 82, 40, 83, 172 ));
   
   type IVpnCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PasskeyCredential
   (
      This       : access IVpnCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_CertificateCredential
   (
      This       : access IVpnCredential_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalPin
   (
      This       : access IVpnCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OldPasswordCredential
   (
      This       : access IVpnCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnSystemHealth : aliased constant Windows.IID := (2577987759, 49390, 20085, (129, 122, 242, 49, 174, 229, 18, 61 ));
   
   type IVpnSystemHealth_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StatementOfHealth
   (
      This       : access IVpnSystemHealth_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannelConfiguration : aliased constant Windows.IID := (237886626, 8210, 20452, (177, 121, 140, 101, 44, 109, 16, 126 ));
   
   type IVpnChannelConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerServiceName
   (
      This       : access IVpnChannelConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerHostNameList
   (
      This       : access IVpnChannelConfiguration_Interface
      ; RetVal : access Windows.Networking.IVectorView_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomField
   (
      This       : access IVpnChannelConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannelConfiguration2 : aliased constant Windows.IID := (4077606732, 30756, 18204, (161, 24, 99, 219, 201, 58, 228, 199 ));
   
   type IVpnChannelConfiguration2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerUris
   (
      This       : access IVpnChannelConfiguration2_Interface
      ; RetVal : access Windows.Foundation.IVectorView_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannelActivityEventArgs : aliased constant Windows.IID := (2741799154, 45020, 18293, (133, 93, 212, 172, 10, 53, 252, 85 ));
   
   type IVpnChannelActivityEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IVpnChannelActivityEventArgs_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnChannelActivityEventType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannel : aliased constant Windows.IID := (1254591751, 53672, 17155, (160, 145, 200, 210, 224, 145, 91, 195 ));
   
   type IVpnChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function AssociateTransport
   (
      This       : access IVpnChannel_Interface
      ; mainOuterTunnelTransport : Windows.Object
      ; optionalOuterTunnelTransport : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IVpnChannel_Interface
      ; assignedClientIPv4list : Windows.Networking.IVectorView_IHostName
      ; assignedClientIPv6list : Windows.Networking.IVectorView_IHostName
      ; vpnInterfaceId : Windows.Networking.Vpn.IVpnInterfaceId
      ; routeScope : Windows.Networking.Vpn.IVpnRouteAssignment
      ; namespaceScope : Windows.Networking.Vpn.IVpnNamespaceAssignment
      ; mtuSize : Windows.UInt32
      ; maxFrameSize : Windows.UInt32
      ; optimizeForLowCostNetwork : Windows.Boolean
      ; mainOuterTunnelTransport : Windows.Object
      ; optionalOuterTunnelTransport : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IVpnChannel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RequestCredentials
   (
      This       : access IVpnChannel_Interface
      ; credType : Windows.Networking.Vpn.VpnCredentialType
      ; isRetry : Windows.Boolean
      ; isSingleSignOnCredential : Windows.Boolean
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; RetVal : access Windows.Networking.Vpn.IVpnPickedCredential
   )
   return Windows.HRESULT is abstract;
   
   function RequestVpnPacketBuffer
   (
      This       : access IVpnChannel_Interface
      ; type_x : Windows.Networking.Vpn.VpnDataPathType
      ; vpnPacketBuffer : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function LogDiagnosticMessage
   (
      This       : access IVpnChannel_Interface
      ; message : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IVpnChannel_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IVpnChannel_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnChannelConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function add_ActivityChange
   (
      This       : access IVpnChannel_Interface
      ; handler : TypedEventHandler_IVpnChannel_add_ActivityChange
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActivityChange
   (
      This       : access IVpnChannel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function put_PlugInContext
   (
      This       : access IVpnChannel_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_PlugInContext
   (
      This       : access IVpnChannel_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemHealth
   (
      This       : access IVpnChannel_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnSystemHealth
   )
   return Windows.HRESULT is abstract;
   
   function RequestCustomPrompt
   (
      This       : access IVpnChannel_Interface
      ; customPrompt : Windows.Networking.Vpn.IVectorView_IVpnCustomPrompt
   )
   return Windows.HRESULT is abstract;
   
   function SetErrorMessage
   (
      This       : access IVpnChannel_Interface
      ; message : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAllowedSslTlsVersions
   (
      This       : access IVpnChannel_Interface
      ; tunnelTransport : Windows.Object
      ; useTls12 : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannel2 : aliased constant Windows.IID := (576049509, 39227, 17961, (173, 96, 241, 195, 243, 83, 127, 80 ));
   
   type IVpnChannel2_Interface is interface and Windows.IInspectable_Interface;
   
   function StartWithMainTransport
   (
      This       : access IVpnChannel2_Interface
      ; assignedClientIPv4list : Windows.Networking.IVectorView_IHostName
      ; assignedClientIPv6list : Windows.Networking.IVectorView_IHostName
      ; vpnInterfaceId : Windows.Networking.Vpn.IVpnInterfaceId
      ; assignedRoutes : Windows.Networking.Vpn.IVpnRouteAssignment
      ; assignedDomainName : Windows.Networking.Vpn.IVpnDomainNameAssignment
      ; mtuSize : Windows.UInt32
      ; maxFrameSize : Windows.UInt32
      ; Reserved : Windows.Boolean
      ; mainOuterTunnelTransport : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function StartExistingTransports
   (
      This       : access IVpnChannel2_Interface
      ; assignedClientIPv4list : Windows.Networking.IVectorView_IHostName
      ; assignedClientIPv6list : Windows.Networking.IVectorView_IHostName
      ; vpnInterfaceId : Windows.Networking.Vpn.IVpnInterfaceId
      ; assignedRoutes : Windows.Networking.Vpn.IVpnRouteAssignment
      ; assignedDomainName : Windows.Networking.Vpn.IVpnDomainNameAssignment
      ; mtuSize : Windows.UInt32
      ; maxFrameSize : Windows.UInt32
      ; Reserved : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ActivityStateChange
   (
      This       : access IVpnChannel2_Interface
      ; handler : TypedEventHandler_IVpnChannel2_add_ActivityStateChange
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActivityStateChange
   (
      This       : access IVpnChannel2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetVpnSendPacketBuffer
   (
      This       : access IVpnChannel2_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetVpnReceivePacketBuffer
   (
      This       : access IVpnChannel2_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RequestCustomPromptAsync
   (
      This       : access IVpnChannel2_Interface
      ; customPromptElement : Windows.Networking.Vpn.IVectorView_IVpnCustomPromptElement
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestCredentialsWithCertificateAsync
   (
      This       : access IVpnChannel2_Interface
      ; credType : Windows.Networking.Vpn.VpnCredentialType
      ; credOptions : Windows.UInt32
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_IVpnCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCredentialsWithOptionsAsync
   (
      This       : access IVpnChannel2_Interface
      ; credType : Windows.Networking.Vpn.VpnCredentialType
      ; credOptions : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_IVpnCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCredentialsSimpleAsync
   (
      This       : access IVpnChannel2_Interface
      ; credType : Windows.Networking.Vpn.VpnCredentialType
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_IVpnCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TerminateConnection
   (
      This       : access IVpnChannel2_Interface
      ; message : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function StartWithTrafficFilter
   (
      This       : access IVpnChannel2_Interface
      ; assignedClientIpv4List : Windows.Networking.IVectorView_IHostName
      ; assignedClientIpv6List : Windows.Networking.IVectorView_IHostName
      ; vpnInterfaceId : Windows.Networking.Vpn.IVpnInterfaceId
      ; assignedRoutes : Windows.Networking.Vpn.IVpnRouteAssignment
      ; assignedNamespace : Windows.Networking.Vpn.IVpnDomainNameAssignment
      ; mtuSize : Windows.UInt32
      ; maxFrameSize : Windows.UInt32
      ; reserved : Windows.Boolean
      ; mainOuterTunnelTransport : Windows.Object
      ; optionalOuterTunnelTransport : Windows.Object
      ; assignedTrafficFilters : Windows.Networking.Vpn.IVpnTrafficFilterAssignment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPromptElement : aliased constant Windows.IID := (1941788216, 28420, 16461, (147, 221, 80, 164, 73, 36, 163, 139 ));
   
   type IVpnCustomPromptElement_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DisplayName
   (
      This       : access IVpnCustomPromptElement_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Compulsory
   (
      This       : access IVpnCustomPromptElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Compulsory
   (
      This       : access IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Emphasized
   (
      This       : access IVpnCustomPromptElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Emphasized
   (
      This       : access IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannel4 : aliased constant Windows.IID := (3609620190, 10551, 16797, (149, 112, 72, 106, 235, 184, 24, 3 ));
   
   type IVpnChannel4_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAndAssociateTransport
   (
      This       : access IVpnChannel4_Interface
      ; transport : Windows.Object
      ; context : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function StartWithMultipleTransports
   (
      This       : access IVpnChannel4_Interface
      ; assignedClientIpv4Addresses : Windows.Networking.IIterable_IHostName
      ; assignedClientIpv6Addresses : Windows.Networking.IIterable_IHostName
      ; vpninterfaceId : Windows.Networking.Vpn.IVpnInterfaceId
      ; assignedRoutes : Windows.Networking.Vpn.IVpnRouteAssignment
      ; assignedNamespace : Windows.Networking.Vpn.IVpnDomainNameAssignment
      ; mtuSize : Windows.UInt32
      ; maxFrameSize : Windows.UInt32
      ; reserved : Windows.Boolean
      ; transports : Windows.Foundation.Collections.IIterable_Object
      ; assignedTrafficFilters : Windows.Networking.Vpn.IVpnTrafficFilterAssignment
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAndAssociateTransport
   (
      This       : access IVpnChannel4_Interface
      ; transport : Windows.Object
      ; context : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function StartReconnectingTransport
   (
      This       : access IVpnChannel4_Interface
      ; transport : Windows.Object
      ; context : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetSlotTypeForTransportContext
   (
      This       : access IVpnChannel4_Interface
      ; context : Windows.Object
      ; RetVal : access Windows.Networking.Sockets.ControlChannelTriggerStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentRequestTransportContext
   (
      This       : access IVpnChannel4_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannelStatics : aliased constant Windows.IID := (2297103917, 59416, 20477, (152, 166, 54, 62, 55, 54, 201, 93 ));
   
   type IVpnChannelStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ProcessEventAsync
   (
      This       : access IVpnChannelStatics_Interface
      ; thirdPartyPlugIn : Windows.Object
      ; event : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBufferFactory : aliased constant Windows.IID := (2653805730, 5906, 19684, (177, 121, 140, 101, 44, 109, 153, 153 ));
   
   type IVpnPacketBufferFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateVpnPacketBuffer
   (
      This       : access IVpnPacketBufferFactory_Interface
      ; parentBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
      ; offset : Windows.UInt32
      ; length : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBuffer : aliased constant Windows.IID := (3271070204, 19804, 19043, (183, 13, 78, 48, 126, 172, 206, 85 ));
   
   type IVpnPacketBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Buffer
   (
      This       : access IVpnPacketBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IVpnPacketBuffer_Interface
      ; value : Windows.Networking.Vpn.VpnPacketBufferStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IVpnPacketBuffer_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnPacketBufferStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_TransportAffinity
   (
      This       : access IVpnPacketBuffer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportAffinity
   (
      This       : access IVpnPacketBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBuffer2 : aliased constant Windows.IID := (1717473776, 34821, 19445, (166, 25, 46, 132, 136, 46, 107, 79 ));
   
   type IVpnPacketBuffer2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppId
   (
      This       : access IVpnPacketBuffer2_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBuffer3 : aliased constant Windows.IID := (3797288751, 4219, 19520, (177, 39, 91, 197, 62, 10, 217, 96 ));
   
   type IVpnPacketBuffer3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_TransportContext
   (
      This       : access IVpnPacketBuffer3_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportContext
   (
      This       : access IVpnPacketBuffer3_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBufferList : aliased constant Windows.IID := (3271070204, 19804, 19043, (183, 13, 78, 48, 126, 172, 206, 119 ));
   
   type IVpnPacketBufferList_Interface is interface and Windows.IInspectable_Interface;
   
   function Append
   (
      This       : access IVpnPacketBufferList_Interface
      ; nextVpnPacketBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function AddAtBegin
   (
      This       : access IVpnPacketBufferList_Interface
      ; nextVpnPacketBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVpnPacketBufferList_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtBegin
   (
      This       : access IVpnPacketBufferList_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVpnPacketBufferList_Interface
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IVpnPacketBufferList_Interface
      ; value : Windows.Networking.Vpn.VpnPacketBufferStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IVpnPacketBufferList_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnPacketBufferStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVpnPacketBufferList_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPacketBufferList2 : aliased constant Windows.IID := (1048236005, 59934, 18474, (141, 152, 192, 101, 245, 125, 137, 234 ));
   
   type IVpnPacketBufferList2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddLeadingPacket
   (
      This       : access IVpnPacketBufferList2_Interface
      ; nextVpnPacketBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveLeadingPacket
   (
      This       : access IVpnPacketBufferList2_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function AddTrailingPacket
   (
      This       : access IVpnPacketBufferList2_Interface
      ; nextVpnPacketBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveTrailingPacket
   (
      This       : access IVpnPacketBufferList2_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPromptTextInput : aliased constant Windows.IID := (3386547317, 37180, 18389, (136, 186, 72, 252, 72, 147, 2, 53 ));
   
   type IVpnCustomPromptTextInput_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PlaceholderText
   (
      This       : access IVpnCustomPromptTextInput_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderText
   (
      This       : access IVpnCustomPromptTextInput_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTextHidden
   (
      This       : access IVpnCustomPromptTextInput_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTextHidden
   (
      This       : access IVpnCustomPromptTextInput_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IVpnCustomPromptTextInput_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPromptOptionSelector : aliased constant Windows.IID := (999240921, 36545, 20117, (154, 78, 123, 166, 77, 56, 243, 48 ));
   
   type IVpnCustomPromptOptionSelector_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Options
   (
      This       : access IVpnCustomPromptOptionSelector_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedIndex
   (
      This       : access IVpnCustomPromptOptionSelector_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPromptBooleanInput : aliased constant Windows.IID := (3301549726, 65351, 17703, (159, 39, 164, 146, 146, 1, 153, 121 ));
   
   type IVpnCustomPromptBooleanInput_Interface is interface and Windows.IInspectable_Interface;
   
   function put_InitialValue
   (
      This       : access IVpnCustomPromptBooleanInput_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialValue
   (
      This       : access IVpnCustomPromptBooleanInput_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IVpnCustomPromptBooleanInput_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnCustomPromptText : aliased constant Windows.IID := (1003011566, 14914, 18851, (171, 221, 7, 178, 237, 234, 117, 45 ));
   
   type IVpnCustomPromptText_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Text
   (
      This       : access IVpnCustomPromptText_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IVpnCustomPromptText_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnChannelActivityStateChangedArgs : aliased constant Windows.IID := (1031079269, 64960, 19390, (162, 59, 69, 255, 252, 109, 151, 161 ));
   
   type IVpnChannelActivityStateChangedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityState
   (
      This       : access IVpnChannelActivityStateChangedArgs_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnChannelActivityEventType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnDomainNameInfoFactory : aliased constant Windows.IID := (621263733, 655, 18056, (141, 58, 196, 83, 29, 243, 125, 168 ));
   
   type IVpnDomainNameInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateVpnDomainNameInfo
   (
      This       : access IVpnDomainNameInfoFactory_Interface
      ; name : Windows.String
      ; nameType : Windows.Networking.Vpn.VpnDomainNameType
      ; dnsServerList : Windows.Networking.IIterable_IHostName
      ; proxyServerList : Windows.Networking.IIterable_IHostName
      ; RetVal : access Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnDomainNameInfo : aliased constant Windows.IID := (2905520175, 60046, 20346, (132, 62, 26, 135, 227, 46, 27, 154 ));
   
   type IVpnDomainNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DomainName
   (
      This       : access IVpnDomainNameInfo_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainName
   (
      This       : access IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_DomainNameType
   (
      This       : access IVpnDomainNameInfo_Interface
      ; value : Windows.Networking.Vpn.VpnDomainNameType
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainNameType
   (
      This       : access IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnDomainNameType
   )
   return Windows.HRESULT is abstract;
   
   function get_DnsServers
   (
      This       : access IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.IVector_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WebProxyServers
   (
      This       : access IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.IVector_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnDomainNameInfo2 : aliased constant Windows.IID := (2877755729, 27731, 18472, (152, 131, 216, 134, 222, 16, 68, 7 ));
   
   type IVpnDomainNameInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebProxyUris
   (
      This       : access IVpnDomainNameInfo2_Interface
      ; RetVal : access Windows.Foundation.IVector_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnDomainNameAssignment : aliased constant Windows.IID := (1094037825, 52443, 18869, (148, 1, 3, 154, 138, 231, 103, 233 ));
   
   type IVpnDomainNameAssignment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DomainNameList
   (
      This       : access IVpnDomainNameAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnDomainNameInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyAutoConfigurationUri
   (
      This       : access IVpnDomainNameAssignment_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyAutoConfigurationUri
   (
      This       : access IVpnDomainNameAssignment_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnAppIdFactory : aliased constant Windows.IID := (1185807658, 2731, 20443, (130, 29, 211, 221, 201, 25, 120, 139 ));
   
   type IVpnAppIdFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVpnAppIdFactory_Interface
      ; type_x : Windows.Networking.Vpn.VpnAppIdType
      ; value : Windows.String
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnAppId : aliased constant Windows.IID := (2064033333, 23640, 16857, (148, 167, 191, 188, 241, 216, 202, 84 ));
   
   type IVpnAppId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IVpnAppId_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnAppIdType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IVpnAppId_Interface
      ; value : Windows.Networking.Vpn.VpnAppIdType
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IVpnAppId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IVpnAppId_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnTrafficFilterFactory : aliased constant Windows.IID := (1208828373, 32665, 18252, (134, 238, 150, 223, 22, 131, 24, 241 ));
   
   type IVpnTrafficFilterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVpnTrafficFilterFactory_Interface
      ; appId : Windows.Networking.Vpn.IVpnAppId
      ; RetVal : access Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnTrafficFilter : aliased constant Windows.IID := (795417440, 27807, 18421, (172, 54, 187, 27, 4, 46, 44, 80 ));
   
   type IVpnTrafficFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppId
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function put_AppId
   (
      This       : access IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function get_AppClaims
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Protocol
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnIPProtocol
   )
   return Windows.HRESULT is abstract;
   
   function put_Protocol
   (
      This       : access IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.VpnIPProtocol
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalPortRanges
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RemotePortRanges
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalAddressRanges
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteAddressRanges
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RoutingPolicyType
   (
      This       : access IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnRoutingPolicyType
   )
   return Windows.HRESULT is abstract;
   
   function put_RoutingPolicyType
   (
      This       : access IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.VpnRoutingPolicyType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnTrafficFilterAssignment : aliased constant Windows.IID := (1456264284, 58980, 18206, (137, 205, 96, 22, 3, 185, 224, 243 ));
   
   type IVpnTrafficFilterAssignment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TrafficFilterList
   (
      This       : access IVpnTrafficFilterAssignment_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnTrafficFilter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowOutbound
   (
      This       : access IVpnTrafficFilterAssignment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowOutbound
   (
      This       : access IVpnTrafficFilterAssignment_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowInbound
   (
      This       : access IVpnTrafficFilterAssignment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowInbound
   (
      This       : access IVpnTrafficFilterAssignment_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnProfile : aliased constant Windows.IID := (2020980561, 45271, 17371, (138, 147, 211, 254, 36, 121, 229, 106 ));
   
   type IVpnProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProfileName
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ProfileName
   (
      This       : access IVpnProfile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppTriggers
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnAppId -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Routes
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainNameInfoList
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnDomainNameInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficFilters
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.IVector_IVpnTrafficFilter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RememberCredentials
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RememberCredentials
   (
      This       : access IVpnProfile_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysOn
   (
      This       : access IVpnProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysOn
   (
      This       : access IVpnProfile_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPlugInProfile : aliased constant Windows.IID := (249499044, 20224, 17801, (141, 123, 75, 249, 136, 246, 84, 44 ));
   
   type IVpnPlugInProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerUris
   (
      This       : access IVpnPlugInProfile_Interface
      ; RetVal : access Windows.Foundation.IVector_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomConfiguration
   (
      This       : access IVpnPlugInProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomConfiguration
   (
      This       : access IVpnPlugInProfile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VpnPluginPackageFamilyName
   (
      This       : access IVpnPlugInProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_VpnPluginPackageFamilyName
   (
      This       : access IVpnPlugInProfile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnPlugInProfile2 : aliased constant Windows.IID := (1629243538, 53140, 19158, (186, 153, 0, 244, 255, 52, 86, 94 ));
   
   type IVpnPlugInProfile2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequireVpnClientAppUI
   (
      This       : access IVpnPlugInProfile2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RequireVpnClientAppUI
   (
      This       : access IVpnPlugInProfile2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionStatus
   (
      This       : access IVpnPlugInProfile2_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnManagementConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnNativeProfile : aliased constant Windows.IID := (2762924702, 25623, 17203, (152, 66, 240, 166, 109, 182, 152, 2 ));
   
   type IVpnNativeProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Servers
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RoutingPolicyType
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnRoutingPolicyType
   )
   return Windows.HRESULT is abstract;
   
   function put_RoutingPolicyType
   (
      This       : access IVpnNativeProfile_Interface
      ; value : Windows.Networking.Vpn.VpnRoutingPolicyType
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeProtocolType
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnNativeProtocolType
   )
   return Windows.HRESULT is abstract;
   
   function put_NativeProtocolType
   (
      This       : access IVpnNativeProfile_Interface
      ; value : Windows.Networking.Vpn.VpnNativeProtocolType
   )
   return Windows.HRESULT is abstract;
   
   function get_UserAuthenticationMethod
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnAuthenticationMethod
   )
   return Windows.HRESULT is abstract;
   
   function put_UserAuthenticationMethod
   (
      This       : access IVpnNativeProfile_Interface
      ; value : Windows.Networking.Vpn.VpnAuthenticationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_TunnelAuthenticationMethod
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnAuthenticationMethod
   )
   return Windows.HRESULT is abstract;
   
   function put_TunnelAuthenticationMethod
   (
      This       : access IVpnNativeProfile_Interface
      ; value : Windows.Networking.Vpn.VpnAuthenticationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_EapConfiguration
   (
      This       : access IVpnNativeProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EapConfiguration
   (
      This       : access IVpnNativeProfile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnNativeProfile2 : aliased constant Windows.IID := (267134055, 52661, 19143, (181, 163, 10, 251, 94, 196, 118, 130 ));
   
   type IVpnNativeProfile2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequireVpnClientAppUI
   (
      This       : access IVpnNativeProfile2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RequireVpnClientAppUI
   (
      This       : access IVpnNativeProfile2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionStatus
   (
      This       : access IVpnNativeProfile2_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnManagementConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVpnManagementAgent : aliased constant Windows.IID := (423007949, 42436, 19134, (133, 43, 120, 91, 228, 203, 62, 52 ));
   
   type IVpnManagementAgent_Interface is interface and Windows.IInspectable_Interface;
   
   function AddProfileFromXmlAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; xml : Windows.String
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddProfileFromObjectAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateProfileFromXmlAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; xml : Windows.String
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateProfileFromObjectAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProfilesAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteProfileAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectProfileAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectProfileWithPasswordCredentialAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisconnectProfileAsync
   (
      This       : access IVpnManagementAgent_Interface
      ; profile : Windows.Networking.Vpn.IVpnProfile
      ; RetVal : access Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_VpnPacketBuffer : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_VpnPacketBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_VpnPacketBuffer_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnPacketBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnRoute : aliased constant Windows.IID := (1157108652, 1327, 20811, (167, 118, 170, 211, 122, 100, 253, 198 ));
   
   type IIterator_IVpnRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnRoute_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnRoute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnRoute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnRoute_Interface
      ; items : Windows.Networking.Vpn.IVpnRoute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnRoute : aliased constant Windows.IID := (3153369301, 47599, 22001, (151, 177, 119, 160, 102, 57, 228, 226 ));
   
   type IIterable_IVpnRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnRoute_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnRoute : aliased constant Windows.IID := (1131420276, 58519, 21849, (167, 27, 17, 208, 21, 111, 168, 57 ));
   
   type IVectorView_IVpnRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnRoute_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnRoute_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnRoute_Interface
      ; value : Windows.Networking.Vpn.IVpnRoute
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnRoute_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnRoute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVpnRoute : aliased constant Windows.IID := (1526885336, 11461, 21872, (189, 229, 13, 183, 196, 51, 18, 121 ));
   
   type IVector_IVpnRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVpnRoute_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVpnRoute_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVpnRoute_Interface
      ; RetVal : access Windows.Networking.Vpn.IVectorView_IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVpnRoute_Interface
      ; value : Windows.Networking.Vpn.IVpnRoute
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVpnRoute_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVpnRoute_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVpnRoute_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVpnRoute_Interface
      ; value : Windows.Networking.Vpn.IVpnRoute
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVpnRoute_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVpnRoute_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVpnRoute_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnRoute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVpnRoute_Interface
      ; items : Windows.Networking.Vpn.IVpnRoute_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnNamespaceInfo : aliased constant Windows.IID := (2447540804, 30037, 22861, (181, 77, 156, 135, 9, 94, 121, 162 ));
   
   type IIterator_IVpnNamespaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnNamespaceInfo_Interface
      ; items : Windows.Networking.Vpn.IVpnNamespaceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnNamespaceInfo : aliased constant Windows.IID := (393747715, 56783, 21823, (171, 168, 210, 232, 21, 92, 182, 184 ));
   
   type IIterable_IVpnNamespaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnNamespaceInfo : aliased constant Windows.IID := (3337422249, 19911, 20605, (156, 146, 124, 120, 194, 239, 71, 134 ));
   
   type IVectorView_IVpnNamespaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnNamespaceInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnNamespaceInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnNamespaceInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnNamespaceInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnNamespaceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVpnNamespaceInfo : aliased constant Windows.IID := (90955250, 4957, 21550, (163, 34, 54, 170, 76, 160, 230, 13 ));
   
   type IVector_IVpnNamespaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IVectorView_IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnNamespaceInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnNamespaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnNamespaceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVpnNamespaceInfo_Interface
      ; items : Windows.Networking.Vpn.IVpnNamespaceInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnCustomPrompt : aliased constant Windows.IID := (1875365864, 6274, 23457, (142, 94, 76, 94, 58, 79, 168, 109 ));
   
   type IIterator_IVpnCustomPrompt_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnCustomPrompt
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnCustomPrompt_Interface
      ; items : Windows.Networking.Vpn.IVpnCustomPrompt_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnCustomPrompt : aliased constant Windows.IID := (2343332188, 28875, 21718, (134, 6, 175, 110, 58, 37, 227, 161 ));
   
   type IIterable_IVpnCustomPrompt_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnCustomPrompt_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnCustomPrompt
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnCustomPrompt : aliased constant Windows.IID := (2151958978, 15297, 23806, (132, 104, 59, 190, 206, 74, 92, 215 ));
   
   type IVectorView_IVpnCustomPrompt_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnCustomPrompt_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnCustomPrompt
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnCustomPrompt_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnCustomPrompt_Interface
      ; value : Windows.Networking.Vpn.IVpnCustomPrompt
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnCustomPrompt_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnCustomPrompt_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnCustomPromptElement : aliased constant Windows.IID := (3995336481, 20922, 23748, (152, 86, 98, 92, 121, 194, 128, 128 ));
   
   type IIterator_IVpnCustomPromptElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnCustomPromptElement
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnCustomPromptElement_Interface
      ; items : Windows.Networking.Vpn.IVpnCustomPromptElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnCustomPromptElement : aliased constant Windows.IID := (1132279443, 196, 20660, (152, 154, 147, 143, 16, 22, 162, 48 ));
   
   type IIterable_IVpnCustomPromptElement_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnCustomPromptElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnCustomPromptElement : aliased constant Windows.IID := (636155371, 12089, 23373, (187, 110, 230, 82, 199, 208, 15, 106 ));
   
   type IVectorView_IVpnCustomPromptElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnCustomPromptElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnCustomPromptElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnCustomPromptElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnCustomPromptElement_Interface
      ; value : Windows.Networking.Vpn.IVpnCustomPromptElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnCustomPromptElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnCustomPromptElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVpnCredential : aliased constant Windows.IID := (560623511, 56225, 24433, (161, 75, 40, 24, 173, 60, 76, 105 ));
   
   type IAsyncOperation_IVpnCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVpnCredential_Interface
      ; handler : Windows.Networking.Vpn.AsyncOperationCompletedHandler_IVpnCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVpnCredential_Interface
      ; RetVal : access Windows.Networking.Vpn.AsyncOperationCompletedHandler_IVpnCredential
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVpnCredential_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnDomainNameInfo : aliased constant Windows.IID := (704184462, 16001, 23640, (138, 120, 107, 233, 26, 188, 193, 125 ));
   
   type IIterator_IVpnDomainNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnDomainNameInfo_Interface
      ; items : Windows.Networking.Vpn.IVpnDomainNameInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnDomainNameInfo : aliased constant Windows.IID := (866903176, 48666, 21898, (169, 207, 181, 51, 10, 180, 159, 80 ));
   
   type IIterable_IVpnDomainNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnDomainNameInfo : aliased constant Windows.IID := (3564580695, 9000, 23589, (154, 17, 36, 109, 161, 126, 57, 213 ));
   
   type IVectorView_IVpnDomainNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnDomainNameInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnDomainNameInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnDomainNameInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnDomainNameInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnDomainNameInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVpnDomainNameInfo : aliased constant Windows.IID := (2172237554, 29299, 23715, (168, 27, 83, 233, 2, 202, 32, 155 ));
   
   type IVector_IVpnDomainNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; RetVal : access Windows.Networking.Vpn.IVectorView_IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnDomainNameInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; value : Windows.Networking.Vpn.IVpnDomainNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnDomainNameInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVpnDomainNameInfo_Interface
      ; items : Windows.Networking.Vpn.IVpnDomainNameInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnTrafficFilter : aliased constant Windows.IID := (2402801056, 22789, 21951, (156, 24, 185, 179, 181, 68, 100, 139 ));
   
   type IIterator_IVpnTrafficFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnTrafficFilter_Interface
      ; items : Windows.Networking.Vpn.IVpnTrafficFilter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnTrafficFilter : aliased constant Windows.IID := (3067398227, 30665, 21194, (156, 233, 133, 58, 221, 69, 84, 207 ));
   
   type IIterable_IVpnTrafficFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnTrafficFilter : aliased constant Windows.IID := (1977489254, 60962, 22249, (190, 153, 39, 20, 6, 83, 73, 229 ));
   
   type IVectorView_IVpnTrafficFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnTrafficFilter_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.IVpnTrafficFilter
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnTrafficFilter_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnTrafficFilter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVpnTrafficFilter : aliased constant Windows.IID := (710646488, 61445, 24425, (173, 129, 48, 6, 66, 231, 198, 103 ));
   
   type IVector_IVpnTrafficFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; RetVal : access Windows.Networking.Vpn.IVectorView_IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.IVpnTrafficFilter
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; value : Windows.Networking.Vpn.IVpnTrafficFilter
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVpnTrafficFilter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVpnTrafficFilter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnTrafficFilter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVpnTrafficFilter_Interface
      ; items : Windows.Networking.Vpn.IVpnTrafficFilter_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVpnAppId : aliased constant Windows.IID := (3969030320, 36002, 21660, (187, 226, 37, 40, 35, 231, 14, 239 ));
   
   type IIterator_IVpnAppId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVpnAppId_Interface
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVpnAppId_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVpnAppId_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVpnAppId_Interface
      ; items : Windows.Networking.Vpn.IVpnAppId_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVpnAppId : aliased constant Windows.IID := (236847274, 63805, 24007, (153, 18, 224, 125, 31, 166, 189, 103 ));
   
   type IIterable_IVpnAppId_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVpnAppId_Interface
      ; RetVal : access Windows.Networking.Vpn.IIterator_IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVpnAppId : aliased constant Windows.IID := (4209818704, 55962, 20738, (130, 41, 29, 210, 78, 135, 61, 31 ));
   
   type IVectorView_IVpnAppId_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVpnAppId_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVpnAppId_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVpnAppId_Interface
      ; value : Windows.Networking.Vpn.IVpnAppId
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVpnAppId_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnAppId_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVpnAppId : aliased constant Windows.IID := (2299100504, 60856, 23252, (171, 197, 96, 63, 33, 221, 75, 21 ));
   
   type IVector_IVpnAppId_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVpnAppId_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVpnAppId_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVpnAppId_Interface
      ; RetVal : access Windows.Networking.Vpn.IVectorView_IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVpnAppId_Interface
      ; value : Windows.Networking.Vpn.IVpnAppId
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVpnAppId_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVpnAppId_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVpnAppId_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVpnAppId_Interface
      ; value : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVpnAppId_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVpnAppId_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVpnAppId_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Vpn.IVpnAppId_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVpnAppId_Interface
      ; items : Windows.Networking.Vpn.IVpnAppId_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_VpnManagementErrorStatus : aliased constant Windows.IID := (3919283932, 27493, 24355, (148, 25, 144, 181, 88, 82, 242, 131 ));
   
   type IAsyncOperation_VpnManagementErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_VpnManagementErrorStatus_Interface
      ; handler : Windows.Networking.Vpn.AsyncOperationCompletedHandler_VpnManagementErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_VpnManagementErrorStatus_Interface
      ; RetVal : access Windows.Networking.Vpn.AsyncOperationCompletedHandler_VpnManagementErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_VpnManagementErrorStatus_Interface
      ; RetVal : access Windows.Networking.Vpn.VpnManagementErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IVpnChannel_add_ActivityChange : aliased constant Windows.IID := (965769545, 43212, 23781, (158, 10, 6, 227, 178, 211, 21, 112 ));
   
   type TypedEventHandler_IVpnChannel_add_ActivityChange_Interface(Callback : access procedure (sender : Windows.Networking.Vpn.IVpnChannel ; args : Windows.Networking.Vpn.IVpnChannelActivityEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IVpnChannel_add_ActivityChange'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IVpnChannel_add_ActivityChange_Interface
      ; sender : Windows.Networking.Vpn.IVpnChannel
      ; args : Windows.Networking.Vpn.IVpnChannelActivityEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IVpnChannel2_add_ActivityStateChange : aliased constant Windows.IID := (754774458, 49148, 22342, (184, 104, 46, 69, 164, 109, 41, 88 ));
   
   type TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface(Callback : access procedure (sender : Windows.Networking.Vpn.IVpnChannel ; args : Windows.Networking.Vpn.IVpnChannelActivityStateChangedArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IVpnChannel2_add_ActivityStateChange'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface
      ; sender : Windows.Networking.Vpn.IVpnChannel
      ; args : Windows.Networking.Vpn.IVpnChannelActivityStateChangedArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVpnCredential : aliased constant Windows.IID := (480003332, 19317, 22506, (131, 125, 83, 56, 53, 139, 183, 98 ));
   
   type AsyncOperationCompletedHandler_IVpnCredential_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Vpn.IAsyncOperation_IVpnCredential ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVpnCredential'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVpnCredential_Interface
      ; asyncInfo : Windows.Networking.Vpn.IAsyncOperation_IVpnCredential
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_VpnManagementErrorStatus : aliased constant Windows.IID := (824352652, 28829, 20503, (134, 41, 87, 239, 18, 137, 230, 22 ));
   
   type AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_VpnManagementErrorStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface
      ; asyncInfo : Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VpnRoute is Windows.Networking.Vpn.IVpnRoute;
   function CreateVpnRoute
   (
      address : Windows.Networking.IHostName
      ; prefixSize : Windows.UInt8
   )
   return Windows.Networking.Vpn.IVpnRoute;
   
   subtype VpnNamespaceInfo is Windows.Networking.Vpn.IVpnNamespaceInfo;
   function CreateVpnNamespaceInfo
   (
      name : Windows.String
      ; dnsServerList : Windows.Networking.IVector_IHostName
      ; proxyServerList : Windows.Networking.IVector_IHostName
   )
   return Windows.Networking.Vpn.IVpnNamespaceInfo;
   
   subtype VpnInterfaceId is Windows.Networking.Vpn.IVpnInterfaceId;
   function CreateVpnInterfaceId
   (
      address : Windows.UInt8_Ptr
   )
   return Windows.Networking.Vpn.IVpnInterfaceId;
   
   subtype VpnRouteAssignment is Windows.Networking.Vpn.IVpnRouteAssignment;
   function CreateVpnRouteAssignment return Windows.Networking.Vpn.IVpnRouteAssignment;
   
   subtype VpnNamespaceAssignment is Windows.Networking.Vpn.IVpnNamespaceAssignment;
   function CreateVpnNamespaceAssignment return Windows.Networking.Vpn.IVpnNamespaceAssignment;
   
   subtype VpnPickedCredential is Windows.Networking.Vpn.IVpnPickedCredential;
   subtype VpnPacketBuffer is Windows.Networking.Vpn.IVpnPacketBuffer;
   function CreateVpnPacketBuffer
   (
      parentBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
      ; offset : Windows.UInt32
      ; length : Windows.UInt32
   )
   return Windows.Networking.Vpn.IVpnPacketBuffer;
   
   subtype VpnChannelConfiguration is Windows.Networking.Vpn.IVpnChannelConfiguration;
   subtype VpnChannel is Windows.Networking.Vpn.IVpnChannel;
   subtype VpnChannelActivityEventArgs is Windows.Networking.Vpn.IVpnChannelActivityEventArgs;
   subtype VpnSystemHealth is Windows.Networking.Vpn.IVpnSystemHealth;
   subtype VpnDomainNameAssignment is Windows.Networking.Vpn.IVpnDomainNameAssignment;
   function CreateVpnDomainNameAssignment return Windows.Networking.Vpn.IVpnDomainNameAssignment;
   
   subtype VpnChannelActivityStateChangedArgs is Windows.Networking.Vpn.IVpnChannelActivityStateChangedArgs;
   subtype VpnCredential is Windows.Networking.Vpn.IVpnCredential;
   subtype VpnTrafficFilterAssignment is Windows.Networking.Vpn.IVpnTrafficFilterAssignment;
   function CreateVpnTrafficFilterAssignment return Windows.Networking.Vpn.IVpnTrafficFilterAssignment;
   
   subtype VpnAppId is Windows.Networking.Vpn.IVpnAppId;
   function Create
   (
      type_x : Windows.Networking.Vpn.VpnAppIdType
      ; value : Windows.String
   )
   return Windows.Networking.Vpn.IVpnAppId;
   
   subtype VpnDomainNameInfo is Windows.Networking.Vpn.IVpnDomainNameInfo;
   function CreateVpnDomainNameInfo
   (
      name : Windows.String
      ; nameType : Windows.Networking.Vpn.VpnDomainNameType
      ; dnsServerList : Windows.Networking.IIterable_IHostName
      ; proxyServerList : Windows.Networking.IIterable_IHostName
   )
   return Windows.Networking.Vpn.IVpnDomainNameInfo;
   
   subtype VpnTrafficFilter is Windows.Networking.Vpn.IVpnTrafficFilter;
   function Create
   (
      appId : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.Networking.Vpn.IVpnTrafficFilter;
   
   subtype VpnPacketBufferList is Windows.Networking.Vpn.IVpnPacketBufferList;
   subtype VpnCustomEditBox is Windows.Networking.Vpn.IVpnCustomEditBox;
   function CreateVpnCustomEditBox return Windows.Networking.Vpn.IVpnCustomEditBox;
   
   subtype VpnCustomPromptTextInput is Windows.Networking.Vpn.IVpnCustomPromptTextInput;
   function CreateVpnCustomPromptTextInput return Windows.Networking.Vpn.IVpnCustomPromptTextInput;
   
   subtype VpnCustomComboBox is Windows.Networking.Vpn.IVpnCustomComboBox;
   function CreateVpnCustomComboBox return Windows.Networking.Vpn.IVpnCustomComboBox;
   
   subtype VpnCustomPromptOptionSelector is Windows.Networking.Vpn.IVpnCustomPromptOptionSelector;
   function CreateVpnCustomPromptOptionSelector return Windows.Networking.Vpn.IVpnCustomPromptOptionSelector;
   
   subtype VpnCustomTextBox is Windows.Networking.Vpn.IVpnCustomTextBox;
   function CreateVpnCustomTextBox return Windows.Networking.Vpn.IVpnCustomTextBox;
   
   subtype VpnCustomPromptText is Windows.Networking.Vpn.IVpnCustomPromptText;
   function CreateVpnCustomPromptText return Windows.Networking.Vpn.IVpnCustomPromptText;
   
   subtype VpnCustomCheckBox is Windows.Networking.Vpn.IVpnCustomCheckBox;
   function CreateVpnCustomCheckBox return Windows.Networking.Vpn.IVpnCustomCheckBox;
   
   subtype VpnCustomPromptBooleanInput is Windows.Networking.Vpn.IVpnCustomPromptBooleanInput;
   function CreateVpnCustomPromptBooleanInput return Windows.Networking.Vpn.IVpnCustomPromptBooleanInput;
   
   subtype VpnCustomErrorBox is Windows.Networking.Vpn.IVpnCustomErrorBox;
   function CreateVpnCustomErrorBox return Windows.Networking.Vpn.IVpnCustomErrorBox;
   
   subtype VpnPlugInProfile is Windows.Networking.Vpn.IVpnPlugInProfile;
   function CreateVpnPlugInProfile return Windows.Networking.Vpn.IVpnPlugInProfile;
   
   subtype VpnNativeProfile is Windows.Networking.Vpn.IVpnNativeProfile;
   function CreateVpnNativeProfile return Windows.Networking.Vpn.IVpnNativeProfile;
   
   subtype VpnManagementAgent is Windows.Networking.Vpn.IVpnManagementAgent;
   function CreateVpnManagementAgent return Windows.Networking.Vpn.IVpnManagementAgent;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   procedure ProcessEventAsync
   (
      thirdPartyPlugIn : Windows.Object
      ; event : Windows.Object
   )
   ;
   
end;
