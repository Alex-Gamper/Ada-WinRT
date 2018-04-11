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
with Windows.Devices.Geolocation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Geolocation.Geofencing is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface
      ; sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface
      ; sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geofencing.Geofence");
      m_Factory     : Windows.Devices.Geolocation.Geofencing.IGeofenceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.Geofencing.IGeofence := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeofenceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(id, geoshape, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithMonitorStates
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geofencing.Geofence");
      m_Factory     : Windows.Devices.Geolocation.Geofencing.IGeofenceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.Geofencing.IGeofence := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeofenceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithMonitorStates(id, geoshape, monitoredStates, singleUse, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithMonitorStatesAndDwellTime
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; dwellTime : Windows.Foundation.TimeSpan
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geofencing.Geofence");
      m_Factory     : Windows.Devices.Geolocation.Geofencing.IGeofenceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.Geofencing.IGeofence := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeofenceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithMonitorStatesAndDwellTime(id, geoshape, monitoredStates, singleUse, dwellTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithMonitorStatesDwellTimeStartTimeAndDuration
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; dwellTime : Windows.Foundation.TimeSpan
      ; startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geofencing.Geofence");
      m_Factory     : Windows.Devices.Geolocation.Geofencing.IGeofenceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.Geofencing.IGeofence := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeofenceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithMonitorStatesDwellTimeStartTimeAndDuration(id, geoshape, monitoredStates, singleUse, dwellTime, startTime, duration, RetVal'Access);
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
   
   function get_Current
   return Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geofencing.GeofenceMonitor");
      m_Factory     : IGeofenceMonitorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeofenceMonitorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
