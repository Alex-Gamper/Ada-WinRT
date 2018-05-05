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
with Windows.Foundation;
limited with Windows.Devices.Geolocation;
with Windows.Foundation.Collections;
limited with Windows.UI.Popups;
--------------------------------------------------------------------------------
package Windows.Services.Maps is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MapRouteOptimization is (
      Time,
      Distance,
      TimeWithTraffic,
      Scenic
   );
   for MapRouteOptimization use (
      Time => 0,
      Distance => 1,
      TimeWithTraffic => 2,
      Scenic => 3
   );
   for MapRouteOptimization'Size use 32;
   
   type MapRouteOptimization_Ptr is access MapRouteOptimization;
   
   type MapRouteRestrictions is (
      None,
      Highways,
      TollRoads,
      Ferries,
      Tunnels,
      DirtRoads,
      Motorail
   );
   for MapRouteRestrictions use (
      None => 0,
      Highways => 1,
      TollRoads => 2,
      Ferries => 4,
      Tunnels => 8,
      DirtRoads => 16,
      Motorail => 32
   );
   for MapRouteRestrictions'Size use 32;
   
   type MapRouteRestrictions_Ptr is access MapRouteRestrictions;
   
   type MapRouteManeuverKind is (
      None,
      Start,
      Stopover,
      StopoverResume,
      End_x,
      GoStraight,
      UTurnLeft,
      UTurnRight,
      TurnKeepLeft,
      TurnKeepRight,
      TurnLightLeft,
      TurnLightRight,
      TurnLeft,
      TurnRight,
      TurnHardLeft,
      TurnHardRight,
      FreewayEnterLeft,
      FreewayEnterRight,
      FreewayLeaveLeft,
      FreewayLeaveRight,
      FreewayContinueLeft,
      FreewayContinueRight,
      TrafficCircleLeft,
      TrafficCircleRight,
      TakeFerry
   );
   for MapRouteManeuverKind use (
      None => 0,
      Start => 1,
      Stopover => 2,
      StopoverResume => 3,
      End_x => 4,
      GoStraight => 5,
      UTurnLeft => 6,
      UTurnRight => 7,
      TurnKeepLeft => 8,
      TurnKeepRight => 9,
      TurnLightLeft => 10,
      TurnLightRight => 11,
      TurnLeft => 12,
      TurnRight => 13,
      TurnHardLeft => 14,
      TurnHardRight => 15,
      FreewayEnterLeft => 16,
      FreewayEnterRight => 17,
      FreewayLeaveLeft => 18,
      FreewayLeaveRight => 19,
      FreewayContinueLeft => 20,
      FreewayContinueRight => 21,
      TrafficCircleLeft => 22,
      TrafficCircleRight => 23,
      TakeFerry => 24
   );
   for MapRouteManeuverKind'Size use 32;
   
   type MapRouteManeuverKind_Ptr is access MapRouteManeuverKind;
   
   type MapManeuverNotices is (
      None,
      Toll,
      Unpaved
   );
   for MapManeuverNotices use (
      None => 0,
      Toll => 1,
      Unpaved => 2
   );
   for MapManeuverNotices'Size use 32;
   
   type MapManeuverNotices_Ptr is access MapManeuverNotices;
   
   type MapLocationFinderStatus is (
      Success,
      UnknownError,
      InvalidCredentials,
      BadLocation,
      IndexFailure,
      NetworkFailure,
      NotSupported
   );
   for MapLocationFinderStatus use (
      Success => 0,
      UnknownError => 1,
      InvalidCredentials => 2,
      BadLocation => 3,
      IndexFailure => 4,
      NetworkFailure => 5,
      NotSupported => 6
   );
   for MapLocationFinderStatus'Size use 32;
   
   type MapLocationFinderStatus_Ptr is access MapLocationFinderStatus;
   
   type MapRouteFinderStatus is (
      Success,
      UnknownError,
      InvalidCredentials,
      NoRouteFound,
      NoRouteFoundWithGivenOptions,
      StartPointNotFound,
      EndPointNotFound,
      NoPedestrianRouteFound,
      NetworkFailure,
      NotSupported
   );
   for MapRouteFinderStatus use (
      Success => 0,
      UnknownError => 1,
      InvalidCredentials => 2,
      NoRouteFound => 3,
      NoRouteFoundWithGivenOptions => 4,
      StartPointNotFound => 5,
      EndPointNotFound => 6,
      NoPedestrianRouteFound => 7,
      NetworkFailure => 8,
      NotSupported => 9
   );
   for MapRouteFinderStatus'Size use 32;
   
   type MapRouteFinderStatus_Ptr is access MapRouteFinderStatus;
   
   type MapLocationDesiredAccuracy is (
      High,
      Low
   );
   for MapLocationDesiredAccuracy use (
      High => 0,
      Low => 1
   );
   for MapLocationDesiredAccuracy'Size use 32;
   
   type MapLocationDesiredAccuracy_Ptr is access MapLocationDesiredAccuracy;
   
   type WaypointKind is (
      Stop,
      Via
   );
   for WaypointKind use (
      Stop => 0,
      Via => 1
   );
   for WaypointKind'Size use 32;
   
   type WaypointKind_Ptr is access WaypointKind;
   
   type MapServiceDataUsagePreference is (
      Default,
      OfflineMapDataOnly
   );
   for MapServiceDataUsagePreference use (
      Default => 0,
      OfflineMapDataOnly => 1
   );
   for MapServiceDataUsagePreference'Size use 32;
   
   type MapServiceDataUsagePreference_Ptr is access MapServiceDataUsagePreference;
   
   type TrafficCongestion is (
      Unknown,
      Light,
      Mild,
      Medium,
      Heavy
   );
   for TrafficCongestion use (
      Unknown => 0,
      Light => 1,
      Mild => 2,
      Medium => 3,
      Heavy => 4
   );
   for TrafficCongestion'Size use 32;
   
   type TrafficCongestion_Ptr is access TrafficCongestion;
   
   type ManeuverWarningKind is (
      None,
      Accident,
      AdministrativeDivisionChange,
      Alert,
      BlockedRoad,
      CheckTimetable,
      Congestion,
      Construction,
      CountryChange,
      DisabledVehicle,
      GateAccess,
      GetOffTransit,
      GetOnTransit,
      IllegalUTurn,
      MassTransit,
      Miscellaneous,
      NoIncident,
      Other,
      OtherNews,
      OtherTrafficIncidents,
      PlannedEvent,
      PrivateRoad,
      RestrictedTurn,
      RoadClosures,
      RoadHazard,
      ScheduledConstruction,
      SeasonalClosures,
      Tollbooth,
      TollRoad,
      TollZoneEnter,
      TollZoneExit,
      TrafficFlow,
      TransitLineChange,
      UnpavedRoad,
      UnscheduledConstruction,
      Weather
   );
   for ManeuverWarningKind use (
      None => 0,
      Accident => 1,
      AdministrativeDivisionChange => 2,
      Alert => 3,
      BlockedRoad => 4,
      CheckTimetable => 5,
      Congestion => 6,
      Construction => 7,
      CountryChange => 8,
      DisabledVehicle => 9,
      GateAccess => 10,
      GetOffTransit => 11,
      GetOnTransit => 12,
      IllegalUTurn => 13,
      MassTransit => 14,
      Miscellaneous => 15,
      NoIncident => 16,
      Other => 17,
      OtherNews => 18,
      OtherTrafficIncidents => 19,
      PlannedEvent => 20,
      PrivateRoad => 21,
      RestrictedTurn => 22,
      RoadClosures => 23,
      RoadHazard => 24,
      ScheduledConstruction => 25,
      SeasonalClosures => 26,
      Tollbooth => 27,
      TollRoad => 28,
      TollZoneEnter => 29,
      TollZoneExit => 30,
      TrafficFlow => 31,
      TransitLineChange => 32,
      UnpavedRoad => 33,
      UnscheduledConstruction => 34,
      Weather => 35
   );
   for ManeuverWarningKind'Size use 32;
   
   type ManeuverWarningKind_Ptr is access ManeuverWarningKind;
   
   type ManeuverWarningSeverity is (
      None,
      LowImpact,
      Minor,
      Moderate,
      Serious
   );
   for ManeuverWarningSeverity use (
      None => 0,
      LowImpact => 1,
      Minor => 2,
      Moderate => 3,
      Serious => 4
   );
   for ManeuverWarningSeverity'Size use 32;
   
   type ManeuverWarningSeverity_Ptr is access ManeuverWarningSeverity;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GuidanceContract is null record;
   pragma Convention (C_Pass_By_Copy , GuidanceContract);
   
   type GuidanceContract_Ptr is access GuidanceContract;
   
   type LocalSearchContract is null record;
   pragma Convention (C_Pass_By_Copy , LocalSearchContract);
   
   type LocalSearchContract_Ptr is access LocalSearchContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMapLocationFinderResult_Interface;
   type AsyncOperationCompletedHandler_IMapLocationFinderResult is access all AsyncOperationCompletedHandler_IMapLocationFinderResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMapLocationFinderResult_Ptr is access all AsyncOperationCompletedHandler_IMapLocationFinderResult;
   type AsyncOperationCompletedHandler_IMapRouteFinderResult_Interface;
   type AsyncOperationCompletedHandler_IMapRouteFinderResult is access all AsyncOperationCompletedHandler_IMapRouteFinderResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMapRouteFinderResult_Ptr is access all AsyncOperationCompletedHandler_IMapRouteFinderResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMapRouteDrivingOptions_Interface;
   type IMapRouteDrivingOptions is access all IMapRouteDrivingOptions_Interface'Class;
   type IMapRouteDrivingOptions_Ptr is access all IMapRouteDrivingOptions;
   type IMapRouteDrivingOptions2_Interface;
   type IMapRouteDrivingOptions2 is access all IMapRouteDrivingOptions2_Interface'Class;
   type IMapRouteDrivingOptions2_Ptr is access all IMapRouteDrivingOptions2;
   type IMapAddress_Interface;
   type IMapAddress is access all IMapAddress_Interface'Class;
   type IMapAddress_Ptr is access all IMapAddress;
   type IMapAddress2_Interface;
   type IMapAddress2 is access all IMapAddress2_Interface'Class;
   type IMapAddress2_Ptr is access all IMapAddress2;
   type IMapLocation_Interface;
   type IMapLocation is access all IMapLocation_Interface'Class;
   type IMapLocation_Ptr is access all IMapLocation;
   type IMapLocationFinderResult_Interface;
   type IMapLocationFinderResult is access all IMapLocationFinderResult_Interface'Class;
   type IMapLocationFinderResult_Ptr is access all IMapLocationFinderResult;
   type IMapRouteManeuver_Interface;
   type IMapRouteManeuver is access all IMapRouteManeuver_Interface'Class;
   type IMapRouteManeuver_Ptr is access all IMapRouteManeuver;
   type IMapRouteManeuver2_Interface;
   type IMapRouteManeuver2 is access all IMapRouteManeuver2_Interface'Class;
   type IMapRouteManeuver2_Ptr is access all IMapRouteManeuver2;
   type IMapRouteManeuver3_Interface;
   type IMapRouteManeuver3 is access all IMapRouteManeuver3_Interface'Class;
   type IMapRouteManeuver3_Ptr is access all IMapRouteManeuver3;
   type IManeuverWarning_Interface;
   type IManeuverWarning is access all IManeuverWarning_Interface'Class;
   type IManeuverWarning_Ptr is access all IManeuverWarning;
   type IMapRouteLeg_Interface;
   type IMapRouteLeg is access all IMapRouteLeg_Interface'Class;
   type IMapRouteLeg_Ptr is access all IMapRouteLeg;
   type IMapRouteLeg2_Interface;
   type IMapRouteLeg2 is access all IMapRouteLeg2_Interface'Class;
   type IMapRouteLeg2_Ptr is access all IMapRouteLeg2;
   type IMapRoute_Interface;
   type IMapRoute is access all IMapRoute_Interface'Class;
   type IMapRoute_Ptr is access all IMapRoute;
   type IMapRoute2_Interface;
   type IMapRoute2 is access all IMapRoute2_Interface'Class;
   type IMapRoute2_Ptr is access all IMapRoute2;
   type IMapRoute3_Interface;
   type IMapRoute3 is access all IMapRoute3_Interface'Class;
   type IMapRoute3_Ptr is access all IMapRoute3;
   type IMapRoute4_Interface;
   type IMapRoute4 is access all IMapRoute4_Interface'Class;
   type IMapRoute4_Ptr is access all IMapRoute4;
   type IMapRouteFinderResult_Interface;
   type IMapRouteFinderResult is access all IMapRouteFinderResult_Interface'Class;
   type IMapRouteFinderResult_Ptr is access all IMapRouteFinderResult;
   type IMapRouteFinderResult2_Interface;
   type IMapRouteFinderResult2 is access all IMapRouteFinderResult2_Interface'Class;
   type IMapRouteFinderResult2_Ptr is access all IMapRouteFinderResult2;
   type IEnhancedWaypoint_Interface;
   type IEnhancedWaypoint is access all IEnhancedWaypoint_Interface'Class;
   type IEnhancedWaypoint_Ptr is access all IEnhancedWaypoint;
   type IEnhancedWaypointFactory_Interface;
   type IEnhancedWaypointFactory is access all IEnhancedWaypointFactory_Interface'Class;
   type IEnhancedWaypointFactory_Ptr is access all IEnhancedWaypointFactory;
   type IMapLocationFinderStatics_Interface;
   type IMapLocationFinderStatics is access all IMapLocationFinderStatics_Interface'Class;
   type IMapLocationFinderStatics_Ptr is access all IMapLocationFinderStatics;
   type IMapLocationFinderStatics2_Interface;
   type IMapLocationFinderStatics2 is access all IMapLocationFinderStatics2_Interface'Class;
   type IMapLocationFinderStatics2_Ptr is access all IMapLocationFinderStatics2;
   type IMapRouteFinderStatics_Interface;
   type IMapRouteFinderStatics is access all IMapRouteFinderStatics_Interface'Class;
   type IMapRouteFinderStatics_Ptr is access all IMapRouteFinderStatics;
   type IMapRouteFinderStatics2_Interface;
   type IMapRouteFinderStatics2 is access all IMapRouteFinderStatics2_Interface'Class;
   type IMapRouteFinderStatics2_Ptr is access all IMapRouteFinderStatics2;
   type IMapRouteFinderStatics3_Interface;
   type IMapRouteFinderStatics3 is access all IMapRouteFinderStatics3_Interface'Class;
   type IMapRouteFinderStatics3_Ptr is access all IMapRouteFinderStatics3;
   type IMapServiceStatics_Interface;
   type IMapServiceStatics is access all IMapServiceStatics_Interface'Class;
   type IMapServiceStatics_Ptr is access all IMapServiceStatics;
   type IMapManagerStatics_Interface;
   type IMapManagerStatics is access all IMapManagerStatics_Interface'Class;
   type IMapManagerStatics_Ptr is access all IMapManagerStatics;
   type IMapServiceStatics2_Interface;
   type IMapServiceStatics2 is access all IMapServiceStatics2_Interface'Class;
   type IMapServiceStatics2_Ptr is access all IMapServiceStatics2;
   type IMapServiceStatics3_Interface;
   type IMapServiceStatics3 is access all IMapServiceStatics3_Interface'Class;
   type IMapServiceStatics3_Ptr is access all IMapServiceStatics3;
   type IMapServiceStatics4_Interface;
   type IMapServiceStatics4 is access all IMapServiceStatics4_Interface'Class;
   type IMapServiceStatics4_Ptr is access all IMapServiceStatics4;
   type IPlaceInfoCreateOptions_Interface;
   type IPlaceInfoCreateOptions is access all IPlaceInfoCreateOptions_Interface'Class;
   type IPlaceInfoCreateOptions_Ptr is access all IPlaceInfoCreateOptions;
   type IPlaceInfoStatics_Interface;
   type IPlaceInfoStatics is access all IPlaceInfoStatics_Interface'Class;
   type IPlaceInfoStatics_Ptr is access all IPlaceInfoStatics;
   type IPlaceInfoStatics2_Interface;
   type IPlaceInfoStatics2 is access all IPlaceInfoStatics2_Interface'Class;
   type IPlaceInfoStatics2_Ptr is access all IPlaceInfoStatics2;
   type IPlaceInfo_Interface;
   type IPlaceInfo is access all IPlaceInfo_Interface'Class;
   type IPlaceInfo_Ptr is access all IPlaceInfo;
   type IIterator_IMapLocation_Interface;
   type IIterator_IMapLocation is access all IIterator_IMapLocation_Interface'Class;
   type IIterator_IMapLocation_Ptr is access all IIterator_IMapLocation;
   type IIterable_IMapLocation_Interface;
   type IIterable_IMapLocation is access all IIterable_IMapLocation_Interface'Class;
   type IIterable_IMapLocation_Ptr is access all IIterable_IMapLocation;
   type IVectorView_IMapLocation_Interface;
   type IVectorView_IMapLocation is access all IVectorView_IMapLocation_Interface'Class;
   type IVectorView_IMapLocation_Ptr is access all IVectorView_IMapLocation;
   type IIterator_IManeuverWarning_Interface;
   type IIterator_IManeuverWarning is access all IIterator_IManeuverWarning_Interface'Class;
   type IIterator_IManeuverWarning_Ptr is access all IIterator_IManeuverWarning;
   type IIterable_IManeuverWarning_Interface;
   type IIterable_IManeuverWarning is access all IIterable_IManeuverWarning_Interface'Class;
   type IIterable_IManeuverWarning_Ptr is access all IIterable_IManeuverWarning;
   type IVectorView_IManeuverWarning_Interface;
   type IVectorView_IManeuverWarning is access all IVectorView_IManeuverWarning_Interface'Class;
   type IVectorView_IManeuverWarning_Ptr is access all IVectorView_IManeuverWarning;
   type IIterator_IMapRouteManeuver_Interface;
   type IIterator_IMapRouteManeuver is access all IIterator_IMapRouteManeuver_Interface'Class;
   type IIterator_IMapRouteManeuver_Ptr is access all IIterator_IMapRouteManeuver;
   type IIterable_IMapRouteManeuver_Interface;
   type IIterable_IMapRouteManeuver is access all IIterable_IMapRouteManeuver_Interface'Class;
   type IIterable_IMapRouteManeuver_Ptr is access all IIterable_IMapRouteManeuver;
   type IVectorView_IMapRouteManeuver_Interface;
   type IVectorView_IMapRouteManeuver is access all IVectorView_IMapRouteManeuver_Interface'Class;
   type IVectorView_IMapRouteManeuver_Ptr is access all IVectorView_IMapRouteManeuver;
   type IIterator_IMapRouteLeg_Interface;
   type IIterator_IMapRouteLeg is access all IIterator_IMapRouteLeg_Interface'Class;
   type IIterator_IMapRouteLeg_Ptr is access all IIterator_IMapRouteLeg;
   type IIterable_IMapRouteLeg_Interface;
   type IIterable_IMapRouteLeg is access all IIterable_IMapRouteLeg_Interface'Class;
   type IIterable_IMapRouteLeg_Ptr is access all IIterable_IMapRouteLeg;
   type IVectorView_IMapRouteLeg_Interface;
   type IVectorView_IMapRouteLeg is access all IVectorView_IMapRouteLeg_Interface'Class;
   type IVectorView_IMapRouteLeg_Ptr is access all IVectorView_IMapRouteLeg;
   type IIterator_IMapRoute_Interface;
   type IIterator_IMapRoute is access all IIterator_IMapRoute_Interface'Class;
   type IIterator_IMapRoute_Ptr is access all IIterator_IMapRoute;
   type IIterable_IMapRoute_Interface;
   type IIterable_IMapRoute is access all IIterable_IMapRoute_Interface'Class;
   type IIterable_IMapRoute_Ptr is access all IIterable_IMapRoute;
   type IVectorView_IMapRoute_Interface;
   type IVectorView_IMapRoute is access all IVectorView_IMapRoute_Interface'Class;
   type IVectorView_IMapRoute_Ptr is access all IVectorView_IMapRoute;
   type IAsyncOperation_IMapLocationFinderResult_Interface;
   type IAsyncOperation_IMapLocationFinderResult is access all IAsyncOperation_IMapLocationFinderResult_Interface'Class;
   type IAsyncOperation_IMapLocationFinderResult_Ptr is access all IAsyncOperation_IMapLocationFinderResult;
   type IAsyncOperation_IMapRouteFinderResult_Interface;
   type IAsyncOperation_IMapRouteFinderResult is access all IAsyncOperation_IMapRouteFinderResult_Interface'Class;
   type IAsyncOperation_IMapRouteFinderResult_Ptr is access all IAsyncOperation_IMapRouteFinderResult;
   type IIterator_IEnhancedWaypoint_Interface;
   type IIterator_IEnhancedWaypoint is access all IIterator_IEnhancedWaypoint_Interface'Class;
   type IIterator_IEnhancedWaypoint_Ptr is access all IIterator_IEnhancedWaypoint;
   type IIterable_IEnhancedWaypoint_Interface;
   type IIterable_IEnhancedWaypoint is access all IIterable_IEnhancedWaypoint_Interface'Class;
   type IIterable_IEnhancedWaypoint_Ptr is access all IIterable_IEnhancedWaypoint;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteDrivingOptions : aliased constant Windows.IID := (1746220621, 50908, 18071, (164, 82, 177, 143, 143, 11, 103, 161 ));
   
   type IMapRouteDrivingOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxAlternateRouteCount
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxAlternateRouteCount
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialHeading
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialHeading
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RouteOptimization
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; RetVal : access Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.HRESULT is abstract;
   
   function put_RouteOptimization
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; value : Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.HRESULT is abstract;
   
   function get_RouteRestrictions
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; RetVal : access Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.HRESULT is abstract;
   
   function put_RouteRestrictions
   (
      This       : access IMapRouteDrivingOptions_Interface
      ; value : Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteDrivingOptions2 : aliased constant Windows.IID := (903644784, 49816, 18640, (181, 173, 130, 84, 96, 100, 86, 3 ));
   
   type IMapRouteDrivingOptions2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DepartureTime
   (
      This       : access IMapRouteDrivingOptions2_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DepartureTime
   (
      This       : access IMapRouteDrivingOptions2_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapAddress : aliased constant Windows.IID := (3483871603, 41908, 17556, (179, 255, 203, 169, 77, 182, 150, 153 ));
   
   type IMapAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BuildingName
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BuildingFloor
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BuildingRoom
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BuildingWing
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StreetNumber
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Street
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Neighborhood
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_District
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Town
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Region
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RegionCode
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Country
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CountryCode
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostCode
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Continent
   (
      This       : access IMapAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapAddress2 : aliased constant Windows.IID := (1976397297, 58797, 17833, (191, 64, 108, 242, 86, 193, 221, 19 ));
   
   type IMapAddress2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormattedAddress
   (
      This       : access IMapAddress2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLocation : aliased constant Windows.IID := (1007107927, 3492, 17128, (158, 226, 169, 111, 207, 35, 113, 220 ));
   
   type IMapLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point
   (
      This       : access IMapLocation_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IMapLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IMapLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IMapLocation_Interface
      ; RetVal : access Windows.Services.Maps.IMapAddress
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLocationFinderResult : aliased constant Windows.IID := (1139929465, 59596, 17910, (190, 210, 84, 204, 191, 150, 93, 154 ));
   
   type IMapLocationFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Locations
   (
      This       : access IMapLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.IVectorView_IMapLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IMapLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.MapLocationFinderStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteManeuver : aliased constant Windows.IID := (3982235632, 42667, 19813, (160, 134, 250, 138, 126, 52, 13, 242 ));
   
   type IMapRouteManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartingPoint
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_LengthInMeters
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_InstructionText
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.Services.Maps.MapRouteManeuverKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitNumber
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ManeuverNotices
   (
      This       : access IMapRouteManeuver_Interface
      ; RetVal : access Windows.Services.Maps.MapManeuverNotices
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteManeuver2 : aliased constant Windows.IID := (1568394652, 31899, 16863, (131, 139, 234, 226, 30, 75, 5, 169 ));
   
   type IMapRouteManeuver2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartHeading
   (
      This       : access IMapRouteManeuver2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EndHeading
   (
      This       : access IMapRouteManeuver2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StreetName
   (
      This       : access IMapRouteManeuver2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteManeuver3 : aliased constant Windows.IID := (2795583711, 1155, 16742, (133, 190, 185, 147, 54, 193, 24, 117 ));
   
   type IMapRouteManeuver3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Warnings
   (
      This       : access IMapRouteManeuver3_Interface
      ; RetVal : access Windows.Services.Maps.IVectorView_IManeuverWarning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManeuverWarning : aliased constant Windows.IID := (3248713098, 9776, 17272, (158, 74, 110, 68, 37, 61, 206, 186 ));
   
   type IManeuverWarning_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IManeuverWarning_Interface
      ; RetVal : access Windows.Services.Maps.ManeuverWarningKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Severity
   (
      This       : access IManeuverWarning_Interface
      ; RetVal : access Windows.Services.Maps.ManeuverWarningSeverity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteLeg : aliased constant Windows.IID := (2532881142, 23482, 19735, (157, 182, 26, 38, 63, 236, 116, 113 ));
   
   type IMapRouteLeg_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BoundingBox
   (
      This       : access IMapRouteLeg_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IMapRouteLeg_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_LengthInMeters
   (
      This       : access IMapRouteLeg_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EstimatedDuration
   (
      This       : access IMapRouteLeg_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Maneuvers
   (
      This       : access IMapRouteLeg_Interface
      ; RetVal : access Windows.Services.Maps.IVectorView_IMapRouteManeuver -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteLeg2 : aliased constant Windows.IID := (48367149, 51654, 17848, (142, 84, 26, 16, 181, 122, 23, 232 ));
   
   type IMapRouteLeg2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DurationWithoutTraffic
   (
      This       : access IMapRouteLeg2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficCongestion
   (
      This       : access IMapRouteLeg2_Interface
      ; RetVal : access Windows.Services.Maps.TrafficCongestion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRoute : aliased constant Windows.IID := (4211586866, 22605, 17795, (156, 96, 100, 31, 234, 39, 67, 73 ));
   
   type IMapRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BoundingBox
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function get_LengthInMeters
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EstimatedDuration
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_Legs
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Services.Maps.IVectorView_IMapRouteLeg -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrafficBased
   (
      This       : access IMapRoute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRoute2 : aliased constant Windows.IID := (3519403020, 8723, 19120, (162, 96, 70, 179, 129, 105, 190, 172 ));
   
   type IMapRoute2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViolatedRestrictions
   (
      This       : access IMapRoute2_Interface
      ; RetVal : access Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.HRESULT is abstract;
   
   function get_HasBlockedRoads
   (
      This       : access IMapRoute2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRoute3 : aliased constant Windows.IID := (2240618158, 62125, 17055, (187, 55, 205, 33, 9, 79, 252, 146 ));
   
   type IMapRoute3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DurationWithoutTraffic
   (
      This       : access IMapRoute3_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficCongestion
   (
      This       : access IMapRoute3_Interface
      ; RetVal : access Windows.Services.Maps.TrafficCongestion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRoute4 : aliased constant Windows.IID := (913083557, 12371, 20385, (128, 255, 212, 117, 243, 237, 30, 110 ));
   
   type IMapRoute4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsScenic
   (
      This       : access IMapRoute4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteFinderResult : aliased constant Windows.IID := (2825429786, 37922, 18092, (140, 161, 177, 97, 77, 75, 251, 226 ));
   
   type IMapRouteFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Route
   (
      This       : access IMapRouteFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IMapRouteFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.MapRouteFinderStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteFinderResult2 : aliased constant Windows.IID := (544250989, 55564, 18120, (145, 198, 125, 75, 228, 239, 178, 21 ));
   
   type IMapRouteFinderResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlternateRoutes
   (
      This       : access IMapRouteFinderResult2_Interface
      ; RetVal : access Windows.Services.Maps.IVectorView_IMapRoute -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEnhancedWaypoint : aliased constant Windows.IID := (3978726516, 22803, 4582, (139, 119, 134, 243, 12, 168, 147, 211 ));
   
   type IEnhancedWaypoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point
   (
      This       : access IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Services.Maps.WaypointKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEnhancedWaypointFactory : aliased constant Windows.IID := (2944828535, 41642, 18141, (182, 69, 35, 179, 27, 138, 166, 199 ));
   
   type IEnhancedWaypointFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEnhancedWaypointFactory_Interface
      ; point : Windows.Devices.Geolocation.IGeopoint
      ; kind : Windows.Services.Maps.WaypointKind
      ; RetVal : access Windows.Services.Maps.IEnhancedWaypoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLocationFinderStatics : aliased constant Windows.IID := (831183709, 7261, 20277, (162, 223, 170, 202, 148, 149, 149, 23 ));
   
   type IMapLocationFinderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindLocationsAtAsync
   (
      This       : access IMapLocationFinderStatics_Interface
      ; queryPoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindLocationsAsync
   (
      This       : access IMapLocationFinderStatics_Interface
      ; searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindLocationsWithMaxCountAsync
   (
      This       : access IMapLocationFinderStatics_Interface
      ; searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; maxCount : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapLocationFinderStatics2 : aliased constant Windows.IID := (2509933462, 25733, 19965, (133, 26, 51, 172, 49, 126, 58, 246 ));
   
   type IMapLocationFinderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FindLocationsAtWithAccuracyAsync
   (
      This       : access IMapLocationFinderStatics2_Interface
      ; queryPoint : Windows.Devices.Geolocation.IGeopoint
      ; accuracy : Windows.Services.Maps.MapLocationDesiredAccuracy
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteFinderStatics : aliased constant Windows.IID := (3097871631, 7268, 19514, (129, 235, 31, 124, 21, 42, 251, 187 ));
   
   type IMapRouteFinderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDrivingRouteAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteWithOptimizationAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteWithOptimizationAndRestrictionsAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteFromWaypointsAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteFromWaypointsAndOptimizationAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWalkingRouteAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWalkingRouteFromWaypointsAsync
   (
      This       : access IMapRouteFinderStatics_Interface
      ; wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteFinderStatics2 : aliased constant Windows.IID := (2949393523, 30560, 18863, (179, 189, 186, 241, 53, 183, 3, 225 ));
   
   type IMapRouteFinderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDrivingRouteWithOptionsAsync
   (
      This       : access IMapRouteFinderStatics2_Interface
      ; startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapRouteFinderStatics3 : aliased constant Windows.IID := (4127818036, 22803, 4582, (139, 119, 134, 243, 12, 168, 147, 211 ));
   
   type IMapRouteFinderStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDrivingRouteFromEnhancedWaypointsAsync
   (
      This       : access IMapRouteFinderStatics3_Interface
      ; waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync
   (
      This       : access IMapRouteFinderStatics3_Interface
      ; waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
      ; RetVal : access Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapServiceStatics : aliased constant Windows.IID := (21278085, 49228, 19677, (135, 26, 160, 114, 109, 9, 124, 212 ));
   
   type IMapServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ServiceToken
   (
      This       : access IMapServiceStatics_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceToken
   (
      This       : access IMapServiceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapManagerStatics : aliased constant Windows.IID := (937682197, 33460, 19796, (143, 217, 175, 38, 36, 179, 1, 28 ));
   
   type IMapManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowDownloadedMapsUI
   (
      This       : access IMapManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ShowMapsUpdateUI
   (
      This       : access IMapManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapServiceStatics2 : aliased constant Windows.IID := (4162404077, 40069, 16553, (136, 150, 15, 195, 253, 43, 124, 42 ));
   
   type IMapServiceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WorldViewRegionCode
   (
      This       : access IMapServiceStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapServiceStatics3 : aliased constant Windows.IID := (168939040, 25511, 18516, (179, 85, 214, 220, 218, 34, 61, 27 ));
   
   type IMapServiceStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataAttributions
   (
      This       : access IMapServiceStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapServiceStatics4 : aliased constant Windows.IID := (143272034, 27324, 16910, (148, 95, 76, 253, 137, 198, 115, 86 ));
   
   type IMapServiceStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DataUsagePreference
   (
      This       : access IMapServiceStatics4_Interface
      ; value : Windows.Services.Maps.MapServiceDataUsagePreference
   )
   return Windows.HRESULT is abstract;
   
   function get_DataUsagePreference
   (
      This       : access IMapServiceStatics4_Interface
      ; RetVal : access Windows.Services.Maps.MapServiceDataUsagePreference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaceInfoCreateOptions : aliased constant Windows.IID := (3442721061, 26609, 19379, (153, 7, 236, 206, 147, 155, 3, 153 ));
   
   type IPlaceInfoCreateOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DisplayName
   (
      This       : access IPlaceInfoCreateOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPlaceInfoCreateOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayAddress
   (
      This       : access IPlaceInfoCreateOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAddress
   (
      This       : access IPlaceInfoCreateOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaceInfoStatics : aliased constant Windows.IID := (2193227633, 27856, 18596, (175, 217, 94, 216, 32, 151, 147, 107 ));
   
   type IPlaceInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPlaceInfoStatics_Interface
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithGeopointAndOptions
   (
      This       : access IPlaceInfoStatics_Interface
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromIdentifier
   (
      This       : access IPlaceInfoStatics_Interface
      ; identifier : Windows.String
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromIdentifierWithOptions
   (
      This       : access IPlaceInfoStatics_Interface
      ; identifier : Windows.String
      ; defaultPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromMapLocation
   (
      This       : access IPlaceInfoStatics_Interface
      ; location : Windows.Services.Maps.IMapLocation
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_IsShowSupported
   (
      This       : access IPlaceInfoStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaceInfoStatics2 : aliased constant Windows.IID := (1930363465, 16455, 17571, (143, 129, 37, 80, 165, 33, 99, 112 ));
   
   type IPlaceInfoStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromAddress
   (
      This       : access IPlaceInfoStatics2_Interface
      ; displayAddress : Windows.String
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromAddressWithName
   (
      This       : access IPlaceInfoStatics2_Interface
      ; displayAddress : Windows.String
      ; displayName : Windows.String
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaceInfo : aliased constant Windows.IID := (2584219830, 12744, 20330, (159, 24, 149, 11, 76, 56, 149, 26 ));
   
   type IPlaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function Show
   (
      This       : access IPlaceInfo_Interface
      ; selection : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function ShowWithPreferredPlacement
   (
      This       : access IPlaceInfo_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function get_Identifier
   (
      This       : access IPlaceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPlaceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAddress
   (
      This       : access IPlaceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Geoshape
   (
      This       : access IPlaceInfo_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoshape
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapLocation : aliased constant Windows.IID := (712002970, 14743, 24350, (134, 65, 136, 62, 186, 64, 135, 38 ));
   
   type IIterator_IMapLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapLocation_Interface
      ; RetVal : access Windows.Services.Maps.IMapLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapLocation_Interface
      ; items : Windows.Services.Maps.IMapLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapLocation : aliased constant Windows.IID := (2010800465, 1891, 20618, (144, 65, 51, 16, 186, 172, 229, 117 ));
   
   type IIterable_IMapLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapLocation_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IMapLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapLocation : aliased constant Windows.IID := (1490238736, 58095, 23025, (184, 94, 168, 129, 159, 240, 217, 38 ));
   
   type IVectorView_IMapLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapLocation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IMapLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapLocation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapLocation_Interface
      ; value : Windows.Services.Maps.IMapLocation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapLocation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.IMapLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IManeuverWarning : aliased constant Windows.IID := (3748962979, 7915, 23234, (188, 95, 159, 45, 175, 252, 224, 23 ));
   
   type IIterator_IManeuverWarning_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IManeuverWarning_Interface
      ; RetVal : access Windows.Services.Maps.IManeuverWarning
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IManeuverWarning_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IManeuverWarning_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IManeuverWarning_Interface
      ; items : Windows.Services.Maps.IManeuverWarning_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IManeuverWarning : aliased constant Windows.IID := (3456793619, 54212, 21935, (169, 15, 197, 63, 123, 217, 51, 115 ));
   
   type IIterable_IManeuverWarning_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IManeuverWarning_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IManeuverWarning
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IManeuverWarning : aliased constant Windows.IID := (1153506080, 49517, 22241, (160, 163, 110, 180, 79, 36, 146, 234 ));
   
   type IVectorView_IManeuverWarning_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IManeuverWarning_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IManeuverWarning
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IManeuverWarning_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IManeuverWarning_Interface
      ; value : Windows.Services.Maps.IManeuverWarning
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IManeuverWarning_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.IManeuverWarning_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapRouteManeuver : aliased constant Windows.IID := (2813002891, 42716, 24140, (147, 33, 113, 176, 228, 101, 223, 232 ));
   
   type IIterator_IMapRouteManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapRouteManeuver_Interface
      ; RetVal : access Windows.Services.Maps.IMapRouteManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapRouteManeuver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapRouteManeuver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapRouteManeuver_Interface
      ; items : Windows.Services.Maps.IMapRouteManeuver_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapRouteManeuver : aliased constant Windows.IID := (3733984763, 37335, 21870, (187, 77, 32, 11, 111, 88, 250, 212 ));
   
   type IIterable_IMapRouteManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapRouteManeuver_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IMapRouteManeuver
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapRouteManeuver : aliased constant Windows.IID := (2750768789, 18063, 21999, (177, 132, 201, 139, 76, 199, 228, 132 ));
   
   type IVectorView_IMapRouteManeuver_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapRouteManeuver_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IMapRouteManeuver
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapRouteManeuver_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapRouteManeuver_Interface
      ; value : Windows.Services.Maps.IMapRouteManeuver
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapRouteManeuver_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.IMapRouteManeuver_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapRouteLeg : aliased constant Windows.IID := (3709593554, 56930, 22354, (178, 224, 162, 176, 135, 35, 183, 135 ));
   
   type IIterator_IMapRouteLeg_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapRouteLeg_Interface
      ; RetVal : access Windows.Services.Maps.IMapRouteLeg
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapRouteLeg_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapRouteLeg_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapRouteLeg_Interface
      ; items : Windows.Services.Maps.IMapRouteLeg_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapRouteLeg : aliased constant Windows.IID := (2415495001, 30925, 22248, (135, 123, 131, 206, 132, 109, 111, 139 ));
   
   type IIterable_IMapRouteLeg_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapRouteLeg_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IMapRouteLeg
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapRouteLeg : aliased constant Windows.IID := (4187448160, 46000, 23176, (177, 182, 244, 51, 155, 184, 91, 240 ));
   
   type IVectorView_IMapRouteLeg_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapRouteLeg_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IMapRouteLeg
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapRouteLeg_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapRouteLeg_Interface
      ; value : Windows.Services.Maps.IMapRouteLeg
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapRouteLeg_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.IMapRouteLeg_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMapRoute : aliased constant Windows.IID := (2548582490, 31168, 21315, (147, 209, 71, 205, 251, 85, 36, 107 ));
   
   type IIterator_IMapRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMapRoute_Interface
      ; RetVal : access Windows.Services.Maps.IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMapRoute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMapRoute_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMapRoute_Interface
      ; items : Windows.Services.Maps.IMapRoute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMapRoute : aliased constant Windows.IID := (3632947874, 3807, 21266, (151, 168, 16, 174, 174, 168, 11, 153 ));
   
   type IIterable_IMapRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMapRoute_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMapRoute : aliased constant Windows.IID := (643200681, 18995, 23849, (151, 30, 130, 68, 160, 33, 184, 78 ));
   
   type IVectorView_IMapRoute_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMapRoute_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.IMapRoute
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMapRoute_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMapRoute_Interface
      ; value : Windows.Services.Maps.IMapRoute
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMapRoute_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.IMapRoute_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMapLocationFinderResult : aliased constant Windows.IID := (3857051187, 43992, 22165, (159, 229, 172, 149, 133, 13, 113, 152 ));
   
   type IAsyncOperation_IMapLocationFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMapLocationFinderResult_Interface
      ; handler : Windows.Services.Maps.AsyncOperationCompletedHandler_IMapLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMapLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.AsyncOperationCompletedHandler_IMapLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMapLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.IMapLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMapRouteFinderResult : aliased constant Windows.IID := (3970580095, 50470, 20631, (182, 36, 207, 116, 61, 120, 169, 186 ));
   
   type IAsyncOperation_IMapRouteFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMapRouteFinderResult_Interface
      ; handler : Windows.Services.Maps.AsyncOperationCompletedHandler_IMapRouteFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMapRouteFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.AsyncOperationCompletedHandler_IMapRouteFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMapRouteFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.IMapRouteFinderResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEnhancedWaypoint : aliased constant Windows.IID := (373967905, 53408, 23912, (128, 226, 68, 136, 157, 206, 166, 213 ));
   
   type IIterator_IEnhancedWaypoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Services.Maps.IEnhancedWaypoint
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEnhancedWaypoint_Interface
      ; items : Windows.Services.Maps.IEnhancedWaypoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEnhancedWaypoint : aliased constant Windows.IID := (3495189946, 39685, 24119, (191, 192, 61, 162, 181, 29, 19, 91 ));
   
   type IIterable_IEnhancedWaypoint_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEnhancedWaypoint_Interface
      ; RetVal : access Windows.Services.Maps.IIterator_IEnhancedWaypoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMapLocationFinderResult : aliased constant Windows.IID := (651094801, 4641, 23595, (187, 249, 207, 234, 54, 99, 194, 237 ));
   
   type AsyncOperationCompletedHandler_IMapLocationFinderResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMapLocationFinderResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMapLocationFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMapRouteFinderResult : aliased constant Windows.IID := (1853500239, 33052, 21699, (137, 56, 103, 149, 244, 230, 112, 9 ));
   
   type AsyncOperationCompletedHandler_IMapRouteFinderResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMapRouteFinderResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMapRouteFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MapAddress is Windows.Services.Maps.IMapAddress;
   subtype MapLocation is Windows.Services.Maps.IMapLocation;
   subtype ManeuverWarning is Windows.Services.Maps.IManeuverWarning;
   subtype MapRouteManeuver is Windows.Services.Maps.IMapRouteManeuver;
   subtype MapRouteLeg is Windows.Services.Maps.IMapRouteLeg;
   subtype MapRoute is Windows.Services.Maps.IMapRoute;
   subtype EnhancedWaypoint is Windows.Services.Maps.IEnhancedWaypoint;
   function Create
   (
      point : Windows.Devices.Geolocation.IGeopoint
      ; kind : Windows.Services.Maps.WaypointKind
   )
   return Windows.Services.Maps.IEnhancedWaypoint;
   
   subtype MapLocationFinderResult is Windows.Services.Maps.IMapLocationFinderResult;
   subtype MapRouteFinderResult is Windows.Services.Maps.IMapRouteFinderResult;
   subtype MapRouteDrivingOptions is Windows.Services.Maps.IMapRouteDrivingOptions;
   function CreateMapRouteDrivingOptions return Windows.Services.Maps.IMapRouteDrivingOptions;
   
   subtype PlaceInfo is Windows.Services.Maps.IPlaceInfo;
   subtype PlaceInfoCreateOptions is Windows.Services.Maps.IPlaceInfoCreateOptions;
   function CreatePlaceInfoCreateOptions return Windows.Services.Maps.IPlaceInfoCreateOptions;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateFromAddress
   (
      displayAddress : Windows.String
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function CreateFromAddressWithName
   (
      displayAddress : Windows.String
      ; displayName : Windows.String
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function Create
   (
      referencePoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function CreateWithGeopointAndOptions
   (
      referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function CreateFromIdentifier
   (
      identifier : Windows.String
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function CreateFromIdentifierWithOptions
   (
      identifier : Windows.String
      ; defaultPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function CreateFromMapLocation
   (
      location : Windows.Services.Maps.IMapLocation
   )
   return Windows.Services.Maps.IPlaceInfo;
   
   function get_IsShowSupported
   return Windows.Boolean;
   
   function FindLocationsAtAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   
   function FindLocationsAsync
   (
      searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   
   function FindLocationsWithMaxCountAsync
   (
      searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; maxCount : Windows.UInt32
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   
   function FindLocationsAtWithAccuracyAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
      ; accuracy : Windows.Services.Maps.MapLocationDesiredAccuracy
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   
   function GetDrivingRouteFromEnhancedWaypointsAsync
   (
      waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync
   (
      waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteWithOptionsAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteWithOptimizationAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteWithOptimizationAndRestrictionsAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteFromWaypointsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteFromWaypointsAndOptimizationAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetWalkingRouteAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   function GetWalkingRouteFromWaypointsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   
   procedure put_ServiceToken
   (
      value : Windows.String
   )
   ;
   
   function get_ServiceToken
   return Windows.String;
   
   function get_WorldViewRegionCode
   return Windows.String;
   
   procedure put_DataUsagePreference
   (
      value : Windows.Services.Maps.MapServiceDataUsagePreference
   )
   ;
   
   function get_DataUsagePreference
   return Windows.Services.Maps.MapServiceDataUsagePreference;
   
   function get_DataAttributions
   return Windows.String;
   
   procedure ShowDownloadedMapsUI
   ;
   
   procedure ShowMapsUpdateUI
   ;
   
end;
