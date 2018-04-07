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
limited with Windows.UI;
with Windows.Foundation.Collections;
limited with Windows.Devices.Geolocation;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Services.Maps.Guidance is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GuidanceManeuverKind is (
      None,
      GoStraight,
      UTurnRight,
      UTurnLeft,
      TurnKeepRight,
      TurnLightRight,
      TurnRight,
      TurnHardRight,
      KeepMiddle,
      TurnKeepLeft,
      TurnLightLeft,
      TurnLeft,
      TurnHardLeft,
      FreewayEnterRight,
      FreewayEnterLeft,
      FreewayLeaveRight,
      FreewayLeaveLeft,
      FreewayKeepRight,
      FreewayKeepLeft,
      TrafficCircleRight1,
      TrafficCircleRight2,
      TrafficCircleRight3,
      TrafficCircleRight4,
      TrafficCircleRight5,
      TrafficCircleRight6,
      TrafficCircleRight7,
      TrafficCircleRight8,
      TrafficCircleRight9,
      TrafficCircleRight10,
      TrafficCircleRight11,
      TrafficCircleRight12,
      TrafficCircleLeft1,
      TrafficCircleLeft2,
      TrafficCircleLeft3,
      TrafficCircleLeft4,
      TrafficCircleLeft5,
      TrafficCircleLeft6,
      TrafficCircleLeft7,
      TrafficCircleLeft8,
      TrafficCircleLeft9,
      TrafficCircleLeft10,
      TrafficCircleLeft11,
      TrafficCircleLeft12,
      Start,
      End_x,
      TakeFerry,
      PassTransitStation,
      LeaveTransitStation
   );
   for GuidanceManeuverKind use (
      None => 0,
      GoStraight => 1,
      UTurnRight => 2,
      UTurnLeft => 3,
      TurnKeepRight => 4,
      TurnLightRight => 5,
      TurnRight => 6,
      TurnHardRight => 7,
      KeepMiddle => 8,
      TurnKeepLeft => 9,
      TurnLightLeft => 10,
      TurnLeft => 11,
      TurnHardLeft => 12,
      FreewayEnterRight => 13,
      FreewayEnterLeft => 14,
      FreewayLeaveRight => 15,
      FreewayLeaveLeft => 16,
      FreewayKeepRight => 17,
      FreewayKeepLeft => 18,
      TrafficCircleRight1 => 19,
      TrafficCircleRight2 => 20,
      TrafficCircleRight3 => 21,
      TrafficCircleRight4 => 22,
      TrafficCircleRight5 => 23,
      TrafficCircleRight6 => 24,
      TrafficCircleRight7 => 25,
      TrafficCircleRight8 => 26,
      TrafficCircleRight9 => 27,
      TrafficCircleRight10 => 28,
      TrafficCircleRight11 => 29,
      TrafficCircleRight12 => 30,
      TrafficCircleLeft1 => 31,
      TrafficCircleLeft2 => 32,
      TrafficCircleLeft3 => 33,
      TrafficCircleLeft4 => 34,
      TrafficCircleLeft5 => 35,
      TrafficCircleLeft6 => 36,
      TrafficCircleLeft7 => 37,
      TrafficCircleLeft8 => 38,
      TrafficCircleLeft9 => 39,
      TrafficCircleLeft10 => 40,
      TrafficCircleLeft11 => 41,
      TrafficCircleLeft12 => 42,
      Start => 43,
      End_x => 44,
      TakeFerry => 45,
      PassTransitStation => 46,
      LeaveTransitStation => 47
   );
   for GuidanceManeuverKind'Size use 32;
   
   type GuidanceManeuverKind_Ptr is access GuidanceManeuverKind;
   
   type GuidanceMode is (
      None,
      Simulation,
      Navigation,
      Tracking
   );
   for GuidanceMode use (
      None => 0,
      Simulation => 1,
      Navigation => 2,
      Tracking => 3
   );
   for GuidanceMode'Size use 32;
   
   type GuidanceMode_Ptr is access GuidanceMode;
   
   type GuidanceAudioMeasurementSystem is (
      Meters,
      MilesAndYards,
      MilesAndFeet
   );
   for GuidanceAudioMeasurementSystem use (
      Meters => 0,
      MilesAndYards => 1,
      MilesAndFeet => 2
   );
   for GuidanceAudioMeasurementSystem'Size use 32;
   
   type GuidanceAudioMeasurementSystem_Ptr is access GuidanceAudioMeasurementSystem;
   
   type GuidanceAudioNotifications is (
      None,
      Maneuver,
      Route,
      Gps,
      SpeedLimit,
      Traffic,
      TrafficCamera
   );
   for GuidanceAudioNotifications use (
      None => 0,
      Maneuver => 1,
      Route => 2,
      Gps => 4,
      SpeedLimit => 8,
      Traffic => 16,
      TrafficCamera => 32
   );
   for GuidanceAudioNotifications'Size use 32;
   
   type GuidanceAudioNotifications_Ptr is access GuidanceAudioNotifications;
   
   type GuidanceAudioNotificationKind is (
      Maneuver,
      Route,
      Gps,
      SpeedLimit,
      Traffic,
      TrafficCamera
   );
   for GuidanceAudioNotificationKind use (
      Maneuver => 0,
      Route => 1,
      Gps => 2,
      SpeedLimit => 3,
      Traffic => 4,
      TrafficCamera => 5
   );
   for GuidanceAudioNotificationKind'Size use 32;
   
   type GuidanceAudioNotificationKind_Ptr is access GuidanceAudioNotificationKind;
   
   type GuidanceLaneMarkers is (
      None,
      LightRight,
      Right,
      HardRight,
      Straight,
      UTurnLeft,
      HardLeft,
      Left,
      LightLeft,
      UTurnRight,
      Unknown
   );
   for GuidanceLaneMarkers use (
      None => 0,
      LightRight => 1,
      Right => 2,
      HardRight => 4,
      Straight => 8,
      UTurnLeft => 16,
      HardLeft => 32,
      Left => 64,
      LightLeft => 128,
      UTurnRight => 256,
      Unknown => 4294967295
   );
   for GuidanceLaneMarkers'Size use 32;
   
   type GuidanceLaneMarkers_Ptr is access GuidanceLaneMarkers;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated is access all TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated;
   type TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_DestinationReached is access all TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_DestinationReached;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouting is access all TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouting_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_Rerouting;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouted is access all TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_Rerouted_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_Rerouted;
   type TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_RerouteFailed is access all TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_RerouteFailed;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationLost is access all TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_UserLocationLost;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored is access all TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Ptr is access all TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored;
   type TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface;
   type TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested is access all TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface'Class;
   type TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Ptr is access all TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGuidanceRoadSignpost_Interface;
   type IGuidanceRoadSignpost is access all IGuidanceRoadSignpost_Interface'Class;
   type IGuidanceRoadSignpost_Ptr is access all IGuidanceRoadSignpost;
   type IGuidanceManeuver_Interface;
   type IGuidanceManeuver is access all IGuidanceManeuver_Interface'Class;
   type IGuidanceManeuver_Ptr is access all IGuidanceManeuver;
   type IGuidanceUpdatedEventArgs_Interface;
   type IGuidanceUpdatedEventArgs is access all IGuidanceUpdatedEventArgs_Interface'Class;
   type IGuidanceUpdatedEventArgs_Ptr is access all IGuidanceUpdatedEventArgs;
   type IGuidanceReroutedEventArgs_Interface;
   type IGuidanceReroutedEventArgs is access all IGuidanceReroutedEventArgs_Interface'Class;
   type IGuidanceReroutedEventArgs_Ptr is access all IGuidanceReroutedEventArgs;
   type IGuidanceAudioNotificationRequestedEventArgs_Interface;
   type IGuidanceAudioNotificationRequestedEventArgs is access all IGuidanceAudioNotificationRequestedEventArgs_Interface'Class;
   type IGuidanceAudioNotificationRequestedEventArgs_Ptr is access all IGuidanceAudioNotificationRequestedEventArgs;
   type IGuidanceNavigator_Interface;
   type IGuidanceNavigator is access all IGuidanceNavigator_Interface'Class;
   type IGuidanceNavigator_Ptr is access all IGuidanceNavigator;
   type IGuidanceNavigator2_Interface;
   type IGuidanceNavigator2 is access all IGuidanceNavigator2_Interface'Class;
   type IGuidanceNavigator2_Ptr is access all IGuidanceNavigator2;
   type IGuidanceNavigatorStatics_Interface;
   type IGuidanceNavigatorStatics is access all IGuidanceNavigatorStatics_Interface'Class;
   type IGuidanceNavigatorStatics_Ptr is access all IGuidanceNavigatorStatics;
   type IGuidanceNavigatorStatics2_Interface;
   type IGuidanceNavigatorStatics2 is access all IGuidanceNavigatorStatics2_Interface'Class;
   type IGuidanceNavigatorStatics2_Ptr is access all IGuidanceNavigatorStatics2;
   type IGuidanceRoadSegment_Interface;
   type IGuidanceRoadSegment is access all IGuidanceRoadSegment_Interface'Class;
   type IGuidanceRoadSegment_Ptr is access all IGuidanceRoadSegment;
   type IGuidanceRoadSegment2_Interface;
   type IGuidanceRoadSegment2 is access all IGuidanceRoadSegment2_Interface'Class;
   type IGuidanceRoadSegment2_Ptr is access all IGuidanceRoadSegment2;
   type IGuidanceMapMatchedCoordinate_Interface;
   type IGuidanceMapMatchedCoordinate is access all IGuidanceMapMatchedCoordinate_Interface'Class;
   type IGuidanceMapMatchedCoordinate_Ptr is access all IGuidanceMapMatchedCoordinate;
   type IGuidanceTelemetryCollectorStatics_Interface;
   type IGuidanceTelemetryCollectorStatics is access all IGuidanceTelemetryCollectorStatics_Interface'Class;
   type IGuidanceTelemetryCollectorStatics_Ptr is access all IGuidanceTelemetryCollectorStatics;
   type IGuidanceTelemetryCollector_Interface;
   type IGuidanceTelemetryCollector is access all IGuidanceTelemetryCollector_Interface'Class;
   type IGuidanceTelemetryCollector_Ptr is access all IGuidanceTelemetryCollector;
   type IGuidanceRouteStatics_Interface;
   type IGuidanceRouteStatics is access all IGuidanceRouteStatics_Interface'Class;
   type IGuidanceRouteStatics_Ptr is access all IGuidanceRouteStatics;
   type IGuidanceRoute_Interface;
   type IGuidanceRoute is access all IGuidanceRoute_Interface'Class;
   type IGuidanceRoute_Ptr is access all IGuidanceRoute;
   type IGuidanceLaneInfo_Interface;
   type IGuidanceLaneInfo is access all IGuidanceLaneInfo_Interface'Class;
   type IGuidanceLaneInfo_Ptr is access all IGuidanceLaneInfo;
   type IIterator_IGuidanceLaneInfo_Interface;
   type IIterator_IGuidanceLaneInfo is access all IIterator_IGuidanceLaneInfo_Interface'Class;
   type IIterator_IGuidanceLaneInfo_Ptr is access all IIterator_IGuidanceLaneInfo;
   type IIterable_IGuidanceLaneInfo_Interface;
   type IIterable_IGuidanceLaneInfo is access all IIterable_IGuidanceLaneInfo_Interface'Class;
   type IIterable_IGuidanceLaneInfo_Ptr is access all IIterable_IGuidanceLaneInfo;
   type IVectorView_IGuidanceLaneInfo_Interface;
   type IVectorView_IGuidanceLaneInfo is access all IVectorView_IGuidanceLaneInfo_Interface'Class;
   type IVectorView_IGuidanceLaneInfo_Ptr is access all IVectorView_IGuidanceLaneInfo;
   type IIterator_IGuidanceManeuver_Interface;
   type IIterator_IGuidanceManeuver is access all IIterator_IGuidanceManeuver_Interface'Class;
   type IIterator_IGuidanceManeuver_Ptr is access all IIterator_IGuidanceManeuver;
   type IIterable_IGuidanceManeuver_Interface;
   type IIterable_IGuidanceManeuver is access all IIterable_IGuidanceManeuver_Interface'Class;
   type IIterable_IGuidanceManeuver_Ptr is access all IIterable_IGuidanceManeuver;
   type IVectorView_IGuidanceManeuver_Interface;
   type IVectorView_IGuidanceManeuver is access all IVectorView_IGuidanceManeuver_Interface'Class;
   type IVectorView_IGuidanceManeuver_Ptr is access all IVectorView_IGuidanceManeuver;
   type IIterator_IGuidanceRoadSegment_Interface;
   type IIterator_IGuidanceRoadSegment is access all IIterator_IGuidanceRoadSegment_Interface'Class;
   type IIterator_IGuidanceRoadSegment_Ptr is access all IIterator_IGuidanceRoadSegment;
   type IIterable_IGuidanceRoadSegment_Interface;
   type IIterable_IGuidanceRoadSegment is access all IIterable_IGuidanceRoadSegment_Interface'Class;
   type IIterable_IGuidanceRoadSegment_Ptr is access all IIterable_IGuidanceRoadSegment;
   type IVectorView_IGuidanceRoadSegment_Interface;
   type IVectorView_IGuidanceRoadSegment is access all IVectorView_IGuidanceRoadSegment_Interface'Class;
   type IVectorView_IGuidanceRoadSegment_Ptr is access all IVectorView_IGuidanceRoadSegment;
   
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
   type IGuidanceRoadSignpost_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExitNumber
   (
      This       : access IGuidanceRoadSignpost_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Exit
   (
      This       : access IGuidanceRoadSignpost_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IGuidanceRoadSignpost_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IGuidanceRoadSignpost_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitDirections
   (
      This       : access IGuidanceRoadSignpost_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceRoadSignpost : aliased constant Windows.IID := (4054263990, 63354, 18242, (131, 18, 83, 48, 15, 152, 69, 240 ));
   
   ------------------------------------------------------------------------
   type IGuidanceManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartLocation
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_DistanceFromRouteStart
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DistanceFromPreviousManeuver
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DepartureRoadName
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NextRoadName
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DepartureShortRoadName
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NextShortRoadName
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceManeuverKind
   )
   return Windows.HRESULT is abstract;
   
   function get_StartAngle
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndAngle
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RoadSignpost
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoadSignpost
   )
   return Windows.HRESULT is abstract;
   
   function get_InstructionText
   (
      This       : access IGuidanceManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceManeuver : aliased constant Windows.IID := (4228461164, 60617, 18728, (162, 161, 114, 50, 185, 155, 148, 161 ));
   
   ------------------------------------------------------------------------
   type IGuidanceUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceMode
   )
   return Windows.HRESULT is abstract;
   
   function get_NextManeuver
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_NextManeuverDistance
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AfterNextManeuver
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_AfterNextManeuverDistance
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DistanceToDestination
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ElapsedDistance
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ElapsedTime
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeToDestination
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_RoadName
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Route
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentLocation
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceMapMatchedCoordinate
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNewManeuver
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LaneInfo
   (
      This       : access IGuidanceUpdatedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IVectorView_IGuidanceLaneInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceUpdatedEventArgs : aliased constant Windows.IID := (4255913483, 40589, 19939, (169, 250, 176, 99, 33, 209, 141, 185 ));
   
   ------------------------------------------------------------------------
   type IGuidanceReroutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Route
   (
      This       : access IGuidanceReroutedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoute
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceReroutedEventArgs : aliased constant Windows.IID := (291323912, 54568, 17742, (187, 148, 165, 3, 65, 210, 201, 241 ));
   
   ------------------------------------------------------------------------
   type IGuidanceAudioNotificationRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioNotification
   (
      This       : access IGuidanceAudioNotificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceAudioNotificationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFilePaths
   (
      This       : access IGuidanceAudioNotificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioText
   (
      This       : access IGuidanceAudioNotificationRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceAudioNotificationRequestedEventArgs : aliased constant Windows.IID := (3391791690, 51138, 19788, (157, 124, 73, 149, 118, 188, 237, 219 ));
   
   ------------------------------------------------------------------------
   type IGuidanceNavigator_Interface is interface and Windows.IInspectable_Interface;
   
   function StartNavigating
   (
      This       : access IGuidanceNavigator_Interface
      ; route : Windows.Services.Maps.Guidance.IGuidanceRoute
   )
   return Windows.HRESULT is abstract;
   
   function StartSimulating
   (
      This       : access IGuidanceNavigator_Interface
      ; route : Windows.Services.Maps.Guidance.IGuidanceRoute
      ; speedInMetersPerSecond : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function StartTracking
   (
      This       : access IGuidanceNavigator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IGuidanceNavigator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access IGuidanceNavigator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IGuidanceNavigator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RepeatLastAudioNotification
   (
      This       : access IGuidanceNavigator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioMeasurementSystem
   (
      This       : access IGuidanceNavigator_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceAudioMeasurementSystem
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioMeasurementSystem
   (
      This       : access IGuidanceNavigator_Interface
      ; value : Windows.Services.Maps.Guidance.GuidanceAudioMeasurementSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioNotifications
   (
      This       : access IGuidanceNavigator_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceAudioNotifications
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioNotifications
   (
      This       : access IGuidanceNavigator_Interface
      ; value : Windows.Services.Maps.Guidance.GuidanceAudioNotifications
   )
   return Windows.HRESULT is abstract;
   
   function add_GuidanceUpdated
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GuidanceUpdated
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DestinationReached
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_DestinationReached
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DestinationReached
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Rerouting
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_Rerouting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Rerouting
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Rerouted
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_Rerouted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Rerouted
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RerouteFailed
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_RerouteFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RerouteFailed
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UserLocationLost
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_UserLocationLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserLocationLost
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UserLocationRestored
   (
      This       : access IGuidanceNavigator_Interface
      ; handler : TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserLocationRestored
   (
      This       : access IGuidanceNavigator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetGuidanceVoice
   (
      This       : access IGuidanceNavigator_Interface
      ; voiceId : Windows.Int32
      ; voiceFolder : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function UpdateUserLocation
   (
      This       : access IGuidanceNavigator_Interface
      ; userLocation : Windows.Devices.Geolocation.IGeocoordinate
   )
   return Windows.HRESULT is abstract;
   
   function UpdateUserLocationWithPositionOverride
   (
      This       : access IGuidanceNavigator_Interface
      ; userLocation : Windows.Devices.Geolocation.IGeocoordinate
      ; positionOverride : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceNavigator : aliased constant Windows.IID := (150044407, 36415, 19866, (190, 138, 16, 143, 154, 1, 44, 103 ));
   
   ------------------------------------------------------------------------
   type IGuidanceNavigator2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AudioNotificationRequested
   (
      This       : access IGuidanceNavigator2_Interface
      ; value : TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioNotificationRequested
   (
      This       : access IGuidanceNavigator2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGuidanceAudioMuted
   (
      This       : access IGuidanceNavigator2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsGuidanceAudioMuted
   (
      This       : access IGuidanceNavigator2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceNavigator2 : aliased constant Windows.IID := (1826377937, 1052, 19443, (182, 51, 161, 1, 252, 47, 107, 87 ));
   
   ------------------------------------------------------------------------
   type IGuidanceNavigatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrent
   (
      This       : access IGuidanceNavigatorStatics_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceNavigator
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceNavigatorStatics : aliased constant Windows.IID := (16618771, 17494, 20070, (161, 67, 58, 221, 107, 224, 132, 38 ));
   
   ------------------------------------------------------------------------
   type IGuidanceNavigatorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UseAppProvidedVoice
   (
      This       : access IGuidanceNavigatorStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceNavigatorStatics2 : aliased constant Windows.IID := (1422246882, 30596, 19589, (140, 149, 208, 198, 239, 180, 57, 101 ));
   
   ------------------------------------------------------------------------
   type IGuidanceRoadSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RoadName
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShortRoadName
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeedLimit
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TravelTime
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHighway
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTunnel
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTollRoad
   (
      This       : access IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceRoadSegment : aliased constant Windows.IID := (3005700262, 48760, 19555, (175, 231, 108, 41, 87, 71, 155, 62 ));
   
   ------------------------------------------------------------------------
   type IGuidanceRoadSegment2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsScenic
   (
      This       : access IGuidanceRoadSegment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceRoadSegment2 : aliased constant Windows.IID := (611624477, 5923, 18929, (137, 91, 71, 162, 196, 170, 156, 85 ));
   
   ------------------------------------------------------------------------
   type IGuidanceMapMatchedCoordinate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Location
   (
      This       : access IGuidanceMapMatchedCoordinate_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentHeading
   (
      This       : access IGuidanceMapMatchedCoordinate_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentSpeed
   (
      This       : access IGuidanceMapMatchedCoordinate_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnStreet
   (
      This       : access IGuidanceMapMatchedCoordinate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Road
   (
      This       : access IGuidanceMapMatchedCoordinate_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoadSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceMapMatchedCoordinate : aliased constant Windows.IID := (3081548136, 10514, 19097, (175, 241, 121, 134, 9, 185, 129, 254 ));
   
   ------------------------------------------------------------------------
   type IGuidanceTelemetryCollectorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrent
   (
      This       : access IGuidanceTelemetryCollectorStatics_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceTelemetryCollector
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceTelemetryCollectorStatics : aliased constant Windows.IID := (911417415, 61792, 17659, (181, 120, 148, 87, 124, 160, 89, 144 ));
   
   ------------------------------------------------------------------------
   type IGuidanceTelemetryCollector_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Enabled
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ClearLocalData
   (
      This       : access IGuidanceTelemetryCollector_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeedTrigger
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SpeedTrigger
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_UploadFrequency
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_UploadFrequency
   (
      This       : access IGuidanceTelemetryCollector_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceTelemetryCollector : aliased constant Windows.IID := (3676278181, 47224, 19858, (152, 221, 52, 125, 35, 211, 130, 98 ));
   
   ------------------------------------------------------------------------
   type IGuidanceRouteStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CanCreateFromMapRoute
   (
      This       : access IGuidanceRouteStatics_Interface
      ; mapRoute : Windows.Services.Maps.IMapRoute
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateFromMapRoute
   (
      This       : access IGuidanceRouteStatics_Interface
      ; mapRoute : Windows.Services.Maps.IMapRoute
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoute
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceRouteStatics : aliased constant Windows.IID := (4117598826, 21997, 18881, (176, 156, 75, 130, 35, 181, 13, 179 ));
   
   ------------------------------------------------------------------------
   type IGuidanceRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Duration
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Distance
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Maneuvers
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IVectorView_IGuidanceManeuver -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingBox
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_RoadSegments
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IVectorView_IGuidanceRoadSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConvertToMapRoute
   (
      This       : access IGuidanceRoute_Interface
      ; RetVal : access Windows.Services.Maps.IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceRoute : aliased constant Windows.IID := (974410845, 32794, 16573, (162, 134, 175, 178, 1, 12, 206, 108 ));
   
   ------------------------------------------------------------------------
   type IGuidanceLaneInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LaneMarkers
   (
      This       : access IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.GuidanceLaneMarkers
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnRoute
   (
      This       : access IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGuidanceLaneInfo : aliased constant Windows.IID := (2214908180, 25985, 17335, (172, 21, 201, 7, 155, 249, 13, 241 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGuidanceLaneInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceLaneInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGuidanceLaneInfo_Interface
      ; items : Windows.Services.Maps.Guidance.IGuidanceLaneInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGuidanceLaneInfo : aliased constant Windows.IID := (1296884952, 31968, 20840, (171, 41, 107, 207, 127, 25, 138, 88 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGuidanceLaneInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IIterator_IGuidanceLaneInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGuidanceLaneInfo : aliased constant Windows.IID := (1167461746, 7158, 23069, (161, 127, 232, 63, 86, 241, 171, 87 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGuidanceLaneInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGuidanceLaneInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceLaneInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGuidanceLaneInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGuidanceLaneInfo_Interface
      ; value : Windows.Services.Maps.Guidance.IGuidanceLaneInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGuidanceLaneInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.Guidance.IGuidanceLaneInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGuidanceLaneInfo : aliased constant Windows.IID := (2169058928, 58645, 23650, (179, 76, 110, 61, 153, 108, 173, 49 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGuidanceManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGuidanceManeuver_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGuidanceManeuver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGuidanceManeuver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGuidanceManeuver_Interface
      ; items : Windows.Services.Maps.Guidance.IGuidanceManeuver_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGuidanceManeuver : aliased constant Windows.IID := (1956868242, 9793, 23613, (179, 203, 104, 157, 200, 171, 162, 46 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGuidanceManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGuidanceManeuver_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IIterator_IGuidanceManeuver
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGuidanceManeuver : aliased constant Windows.IID := (3044543847, 35467, 21903, (164, 182, 196, 83, 30, 243, 46, 200 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGuidanceManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGuidanceManeuver_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGuidanceManeuver_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGuidanceManeuver_Interface
      ; value : Windows.Services.Maps.Guidance.IGuidanceManeuver
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGuidanceManeuver_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.Guidance.IGuidanceManeuver_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGuidanceManeuver : aliased constant Windows.IID := (2270577880, 22436, 22998, (157, 44, 93, 69, 13, 57, 210, 246 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGuidanceRoadSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoadSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGuidanceRoadSegment_Interface
      ; items : Windows.Services.Maps.Guidance.IGuidanceRoadSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGuidanceRoadSegment : aliased constant Windows.IID := (344766719, 15033, 21419, (136, 36, 37, 106, 98, 4, 123, 67 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGuidanceRoadSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.Services.Maps.Guidance.IIterator_IGuidanceRoadSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGuidanceRoadSegment : aliased constant Windows.IID := (4156953796, 4042, 24282, (128, 76, 133, 200, 41, 149, 99, 52 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGuidanceRoadSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGuidanceRoadSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.Guidance.IGuidanceRoadSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGuidanceRoadSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGuidanceRoadSegment_Interface
      ; value : Windows.Services.Maps.Guidance.IGuidanceRoadSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGuidanceRoadSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.Guidance.IGuidanceRoadSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGuidanceRoadSegment : aliased constant Windows.IID := (4031544514, 19796, 21060, (190, 178, 143, 79, 5, 193, 132, 230 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Services.Maps.Guidance.IGuidanceUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated : aliased constant Windows.IID := (2192832479, 48915, 21573, (170, 220, 236, 97, 181, 15, 187, 70 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_DestinationReached : aliased constant Windows.IID := (1061776437, 15818, 24209, (135, 48, 110, 247, 126, 157, 112, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_Rerouting : aliased constant Windows.IID := (1061776437, 15818, 24209, (135, 48, 110, 247, 126, 157, 112, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Services.Maps.Guidance.IGuidanceReroutedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceReroutedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_Rerouted : aliased constant Windows.IID := (1639525147, 61999, 22555, (191, 160, 72, 104, 195, 20, 198, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_RerouteFailed : aliased constant Windows.IID := (1061776437, 15818, 24209, (135, 48, 110, 247, 126, 157, 112, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_UserLocationLost : aliased constant Windows.IID := (1061776437, 15818, 24209, (135, 48, 110, 247, 126, 157, 112, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored : aliased constant Windows.IID := (1061776437, 15818, 24209, (135, 48, 110, 247, 126, 157, 112, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface(Callback : access procedure (sender : Windows.Services.Maps.Guidance.IGuidanceNavigator ; args : Windows.Services.Maps.Guidance.IGuidanceAudioNotificationRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceAudioNotificationRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested : aliased constant Windows.IID := (1950200687, 59818, 21882, (159, 215, 48, 76, 155, 4, 153, 223 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GuidanceRoadSignpost is Windows.Services.Maps.Guidance.IGuidanceRoadSignpost;
   subtype GuidanceManeuver is Windows.Services.Maps.Guidance.IGuidanceManeuver;
   subtype GuidanceRoute is Windows.Services.Maps.Guidance.IGuidanceRoute;
   subtype GuidanceMapMatchedCoordinate is Windows.Services.Maps.Guidance.IGuidanceMapMatchedCoordinate;
   subtype GuidanceLaneInfo is Windows.Services.Maps.Guidance.IGuidanceLaneInfo;
   subtype GuidanceUpdatedEventArgs is Windows.Services.Maps.Guidance.IGuidanceUpdatedEventArgs;
   subtype GuidanceReroutedEventArgs is Windows.Services.Maps.Guidance.IGuidanceReroutedEventArgs;
   subtype GuidanceAudioNotificationRequestedEventArgs is Windows.Services.Maps.Guidance.IGuidanceAudioNotificationRequestedEventArgs;
   subtype GuidanceNavigator is Windows.Services.Maps.Guidance.IGuidanceNavigator;
   subtype GuidanceRoadSegment is Windows.Services.Maps.Guidance.IGuidanceRoadSegment;
   subtype GuidanceTelemetryCollector is Windows.Services.Maps.Guidance.IGuidanceTelemetryCollector;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CanCreateFromMapRoute
   (
      mapRoute : Windows.Services.Maps.IMapRoute
   )
   return Windows.Boolean;
   
   function TryCreateFromMapRoute
   (
      mapRoute : Windows.Services.Maps.IMapRoute
   )
   return Windows.Services.Maps.Guidance.IGuidanceRoute;
   
   function GetCurrent
   return Windows.Services.Maps.Guidance.IGuidanceNavigator;
   
   function get_UseAppProvidedVoice
   return Windows.Boolean;
   
   function GetCurrent
   return Windows.Services.Maps.Guidance.IGuidanceTelemetryCollector;

end;
