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
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.UserActivities.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreUserActivityManagerStatics_Interface;
   type ICoreUserActivityManagerStatics is access all ICoreUserActivityManagerStatics_Interface'Class;
   type ICoreUserActivityManagerStatics_Ptr is access all ICoreUserActivityManagerStatics;
   
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
   type ICoreUserActivityManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateUserActivitySessionInBackground
   (
      This       : access ICoreUserActivityManagerStatics_Interface
      ; activity : Windows.ApplicationModel.UserActivities.IUserActivity
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivitySession
   )
   return Windows.HRESULT is abstract;
   
   function DeleteUserActivitySessionsInTimeRangeAsync
   (
      This       : access ICoreUserActivityManagerStatics_Interface
      ; channel : Windows.ApplicationModel.UserActivities.IUserActivityChannel
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ICoreUserActivityManagerStatics : aliased constant Windows.IID := (3392854786, 42174, 19789, (191, 168, 103, 149, 244, 38, 78, 251 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateUserActivitySessionInBackground
   (
      activity : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.ApplicationModel.UserActivities.IUserActivitySession;
   
   function DeleteUserActivitySessionsInTimeRangeAsync
   (
      channel : Windows.ApplicationModel.UserActivities.IUserActivityChannel
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncAction;

end;
