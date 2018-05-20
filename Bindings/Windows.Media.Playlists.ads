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
with Windows.Foundation.Collections;
limited with Windows.Storage;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Media.Playlists is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PlaylistFormat is (
      WindowsMedia,
      Zune,
      M3u
   );
   for PlaylistFormat use (
      WindowsMedia => 0,
      Zune => 1,
      M3u => 2
   );
   for PlaylistFormat'Size use 32;
   
   type PlaylistFormat_Ptr is access PlaylistFormat;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PlaylistsContract is null record;
   pragma Convention (C_Pass_By_Copy , PlaylistsContract);
   
   type PlaylistsContract_Ptr is access PlaylistsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPlaylist_Interface;
   type AsyncOperationCompletedHandler_IPlaylist is access all AsyncOperationCompletedHandler_IPlaylist_Interface'Class;
   type AsyncOperationCompletedHandler_IPlaylist_Ptr is access all AsyncOperationCompletedHandler_IPlaylist;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPlaylist_Interface;
   type IPlaylist is access all IPlaylist_Interface'Class;
   type IPlaylist_Ptr is access all IPlaylist;
   type IPlaylistStatics_Interface;
   type IPlaylistStatics is access all IPlaylistStatics_Interface'Class;
   type IPlaylistStatics_Ptr is access all IPlaylistStatics;
   type IAsyncOperation_IPlaylist_Interface;
   type IAsyncOperation_IPlaylist is access all IAsyncOperation_IPlaylist_Interface'Class;
   type IAsyncOperation_IPlaylist_Ptr is access all IAsyncOperation_IPlaylist;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPlaylist : aliased constant Windows.IID := (2151102197, 53060, 19863, (131, 179, 122, 8, 158, 154, 182, 99 ));
   
   type IPlaylist_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Files
   (
      This       : access IPlaylist_Interface
      ; RetVal : access Windows.Storage.IVector_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IPlaylist_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsAsync
   (
      This       : access IPlaylist_Interface
      ; saveLocation : Windows.Storage.IStorageFolder
      ; desiredName : Windows.String
      ; option : Windows.Storage.NameCollisionOption
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsWithFormatAsync
   (
      This       : access IPlaylist_Interface
      ; saveLocation : Windows.Storage.IStorageFolder
      ; desiredName : Windows.String
      ; option : Windows.Storage.NameCollisionOption
      ; playlistFormat : Windows.Media.Playlists.PlaylistFormat
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaylistStatics : aliased constant Windows.IID := (3317903821, 33273, 20467, (149, 185, 112, 182, 255, 4, 107, 104 ));
   
   type IPlaylistStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadAsync
   (
      This       : access IPlaylistStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Playlists.IAsyncOperation_IPlaylist -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPlaylist : aliased constant Windows.IID := (2415621291, 37167, 23489, (135, 250, 40, 101, 246, 115, 203, 252 ));
   
   type IAsyncOperation_IPlaylist_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPlaylist_Interface
      ; handler : Windows.Media.Playlists.AsyncOperationCompletedHandler_IPlaylist
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPlaylist_Interface
      ; RetVal : access Windows.Media.Playlists.AsyncOperationCompletedHandler_IPlaylist
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPlaylist_Interface
      ; RetVal : access Windows.Media.Playlists.IPlaylist
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPlaylist : aliased constant Windows.IID := (1115548413, 45606, 24304, (147, 32, 201, 243, 37, 227, 116, 116 ));
   
   type AsyncOperationCompletedHandler_IPlaylist_Interface(Callback : access procedure (asyncInfo : Windows.Media.Playlists.IAsyncOperation_IPlaylist ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPlaylist'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPlaylist_Interface
      ; asyncInfo : Windows.Media.Playlists.IAsyncOperation_IPlaylist
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Playlist is Windows.Media.Playlists.IPlaylist;
   function Create return Windows.Media.Playlists.IPlaylist;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function LoadAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Playlists.IAsyncOperation_IPlaylist;
   
end;
