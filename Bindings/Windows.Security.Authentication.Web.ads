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
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.Security.Authentication.Web is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type TokenBindingKeyType is (
      Rsa2048,
      EcdsaP256,
      AnyExisting
   );
   for TokenBindingKeyType use (
      Rsa2048 => 0,
      EcdsaP256 => 1,
      AnyExisting => 2
   );
   for TokenBindingKeyType'Size use 32;
   
   type TokenBindingKeyType_Ptr is access TokenBindingKeyType;
   
   type WebAuthenticationStatus is (
      Success,
      UserCancel,
      ErrorHttp
   );
   for WebAuthenticationStatus use (
      Success => 0,
      UserCancel => 1,
      ErrorHttp => 2
   );
   for WebAuthenticationStatus'Size use 32;
   
   type WebAuthenticationStatus_Ptr is access WebAuthenticationStatus;
   
   type WebAuthenticationOptions is (
      None,
      SilentMode,
      UseTitle,
      UseHttpPost,
      UseCorporateNetwork
   );
   for WebAuthenticationOptions use (
      None => 0,
      SilentMode => 1,
      UseTitle => 2,
      UseHttpPost => 4,
      UseCorporateNetwork => 8
   );
   for WebAuthenticationOptions'Size use 32;
   
   type WebAuthenticationOptions_Ptr is access WebAuthenticationOptions;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWebAuthenticationResult_Interface;
   type AsyncOperationCompletedHandler_IWebAuthenticationResult is access all AsyncOperationCompletedHandler_IWebAuthenticationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IWebAuthenticationResult_Ptr is access all AsyncOperationCompletedHandler_IWebAuthenticationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebAuthenticationResult_Interface;
   type IWebAuthenticationResult is access all IWebAuthenticationResult_Interface'Class;
   type IWebAuthenticationResult_Ptr is access all IWebAuthenticationResult;
   type IWebAuthenticationBrokerStatics_Interface;
   type IWebAuthenticationBrokerStatics is access all IWebAuthenticationBrokerStatics_Interface'Class;
   type IWebAuthenticationBrokerStatics_Ptr is access all IWebAuthenticationBrokerStatics;
   type IWebAuthenticationBrokerStatics2_Interface;
   type IWebAuthenticationBrokerStatics2 is access all IWebAuthenticationBrokerStatics2_Interface'Class;
   type IWebAuthenticationBrokerStatics2_Ptr is access all IWebAuthenticationBrokerStatics2;
   type IAsyncOperation_IWebAuthenticationResult_Interface;
   type IAsyncOperation_IWebAuthenticationResult is access all IAsyncOperation_IWebAuthenticationResult_Interface'Class;
   type IAsyncOperation_IWebAuthenticationResult_Ptr is access all IAsyncOperation_IWebAuthenticationResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWebAuthenticationResult : aliased constant Windows.IID := (1677732683, 60905, 18186, (165, 205, 3, 35, 250, 246, 226, 98 ));
   
   type IWebAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResponseData
   (
      This       : access IWebAuthenticationResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseStatus
   (
      This       : access IWebAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.WebAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseErrorDetail
   (
      This       : access IWebAuthenticationResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAuthenticationBrokerStatics : aliased constant Windows.IID := (789880602, 58995, 16565, (188, 34, 32, 26, 104, 100, 163, 123 ));
   
   type IWebAuthenticationBrokerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AuthenticateWithCallbackUriAsync
   (
      This       : access IWebAuthenticationBrokerStatics_Interface
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateWithoutCallbackUriAsync
   (
      This       : access IWebAuthenticationBrokerStatics_Interface
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentApplicationCallbackUri
   (
      This       : access IWebAuthenticationBrokerStatics_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAuthenticationBrokerStatics2 : aliased constant Windows.IID := (1942879134, 5351, 16858, (169, 113, 170, 244, 65, 11, 98, 30 ));
   
   type IWebAuthenticationBrokerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function AuthenticateAndContinue
   (
      This       : access IWebAuthenticationBrokerStatics2_Interface
      ; requestUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateWithCallbackUriAndContinue
   (
      This       : access IWebAuthenticationBrokerStatics2_Interface
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue
   (
      This       : access IWebAuthenticationBrokerStatics2_Interface
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
      ; continuationData : Windows.Foundation.Collections.IPropertySet
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateSilentlyAsync
   (
      This       : access IWebAuthenticationBrokerStatics2_Interface
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateSilentlyWithOptionsAsync
   (
      This       : access IWebAuthenticationBrokerStatics2_Interface
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; RetVal : access Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWebAuthenticationResult : aliased constant Windows.IID := (3007926956, 9822, 22855, (135, 53, 233, 49, 143, 67, 1, 255 ));
   
   type IAsyncOperation_IWebAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWebAuthenticationResult_Interface
      ; handler : Windows.Security.Authentication.Web.AsyncOperationCompletedHandler_IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWebAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.AsyncOperationCompletedHandler_IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWebAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWebAuthenticationResult : aliased constant Windows.IID := (1008649292, 59714, 21733, (188, 211, 227, 41, 201, 81, 245, 149 ));
   
   type AsyncOperationCompletedHandler_IWebAuthenticationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWebAuthenticationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebAuthenticationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebAuthenticationResult is Windows.Security.Authentication.Web.IWebAuthenticationResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function AuthenticateWithCallbackUriAsync
   (
      options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   
   function AuthenticateWithoutCallbackUriAsync
   (
      options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   
   function GetCurrentApplicationCallbackUri
   return Windows.Foundation.IUriRuntimeClass;
   
   procedure AuthenticateAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
   )
   ;
   
   procedure AuthenticateWithCallbackUriAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
   )
   ;
   
   procedure AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
      ; continuationData : Windows.Foundation.Collections.IPropertySet
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
   )
   ;
   
   function AuthenticateSilentlyAsync
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   
   function AuthenticateSilentlyWithOptionsAsync
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   
end;
