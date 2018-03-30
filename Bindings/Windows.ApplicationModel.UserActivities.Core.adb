--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
