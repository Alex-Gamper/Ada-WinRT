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
with Windows.Storage.Streams;
with Windows.UI;
with Windows.Devices.Geolocation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Wallet is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWalletItem_Interface
      ; asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem
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
      This       : access TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Interface
      ; sender : Windows.ApplicationModel.Wallet.IWalletItemStore
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Wallet.IWalletItemStore(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWalletItemStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore
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
   
   function CreateWalletBarcode
   (
      symbology : Windows.ApplicationModel.Wallet.WalletBarcodeSymbology
      ; value : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletBarcode is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletBarcode");
      m_Factory     : Windows.ApplicationModel.Wallet.IWalletBarcodeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IWalletBarcode := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletBarcodeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWalletBarcode(symbology, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCustomWalletBarcode
   (
      streamToBarcodeImage : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Wallet.IWalletBarcode is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletBarcode");
      m_Factory     : Windows.ApplicationModel.Wallet.IWalletBarcodeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IWalletBarcode := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletBarcodeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCustomWalletBarcode(streamToBarcodeImage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWalletTransaction return Windows.ApplicationModel.Wallet.IWalletTransaction is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletTransaction");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Wallet.IWalletTransaction) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Wallet.IID_IWalletTransaction'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWalletRelevantLocation return Windows.ApplicationModel.Wallet.IWalletRelevantLocation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletRelevantLocation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Wallet.IWalletRelevantLocation) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Wallet.IID_IWalletRelevantLocation'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWalletItemCustomProperty
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletItemCustomProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletItemCustomProperty");
      m_Factory     : Windows.ApplicationModel.Wallet.IWalletItemCustomPropertyFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IWalletItemCustomProperty := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletItemCustomPropertyFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWalletItemCustomProperty(name, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWalletVerb
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletVerb is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletVerb");
      m_Factory     : Windows.ApplicationModel.Wallet.IWalletVerbFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IWalletVerb := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletVerbFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWalletVerb(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWalletItem
   (
      kind : Windows.ApplicationModel.Wallet.WalletItemKind
      ; displayName : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletItem");
      m_Factory     : Windows.ApplicationModel.Wallet.IWalletItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IWalletItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWalletItem(kind, displayName, RetVal'Access);
         RefCount := m_Factory.Release;
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
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Wallet.WalletManager");
      m_Factory     : IWalletManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWalletManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
