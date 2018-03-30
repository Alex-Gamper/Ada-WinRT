--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows; use Windows;
with Windows.Foundation;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Security.Authentication.OnlineId is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CredentialPromptType is (
      PromptIfNeeded,
      RetypeCredentials,
      DoNotPrompt
   );
   for CredentialPromptType use (
      PromptIfNeeded => 0,
      RetypeCredentials => 1,
      DoNotPrompt => 2
   );
   for CredentialPromptType'Size use 32;
   
   type CredentialPromptType_Ptr is access CredentialPromptType;
   
   type OnlineIdSystemTicketStatus is (
      Success,
      Error,
      ServiceConnectionError
   );
   for OnlineIdSystemTicketStatus use (
      Success => 0,
      Error => 1,
      ServiceConnectionError => 2
   );
   for OnlineIdSystemTicketStatus'Size use 32;
   
   type OnlineIdSystemTicketStatus_Ptr is access OnlineIdSystemTicketStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface;
   type AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult is access all AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface'Class;
   type AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Ptr is access all AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IOnlineIdServiceTicketRequest_Interface;
   type IOnlineIdServiceTicketRequest is access all IOnlineIdServiceTicketRequest_Interface'Class;
   type IOnlineIdServiceTicketRequest_Ptr is access all IOnlineIdServiceTicketRequest;
   type IOnlineIdServiceTicketRequestFactory_Interface;
   type IOnlineIdServiceTicketRequestFactory is access all IOnlineIdServiceTicketRequestFactory_Interface'Class;
   type IOnlineIdServiceTicketRequestFactory_Ptr is access all IOnlineIdServiceTicketRequestFactory;
   type IOnlineIdServiceTicket_Interface;
   type IOnlineIdServiceTicket is access all IOnlineIdServiceTicket_Interface'Class;
   type IOnlineIdServiceTicket_Ptr is access all IOnlineIdServiceTicket;
   type IUserIdentity_Interface;
   type IUserIdentity is access all IUserIdentity_Interface'Class;
   type IUserIdentity_Ptr is access all IUserIdentity;
   type IOnlineIdAuthenticator_Interface;
   type IOnlineIdAuthenticator is access all IOnlineIdAuthenticator_Interface'Class;
   type IOnlineIdAuthenticator_Ptr is access all IOnlineIdAuthenticator;
   type IAsyncOperation_UserIdentity_Interface;
   type IAsyncOperation_UserIdentity is access all IAsyncOperation_UserIdentity_Interface'Class;
   type IAsyncOperation_UserIdentity_Ptr is access all IAsyncOperation_UserIdentity;
   type IOnlineIdSystemIdentity_Interface;
   type IOnlineIdSystemIdentity is access all IOnlineIdSystemIdentity_Interface'Class;
   type IOnlineIdSystemIdentity_Ptr is access all IOnlineIdSystemIdentity;
   type IOnlineIdSystemTicketResult_Interface;
   type IOnlineIdSystemTicketResult is access all IOnlineIdSystemTicketResult_Interface'Class;
   type IOnlineIdSystemTicketResult_Ptr is access all IOnlineIdSystemTicketResult;
   type IOnlineIdSystemAuthenticatorForUser_Interface;
   type IOnlineIdSystemAuthenticatorForUser is access all IOnlineIdSystemAuthenticatorForUser_Interface'Class;
   type IOnlineIdSystemAuthenticatorForUser_Ptr is access all IOnlineIdSystemAuthenticatorForUser;
   type IOnlineIdSystemAuthenticatorStatics_Interface;
   type IOnlineIdSystemAuthenticatorStatics is access all IOnlineIdSystemAuthenticatorStatics_Interface'Class;
   type IOnlineIdSystemAuthenticatorStatics_Ptr is access all IOnlineIdSystemAuthenticatorStatics;
   type IIterator_IOnlineIdServiceTicket_Interface;
   type IIterator_IOnlineIdServiceTicket is access all IIterator_IOnlineIdServiceTicket_Interface'Class;
   type IIterator_IOnlineIdServiceTicket_Ptr is access all IIterator_IOnlineIdServiceTicket;
   type IIterable_IOnlineIdServiceTicket_Interface;
   type IIterable_IOnlineIdServiceTicket is access all IIterable_IOnlineIdServiceTicket_Interface'Class;
   type IIterable_IOnlineIdServiceTicket_Ptr is access all IIterable_IOnlineIdServiceTicket;
   type IVectorView_IOnlineIdServiceTicket_Interface;
   type IVectorView_IOnlineIdServiceTicket is access all IVectorView_IOnlineIdServiceTicket_Interface'Class;
   type IVectorView_IOnlineIdServiceTicket_Ptr is access all IVectorView_IOnlineIdServiceTicket;
   type IIterator_IOnlineIdServiceTicketRequest_Interface;
   type IIterator_IOnlineIdServiceTicketRequest is access all IIterator_IOnlineIdServiceTicketRequest_Interface'Class;
   type IIterator_IOnlineIdServiceTicketRequest_Ptr is access all IIterator_IOnlineIdServiceTicketRequest;
   type IIterable_IOnlineIdServiceTicketRequest_Interface;
   type IIterable_IOnlineIdServiceTicketRequest is access all IIterable_IOnlineIdServiceTicketRequest_Interface'Class;
   type IIterable_IOnlineIdServiceTicketRequest_Ptr is access all IIterable_IOnlineIdServiceTicketRequest;
   type IAsyncOperation_IOnlineIdSystemTicketResult_Interface;
   type IAsyncOperation_IOnlineIdSystemTicketResult is access all IAsyncOperation_IOnlineIdSystemTicketResult_Interface'Class;
   type IAsyncOperation_IOnlineIdSystemTicketResult_Ptr is access all IAsyncOperation_IOnlineIdSystemTicketResult;
   
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
   type IOnlineIdServiceTicketRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Service
   (
      This       : access IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Policy
   (
      This       : access IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdServiceTicketRequest : aliased constant Windows.IID := (695485907, 64355, 16693, (137, 9, 78, 53, 76, 6, 20, 102 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdServiceTicketRequestFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateOnlineIdServiceTicketRequest
   (
      This       : access IOnlineIdServiceTicketRequestFactory_Interface
      ; service : Windows.String
      ; policy : Windows.String
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateOnlineIdServiceTicketRequestAdvanced
   (
      This       : access IOnlineIdServiceTicketRequestFactory_Interface
      ; service : Windows.String
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdServiceTicketRequestFactory : aliased constant Windows.IID := (3199928840, 40563, 16503, (150, 20, 8, 97, 76, 11, 194, 69 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdServiceTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdServiceTicket : aliased constant Windows.IID := (3378271359, 55169, 19092, (172, 184, 197, 152, 116, 35, 140, 38 ));
   
   ------------------------------------------------------------------------
   type IUserIdentity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Tickets
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IVectorView_IOnlineIdServiceTicket -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SafeCustomerId
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SignInName
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstName
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastName
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBetaAccount
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConfirmedPC
   (
      This       : access IUserIdentity_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserIdentity : aliased constant Windows.IID := (558291405, 1858, 19427, (138, 28, 124, 122, 230, 121, 170, 136 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdAuthenticator_Interface is interface and Windows.IInspectable_Interface;
   
   function AuthenticateUserAsync
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; request : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
      ; RetVal : access Windows.Security.Authentication.OnlineId.IAsyncOperation_UserIdentity
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateUserAsyncAdvanced
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; requests : Windows.Security.Authentication.OnlineId.IIterable_IOnlineIdServiceTicketRequest
      ; credentialPromptType : Windows.Security.Authentication.OnlineId.CredentialPromptType
      ; RetVal : access Windows.Security.Authentication.OnlineId.IAsyncOperation_UserIdentity
   )
   return Windows.HRESULT is abstract;
   
   function SignOutUserAsync
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function put_ApplicationId
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationId
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSignOut
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticatedSafeCustomerId
   (
      This       : access IOnlineIdAuthenticator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdAuthenticator : aliased constant Windows.IID := (2684614026, 10667, 18455, (184, 132, 215, 81, 109, 173, 24, 185 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_UserIdentity_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UserIdentity_Interface
      ; handler : Windows.Security.Authentication.OnlineId.IUserIdentity
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UserIdentity_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IUserIdentity
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UserIdentity_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IUserIdentity
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_UserIdentity : aliased constant Windows.IID := (3100386785, 16543, 22516, (187, 228, 59, 149, 183, 75, 134, 200 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdSystemIdentity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Ticket
   (
      This       : access IOnlineIdSystemIdentity_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IOnlineIdSystemIdentity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdSystemIdentity : aliased constant Windows.IID := (1950142989, 46794, 17229, (129, 36, 83, 234, 18, 104, 83, 7 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdSystemTicketResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identity
   (
      This       : access IOnlineIdSystemTicketResult_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdSystemIdentity
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IOnlineIdSystemTicketResult_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.OnlineIdSystemTicketStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IOnlineIdSystemTicketResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdSystemTicketResult : aliased constant Windows.IID := (3674890232, 45208, 19149, (157, 19, 158, 100, 6, 82, 181, 182 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdSystemAuthenticatorForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTicketAsync
   (
      This       : access IOnlineIdSystemAuthenticatorForUser_Interface
      ; request : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
      ; RetVal : access Windows.Security.Authentication.OnlineId.IAsyncOperation_IOnlineIdSystemTicketResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ApplicationId
   (
      This       : access IOnlineIdSystemAuthenticatorForUser_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationId
   (
      This       : access IOnlineIdSystemAuthenticatorForUser_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IOnlineIdSystemAuthenticatorForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdSystemAuthenticatorForUser : aliased constant Windows.IID := (1469628155, 7652, 16774, (162, 230, 181, 99, 248, 106, 175, 68 ));
   
   ------------------------------------------------------------------------
   type IOnlineIdSystemAuthenticatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Default
   (
      This       : access IOnlineIdSystemAuthenticatorStatics_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IOnlineIdSystemAuthenticatorStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IOnlineIdSystemAuthenticatorStatics : aliased constant Windows.IID := (2231662482, 63028, 16867, (150, 164, 81, 100, 233, 2, 199, 64 ));
   
   ------------------------------------------------------------------------
   type IIterator_IOnlineIdServiceTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IOnlineIdServiceTicket_Interface
      ; items : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IOnlineIdServiceTicket : aliased constant Windows.IID := (60813031, 2178, 20706, (188, 63, 79, 172, 126, 140, 39, 105 ));
   
   ------------------------------------------------------------------------
   type IIterable_IOnlineIdServiceTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IIterator_IOnlineIdServiceTicket
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IOnlineIdServiceTicket : aliased constant Windows.IID := (2157777684, 38827, 21828, (152, 145, 221, 205, 250, 221, 29, 187 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IOnlineIdServiceTicket_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IOnlineIdServiceTicket_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IOnlineIdServiceTicket_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IOnlineIdServiceTicket_Interface
      ; value : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IOnlineIdServiceTicket_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IOnlineIdServiceTicket : aliased constant Windows.IID := (1173369395, 59304, 23262, (159, 243, 11, 138, 28, 107, 167, 107 ));
   
   ------------------------------------------------------------------------
   type IIterator_IOnlineIdServiceTicketRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IOnlineIdServiceTicketRequest_Interface
      ; items : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IOnlineIdServiceTicketRequest : aliased constant Windows.IID := (3064318180, 28220, 23607, (146, 207, 207, 159, 28, 56, 51, 53 ));
   
   ------------------------------------------------------------------------
   type IIterable_IOnlineIdServiceTicketRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IOnlineIdServiceTicketRequest_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IIterator_IOnlineIdServiceTicketRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IOnlineIdServiceTicketRequest : aliased constant Windows.IID := (3413300870, 38166, 21005, (162, 116, 250, 76, 209, 118, 44, 178 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IOnlineIdSystemTicketResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOnlineIdSystemTicketResult_Interface
      ; handler : Windows.Security.Authentication.OnlineId.AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOnlineIdSystemTicketResult_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOnlineIdSystemTicketResult_Interface
      ; RetVal : access Windows.Security.Authentication.OnlineId.IOnlineIdSystemTicketResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IOnlineIdSystemTicketResult : aliased constant Windows.IID := (372201584, 23114, 20540, (152, 127, 160, 90, 19, 18, 216, 228 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.OnlineId.IAsyncOperation_IOnlineIdSystemTicketResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface
      ; asyncInfo : Windows.Security.Authentication.OnlineId.IAsyncOperation_IOnlineIdSystemTicketResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult : aliased constant Windows.IID := (100266732, 22864, 22264, (183, 248, 34, 226, 11, 152, 70, 121 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype OnlineIdServiceTicketRequest is Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest;
   
   function CreateOnlineIdServiceTicketRequest
   (
      service : Windows.String
      ; policy : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest;
   
   function CreateOnlineIdServiceTicketRequestAdvanced
   (
      service : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest;
   
   subtype OnlineIdServiceTicket is Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicket;
   subtype UserAuthenticationOperation is Windows.Security.Authentication.OnlineId.IAsyncOperation_UserIdentity;
   subtype SignOutUserOperation is Windows.Foundation.IAsyncAction;
   subtype UserIdentity is Windows.Security.Authentication.OnlineId.IUserIdentity;
   subtype OnlineIdAuthenticator is Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator;
   
   function CreateOnlineIdAuthenticator return Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator;
   
   subtype OnlineIdSystemIdentity is Windows.Security.Authentication.OnlineId.IOnlineIdSystemIdentity;
   subtype OnlineIdSystemTicketResult is Windows.Security.Authentication.OnlineId.IOnlineIdSystemTicketResult;
   subtype OnlineIdSystemAuthenticatorForUser is Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Default
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;

end;
