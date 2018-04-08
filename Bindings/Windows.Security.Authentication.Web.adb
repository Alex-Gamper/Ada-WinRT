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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Web is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebAuthenticationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult
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
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function AuthenticateWithCallbackUriAsync
   (
      options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateWithCallbackUriAsync(options, requestUri, callbackUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AuthenticateWithoutCallbackUriAsync
   (
      options : Windows.Security.Authentication.Web.WebAuthenticationOptions
      ; requestUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateWithoutCallbackUriAsync(options, requestUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentApplicationCallbackUri
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentApplicationCallbackUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure AuthenticateAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateAndContinue(requestUri);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure AuthenticateWithCallbackUriAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateWithCallbackUriAndContinue(requestUri, callbackUri);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; callbackUri : Windows.Foundation.IUriRuntimeClass
      ; continuationData : Windows.Foundation.Collections.IPropertySet
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue(requestUri, callbackUri, continuationData, options);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function AuthenticateSilentlyAsync
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateSilentlyAsync(requestUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AuthenticateSilentlyWithOptionsAsync
   (
      requestUri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.Security.Authentication.Web.WebAuthenticationOptions
   )
   return Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.WebAuthenticationBroker");
      m_Factory     : IWebAuthenticationBrokerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.IAsyncOperation_IWebAuthenticationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationBrokerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AuthenticateSilentlyWithOptionsAsync(requestUri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
