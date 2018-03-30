--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Security.Credentials;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Security.Authentication.Web.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebTokenRequestPromptType is (
      Default,
      ForceAuthentication
   );
   for WebTokenRequestPromptType use (
      Default => 0,
      ForceAuthentication => 1
   );
   for WebTokenRequestPromptType'Size use 32;
   
   type WebTokenRequestPromptType_Ptr is access WebTokenRequestPromptType;
   
   type WebTokenRequestStatus is (
      Success,
      UserCancel,
      AccountSwitch,
      UserInteractionRequired,
      AccountProviderNotAvailable,
      ProviderError
   );
   for WebTokenRequestStatus use (
      Success => 0,
      UserCancel => 1,
      AccountSwitch => 2,
      UserInteractionRequired => 3,
      AccountProviderNotAvailable => 4,
      ProviderError => 5
   );
   for WebTokenRequestStatus'Size use 32;
   
   type WebTokenRequestStatus_Ptr is access WebTokenRequestStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface;
   type AsyncOperationCompletedHandler_IWebTokenRequestResult is access all AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface'Class;
   type AsyncOperationCompletedHandler_IWebTokenRequestResult_Ptr is access all AsyncOperationCompletedHandler_IWebTokenRequestResult;
   type TypedEventHandler_IWebAccountMonitor_add_Updated_Interface;
   type TypedEventHandler_IWebAccountMonitor_add_Updated is access all TypedEventHandler_IWebAccountMonitor_add_Updated_Interface'Class;
   type TypedEventHandler_IWebAccountMonitor_add_Updated_Ptr is access all TypedEventHandler_IWebAccountMonitor_add_Updated;
   type TypedEventHandler_IWebAccountMonitor_add_Removed_Interface;
   type TypedEventHandler_IWebAccountMonitor_add_Removed is access all TypedEventHandler_IWebAccountMonitor_add_Removed_Interface'Class;
   type TypedEventHandler_IWebAccountMonitor_add_Removed_Ptr is access all TypedEventHandler_IWebAccountMonitor_add_Removed;
   type TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface;
   type TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged is access all TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface'Class;
   type TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Ptr is access all TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebTokenRequest_Interface;
   type IWebTokenRequest is access all IWebTokenRequest_Interface'Class;
   type IWebTokenRequest_Ptr is access all IWebTokenRequest;
   type IWebTokenRequest2_Interface;
   type IWebTokenRequest2 is access all IWebTokenRequest2_Interface'Class;
   type IWebTokenRequest2_Ptr is access all IWebTokenRequest2;
   type IWebTokenRequest3_Interface;
   type IWebTokenRequest3 is access all IWebTokenRequest3_Interface'Class;
   type IWebTokenRequest3_Ptr is access all IWebTokenRequest3;
   type IWebTokenRequestFactory_Interface;
   type IWebTokenRequestFactory is access all IWebTokenRequestFactory_Interface'Class;
   type IWebTokenRequestFactory_Ptr is access all IWebTokenRequestFactory;
   type IWebAccountEventArgs_Interface;
   type IWebAccountEventArgs is access all IWebAccountEventArgs_Interface'Class;
   type IWebAccountEventArgs_Ptr is access all IWebAccountEventArgs;
   type IWebAuthenticationCoreManagerStatics_Interface;
   type IWebAuthenticationCoreManagerStatics is access all IWebAuthenticationCoreManagerStatics_Interface'Class;
   type IWebAuthenticationCoreManagerStatics_Ptr is access all IWebAuthenticationCoreManagerStatics;
   type IWebAuthenticationCoreManagerStatics2_Interface;
   type IWebAuthenticationCoreManagerStatics2 is access all IWebAuthenticationCoreManagerStatics2_Interface'Class;
   type IWebAuthenticationCoreManagerStatics2_Ptr is access all IWebAuthenticationCoreManagerStatics2;
   type IWebAuthenticationCoreManagerStatics3_Interface;
   type IWebAuthenticationCoreManagerStatics3 is access all IWebAuthenticationCoreManagerStatics3_Interface'Class;
   type IWebAuthenticationCoreManagerStatics3_Ptr is access all IWebAuthenticationCoreManagerStatics3;
   type IWebAccountMonitor_Interface;
   type IWebAccountMonitor is access all IWebAccountMonitor_Interface'Class;
   type IWebAccountMonitor_Ptr is access all IWebAccountMonitor;
   type IWebProviderError_Interface;
   type IWebProviderError is access all IWebProviderError_Interface'Class;
   type IWebProviderError_Ptr is access all IWebProviderError;
   type IWebProviderErrorFactory_Interface;
   type IWebProviderErrorFactory is access all IWebProviderErrorFactory_Interface'Class;
   type IWebProviderErrorFactory_Ptr is access all IWebProviderErrorFactory;
   type IWebTokenRequestResult_Interface;
   type IWebTokenRequestResult is access all IWebTokenRequestResult_Interface'Class;
   type IWebTokenRequestResult_Ptr is access all IWebTokenRequestResult;
   type IWebTokenResponse_Interface;
   type IWebTokenResponse is access all IWebTokenResponse_Interface'Class;
   type IWebTokenResponse_Ptr is access all IWebTokenResponse;
   type IWebTokenResponseFactory_Interface;
   type IWebTokenResponseFactory is access all IWebTokenResponseFactory_Interface'Class;
   type IWebTokenResponseFactory_Ptr is access all IWebTokenResponseFactory;
   type IAsyncOperation_IWebTokenRequestResult_Interface;
   type IAsyncOperation_IWebTokenRequestResult is access all IAsyncOperation_IWebTokenRequestResult_Interface'Class;
   type IAsyncOperation_IWebTokenRequestResult_Ptr is access all IAsyncOperation_IWebTokenRequestResult;
   type IIterator_IWebTokenResponse_Interface;
   type IIterator_IWebTokenResponse is access all IIterator_IWebTokenResponse_Interface'Class;
   type IIterator_IWebTokenResponse_Ptr is access all IIterator_IWebTokenResponse;
   type IIterable_IWebTokenResponse_Interface;
   type IIterable_IWebTokenResponse is access all IIterable_IWebTokenResponse_Interface'Class;
   type IIterable_IWebTokenResponse_Ptr is access all IIterable_IWebTokenResponse;
   type IVectorView_IWebTokenResponse_Interface;
   type IVectorView_IWebTokenResponse is access all IVectorView_IWebTokenResponse_Interface'Class;
   type IVectorView_IWebTokenResponse_Ptr is access all IVectorView_IWebTokenResponse;
   
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
   type IWebTokenRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccountProvider
   (
      This       : access IWebTokenRequest_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Scope
   (
      This       : access IWebTokenRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientId
   (
      This       : access IWebTokenRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PromptType
   (
      This       : access IWebTokenRequest_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.WebTokenRequestPromptType
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IWebTokenRequest_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenRequest : aliased constant Windows.IID := (3078311272, 44491, 18035, (179, 100, 12, 247, 179, 92, 175, 151 ));
   
   ------------------------------------------------------------------------
   type IWebTokenRequest2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppProperties
   (
      This       : access IWebTokenRequest2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenRequest2 : aliased constant Windows.IID := (3607150713, 12488, 17303, (150, 84, 150, 28, 59, 232, 184, 85 ));
   
   ------------------------------------------------------------------------
   type IWebTokenRequest3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CorrelationId
   (
      This       : access IWebTokenRequest3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CorrelationId
   (
      This       : access IWebTokenRequest3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenRequest3 : aliased constant Windows.IID := (1517640529, 15281, 16805, (166, 61, 144, 188, 50, 199, 219, 154 ));
   
   ------------------------------------------------------------------------
   type IWebTokenRequestFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebTokenRequestFactory_Interface
      ; provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPromptType
   (
      This       : access IWebTokenRequestFactory_Interface
      ; provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
      ; promptType : Windows.Security.Authentication.Web.Core.WebTokenRequestPromptType
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithProvider
   (
      This       : access IWebTokenRequestFactory_Interface
      ; provider : Windows.Security.Credentials.IWebAccountProvider
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithScope
   (
      This       : access IWebTokenRequestFactory_Interface
      ; provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenRequestFactory : aliased constant Windows.IID := (1827804188, 4080, 19559, (184, 79, 153, 221, 190, 74, 114, 201 ));
   
   ------------------------------------------------------------------------
   type IWebAccountEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Account
   (
      This       : access IWebAccountEventArgs_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebAccountEventArgs : aliased constant Windows.IID := (1874264957, 16974, 17644, (151, 124, 239, 36, 21, 70, 42, 90 ));
   
   ------------------------------------------------------------------------
   type IWebAuthenticationCoreManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTokenSilentlyAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTokenSilentlyWithWebAccountAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestTokenAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestTokenWithWebAccountAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAccountAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; provider : Windows.Security.Credentials.IWebAccountProvider
      ; webAccountId : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAccountProviderAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; webAccountProviderId : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAccountProviderWithAuthorityAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics_Interface
      ; webAccountProviderId : Windows.String
      ; authority : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebAuthenticationCoreManagerStatics : aliased constant Windows.IID := (1791655058, 42369, 17529, (156, 16, 117, 46, 255, 68, 253, 52 ));
   
   ------------------------------------------------------------------------
   type IWebAuthenticationCoreManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAccountProviderWithAuthorityForUserAsync
   (
      This       : access IWebAuthenticationCoreManagerStatics2_Interface
      ; webAccountProviderId : Windows.String
      ; authority : Windows.String
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebAuthenticationCoreManagerStatics2 : aliased constant Windows.IID := (4119074890, 35671, 18464, (182, 164, 112, 165, 182, 252, 244, 74 ));
   
   ------------------------------------------------------------------------
   type IWebAuthenticationCoreManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWebAccountMonitor
   (
      This       : access IWebAuthenticationCoreManagerStatics3_Interface
      ; webAccounts : Windows.Security.Credentials.IIterable_IWebAccount
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebAccountMonitor
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebAuthenticationCoreManagerStatics3 : aliased constant Windows.IID := (604303026, 35108, 19859, (171, 58, 153, 104, 139, 65, 157, 86 ));
   
   ------------------------------------------------------------------------
   type IWebAccountMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Updated
   (
      This       : access IWebAccountMonitor_Interface
      ; handler : TypedEventHandler_IWebAccountMonitor_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IWebAccountMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IWebAccountMonitor_Interface
      ; handler : TypedEventHandler_IWebAccountMonitor_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IWebAccountMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DefaultSignInAccountChanged
   (
      This       : access IWebAccountMonitor_Interface
      ; handler : TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DefaultSignInAccountChanged
   (
      This       : access IWebAccountMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebAccountMonitor : aliased constant Windows.IID := (1950742013, 43677, 17945, (141, 93, 193, 56, 164, 237, 227, 229 ));
   
   ------------------------------------------------------------------------
   type IWebProviderError_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorCode
   (
      This       : access IWebProviderError_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorMessage
   (
      This       : access IWebProviderError_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IWebProviderError_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebProviderError : aliased constant Windows.IID := (3675855793, 20677, 18441, (141, 202, 9, 201, 148, 16, 36, 92 ));
   
   ------------------------------------------------------------------------
   type IWebProviderErrorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebProviderErrorFactory_Interface
      ; errorCode : Windows.UInt32
      ; errorMessage : Windows.String
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebProviderError
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebProviderErrorFactory : aliased constant Windows.IID := (3821275693, 35311, 20023, (132, 127, 168, 185, 213, 163, 41, 16 ));
   
   ------------------------------------------------------------------------
   type IWebTokenRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResponseData
   (
      This       : access IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IVectorView_IWebTokenResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseStatus
   (
      This       : access IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.WebTokenRequestStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseError
   (
      This       : access IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebProviderError
   )
   return Windows.HRESULT is abstract;
   
   function InvalidateCacheAsync
   (
      This       : access IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenRequestResult : aliased constant Windows.IID := (3240788741, 53752, 17539, (141, 84, 56, 254, 41, 39, 132, 255 ));
   
   ------------------------------------------------------------------------
   type IWebTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Token
   (
      This       : access IWebTokenResponse_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderError
   (
      This       : access IWebTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebProviderError
   )
   return Windows.HRESULT is abstract;
   
   function get_WebAccount
   (
      This       : access IWebTokenResponse_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IWebTokenResponse_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenResponse : aliased constant Windows.IID := (1739048394, 33782, 17606, (163, 177, 14, 182, 158, 65, 250, 138 ));
   
   ------------------------------------------------------------------------
   type IWebTokenResponseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithToken
   (
      This       : access IWebTokenResponseFactory_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTokenAndAccount
   (
      This       : access IWebTokenResponseFactory_Interface
      ; token : Windows.String
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTokenAccountAndError
   (
      This       : access IWebTokenResponseFactory_Interface
      ; token : Windows.String
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; error : Windows.Security.Authentication.Web.Core.IWebProviderError
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebTokenResponseFactory : aliased constant Windows.IID := (2875979768, 21584, 20214, (151, 247, 5, 43, 4, 49, 192, 240 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IWebTokenRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWebTokenRequestResult_Interface
      ; handler : Windows.Security.Authentication.Web.Core.AsyncOperationCompletedHandler_IWebTokenRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.AsyncOperationCompletedHandler_IWebTokenRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWebTokenRequestResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequestResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IWebTokenRequestResult : aliased constant Windows.IID := (176248914, 31812, 22132, (179, 210, 250, 46, 76, 30, 70, 201 ));
   
   ------------------------------------------------------------------------
   type IIterator_IWebTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebTokenResponse_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebTokenResponse_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebTokenResponse_Interface
      ; items : Windows.Security.Authentication.Web.Core.IWebTokenResponse_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IWebTokenResponse : aliased constant Windows.IID := (4034965705, 41109, 23354, (161, 220, 209, 126, 125, 41, 130, 199 ));
   
   ------------------------------------------------------------------------
   type IIterable_IWebTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IIterator_IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IWebTokenResponse : aliased constant Windows.IID := (2119940076, 48087, 21877, (154, 97, 245, 129, 95, 162, 42, 14 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IWebTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebTokenResponse_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebTokenResponse_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebTokenResponse_Interface
      ; value : Windows.Security.Authentication.Web.Core.IWebTokenResponse
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebTokenResponse_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Authentication.Web.Core.IWebTokenResponse_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IWebTokenResponse : aliased constant Windows.IID := (429786716, 33173, 21978, (156, 16, 138, 234, 249, 172, 16, 98 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IWebTokenRequestResult : aliased constant Windows.IID := (3736423202, 28914, 21931, (151, 192, 108, 189, 197, 221, 182, 240 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IWebAccountMonitor_add_Updated_Interface(Callback : access procedure (sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IWebAccountMonitor_add_Updated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebAccountMonitor_add_Updated_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IWebAccountMonitor_add_Updated : aliased constant Windows.IID := (4201664260, 34742, 20843, (149, 150, 205, 124, 192, 146, 22, 155 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IWebAccountMonitor_add_Removed_Interface(Callback : access procedure (sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IWebAccountMonitor_add_Removed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebAccountMonitor_add_Removed_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IWebAccountMonitor_add_Removed : aliased constant Windows.IID := (4201664260, 34742, 20843, (149, 150, 205, 124, 192, 146, 22, 155 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface(Callback : access procedure (sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged : aliased constant Windows.IID := (3368765837, 57562, 21153, (171, 249, 113, 152, 199, 245, 203, 66 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebTokenRequest is Windows.Security.Authentication.Web.Core.IWebTokenRequest;
   
   function Create
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest;
   
   function CreateWithPromptType
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
      ; promptType : Windows.Security.Authentication.Web.Core.WebTokenRequestPromptType
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest;
   
   function CreateWithProvider
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest;
   
   function CreateWithScope
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest;
   
   subtype WebAccountEventArgs is Windows.Security.Authentication.Web.Core.IWebAccountEventArgs;
   subtype WebAccountMonitor is Windows.Security.Authentication.Web.Core.IWebAccountMonitor;
   subtype WebProviderError is Windows.Security.Authentication.Web.Core.IWebProviderError;
   
   function Create
   (
      errorCode : Windows.UInt32
      ; errorMessage : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebProviderError;
   
   subtype WebTokenResponse is Windows.Security.Authentication.Web.Core.IWebTokenResponse;
   
   function CreateWebTokenResponse return Windows.Security.Authentication.Web.Core.IWebTokenResponse;
   
   subtype WebTokenRequestResult is Windows.Security.Authentication.Web.Core.IWebTokenRequestResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetTokenSilentlyAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   
   function GetTokenSilentlyWithWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   
   function RequestTokenAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   
   function RequestTokenWithWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   
   function FindAccountAsync
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; webAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function FindAccountProviderAsync
   (
      webAccountProviderId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;
   
   function FindAccountProviderWithAuthorityAsync
   (
      webAccountProviderId : Windows.String
      ; authority : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;
   
   function CreateWebAccountMonitor
   (
      webAccounts : Windows.Security.Credentials.IIterable_IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IWebAccountMonitor;
   
   function FindAccountProviderWithAuthorityForUserAsync
   (
      webAccountProviderId : Windows.String
      ; authority : Windows.String
      ; user : Windows.System.IUser
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;

end;
