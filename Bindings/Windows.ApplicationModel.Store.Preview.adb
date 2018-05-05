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
with Windows.System;
with Windows.Storage.Streams;
with Windows.Security.Authentication.Web.Core;
with Windows.UI.Xaml;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Store.Preview is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults
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
   
   function RequestProductPurchaseByProductIdAndSkuIdAsync
   (
      productId : Windows.String
      ; skuId : Windows.String
   )
   return Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StorePreview");
      m_Factory     : IStorePreview := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorePreview'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseByProductIdAndSkuIdAsync(productId, skuId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadAddOnProductInfosAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StorePreview");
      m_Factory     : IStorePreview := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorePreview'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadAddOnProductInfosAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStoreWebAccountId
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStoreWebAccountId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStoreWebAccountIdForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetEnterpriseStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetEnterpriseStoreWebAccountId(webAccountId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetEnterpriseStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetEnterpriseStoreWebAccountIdForUser(user, webAccountId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetEnterpriseStoreWebAccountId
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEnterpriseStoreWebAccountId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEnterpriseStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEnterpriseStoreWebAccountIdForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShouldRestrictToEnterpriseStoreOnly
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShouldRestrictToEnterpriseStoreOnly(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShouldRestrictToEnterpriseStoreOnlyForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShouldRestrictToEnterpriseStoreOnlyForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetSystemConfiguration
   (
      catalogHardwareManufacturerId : Windows.String
      ; catalogStoreContentModifierId : Windows.String
      ; systemConfigurationExpiration : Windows.Foundation.DateTime
      ; catalogHardwareDescriptor : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetSystemConfiguration(catalogHardwareManufacturerId, catalogStoreContentModifierId, systemConfigurationExpiration, catalogHardwareDescriptor);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetMobileOperatorConfiguration
   (
      mobileOperatorId : Windows.String
      ; appDownloadLimitInMegabytes : Windows.UInt32
      ; updateDownloadLimitInMegabytes : Windows.UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetMobileOperatorConfiguration(mobileOperatorId, appDownloadLimitInMegabytes, updateDownloadLimitInMegabytes);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetStoreWebAccountId(webAccountId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsStoreWebAccountId(webAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HardwareManufacturerInfo
   return Windows.ApplicationModel.Store.Preview.IStoreHardwareManufacturerInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.Preview.IStoreHardwareManufacturerInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HardwareManufacturerInfo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FilterUnsupportedSystemFeaturesAsync
   (
      systemFeatures : Windows.ApplicationModel.Store.Preview.IIterable_StoreSystemFeature
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FilterUnsupportedSystemFeaturesAsync(systemFeatures, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PurchasePromptingPolicy
   return Windows.Foundation.IReference_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IReference_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PurchasePromptingPolicy(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PurchasePromptingPolicy
   (
      value : Windows.Foundation.IReference_UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PurchasePromptingPolicy(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function HasStoreWebAccount
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.HasStoreWebAccount(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function HasStoreWebAccountForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.HasStoreWebAccountForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStoreLogDataAsync
   (
      options : Windows.ApplicationModel.Store.Preview.StoreLogOptions
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStoreLogDataAsync(options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetStoreWebAccountIdForUser(user, webAccountId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsStoreWebAccountIdForUser(user, webAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPurchasePromptingPolicyForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Foundation.IReference_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IReference_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPurchasePromptingPolicyForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetPurchasePromptingPolicyForUser
   (
      user : Windows.System.IUser
      ; value : Windows.Foundation.IReference_UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.StoreConfiguration");
      m_Factory     : IStoreConfigurationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoreConfigurationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPurchasePromptingPolicyForUser(user, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RequestTokenWithUIElementHostingAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; uiElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.WebAuthenticationCoreManagerHelper");
      m_Factory     : IWebAuthenticationCoreManagerHelper := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerHelper'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestTokenWithUIElementHostingAsync(request, uiElement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestTokenWithUIElementHostingAndWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; uiElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.Preview.WebAuthenticationCoreManagerHelper");
      m_Factory     : IWebAuthenticationCoreManagerHelper := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAuthenticationCoreManagerHelper'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestTokenWithUIElementHostingAndWebAccountAsync(request, webAccount, uiElement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
