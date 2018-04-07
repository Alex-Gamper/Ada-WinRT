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
with Windows.Storage.FileProperties;
with Windows.Storage.Search;
with Windows.Storage.Streams;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.BulkAccess is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IStorageItemInformation_add_ThumbnailUpdated_Interface
      ; sender : Windows.Storage.BulkAccess.IStorageItemInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IStorageItemInformation_add_PropertiesUpdated_Interface
      ; sender : Windows.Storage.BulkAccess.IStorageItemInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateWithMode
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.BulkAccess.FileInformationFactory");
      m_Factory     : Windows.Storage.BulkAccess.IFileInformationFactoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.BulkAccess.IFileInformationFactory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileInformationFactoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithMode(queryResult, mode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithModeAndSize
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.BulkAccess.FileInformationFactory");
      m_Factory     : Windows.Storage.BulkAccess.IFileInformationFactoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.BulkAccess.IFileInformationFactory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileInformationFactoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithModeAndSize(queryResult, mode, requestedThumbnailSize, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithModeAndSizeAndOptions
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.BulkAccess.FileInformationFactory");
      m_Factory     : Windows.Storage.BulkAccess.IFileInformationFactoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.BulkAccess.IFileInformationFactory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileInformationFactoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithModeAndSizeAndOptions(queryResult, mode, requestedThumbnailSize, thumbnailOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithModeAndSizeAndOptionsAndFlags
   (
      queryResult : Windows.Storage.Search.IStorageQueryResultBase
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedThumbnailSize : Windows.UInt32
      ; thumbnailOptions : Windows.Storage.FileProperties.ThumbnailOptions
      ; delayLoad : Windows.Boolean
   )
   return Windows.Storage.BulkAccess.IFileInformationFactory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.BulkAccess.FileInformationFactory");
      m_Factory     : Windows.Storage.BulkAccess.IFileInformationFactoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.BulkAccess.IFileInformationFactory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileInformationFactoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithModeAndSizeAndOptionsAndFlags(queryResult, mode, requestedThumbnailSize, thumbnailOptions, delayLoad, RetVal'Access);
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
   

end;
