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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.ApplicationModel.Appointments;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Appointments.DataProvider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection(sender), Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequestEventArgs(args));
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
   
end;
