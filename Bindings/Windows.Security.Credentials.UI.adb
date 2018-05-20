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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Credentials.UI is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICredentialPickerResults_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults
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
      This       : access AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability
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
      This       : access AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult
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
   
   function Create return Windows.Security.Credentials.UI.ICredentialPickerOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPickerOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Security.Credentials.UI.ICredentialPickerOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Credentials.UI.IID_ICredentialPickerOptions'Access, RetVal'access);
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
   
   function PickWithOptionsAsync
   (
      options : Windows.Security.Credentials.UI.ICredentialPickerOptions
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithOptionsAsync(options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PickWithMessageAsync
   (
      targetName : Windows.String
      ; message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithMessageAsync(targetName, message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PickWithCaptionAsync
   (
      targetName : Windows.String
      ; message : Windows.String
      ; caption : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithCaptionAsync(targetName, message, caption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CheckAvailabilityAsync
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.UserConsentVerifier");
      m_Factory     : IUserConsentVerifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserConsentVerifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CheckAvailabilityAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestVerificationAsync
   (
      message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.UserConsentVerifier");
      m_Factory     : IUserConsentVerifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserConsentVerifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestVerificationAsync(message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
