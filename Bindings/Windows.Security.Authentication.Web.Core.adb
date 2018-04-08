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
with Windows.Security.Credentials;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Web.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebTokenRequestResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult
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
      This       : access TypedEventHandler_IWebAccountMonitor_add_Updated_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Security.Authentication.Web.Core.IWebAccountMonitor(sender), Windows.Security.Authentication.Web.Core.IWebAccountEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebAccountMonitor_add_Removed_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Security.Authentication.Web.Core.IWebAccountEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Security.Authentication.Web.Core.IWebAccountMonitor(sender), Windows.Security.Authentication.Web.Core.IWebAccountEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebAccountMonitor_add_DefaultSignInAccountChanged_Interface
      ; sender : Windows.Security.Authentication.Web.Core.IWebAccountMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Security.Authentication.Web.Core.IWebAccountMonitor(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebTokenRequest");
      m_Factory     : Windows.Security.Authentication.Web.Core.IWebTokenRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebTokenRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebTokenRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(provider, scope, clientId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPromptType
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
      ; clientId : Windows.String
      ; promptType : Windows.Security.Authentication.Web.Core.WebTokenRequestPromptType
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebTokenRequest");
      m_Factory     : Windows.Security.Authentication.Web.Core.IWebTokenRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebTokenRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebTokenRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPromptType(provider, scope, clientId, promptType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithProvider
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebTokenRequest");
      m_Factory     : Windows.Security.Authentication.Web.Core.IWebTokenRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebTokenRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebTokenRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithProvider(provider, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithScope
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; scope : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebTokenRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebTokenRequest");
      m_Factory     : Windows.Security.Authentication.Web.Core.IWebTokenRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebTokenRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebTokenRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithScope(provider, scope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      errorCode : Windows.UInt32
      ; errorMessage : Windows.String
   )
   return Windows.Security.Authentication.Web.Core.IWebProviderError is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebProviderError");
      m_Factory     : Windows.Security.Authentication.Web.Core.IWebProviderErrorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebProviderError := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebProviderErrorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(errorCode, errorMessage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebTokenResponse return Windows.Security.Authentication.Web.Core.IWebTokenResponse is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebTokenResponse");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Security.Authentication.Web.Core.IWebTokenResponse) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Authentication.Web.Core.IID_IWebTokenResponse'Access, RetVal'access);
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
   
   
   function GetTokenSilentlyAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTokenSilentlyAsync(request, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTokenSilentlyWithWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTokenSilentlyWithWebAccountAsync(request, webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestTokenAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestTokenAsync(request, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestTokenWithWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestTokenWithWebAccountAsync(request, webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAccountAsync
   (
      provider : Windows.Security.Credentials.IWebAccountProvider
      ; webAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAccountAsync(provider, webAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAccountProviderAsync
   (
      webAccountProviderId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAccountProviderAsync(webAccountProviderId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAccountProviderWithAuthorityAsync
   (
      webAccountProviderId : Windows.String
      ; authority : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAccountProviderWithAuthorityAsync(webAccountProviderId, authority, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebAccountMonitor
   (
      webAccounts : Windows.Security.Credentials.IIterable_IWebAccount
   )
   return Windows.Security.Authentication.Web.Core.IWebAccountMonitor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IWebAccountMonitor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWebAccountMonitor(webAccounts, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAccountProviderWithAuthorityForUserAsync
   (
      webAccountProviderId : Windows.String
      ; authority : Windows.String
      ; user : Windows.System.IUser
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager");
      m_Factory     : IWebAuthenticationCoreManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
