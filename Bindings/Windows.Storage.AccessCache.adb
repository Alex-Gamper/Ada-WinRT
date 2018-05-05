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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.AccessCache is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface
      ; sender : Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
      ; args : Windows.Storage.AccessCache.IItemRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList(sender), Windows.Storage.AccessCache.IItemRemovedEventArgs(args));
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
   
   function get_FutureAccessList
   return Windows.Storage.AccessCache.IStorageItemAccessList is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AccessCache.StorageApplicationPermissions");
      m_Factory     : IStorageApplicationPermissionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.AccessCache.IStorageItemAccessList;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageApplicationPermissionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FutureAccessList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MostRecentlyUsedList
   return Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AccessCache.StorageApplicationPermissions");
      m_Factory     : IStorageApplicationPermissionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageApplicationPermissionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MostRecentlyUsedList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
