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
with Windows.ApplicationModel.UserActivities;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.UserActivities.Core is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateUserActivitySessionInBackground
   (
      activity : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.ApplicationModel.UserActivities.IUserActivitySession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.Core.CoreUserActivityManager");
      m_Factory     : ICoreUserActivityManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivitySession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreUserActivityManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUserActivitySessionInBackground(activity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeleteUserActivitySessionsInTimeRangeAsync
   (
      channel : Windows.ApplicationModel.UserActivities.IUserActivityChannel
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.Core.CoreUserActivityManager");
      m_Factory     : ICoreUserActivityManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreUserActivityManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteUserActivitySessionsInTimeRangeAsync(channel, startTime, endTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
