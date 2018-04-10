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
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.Geolocation.Geofencing is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MonitoredGeofenceStates is (
      None,
      Entered,
      Exited,
      Removed
   );
   for MonitoredGeofenceStates use (
      None => 0,
      Entered => 1,
      Exited => 2,
      Removed => 4
   );
   for MonitoredGeofenceStates'Size use 32;
   
   type MonitoredGeofenceStates_Ptr is access MonitoredGeofenceStates;
   
   type GeofenceState is (
      None,
      Entered,
      Exited,
      Removed
   );
   for GeofenceState use (
      None => 0,
      Entered => 1,
      Exited => 2,
      Removed => 4
   );
   for GeofenceState'Size use 32;
   
   type GeofenceState_Ptr is access GeofenceState;
   
   type GeofenceMonitorStatus is (
      Ready,
      Initializing,
      NoData,
      Disabled,
      NotInitialized,
      NotAvailable
   );
   for GeofenceMonitorStatus use (
      Ready => 0,
      Initializing => 1,
      NoData => 2,
      Disabled => 3,
      NotInitialized => 4,
      NotAvailable => 5
   );
   for GeofenceMonitorStatus'Size use 32;
   
   type GeofenceMonitorStatus_Ptr is access GeofenceMonitorStatus;
   
   type GeofenceRemovalReason is (
      Used,
      Expired
   );
   for GeofenceRemovalReason use (
      Used => 0,
      Expired => 1
   );
   for GeofenceRemovalReason'Size use 32;
   
   type GeofenceRemovalReason_Ptr is access GeofenceRemovalReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface;
   type TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged is access all TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface'Class;
   type TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Ptr is access all TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged;
   type TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface;
   type TypedEventHandler_IGeofenceMonitor_add_StatusChanged is access all TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Ptr is access all TypedEventHandler_IGeofenceMonitor_add_StatusChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGeofenceFactory_Interface;
   type IGeofenceFactory is access all IGeofenceFactory_Interface'Class;
   type IGeofenceFactory_Ptr is access all IGeofenceFactory;
   type IGeofence_Interface;
   type IGeofence is access all IGeofence_Interface'Class;
   type IGeofence_Ptr is access all IGeofence;
   type IGeofenceStateChangeReport_Interface;
   type IGeofenceStateChangeReport is access all IGeofenceStateChangeReport_Interface'Class;
   type IGeofenceStateChangeReport_Ptr is access all IGeofenceStateChangeReport;
   type IGeofenceMonitorStatics_Interface;
   type IGeofenceMonitorStatics is access all IGeofenceMonitorStatics_Interface'Class;
   type IGeofenceMonitorStatics_Ptr is access all IGeofenceMonitorStatics;
   type IGeofenceMonitor_Interface;
   type IGeofenceMonitor is access all IGeofenceMonitor_Interface'Class;
   type IGeofenceMonitor_Ptr is access all IGeofenceMonitor;
   type IIterator_IGeofence_Interface;
   type IIterator_IGeofence is access all IIterator_IGeofence_Interface'Class;
   type IIterator_IGeofence_Ptr is access all IIterator_IGeofence;
   type IIterable_IGeofence_Interface;
   type IIterable_IGeofence is access all IIterable_IGeofence_Interface'Class;
   type IIterable_IGeofence_Ptr is access all IIterable_IGeofence;
   type IVectorView_IGeofence_Interface;
   type IVectorView_IGeofence is access all IVectorView_IGeofence_Interface'Class;
   type IVectorView_IGeofence_Ptr is access all IVectorView_IGeofence;
   type IVector_IGeofence_Interface;
   type IVector_IGeofence is access all IVector_IGeofence_Interface'Class;
   type IVector_IGeofence_Ptr is access all IVector_IGeofence;
   type IIterator_IGeofenceStateChangeReport_Interface;
   type IIterator_IGeofenceStateChangeReport is access all IIterator_IGeofenceStateChangeReport_Interface'Class;
   type IIterator_IGeofenceStateChangeReport_Ptr is access all IIterator_IGeofenceStateChangeReport;
   type IIterable_IGeofenceStateChangeReport_Interface;
   type IIterable_IGeofenceStateChangeReport is access all IIterable_IGeofenceStateChangeReport_Interface'Class;
   type IIterable_IGeofenceStateChangeReport_Ptr is access all IIterable_IGeofenceStateChangeReport;
   type IVectorView_IGeofenceStateChangeReport_Interface;
   type IVectorView_IGeofenceStateChangeReport is access all IVectorView_IGeofenceStateChangeReport_Interface'Class;
   type IVectorView_IGeofenceStateChangeReport_Ptr is access all IVectorView_IGeofenceStateChangeReport;
   
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
   
   IID_IGeofenceFactory : aliased constant Windows.IID := (2216649291, 12895, 19344, (188, 167, 43, 128, 34, 169, 55, 150 ));
   
   type IGeofenceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGeofenceFactory_Interface
      ; id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithMonitorStates
   (
      This       : access IGeofenceFactory_Interface
      ; id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithMonitorStatesAndDwellTime
   (
      This       : access IGeofenceFactory_Interface
      ; id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; dwellTime : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithMonitorStatesDwellTimeStartTimeAndDuration
   (
      This       : access IGeofenceFactory_Interface
      ; id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; dwellTime : Windows.Foundation.TimeSpan
      ; startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeofence : aliased constant Windows.IID := (2617837603, 60856, 18400, (130, 69, 91, 246, 29, 50, 31, 45 ));
   
   type IGeofence_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartTime
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DwellTime
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MonitoredStates
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
   )
   return Windows.HRESULT is abstract;
   
   function get_Geoshape
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoshape
   )
   return Windows.HRESULT is abstract;
   
   function get_SingleUse
   (
      This       : access IGeofence_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeofenceStateChangeReport : aliased constant Windows.IID := (2586065944, 9316, 19593, (190, 5, 179, 255, 255, 91, 171, 197 ));
   
   type IGeofenceStateChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewState
   (
      This       : access IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.GeofenceState
   )
   return Windows.HRESULT is abstract;
   
   function get_Geofence
   (
      This       : access IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function get_Geoposition
   (
      This       : access IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_RemovalReason
   (
      This       : access IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.GeofenceRemovalReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeofenceMonitorStatics : aliased constant Windows.IID := (768815055, 32373, 18585, (172, 227, 43, 208, 166, 92, 206, 6 ));
   
   type IGeofenceMonitorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IGeofenceMonitorStatics_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeofenceMonitor : aliased constant Windows.IID := (1276075896, 7199, 17953, (187, 189, 131, 59, 146, 36, 114, 38 ));
   
   type IGeofenceMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGeofenceMonitor_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.GeofenceMonitorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Geofences
   (
      This       : access IGeofenceMonitor_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IVector_IGeofence -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LastKnownGeoposition
   (
      This       : access IGeofenceMonitor_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function add_GeofenceStateChanged
   (
      This       : access IGeofenceMonitor_Interface
      ; eventHandler : TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GeofenceStateChanged
   (
      This       : access IGeofenceMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ReadReports
   (
      This       : access IGeofenceMonitor_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IVectorView_IGeofenceStateChangeReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IGeofenceMonitor_Interface
      ; eventHandler : TypedEventHandler_IGeofenceMonitor_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IGeofenceMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGeofence : aliased constant Windows.IID := (3886670148, 8237, 22280, (169, 189, 227, 220, 14, 20, 223, 70 ));
   
   type IIterator_IGeofence_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGeofence_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGeofence_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGeofence_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGeofence_Interface
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofence_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGeofence : aliased constant Windows.IID := (3463018291, 22876, 20928, (173, 95, 50, 74, 245, 205, 242, 221 ));
   
   type IIterable_IGeofence_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGeofence_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IIterator_IGeofence
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGeofence : aliased constant Windows.IID := (3624114890, 6725, 23827, (140, 253, 73, 0, 194, 43, 142, 241 ));
   
   type IVectorView_IGeofence_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGeofence_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGeofence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGeofence_Interface
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofence
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGeofence_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofence_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IGeofence : aliased constant Windows.IID := (158189878, 24422, 23662, (149, 206, 239, 85, 65, 251, 244, 196 ));
   
   type IVector_IGeofence_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IGeofence_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IGeofence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IGeofence_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IVectorView_IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IGeofence_Interface
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofence
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IGeofence_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IGeofence_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IGeofence_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IGeofence_Interface
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofence
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IGeofence_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IGeofence_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IGeofence_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofence_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IGeofence_Interface
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofence_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGeofenceStateChangeReport : aliased constant Windows.IID := (3942591972, 26192, 21578, (183, 172, 109, 91, 129, 157, 70, 152 ));
   
   type IIterator_IGeofenceStateChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGeofenceStateChangeReport_Interface
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGeofenceStateChangeReport : aliased constant Windows.IID := (1995770702, 31399, 22107, (170, 218, 176, 193, 204, 20, 78, 208 ));
   
   type IIterable_IGeofenceStateChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IIterator_IGeofenceStateChangeReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGeofenceStateChangeReport : aliased constant Windows.IID := (3935394109, 60660, 20545, (134, 242, 131, 122, 40, 44, 77, 148 ));
   
   type IVectorView_IGeofenceStateChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGeofenceStateChangeReport_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGeofenceStateChangeReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGeofenceStateChangeReport_Interface
      ; value : Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGeofenceStateChangeReport_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged : aliased constant Windows.IID := (3972378412, 58490, 22990, (134, 190, 156, 48, 102, 254, 38, 247 ));
   
   type TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface(Callback : access procedure (sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGeofenceMonitor_add_GeofenceStateChanged_Interface
      ; sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGeofenceMonitor_add_StatusChanged : aliased constant Windows.IID := (3972378412, 58490, 22990, (134, 190, 156, 48, 102, 254, 38, 247 ));
   
   type TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGeofenceMonitor_add_StatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGeofenceMonitor_add_StatusChanged_Interface
      ; sender : Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Geofence is Windows.Devices.Geolocation.Geofencing.IGeofence;
   function Create
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence;
   
   function CreateWithMonitorStates
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence;
   
   function CreateWithMonitorStatesAndDwellTime
   (
      id : Windows.String
      ; geoshape : Windows.Devices.Geolocation.IGeoshape
      ; monitoredStates : Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
      ; singleUse : Windows.Boolean
      ; dwellTime : Windows.Foundation.TimeSpan
   )
   return Windows.Devices.Geolocation.Geofencing.IGeofence;
   
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
   return Windows.Devices.Geolocation.Geofencing.IGeofence;
   
   
   subtype GeofenceMonitor is Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor;
   subtype GeofenceStateChangeReport is Windows.Devices.Geolocation.Geofencing.IGeofenceStateChangeReport;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Current
   return Windows.Devices.Geolocation.Geofencing.IGeofenceMonitor;
   

end;
