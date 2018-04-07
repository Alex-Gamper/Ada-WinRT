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
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Store is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access LicenseChangedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_LicenseChangedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access LicenseChangedEventHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IListingInformation_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IListingInformation or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IListingInformation_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_FulfillmentResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_FulfillmentResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_FulfillmentResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPurchaseResults_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPurchaseResults or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPurchaseResults_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults
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
   
   
   function CreateProductPurchaseDisplayProperties return Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.ProductPurchaseDisplayProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Store.IID_IProductPurchaseDisplayProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetAppPurchaseCampaignIdAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppWithCampaignId := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppWithCampaignId'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppPurchaseCampaignIdAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LicenseInformation
   return Windows.ApplicationModel.Store.ILicenseInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.ILicenseInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LicenseInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LinkUri
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LinkUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAppPurchaseAsync
   (
      includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAppPurchaseAsync(includeReceipt, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseAsync
   (
      productId : Windows.String
      ; includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseAsync(productId, includeReceipt, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationAsync
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAppReceiptAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppReceiptAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProductReceiptAsync
   (
      productId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProductReceiptAsync(productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCustomerPurchaseIdAsync
   (
      serviceTicket : Windows.String
      ; publisherUserId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCustomerPurchaseIdAsync(serviceTicket, publisherUserId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCustomerCollectionsIdAsync
   (
      serviceTicket : Windows.String
      ; publisherUserId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentApp2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentApp2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCustomerCollectionsIdAsync(serviceTicket, publisherUserId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReportConsumableFulfillmentAsync
   (
      productId : Windows.String
      ; transactionId : Windows.Guid
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReportConsumableFulfillmentAsync(productId, transactionId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseWithResultsAsync
   (
      productId : Windows.String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseWithResultsAsync(productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync
   (
      productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseWithDisplayPropertiesAsync(productId, offerId, displayProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetUnfulfilledConsumablesAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetUnfulfilledConsumablesAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationByProductIdsAsync
   (
      productIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppStaticsWithFiltering := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppStaticsWithFiltering'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationByProductIdsAsync(productIds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationByKeywordsAsync
   (
      keywords : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppStaticsWithFiltering := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppStaticsWithFiltering'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationByKeywordsAsync(keywords, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ReportProductFulfillment
   (
      productId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentApp");
      m_Factory     : ICurrentAppStaticsWithFiltering := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppStaticsWithFiltering'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReportProductFulfillment(productId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function ReportConsumableFulfillmentAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; transactionId : Windows.Guid
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReportConsumableFulfillmentAsync(productId, transactionId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseWithResultsAsync_CurrentAppSimulator
   (
      productId : Windows.String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseWithResultsAsync(productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseWithDisplayPropertiesAsync(productId, offerId, displayProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetUnfulfilledConsumablesAsync_CurrentAppSimulator
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorWithConsumables := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorWithConsumables'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetUnfulfilledConsumablesAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAppPurchaseCampaignIdAsync_CurrentAppSimulator
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorWithCampaignId := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorWithCampaignId'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppPurchaseCampaignIdAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LicenseInformation_CurrentAppSimulator
   return Windows.ApplicationModel.Store.ILicenseInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.ILicenseInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LicenseInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LinkUri_CurrentAppSimulator
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LinkUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppId_CurrentAppSimulator
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAppPurchaseAsync_CurrentAppSimulator
   (
      includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAppPurchaseAsync(includeReceipt, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestProductPurchaseAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestProductPurchaseAsync(productId, includeReceipt, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationAsync_CurrentAppSimulator
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAppReceiptAsync_CurrentAppSimulator
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppReceiptAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProductReceiptAsync_CurrentAppSimulator
   (
      productId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProductReceiptAsync(productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReloadSimulatorAsync
   (
      simulatorSettingsFile : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulator := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulator'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReloadSimulatorAsync(simulatorSettingsFile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationByProductIdsAsync_CurrentAppSimulator
   (
      productIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorStaticsWithFiltering := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorStaticsWithFiltering'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationByProductIdsAsync(productIds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadListingInformationByKeywordsAsync_CurrentAppSimulator
   (
      keywords : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.CurrentAppSimulator");
      m_Factory     : ICurrentAppSimulatorStaticsWithFiltering := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrentAppSimulatorStaticsWithFiltering'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadListingInformationByKeywordsAsync(keywords, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
