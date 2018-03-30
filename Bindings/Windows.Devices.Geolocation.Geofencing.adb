--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Devices.Geolocation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Geolocation.Geofencing is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
   
   function QueryInterface(This : access TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGeofenceMonitor_add_StatusChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
