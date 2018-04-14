--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
package Windows.Security.Authentication.Identity.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MicrosoftAccountMultiFactorServiceResponse is (
      Success,
      Error,
      NoNetworkConnection,
      ServiceUnavailable,
      TotpSetupDenied,
      NgcNotSetup,
      SessionAlreadyDenied,
      SessionAlreadyApproved,
      SessionExpired,
      NgcNonceExpired,
      InvalidSessionId,
      InvalidSessionType,
      InvalidOperation,
      InvalidStateTransition,
      DeviceNotFound,
      FlowDisabled,
      SessionNotApproved,
      OperationCanceledByUser,
      NgcDisabledByServer,
      NgcKeyNotFoundOnServer,
      UIRequired,
      DeviceIdChanged
   );
   for MicrosoftAccountMultiFactorServiceResponse use (
      Success => 0,
      Error => 1,
      NoNetworkConnection => 2,
      ServiceUnavailable => 3,
      TotpSetupDenied => 4,
      NgcNotSetup => 5,
      SessionAlreadyDenied => 6,
      SessionAlreadyApproved => 7,
      SessionExpired => 8,
      NgcNonceExpired => 9,
      InvalidSessionId => 10,
      InvalidSessionType => 11,
      InvalidOperation => 12,
      InvalidStateTransition => 13,
      DeviceNotFound => 14,
      FlowDisabled => 15,
      SessionNotApproved => 16,
      OperationCanceledByUser => 17,
      NgcDisabledByServer => 18,
      NgcKeyNotFoundOnServer => 19,
      UIRequired => 20,
      DeviceIdChanged => 21
   );
   for MicrosoftAccountMultiFactorServiceResponse'Size use 32;
   
   type MicrosoftAccountMultiFactorServiceResponse_Ptr is access MicrosoftAccountMultiFactorServiceResponse;
   
   type MicrosoftAccountMultiFactorSessionAuthenticationStatus is (
      Authenticated,
      Unauthenticated
   );
   for MicrosoftAccountMultiFactorSessionAuthenticationStatus use (
      Authenticated => 0,
      Unauthenticated => 1
   );
   for MicrosoftAccountMultiFactorSessionAuthenticationStatus'Size use 32;
   
   type MicrosoftAccountMultiFactorSessionAuthenticationStatus_Ptr is access MicrosoftAccountMultiFactorSessionAuthenticationStatus;
   
   type MicrosoftAccountMultiFactorAuthenticationType is (
      User,
      Device
   );
   for MicrosoftAccountMultiFactorAuthenticationType use (
      User => 0,
      Device => 1
   );
   for MicrosoftAccountMultiFactorAuthenticationType'Size use 32;
   
   type MicrosoftAccountMultiFactorAuthenticationType_Ptr is access MicrosoftAccountMultiFactorAuthenticationType;
   
   type MicrosoftAccountMultiFactorSessionApprovalStatus is (
      Pending,
      Approved,
      Denied
   );
   for MicrosoftAccountMultiFactorSessionApprovalStatus use (
      Pending => 0,
      Approved => 1,
      Denied => 2
   );
   for MicrosoftAccountMultiFactorSessionApprovalStatus'Size use 32;
   
   type MicrosoftAccountMultiFactorSessionApprovalStatus_Ptr is access MicrosoftAccountMultiFactorSessionApprovalStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Ptr is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo;
   type AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Interface;
   type AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse is access all AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Interface'Class;
   type AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Ptr is access all AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Interface;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Ptr is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Ptr is access all AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMicrosoftAccountMultiFactorSessionInfo_Interface;
   type IMicrosoftAccountMultiFactorSessionInfo is access all IMicrosoftAccountMultiFactorSessionInfo_Interface'Class;
   type IMicrosoftAccountMultiFactorSessionInfo_Ptr is access all IMicrosoftAccountMultiFactorSessionInfo;
   type IMicrosoftAccountMultiFactorGetSessionsResult_Interface;
   type IMicrosoftAccountMultiFactorGetSessionsResult is access all IMicrosoftAccountMultiFactorGetSessionsResult_Interface'Class;
   type IMicrosoftAccountMultiFactorGetSessionsResult_Ptr is access all IMicrosoftAccountMultiFactorGetSessionsResult;
   type IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface;
   type IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo is access all IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface'Class;
   type IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Ptr is access all IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo;
   type IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface;
   type IMicrosoftAccountMultiFactorOneTimeCodedInfo is access all IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface'Class;
   type IMicrosoftAccountMultiFactorOneTimeCodedInfo_Ptr is access all IMicrosoftAccountMultiFactorOneTimeCodedInfo;
   type IMicrosoftAccountMultiFactorAuthenticationManager_Interface;
   type IMicrosoftAccountMultiFactorAuthenticationManager is access all IMicrosoftAccountMultiFactorAuthenticationManager_Interface'Class;
   type IMicrosoftAccountMultiFactorAuthenticationManager_Ptr is access all IMicrosoftAccountMultiFactorAuthenticationManager;
   type IMicrosoftAccountMultiFactorAuthenticatorStatics_Interface;
   type IMicrosoftAccountMultiFactorAuthenticatorStatics is access all IMicrosoftAccountMultiFactorAuthenticatorStatics_Interface'Class;
   type IMicrosoftAccountMultiFactorAuthenticatorStatics_Ptr is access all IMicrosoftAccountMultiFactorAuthenticatorStatics;
   type IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface;
   type IIterator_IMicrosoftAccountMultiFactorSessionInfo is access all IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface'Class;
   type IIterator_IMicrosoftAccountMultiFactorSessionInfo_Ptr is access all IIterator_IMicrosoftAccountMultiFactorSessionInfo;
   type IIterable_IMicrosoftAccountMultiFactorSessionInfo_Interface;
   type IIterable_IMicrosoftAccountMultiFactorSessionInfo is access all IIterable_IMicrosoftAccountMultiFactorSessionInfo_Interface'Class;
   type IIterable_IMicrosoftAccountMultiFactorSessionInfo_Ptr is access all IIterable_IMicrosoftAccountMultiFactorSessionInfo;
   type IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface;
   type IVectorView_IMicrosoftAccountMultiFactorSessionInfo is access all IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface'Class;
   type IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Ptr is access all IVectorView_IMicrosoftAccountMultiFactorSessionInfo;
   type IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface;
   type IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo is access all IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface'Class;
   type IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Ptr is access all IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo;
   type IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface;
   type IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse is access all IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface'Class;
   type IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Ptr is access all IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse;
   type IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface;
   type IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult is access all IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface'Class;
   type IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Ptr is access all IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult;
   type IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface;
   type IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo is access all IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface'Class;
   type IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Ptr is access all IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorSessionInfo : aliased constant Windows.IID := (1602137012, 41592, 17973, (183, 101, 180, 148, 235, 38, 10, 244 ));
   
   type IMicrosoftAccountMultiFactorSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserAccountId
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionId
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplaySessionId
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ApprovalStatus
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorSessionApprovalStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationType
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestTime
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorGetSessionsResult : aliased constant Windows.IID := (1310960032, 59898, 18810, (149, 222, 109, 87, 71, 191, 151, 76 ));
   
   type IMicrosoftAccountMultiFactorGetSessionsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Sessions
   (
      This       : access IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IVectorView_IMicrosoftAccountMultiFactorSessionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceResponse
   (
      This       : access IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo : aliased constant Windows.IID := (2860434939, 55871, 16520, (162, 13, 86, 24, 175, 173, 178, 229 ));
   
   type IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Sessions
   (
      This       : access IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IVectorView_IMicrosoftAccountMultiFactorSessionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UnregisteredAccounts
   (
      This       : access IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceResponse
   (
      This       : access IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorOneTimeCodedInfo : aliased constant Windows.IID := (2193237579, 55420, 18024, (169, 118, 64, 207, 174, 84, 125, 8 ));
   
   type IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Code
   (
      This       : access IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeInterval
   (
      This       : access IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeToLive
   (
      This       : access IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceResponse
   (
      This       : access IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorAuthenticationManager : aliased constant Windows.IID := (265502885, 62836, 17184, (160, 142, 10, 25, 168, 35, 34, 170 ));
   
   type IMicrosoftAccountMultiFactorAuthenticationManager_Interface is interface and Windows.IInspectable_Interface;
   
   function GetOneTimePassCodeAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountId : Windows.String
      ; codeLength : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddDeviceAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountId : Windows.String
      ; authenticationToken : Windows.String
      ; wnsChannelId : Windows.String
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemoveDeviceAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountId : Windows.String
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateWnsChannelAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountId : Windows.String
      ; channelUri : Windows.String
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSessionsAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountIdList : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSessionsAndUnregisteredAccountsAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountIdList : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ApproveSessionUsingAuthSessionInfoAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; sessionAuthentictionStatus : Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorSessionAuthenticationStatus
      ; authenticationSessionInfo : Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ApproveSessionAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; sessionAuthentictionStatus : Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorSessionAuthenticationStatus
      ; userAccountId : Windows.String
      ; sessionId : Windows.String
      ; sessionAuthenticationType : Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationType
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DenySessionUsingAuthSessionInfoAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; authenticationSessionInfo : Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DenySessionAsync
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticationManager_Interface
      ; userAccountId : Windows.String
      ; sessionId : Windows.String
      ; sessionAuthenticationType : Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationType
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMicrosoftAccountMultiFactorAuthenticatorStatics : aliased constant Windows.IID := (3647259366, 62534, 19569, (139, 121, 110, 164, 2, 74, 169, 184 ));
   
   type IMicrosoftAccountMultiFactorAuthenticatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IMicrosoftAccountMultiFactorAuthenticatorStatics_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorAuthenticationManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMicrosoftAccountMultiFactorSessionInfo : aliased constant Windows.IID := (4251790046, 4051, 23760, (184, 110, 210, 74, 217, 162, 9, 44 ));
   
   type IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; items : Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMicrosoftAccountMultiFactorSessionInfo : aliased constant Windows.IID := (2242273992, 35421, 22952, (159, 115, 238, 35, 115, 147, 197, 92 ));
   
   type IIterable_IMicrosoftAccountMultiFactorSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IIterator_IMicrosoftAccountMultiFactorSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMicrosoftAccountMultiFactorSessionInfo : aliased constant Windows.IID := (1790855275, 59998, 24538, (145, 33, 121, 216, 167, 133, 196, 101 ));
   
   type IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; value : Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMicrosoftAccountMultiFactorSessionInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo : aliased constant Windows.IID := (2925746318, 8130, 22691, (175, 54, 111, 103, 184, 146, 43, 231 ));
   
   type IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; handler : Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorOneTimeCodedInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse : aliased constant Windows.IID := (93666190, 23259, 20921, (169, 74, 173, 3, 0, 48, 184, 227 ));
   
   type IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface
      ; handler : Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult : aliased constant Windows.IID := (1414317289, 41946, 21400, (163, 8, 227, 50, 165, 137, 97, 246 ));
   
   type IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; handler : Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorGetSessionsResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo : aliased constant Windows.IID := (2560576545, 61289, 22189, (186, 140, 229, 210, 90, 60, 98, 78 ));
   
   type IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; handler : Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo : aliased constant Windows.IID := (48776512, 62625, 22687, (147, 96, 160, 80, 46, 109, 201, 192 ));
   
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse : aliased constant Windows.IID := (2373943872, 33231, 22678, (149, 250, 231, 178, 35, 247, 105, 249 ));
   
   type AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult : aliased constant Windows.IID := (3469455562, 2599, 22484, (163, 93, 73, 152, 241, 153, 218, 201 ));
   
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo : aliased constant Windows.IID := (1824865932, 53476, 24045, (148, 244, 124, 115, 177, 50, 210, 164 ));
   
   type AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MicrosoftAccountMultiFactorSessionInfo is Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorSessionInfo;
   subtype MicrosoftAccountMultiFactorOneTimeCodedInfo is Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorOneTimeCodedInfo;
   subtype MicrosoftAccountMultiFactorGetSessionsResult is Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorGetSessionsResult;
   subtype MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo is Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo;
   subtype MicrosoftAccountMultiFactorAuthenticationManager is Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorAuthenticationManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Current
   return Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorAuthenticationManager;
   
end;
