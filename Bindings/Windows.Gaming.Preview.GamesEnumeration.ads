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
limited with Windows.ApplicationModel;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Gaming.Preview.GamesEnumeration is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GameListCategory is (
      Candidate,
      ConfirmedBySystem,
      ConfirmedByUser
   );
   for GameListCategory use (
      Candidate => 0,
      ConfirmedBySystem => 1,
      ConfirmedByUser => 2
   );
   for GameListCategory'Size use 32;
   
   type GameListCategory_Ptr is access GameListCategory;
   
   type GameListEntryLaunchableState is (
      NotLaunchable,
      ByLastRunningFullPath,
      ByUserProvidedPath,
      ByTile
   );
   for GameListEntryLaunchableState use (
      NotLaunchable => 0,
      ByLastRunningFullPath => 1,
      ByUserProvidedPath => 2,
      ByTile => 3
   );
   for GameListEntryLaunchableState'Size use 32;
   
   type GameListEntryLaunchableState_Ptr is access GameListEntryLaunchableState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type GameListChangedEventHandler_Interface;
   type GameListChangedEventHandler is access all GameListChangedEventHandler_Interface'Class;
   type GameListChangedEventHandler_Ptr is access all GameListChangedEventHandler;
   type GameListRemovedEventHandler_Interface;
   type GameListRemovedEventHandler is access all GameListRemovedEventHandler_Interface'Class;
   type GameListRemovedEventHandler_Ptr is access all GameListRemovedEventHandler;
   type AsyncOperationCompletedHandler_IGameListEntry_Interface;
   type AsyncOperationCompletedHandler_IGameListEntry is access all AsyncOperationCompletedHandler_IGameListEntry_Interface'Class;
   type AsyncOperationCompletedHandler_IGameListEntry_Ptr is access all AsyncOperationCompletedHandler_IGameListEntry;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameListEntry_Interface;
   type IGameListEntry is access all IGameListEntry_Interface'Class;
   type IGameListEntry_Ptr is access all IGameListEntry;
   type IGameModeConfiguration_Interface;
   type IGameModeConfiguration is access all IGameModeConfiguration_Interface'Class;
   type IGameModeConfiguration_Ptr is access all IGameModeConfiguration;
   type IGameListEntry2_Interface;
   type IGameListEntry2 is access all IGameListEntry2_Interface'Class;
   type IGameListEntry2_Ptr is access all IGameListEntry2;
   type IGameModeUserConfiguration_Interface;
   type IGameModeUserConfiguration is access all IGameModeUserConfiguration_Interface'Class;
   type IGameModeUserConfiguration_Ptr is access all IGameModeUserConfiguration;
   type IGameModeUserConfigurationStatics_Interface;
   type IGameModeUserConfigurationStatics is access all IGameModeUserConfigurationStatics_Interface'Class;
   type IGameModeUserConfigurationStatics_Ptr is access all IGameModeUserConfigurationStatics;
   type IGameListStatics_Interface;
   type IGameListStatics is access all IGameListStatics_Interface'Class;
   type IGameListStatics_Ptr is access all IGameListStatics;
   type IGameListStatics2_Interface;
   type IGameListStatics2 is access all IGameListStatics2_Interface'Class;
   type IGameListStatics2_Ptr is access all IGameListStatics2;
   type IAsyncOperation_IGameListEntry_Interface;
   type IAsyncOperation_IGameListEntry is access all IAsyncOperation_IGameListEntry_Interface'Class;
   type IAsyncOperation_IGameListEntry_Ptr is access all IAsyncOperation_IGameListEntry;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGameListEntry : aliased constant Windows.IID := (1935221971, 33055, 17556, (182, 156, 198, 65, 160, 198, 21, 67 ));
   
   type IGameListEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayInfo
   (
      This       : access IGameListEntry_Interface
      ; RetVal : access Windows.ApplicationModel.IAppDisplayInfo
   )
   return Windows.HRESULT is abstract;
   
   function LaunchAsync
   (
      This       : access IGameListEntry_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Category
   (
      This       : access IGameListEntry_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.GameListCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IGameListEntry_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetCategoryAsync
   (
      This       : access IGameListEntry_Interface
      ; value : Windows.Gaming.Preview.GamesEnumeration.GameListCategory
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameModeConfiguration : aliased constant Windows.IID := (2028310959, 45378, 20208, (136, 48, 85, 188, 43, 228, 245, 234 ));
   
   type IGameModeConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RelatedProcessNames
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentGpuTimeAllocatedToGame
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PercentGpuTimeAllocatedToGame
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentGpuMemoryAllocatedToGame
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PercentGpuMemoryAllocatedToGame
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentGpuMemoryAllocatedToSystemCompositor
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PercentGpuMemoryAllocatedToSystemCompositor
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxCpuCount
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxCpuCount
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_CpuExclusivityMaskLow
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_CpuExclusivityMaskLow
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_CpuExclusivityMaskHigh
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_CpuExclusivityMaskHigh
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AffinitizeToExclusiveCpus
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AffinitizeToExclusiveCpus
   (
      This       : access IGameModeConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IGameModeConfiguration_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameListEntry2 : aliased constant Windows.IID := (3628765067, 34633, 18981, (144, 211, 246, 197, 164, 39, 136, 109 ));
   
   type IGameListEntry2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LaunchableState
   (
      This       : access IGameListEntry2_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.GameListEntryLaunchableState
   )
   return Windows.HRESULT is abstract;
   
   function get_LauncherExecutable
   (
      This       : access IGameListEntry2_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_LaunchParameters
   (
      This       : access IGameListEntry2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetLauncherExecutableFileAsync
   (
      This       : access IGameListEntry2_Interface
      ; executableFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetLauncherExecutableFileWithParamsAsync
   (
      This       : access IGameListEntry2_Interface
      ; executableFile : Windows.Storage.IStorageFile
      ; launchParams : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleId
   (
      This       : access IGameListEntry2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTitleIdAsync
   (
      This       : access IGameListEntry2_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_GameModeConfiguration
   (
      This       : access IGameListEntry2_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.IGameModeConfiguration
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameModeUserConfiguration : aliased constant Windows.IID := (1926449908, 30059, 18191, (160, 194, 186, 98, 169, 7, 149, 219 ));
   
   type IGameModeUserConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GamingRelatedProcessNames
   (
      This       : access IGameModeUserConfiguration_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IGameModeUserConfiguration_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameModeUserConfigurationStatics : aliased constant Windows.IID := (1850792316, 26346, 18318, (164, 161, 245, 124, 14, 141, 0, 231 ));
   
   type IGameModeUserConfigurationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGameModeUserConfigurationStatics_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.IGameModeUserConfiguration
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameListStatics : aliased constant Windows.IID := (769462127, 40038, 19205, (148, 92, 214, 237, 120, 73, 27, 140 ));
   
   type IGameListStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAsync
   (
      This       : access IGameListStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncPackageFamilyName
   (
      This       : access IGameListStatics_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_GameAdded
   (
      This       : access IGameListStatics_Interface
      ; handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GameAdded
   (
      This       : access IGameListStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GameRemoved
   (
      This       : access IGameListStatics_Interface
      ; handler : Windows.Gaming.Preview.GamesEnumeration.GameListRemovedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GameRemoved
   (
      This       : access IGameListStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GameUpdated
   (
      This       : access IGameListStatics_Interface
      ; handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GameUpdated
   (
      This       : access IGameListStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameListStatics2 : aliased constant Windows.IID := (962535576, 59930, 17834, (146, 104, 168, 57, 5, 104, 111, 39 ));
   
   type IGameListStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function MergeEntriesAsync
   (
      This       : access IGameListStatics2_Interface
      ; left : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
      ; right : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnmergeEntryAsync
   (
      This       : access IGameListStatics2_Interface
      ; mergedEntry : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGameListEntry : aliased constant Windows.IID := (935113442, 40047, 22104, (164, 59, 237, 40, 254, 12, 132, 88 ));
   
   type IAsyncOperation_IGameListEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGameListEntry_Interface
      ; handler : Windows.Gaming.Preview.GamesEnumeration.AsyncOperationCompletedHandler_IGameListEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGameListEntry_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.AsyncOperationCompletedHandler_IGameListEntry
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGameListEntry_Interface
      ; RetVal : access Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_GameListChangedEventHandler : aliased constant Windows.IID := (636920865, 55541, 19857, (180, 14, 83, 213, 232, 111, 222, 100 ));
   
   type GameListChangedEventHandler_Interface(Callback : access procedure (game : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry)) is new Windows.IMulticastDelegate_Interface(IID_GameListChangedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access GameListChangedEventHandler_Interface
      ; game : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_GameListRemovedEventHandler : aliased constant Windows.IID := (281371791, 27791, 18194, (155, 56, 71, 75, 194, 46, 118, 216 ));
   
   type GameListRemovedEventHandler_Interface(Callback : access procedure (identifier : Windows.String)) is new Windows.IMulticastDelegate_Interface(IID_GameListRemovedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access GameListRemovedEventHandler_Interface
      ; identifier : Windows.String
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGameListEntry : aliased constant Windows.IID := (2809304032, 54536, 21890, (172, 118, 140, 150, 5, 250, 29, 233 ));
   
   type AsyncOperationCompletedHandler_IGameListEntry_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGameListEntry'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameListEntry_Interface
      ; asyncInfo : Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GameModeConfiguration is Windows.Gaming.Preview.GamesEnumeration.IGameModeConfiguration;
   subtype GameListEntry is Windows.Gaming.Preview.GamesEnumeration.IGameListEntry;
   subtype GameModeUserConfiguration is Windows.Gaming.Preview.GamesEnumeration.IGameModeUserConfiguration;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDefault
   return Windows.Gaming.Preview.GamesEnumeration.IGameModeUserConfiguration;
   
   function MergeEntriesAsync
   (
      left : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
      ; right : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.Gaming.Preview.GamesEnumeration.IAsyncOperation_IGameListEntry;
   
   function UnmergeEntryAsync
   (
      mergedEntry : Windows.Gaming.Preview.GamesEnumeration.IGameListEntry
   )
   return Windows.Address;
   
   function FindAllAsync
   return Windows.Address;
   
   function FindAllAsyncPackageFamilyName
   (
      packageFamilyName : Windows.String
   )
   return Windows.Address;
   
   function add_GameAdded
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_GameAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_GameRemoved
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListRemovedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_GameRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_GameUpdated
   (
      handler : Windows.Gaming.Preview.GamesEnumeration.GameListChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_GameUpdated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;

end;
