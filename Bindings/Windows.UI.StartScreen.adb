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
with Windows.UI;
with Windows.UI.Popups;
with Windows.Perception.Spatial;
with Windows.System;
with Windows.ApplicationModel.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.StartScreen is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IJumpList_Interface
      ; asyncInfo : Windows.UI.StartScreen.IAsyncOperation_IJumpList
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
      This       : access TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Interface
      ; sender : Windows.UI.StartScreen.ISecondaryTile
      ; args : Windows.UI.StartScreen.IVisualElementsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.StartScreen.ISecondaryTile(sender), Windows.UI.StartScreen.IVisualElementsRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateMinimalTile
   (
      tileId : Windows.String
      ; displayName : Windows.String
      ; arguments : Windows.String
      ; square150x150Logo : Windows.Foundation.IUriRuntimeClass
      ; desiredSize : Windows.UI.StartScreen.TileSize
   )
   return Windows.UI.StartScreen.ISecondaryTile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.SecondaryTile");
      m_Factory     : Windows.UI.StartScreen.ISecondaryTileFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.ISecondaryTile := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryTileFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMinimalTile(tileId, displayName, arguments, square150x150Logo, desiredSize, RetVal'Access);
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
   
   function CreateWithArguments
   (
      arguments : Windows.String
      ; displayName : Windows.String
   )
   return Windows.UI.StartScreen.IJumpListItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.JumpListItem");
      m_Factory     : IJumpListItemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.IJumpListItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJumpListItemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithArguments(arguments, displayName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSeparator
   return Windows.UI.StartScreen.IJumpListItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.JumpListItem");
      m_Factory     : IJumpListItemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.IJumpListItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJumpListItemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSeparator(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadCurrentAsync
   return Windows.UI.StartScreen.IAsyncOperation_IJumpList is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.JumpList");
      m_Factory     : IJumpListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.IAsyncOperation_IJumpList;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJumpListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadCurrentAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.JumpList");
      m_Factory     : IJumpListStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJumpListStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Exists
   (
      tileId : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.SecondaryTile");
      m_Factory     : ISecondaryTileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryTileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Exists(tileId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.SecondaryTile");
      m_Factory     : ISecondaryTileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryTileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllForApplicationAsync
   (
      applicationId : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.SecondaryTile");
      m_Factory     : ISecondaryTileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryTileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllForApplicationAsync(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllForPackageAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.SecondaryTile");
      m_Factory     : ISecondaryTileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryTileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllForPackageAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.UI.StartScreen.IStartScreenManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.StartScreenManager");
      m_Factory     : IStartScreenManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.IStartScreenManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStartScreenManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.StartScreen.IStartScreenManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.StartScreen.StartScreenManager");
      m_Factory     : IStartScreenManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.StartScreen.IStartScreenManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStartScreenManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
