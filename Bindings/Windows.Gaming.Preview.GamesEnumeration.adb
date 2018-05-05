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
with Windows.ApplicationModel;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.Preview.GamesEnumeration is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access GameListChangedEventHandler_Interface
      ; game : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Gaming.Preview.GamesEnumeration.IGameListEntry(game));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access GameListRemovedEventHandler_Interface
      ; identifier : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(identifier);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameListEntry_Interface
      ; asyncInfo : Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry
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
   
   function GetDefault
   return Windows.Gaming.Preview.GamesEnumeration.IGameModeUserConfiguration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameModeUserConfiguration");
      m_Factory     : IGameModeUserConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Preview.GamesEnumeration.IGameModeUserConfiguration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameModeUserConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncPackageFamilyName
   (
      packageFamilyName : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncPackageFamilyName(packageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_GameAdded
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_GameAdded(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_GameAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_GameAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_GameRemoved
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListRemovedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_GameRemoved(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_GameRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_GameRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_GameUpdated
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_GameUpdated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_GameUpdated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_GameUpdated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function MergeEntriesAsync
   (
      left : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
      ; right : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.MergeEntriesAsync(left, right, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnmergeEntryAsync
   (
      mergedEntry : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Preview.GamesEnumeration.GameList");
      m_Factory     : IGameListStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameListStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnmergeEntryAsync(mergedEntry, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
