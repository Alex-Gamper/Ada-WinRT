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
with Windows.Storage.Streams;
with Windows.Storage;
with Windows.Storage.FileProperties;
with Windows.Data.Text;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.Search is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface
      ; sender : Windows.Storage.Search.IStorageQueryResultBase
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface
      ; sender : Windows.Storage.Search.IStorageQueryResultBase
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IndexedState_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IndexedState or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IndexedState_Interface
      ; asyncInfo : Windows.Storage.Search.IAsyncOperation_IndexedState
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
   
   
   function CreateValueAndLanguage return Windows.Storage.Search.IValueAndLanguage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.ValueAndLanguage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IValueAndLanguage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Search.IID_IValueAndLanguage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateIndexableContent return Windows.Storage.Search.IIndexableContent is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.IndexableContent");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IIndexableContent := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Search.IID_IIndexableContent'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCommonFileQuery
   (
      query : Windows.Storage.Search.CommonFileQuery
      ; fileTypeFilter : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Storage.Search.IQueryOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.QueryOptions");
      m_Factory     : Windows.Storage.Search.IQueryOptionsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IQueryOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IQueryOptionsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCommonFileQuery(query, fileTypeFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCommonFolderQuery
   (
      query : Windows.Storage.Search.CommonFolderQuery
   )
   return Windows.Storage.Search.IQueryOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.QueryOptions");
      m_Factory     : Windows.Storage.Search.IQueryOptionsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IQueryOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IQueryOptionsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCommonFolderQuery(query, RetVal'Access);
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
   
   
   function GetIndexerWithName
   (
      indexName : Windows.String
   )
   return Windows.Storage.Search.IContentIndexer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.ContentIndexer");
      m_Factory     : IContentIndexerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IContentIndexer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentIndexerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIndexerWithName(indexName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIndexer
   return Windows.Storage.Search.IContentIndexer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Search.ContentIndexer");
      m_Factory     : IContentIndexerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Search.IContentIndexer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentIndexerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIndexer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
