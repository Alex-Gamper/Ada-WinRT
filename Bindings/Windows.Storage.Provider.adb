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
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface
      ; sender : Windows.Storage.Provider.ICachedFileUpdaterUI
      ; args : Windows.Storage.Provider.IFileUpdateRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.Provider.ICachedFileUpdaterUI(sender), Windows.Storage.Provider.IFileUpdateRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface
      ; sender : Windows.Storage.Provider.ICachedFileUpdaterUI
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.Provider.ICachedFileUpdaterUI(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_FileUpdateStatus_Interface
      ; asyncInfo : Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus
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
   
   function CreateStorageProviderItemProperty return Windows.Storage.Provider.IStorageProviderItemProperty is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderItemProperty");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Provider.IStorageProviderItemProperty) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Provider.IID_IStorageProviderItemProperty'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStorageProviderItemPropertyDefinition return Windows.Storage.Provider.IStorageProviderItemPropertyDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderItemPropertyDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Provider.IStorageProviderItemPropertyDefinition) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Provider.IID_IStorageProviderItemPropertyDefinition'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStorageProviderSyncRootInfo return Windows.Storage.Provider.IStorageProviderSyncRootInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Provider.IStorageProviderSyncRootInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Provider.IID_IStorageProviderSyncRootInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStorageProviderGetContentInfoForPathResult return Windows.Storage.Provider.IStorageProviderGetContentInfoForPathResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderGetContentInfoForPathResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Provider.IStorageProviderGetContentInfoForPathResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Provider.IID_IStorageProviderGetContentInfoForPathResult'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStorageProviderGetPathForContentUriResult return Windows.Storage.Provider.IStorageProviderGetPathForContentUriResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderGetPathForContentUriResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Provider.IStorageProviderGetPathForContentUriResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Provider.IID_IStorageProviderGetPathForContentUriResult'Access, RetVal'access);
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
   
   procedure SetUpdateInformation
   (
      file : Windows.Storage.IStorageFile
      ; contentId : Windows.String
      ; readMode : Windows.Storage.Provider.ReadActivationMode
      ; writeMode : Windows.Storage.Provider.WriteActivationMode
      ; options : Windows.Storage.Provider.CachedFileOptions
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.CachedFileUpdater");
      m_Factory     : ICachedFileUpdaterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICachedFileUpdaterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetUpdateInformation(file, contentId, readMode, writeMode, options);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function SetAsync
   (
      item : Windows.Storage.IStorageItem
      ; itemProperties : Windows.Storage.Provider.IIterable_IStorageProviderItemProperty
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderItemProperties");
      m_Factory     : IStorageProviderItemPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderItemPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAsync(item, itemProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Register
   (
      syncRootInformation : Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootManager");
      m_Factory     : IStorageProviderSyncRootManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderSyncRootManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Register(syncRootInformation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Unregister
   (
      id : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootManager");
      m_Factory     : IStorageProviderSyncRootManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderSyncRootManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Unregister(id);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetSyncRootInformationForFolder
   (
      folder : Windows.Storage.IStorageFolder
   )
   return Windows.Storage.Provider.IStorageProviderSyncRootInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootManager");
      m_Factory     : IStorageProviderSyncRootManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderSyncRootManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSyncRootInformationForFolder(folder, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSyncRootInformationForId
   (
      id : Windows.String
   )
   return Windows.Storage.Provider.IStorageProviderSyncRootInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootManager");
      m_Factory     : IStorageProviderSyncRootManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderSyncRootManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSyncRootInformationForId(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentSyncRoots
   return Windows.Storage.Provider.IVectorView_IStorageProviderSyncRootInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Provider.StorageProviderSyncRootManager");
      m_Factory     : IStorageProviderSyncRootManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Provider.IVectorView_IStorageProviderSyncRootInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageProviderSyncRootManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentSyncRoots(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
