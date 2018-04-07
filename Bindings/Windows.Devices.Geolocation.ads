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
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Devices.Geolocation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PositionAccuracy is (
      Default,
      High
   );
   for PositionAccuracy use (
      Default => 0,
      High => 1
   );
   for PositionAccuracy'Size use 32;
   
   type PositionAccuracy_Ptr is access PositionAccuracy;
   
   type PositionStatus is (
      Ready,
      Initializing,
      NoData,
      Disabled,
      NotInitialized,
      NotAvailable
   );
   for PositionStatus use (
      Ready => 0,
      Initializing => 1,
      NoData => 2,
      Disabled => 3,
      NotInitialized => 4,
      NotAvailable => 5
   );
   for PositionStatus'Size use 32;
   
   type PositionStatus_Ptr is access PositionStatus;
   
   type PositionSource is (
      Cellular,
      Satellite,
      WiFi,
      IPAddress,
      Unknown,
      Default,
      Obfuscated
   );
   for PositionSource use (
      Cellular => 0,
      Satellite => 1,
      WiFi => 2,
      IPAddress => 3,
      Unknown => 4,
      Default => 5,
      Obfuscated => 6
   );
   for PositionSource'Size use 32;
   
   type PositionSource_Ptr is access PositionSource;
   
   type GeoshapeType is (
      Geopoint_x,
      Geocircle_x,
      Geopath_x,
      GeoboundingBox_x
   );
   for GeoshapeType use (
      Geopoint_x => 0,
      Geocircle_x => 1,
      Geopath_x => 2,
      GeoboundingBox_x => 3
   );
   for GeoshapeType'Size use 32;
   
   type GeoshapeType_Ptr is access GeoshapeType;
   
   type AltitudeReferenceSystem is (
      Unspecified,
      Terrain,
      Ellipsoid,
      Geoid,
      Surface
   );
   for AltitudeReferenceSystem use (
      Unspecified => 0,
      Terrain => 1,
      Ellipsoid => 2,
      Geoid => 3,
      Surface => 4
   );
   for AltitudeReferenceSystem'Size use 32;
   
   type AltitudeReferenceSystem_Ptr is access AltitudeReferenceSystem;
   
   type GeolocationAccessStatus is (
      Unspecified,
      Allowed,
      Denied
   );
   for GeolocationAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      Denied => 2
   );
   for GeolocationAccessStatus'Size use 32;
   
   type GeolocationAccessStatus_Ptr is access GeolocationAccessStatus;
   
   type VisitMonitoringScope is (
      Venue,
      City
   );
   for VisitMonitoringScope use (
      Venue => 0,
      City => 1
   );
   for VisitMonitoringScope'Size use 32;
   
   type VisitMonitoringScope_Ptr is access VisitMonitoringScope;
   
   type VisitStateChange is (
      TrackingLost,
      Arrived,
      Departed,
      OtherMovement
   );
   for VisitStateChange use (
      TrackingLost => 0,
      Arrived => 1,
      Departed => 2,
      OtherMovement => 3
   );
   for VisitStateChange'Size use 32;
   
   type VisitStateChange_Ptr is access VisitStateChange;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type BasicGeoposition is record
      Latitude : Windows.Double;
      Longitude : Windows.Double;
      Altitude : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , BasicGeoposition);
   
   type BasicGeoposition_Ptr is access BasicGeoposition;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IGeopoint_Interface;
   type AsyncOperationCompletedHandler_IGeopoint is access all AsyncOperationCompletedHandler_IGeopoint_Interface'Class;
   type AsyncOperationCompletedHandler_IGeopoint_Ptr is access all AsyncOperationCompletedHandler_IGeopoint;
   type AsyncOperationCompletedHandler_IGeoposition_Interface;
   type AsyncOperationCompletedHandler_IGeoposition is access all AsyncOperationCompletedHandler_IGeoposition_Interface'Class;
   type AsyncOperationCompletedHandler_IGeoposition_Ptr is access all AsyncOperationCompletedHandler_IGeoposition;
   type TypedEventHandler_IGeolocator_add_PositionChanged_Interface;
   type TypedEventHandler_IGeolocator_add_PositionChanged is access all TypedEventHandler_IGeolocator_add_PositionChanged_Interface'Class;
   type TypedEventHandler_IGeolocator_add_PositionChanged_Ptr is access all TypedEventHandler_IGeolocator_add_PositionChanged;
   type TypedEventHandler_IGeolocator_add_StatusChanged_Interface;
   type TypedEventHandler_IGeolocator_add_StatusChanged is access all TypedEventHandler_IGeolocator_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IGeolocator_add_StatusChanged_Ptr is access all TypedEventHandler_IGeolocator_add_StatusChanged;
   type AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface;
   type AsyncOperationCompletedHandler_GeolocationAccessStatus is access all AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_GeolocationAccessStatus_Ptr is access all AsyncOperationCompletedHandler_GeolocationAccessStatus;
   type TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface;
   type TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged is access all TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface'Class;
   type TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Ptr is access all TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged;
   type AsyncOperationCompletedHandler_IGeovisit_Interface;
   type AsyncOperationCompletedHandler_IGeovisit is access all AsyncOperationCompletedHandler_IGeovisit_Interface'Class;
   type AsyncOperationCompletedHandler_IGeovisit_Ptr is access all AsyncOperationCompletedHandler_IGeovisit;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGeoshape_Interface;
   type IGeoshape is access all IGeoshape_Interface'Class;
   type IGeoshape_Ptr is access all IGeoshape;
   type IGeopoint_Interface;
   type IGeopoint is access all IGeopoint_Interface'Class;
   type IGeopoint_Ptr is access all IGeopoint;
   type IGeopointFactory_Interface;
   type IGeopointFactory is access all IGeopointFactory_Interface'Class;
   type IGeopointFactory_Ptr is access all IGeopointFactory;
   type IGeopath_Interface;
   type IGeopath is access all IGeopath_Interface'Class;
   type IGeopath_Ptr is access all IGeopath;
   type IGeopathFactory_Interface;
   type IGeopathFactory is access all IGeopathFactory_Interface'Class;
   type IGeopathFactory_Ptr is access all IGeopathFactory;
   type IGeoboundingBox_Interface;
   type IGeoboundingBox is access all IGeoboundingBox_Interface'Class;
   type IGeoboundingBox_Ptr is access all IGeoboundingBox;
   type IGeoboundingBoxFactory_Interface;
   type IGeoboundingBoxFactory is access all IGeoboundingBoxFactory_Interface'Class;
   type IGeoboundingBoxFactory_Ptr is access all IGeoboundingBoxFactory;
   type IGeoboundingBoxStatics_Interface;
   type IGeoboundingBoxStatics is access all IGeoboundingBoxStatics_Interface'Class;
   type IGeoboundingBoxStatics_Ptr is access all IGeoboundingBoxStatics;
   type IGeocoordinateSatelliteData_Interface;
   type IGeocoordinateSatelliteData is access all IGeocoordinateSatelliteData_Interface'Class;
   type IGeocoordinateSatelliteData_Ptr is access all IGeocoordinateSatelliteData;
   type IVenueData_Interface;
   type IVenueData is access all IVenueData_Interface'Class;
   type IVenueData_Ptr is access all IVenueData;
   type IGeocoordinate_Interface;
   type IGeocoordinate is access all IGeocoordinate_Interface'Class;
   type IGeocoordinate_Ptr is access all IGeocoordinate;
   type IGeocoordinateWithPositionData_Interface;
   type IGeocoordinateWithPositionData is access all IGeocoordinateWithPositionData_Interface'Class;
   type IGeocoordinateWithPositionData_Ptr is access all IGeocoordinateWithPositionData;
   type IGeocoordinateWithPoint_Interface;
   type IGeocoordinateWithPoint is access all IGeocoordinateWithPoint_Interface'Class;
   type IGeocoordinateWithPoint_Ptr is access all IGeocoordinateWithPoint;
   type IGeocoordinateWithPositionSourceTimestamp_Interface;
   type IGeocoordinateWithPositionSourceTimestamp is access all IGeocoordinateWithPositionSourceTimestamp_Interface'Class;
   type IGeocoordinateWithPositionSourceTimestamp_Ptr is access all IGeocoordinateWithPositionSourceTimestamp;
   type IGeoposition_Interface;
   type IGeoposition is access all IGeoposition_Interface'Class;
   type IGeoposition_Ptr is access all IGeoposition;
   type IGeoposition2_Interface;
   type IGeoposition2 is access all IGeoposition2_Interface'Class;
   type IGeoposition2_Ptr is access all IGeoposition2;
   type ICivicAddress_Interface;
   type ICivicAddress is access all ICivicAddress_Interface'Class;
   type ICivicAddress_Ptr is access all ICivicAddress;
   type IPositionChangedEventArgs_Interface;
   type IPositionChangedEventArgs is access all IPositionChangedEventArgs_Interface'Class;
   type IPositionChangedEventArgs_Ptr is access all IPositionChangedEventArgs;
   type IStatusChangedEventArgs_Interface;
   type IStatusChangedEventArgs is access all IStatusChangedEventArgs_Interface'Class;
   type IStatusChangedEventArgs_Ptr is access all IStatusChangedEventArgs;
   type IGeolocator_Interface;
   type IGeolocator is access all IGeolocator_Interface'Class;
   type IGeolocator_Ptr is access all IGeolocator;
   type IGeolocatorWithScalarAccuracy_Interface;
   type IGeolocatorWithScalarAccuracy is access all IGeolocatorWithScalarAccuracy_Interface'Class;
   type IGeolocatorWithScalarAccuracy_Ptr is access all IGeolocatorWithScalarAccuracy;
   type IGeolocator2_Interface;
   type IGeolocator2 is access all IGeolocator2_Interface'Class;
   type IGeolocator2_Ptr is access all IGeolocator2;
   type IGeolocatorStatics_Interface;
   type IGeolocatorStatics is access all IGeolocatorStatics_Interface'Class;
   type IGeolocatorStatics_Ptr is access all IGeolocatorStatics;
   type IGeolocatorStatics2_Interface;
   type IGeolocatorStatics2 is access all IGeolocatorStatics2_Interface'Class;
   type IGeolocatorStatics2_Ptr is access all IGeolocatorStatics2;
   type IGeocircle_Interface;
   type IGeocircle is access all IGeocircle_Interface'Class;
   type IGeocircle_Ptr is access all IGeocircle;
   type IGeocircleFactory_Interface;
   type IGeocircleFactory is access all IGeocircleFactory_Interface'Class;
   type IGeocircleFactory_Ptr is access all IGeocircleFactory;
   type IGeovisit_Interface;
   type IGeovisit is access all IGeovisit_Interface'Class;
   type IGeovisit_Ptr is access all IGeovisit;
   type IGeovisitStateChangedEventArgs_Interface;
   type IGeovisitStateChangedEventArgs is access all IGeovisitStateChangedEventArgs_Interface'Class;
   type IGeovisitStateChangedEventArgs_Ptr is access all IGeovisitStateChangedEventArgs;
   type IGeovisitMonitor_Interface;
   type IGeovisitMonitor is access all IGeovisitMonitor_Interface'Class;
   type IGeovisitMonitor_Ptr is access all IGeovisitMonitor;
   type IGeovisitMonitorStatics_Interface;
   type IGeovisitMonitorStatics is access all IGeovisitMonitorStatics_Interface'Class;
   type IGeovisitMonitorStatics_Ptr is access all IGeovisitMonitorStatics;
   type IGeovisitTriggerDetails_Interface;
   type IGeovisitTriggerDetails is access all IGeovisitTriggerDetails_Interface'Class;
   type IGeovisitTriggerDetails_Ptr is access all IGeovisitTriggerDetails;
   type IAsyncOperation_IGeopoint_Interface;
   type IAsyncOperation_IGeopoint is access all IAsyncOperation_IGeopoint_Interface'Class;
   type IAsyncOperation_IGeopoint_Ptr is access all IAsyncOperation_IGeopoint;
   type IIterator_BasicGeoposition_Interface;
   type IIterator_BasicGeoposition is access all IIterator_BasicGeoposition_Interface'Class;
   type IIterator_BasicGeoposition_Ptr is access all IIterator_BasicGeoposition;
   type IIterable_BasicGeoposition_Interface;
   type IIterable_BasicGeoposition is access all IIterable_BasicGeoposition_Interface'Class;
   type IIterable_BasicGeoposition_Ptr is access all IIterable_BasicGeoposition;
   type IVectorView_BasicGeoposition_Interface;
   type IVectorView_BasicGeoposition is access all IVectorView_BasicGeoposition_Interface'Class;
   type IVectorView_BasicGeoposition_Ptr is access all IVectorView_BasicGeoposition;
   type IAsyncOperation_IGeoposition_Interface;
   type IAsyncOperation_IGeoposition is access all IAsyncOperation_IGeoposition_Interface'Class;
   type IAsyncOperation_IGeoposition_Ptr is access all IAsyncOperation_IGeoposition;
   type IAsyncOperation_GeolocationAccessStatus_Interface;
   type IAsyncOperation_GeolocationAccessStatus is access all IAsyncOperation_GeolocationAccessStatus_Interface'Class;
   type IAsyncOperation_GeolocationAccessStatus_Ptr is access all IAsyncOperation_GeolocationAccessStatus;
   type IReference_BasicGeoposition_Interface;
   type IReference_BasicGeoposition is access all IReference_BasicGeoposition_Interface'Class;
   type IReference_BasicGeoposition_Ptr is access all IReference_BasicGeoposition;
   type IAsyncOperation_IGeovisit_Interface;
   type IAsyncOperation_IGeovisit is access all IAsyncOperation_IGeovisit_Interface'Class;
   type IAsyncOperation_IGeovisit_Ptr is access all IAsyncOperation_IGeovisit;
   type IIterator_IGeovisit_Interface;
   type IIterator_IGeovisit is access all IIterator_IGeovisit_Interface'Class;
   type IIterator_IGeovisit_Ptr is access all IIterator_IGeovisit;
   type IIterable_IGeovisit_Interface;
   type IIterable_IGeovisit is access all IIterable_IGeovisit_Interface'Class;
   type IIterable_IGeovisit_Ptr is access all IIterable_IGeovisit;
   type IVectorView_IGeovisit_Interface;
   type IVectorView_IGeovisit is access all IVectorView_IGeovisit_Interface'Class;
   type IVectorView_IGeovisit_Ptr is access all IVectorView_IGeovisit;
   type IIterator_IGeopoint_Interface;
   type IIterator_IGeopoint is access all IIterator_IGeopoint_Interface'Class;
   type IIterator_IGeopoint_Ptr is access all IIterator_IGeopoint;
   type IIterable_IGeopoint_Interface;
   type IIterable_IGeopoint is access all IIterable_IGeopoint_Interface'Class;
   type IIterable_IGeopoint_Ptr is access all IIterable_IGeopoint;
   type IIterator_IGeopath_Interface;
   type IIterator_IGeopath is access all IIterator_IGeopath_Interface'Class;
   type IIterator_IGeopath_Ptr is access all IIterator_IGeopath;
   type IIterable_IGeopath_Interface;
   type IIterable_IGeopath is access all IIterable_IGeopath_Interface'Class;
   type IIterable_IGeopath_Ptr is access all IIterable_IGeopath;
   type IVectorView_IGeopath_Interface;
   type IVectorView_IGeopath is access all IVectorView_IGeopath_Interface'Class;
   type IVectorView_IGeopath_Ptr is access all IVectorView_IGeopath;
   type IVector_IGeopath_Interface;
   type IVector_IGeopath is access all IVector_IGeopath_Interface'Class;
   type IVector_IGeopath_Ptr is access all IVector_IGeopath;
   
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
   type IGeoshape_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GeoshapeType
   (
      This       : access IGeoshape_Interface
      ; RetVal : access Windows.Devices.Geolocation.GeoshapeType
   )
   return Windows.HRESULT is abstract;
   
   function get_SpatialReferenceId
   (
      This       : access IGeoshape_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AltitudeReferenceSystem
   (
      This       : access IGeoshape_Interface
      ; RetVal : access Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoshape : aliased constant Windows.IID := (3382485679, 50985, 17345, (143, 171, 214, 222, 201, 20, 223, 126 ));
   
   ------------------------------------------------------------------------
   type IGeopoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IGeopoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeopoint : aliased constant Windows.IID := (1811546347, 58734, 18875, (156, 175, 203, 170, 120, 168, 188, 239 ));
   
   ------------------------------------------------------------------------
   type IGeopointFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGeopointFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceSystem
   (
      This       : access IGeopointFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      This       : access IGeopointFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeopointFactory : aliased constant Windows.IID := (3681258803, 30397, 20016, (138, 247, 168, 68, 220, 55, 183, 160 ));
   
   ------------------------------------------------------------------------
   type IGeopath_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Positions
   (
      This       : access IGeopath_Interface
      ; RetVal : access Windows.Devices.Geolocation.IVectorView_BasicGeoposition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeopath : aliased constant Windows.IID := (3846166457, 11684, 18196, (166, 82, 222, 133, 147, 40, 152, 152 ));
   
   ------------------------------------------------------------------------
   type IGeopathFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGeopathFactory_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReference
   (
      This       : access IGeopathFactory_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      This       : access IGeopathFactory_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeopathFactory : aliased constant Windows.IID := (666806728, 51175, 17241, (155, 155, 252, 163, 224, 94, 245, 147 ));
   
   ------------------------------------------------------------------------
   type IGeoboundingBox_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NorthwestCorner
   (
      This       : access IGeoboundingBox_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_SoutheastCorner
   (
      This       : access IGeoboundingBox_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_Center
   (
      This       : access IGeoboundingBox_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_MinAltitude
   (
      This       : access IGeoboundingBox_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAltitude
   (
      This       : access IGeoboundingBox_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoboundingBox : aliased constant Windows.IID := (144099339, 10063, 17370, (154, 6, 203, 252, 218, 235, 78, 194 ));
   
   ------------------------------------------------------------------------
   type IGeoboundingBoxFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGeoboundingBoxFactory_Interface
      ; northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReference
   (
      This       : access IGeoboundingBoxFactory_Interface
      ; northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      This       : access IGeoboundingBoxFactory_Interface
      ; northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoboundingBoxFactory : aliased constant Windows.IID := (1308337545, 1041, 19132, (179, 181, 91, 188, 203, 87, 217, 140 ));
   
   ------------------------------------------------------------------------
   type IGeoboundingBoxStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCompute
   (
      This       : access IGeoboundingBoxStatics_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function TryComputeWithAltitudeReference
   (
      This       : access IGeoboundingBoxStatics_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   function TryComputeWithAltitudeReferenceAndSpatialReference
   (
      This       : access IGeoboundingBoxStatics_Interface
      ; positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoboundingBoxStatics : aliased constant Windows.IID := (1740113672, 58906, 19664, (132, 27, 147, 35, 55, 146, 181, 202 ));
   
   ------------------------------------------------------------------------
   type IGeocoordinateSatelliteData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionDilutionOfPrecision
   (
      This       : access IGeocoordinateSatelliteData_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalDilutionOfPrecision
   (
      This       : access IGeocoordinateSatelliteData_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalDilutionOfPrecision
   (
      This       : access IGeocoordinateSatelliteData_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocoordinateSatelliteData : aliased constant Windows.IID := (3274339545, 9736, 18252, (145, 44, 6, 221, 73, 15, 74, 247 ));
   
   ------------------------------------------------------------------------
   type IVenueData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IVenueData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Level
   (
      This       : access IVenueData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IVenueData : aliased constant Windows.IID := (1727238535, 24803, 19247, (181, 39, 79, 83, 241, 195, 198, 119 ));
   
   ------------------------------------------------------------------------
   type IGeocoordinate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Latitude
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Longitude
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Altitude
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Accuracy
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AltitudeAccuracy
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Heading
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Speed
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IGeocoordinate_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocoordinate : aliased constant Windows.IID := (3995181994, 38762, 19568, (128, 61, 8, 62, 165, 91, 203, 196 ));
   
   ------------------------------------------------------------------------
   type IGeocoordinateWithPositionData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionSource
   (
      This       : access IGeocoordinateWithPositionData_Interface
      ; RetVal : access Windows.Devices.Geolocation.PositionSource
   )
   return Windows.HRESULT is abstract;
   
   function get_SatelliteData
   (
      This       : access IGeocoordinateWithPositionData_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeocoordinateSatelliteData
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocoordinateWithPositionData : aliased constant Windows.IID := (2514891966, 56278, 16556, (184, 242, 166, 92, 3, 64, 217, 166 ));
   
   ------------------------------------------------------------------------
   type IGeocoordinateWithPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Point
   (
      This       : access IGeocoordinateWithPoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocoordinateWithPoint : aliased constant Windows.IID := (4276749605, 53804, 19782, (181, 39, 11, 150, 6, 111, 199, 219 ));
   
   ------------------------------------------------------------------------
   type IGeocoordinateWithPositionSourceTimestamp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionSourceTimestamp
   (
      This       : access IGeocoordinateWithPositionSourceTimestamp_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocoordinateWithPositionSourceTimestamp : aliased constant Windows.IID := (2235825154, 51697, 17936, (175, 224, 139, 195, 166, 168, 112, 54 ));
   
   ------------------------------------------------------------------------
   type IGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Coordinate
   (
      This       : access IGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeocoordinate
   )
   return Windows.HRESULT is abstract;
   
   function get_CivicAddress
   (
      This       : access IGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.ICivicAddress
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoposition : aliased constant Windows.IID := (3247244372, 32065, 20471, (169, 87, 157, 255, 180, 239, 127, 91 ));
   
   ------------------------------------------------------------------------
   type IGeoposition2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VenueData
   (
      This       : access IGeoposition2_Interface
      ; RetVal : access Windows.Devices.Geolocation.IVenueData
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeoposition2 : aliased constant Windows.IID := (2137192087, 34417, 19213, (134, 248, 71, 74, 132, 150, 24, 124 ));
   
   ------------------------------------------------------------------------
   type ICivicAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Country
   (
      This       : access ICivicAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access ICivicAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_City
   (
      This       : access ICivicAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostalCode
   (
      This       : access ICivicAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ICivicAddress_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_ICivicAddress : aliased constant Windows.IID := (2824239642, 25844, 19784, (188, 234, 246, 176, 8, 236, 163, 76 ));
   
   ------------------------------------------------------------------------
   type IPositionChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IPositionChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IPositionChangedEventArgs : aliased constant Windows.IID := (931503333, 40222, 18117, (191, 59, 106, 216, 202, 193, 160, 147 ));
   
   ------------------------------------------------------------------------
   type IStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.PositionStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IStatusChangedEventArgs : aliased constant Windows.IID := (877908698, 35987, 16657, (162, 5, 154, 236, 252, 155, 229, 192 ));
   
   ------------------------------------------------------------------------
   type IGeolocator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredAccuracy
   (
      This       : access IGeolocator_Interface
      ; RetVal : access Windows.Devices.Geolocation.PositionAccuracy
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredAccuracy
   (
      This       : access IGeolocator_Interface
      ; value : Windows.Devices.Geolocation.PositionAccuracy
   )
   return Windows.HRESULT is abstract;
   
   function get_MovementThreshold
   (
      This       : access IGeolocator_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MovementThreshold
   (
      This       : access IGeolocator_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IGeolocator_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IGeolocator_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationStatus
   (
      This       : access IGeolocator_Interface
      ; RetVal : access Windows.Devices.Geolocation.PositionStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetGeopositionAsync
   (
      This       : access IGeolocator_Interface
      ; RetVal : access Windows.Devices.Geolocation.IAsyncOperation_IGeoposition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGeopositionAsyncWithAgeAndTimeout
   (
      This       : access IGeolocator_Interface
      ; maximumAge : Windows.Foundation.TimeSpan
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Devices.Geolocation.IAsyncOperation_IGeoposition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_PositionChanged
   (
      This       : access IGeolocator_Interface
      ; handler : TypedEventHandler_IGeolocator_add_PositionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PositionChanged
   (
      This       : access IGeolocator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IGeolocator_Interface
      ; handler : TypedEventHandler_IGeolocator_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IGeolocator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeolocator : aliased constant Windows.IID := (2848178018, 17700, 18825, (138, 169, 222, 1, 157, 46, 85, 31 ));
   
   ------------------------------------------------------------------------
   type IGeolocatorWithScalarAccuracy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredAccuracyInMeters
   (
      This       : access IGeolocatorWithScalarAccuracy_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredAccuracyInMeters
   (
      This       : access IGeolocatorWithScalarAccuracy_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeolocatorWithScalarAccuracy : aliased constant Windows.IID := (2532692929, 47119, 17930, (153, 77, 169, 108, 71, 165, 26, 164 ));
   
   ------------------------------------------------------------------------
   type IGeolocator2_Interface is interface and Windows.IInspectable_Interface;
   
   function AllowFallbackToConsentlessPositions
   (
      This       : access IGeolocator2_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeolocator2 : aliased constant Windows.IID := (3518246509, 34961, 17332, (173, 54, 39, 198, 254, 154, 151, 177 ));
   
   ------------------------------------------------------------------------
   type IGeolocatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IGeolocatorStatics_Interface
      ; RetVal : access Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGeopositionHistoryAsync
   (
      This       : access IGeolocatorStatics_Interface
      ; startTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGeopositionHistoryWithDurationAsync
   (
      This       : access IGeolocatorStatics_Interface
      ; startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeolocatorStatics : aliased constant Windows.IID := (2593027441, 11765, 17809, (159, 135, 235, 95, 216, 148, 233, 183 ));
   
   ------------------------------------------------------------------------
   type IGeolocatorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDefaultGeopositionRecommended
   (
      This       : access IGeolocatorStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultGeoposition
   (
      This       : access IGeolocatorStatics2_Interface
      ; value : Windows.Devices.Geolocation.IReference_BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultGeoposition
   (
      This       : access IGeolocatorStatics2_Interface
      ; RetVal : access Windows.Devices.Geolocation.IReference_BasicGeoposition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeolocatorStatics2 : aliased constant Windows.IID := (2570064290, 64028, 17969, (167, 29, 13, 190, 177, 37, 13, 156 ));
   
   ------------------------------------------------------------------------
   type IGeocircle_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Center
   (
      This       : access IGeocircle_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_Radius
   (
      This       : access IGeocircle_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocircle : aliased constant Windows.IID := (971266115, 43001, 20067, (146, 167, 186, 12, 40, 209, 36, 177 ));
   
   ------------------------------------------------------------------------
   type IGeocircleFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGeocircleFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; RetVal : access Windows.Devices.Geolocation.IGeocircle
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceSystem
   (
      This       : access IGeocircleFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; RetVal : access Windows.Devices.Geolocation.IGeocircle
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      This       : access IGeocircleFactory_Interface
      ; position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeocircle
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeocircleFactory : aliased constant Windows.IID := (2950058783, 29361, 20349, (135, 204, 78, 212, 201, 132, 156, 5 ));
   
   ------------------------------------------------------------------------
   type IGeovisit_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_StateChange
   (
      This       : access IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.VisitStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IGeovisit_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeovisit : aliased constant Windows.IID := (2978445942, 40694, 16811, (160, 221, 121, 62, 206, 118, 226, 222 ));
   
   ------------------------------------------------------------------------
   type IGeovisitStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Visit
   (
      This       : access IGeovisitStateChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeovisitStateChangedEventArgs : aliased constant Windows.IID := (3467956735, 35667, 18792, (190, 237, 76, 236, 208, 41, 206, 21 ));
   
   ------------------------------------------------------------------------
   type IGeovisitMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MonitoringScope
   (
      This       : access IGeovisitMonitor_Interface
      ; RetVal : access Windows.Devices.Geolocation.VisitMonitoringScope
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IGeovisitMonitor_Interface
      ; value : Windows.Devices.Geolocation.VisitMonitoringScope
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IGeovisitMonitor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_VisitStateChanged
   (
      This       : access IGeovisitMonitor_Interface
      ; handler : TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisitStateChanged
   (
      This       : access IGeovisitMonitor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeovisitMonitor : aliased constant Windows.IID := (2148633263, 22852, 17809, (131, 193, 57, 102, 71, 245, 79, 44 ));
   
   ------------------------------------------------------------------------
   type IGeovisitMonitorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetLastReportAsync
   (
      This       : access IGeovisitMonitorStatics_Interface
      ; RetVal : access Windows.Devices.Geolocation.IAsyncOperation_IGeovisit -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeovisitMonitorStatics : aliased constant Windows.IID := (3170465447, 48114, 19677, (149, 207, 85, 76, 130, 237, 251, 135 ));
   
   ------------------------------------------------------------------------
   type IGeovisitTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadReports
   (
      This       : access IGeovisitTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Geolocation.IVectorView_IGeovisit -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGeovisitTriggerDetails : aliased constant Windows.IID := (3933670814, 53705, 17739, (153, 183, 178, 248, 205, 210, 72, 47 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGeopoint_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGeopoint_Interface
      ; handler : Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGeopoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGeopoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGeopoint : aliased constant Windows.IID := (925098096, 49838, 21391, (132, 110, 15, 157, 40, 3, 16, 192 ));
   
   ------------------------------------------------------------------------
   type IIterator_BasicGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_BasicGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_BasicGeoposition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_BasicGeoposition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_BasicGeoposition_Interface
      ; items : Windows.Devices.Geolocation.BasicGeoposition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_BasicGeoposition : aliased constant Windows.IID := (458106529, 35044, 22642, (187, 45, 79, 49, 112, 8, 40, 178 ));
   
   ------------------------------------------------------------------------
   type IIterable_BasicGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_BasicGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.IIterator_BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_BasicGeoposition : aliased constant Windows.IID := (2451806632, 147, 20489, (168, 210, 248, 123, 14, 174, 117, 245 ));
   
   ------------------------------------------------------------------------
   type IVectorView_BasicGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_BasicGeoposition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_BasicGeoposition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_BasicGeoposition_Interface
      ; value : Windows.Devices.Geolocation.BasicGeoposition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_BasicGeoposition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.BasicGeoposition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_BasicGeoposition : aliased constant Windows.IID := (394221337, 57908, 23003, (153, 186, 247, 253, 221, 243, 20, 48 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGeoposition_Interface
      ; handler : Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGeoposition : aliased constant Windows.IID := (4000574704, 2461, 22501, (132, 7, 91, 50, 229, 175, 28, 196 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_GeolocationAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_GeolocationAccessStatus_Interface
      ; handler : Windows.Devices.Geolocation.AsyncOperationCompletedHandler_GeolocationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_GeolocationAccessStatus_Interface
      ; RetVal : access Windows.Devices.Geolocation.AsyncOperationCompletedHandler_GeolocationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_GeolocationAccessStatus_Interface
      ; RetVal : access Windows.Devices.Geolocation.GeolocationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_GeolocationAccessStatus : aliased constant Windows.IID := (3727369424, 46886, 22449, (167, 197, 229, 161, 57, 50, 183, 222 ));
   
   ------------------------------------------------------------------------
   type IReference_BasicGeoposition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_BasicGeoposition_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   IID_IReference_BasicGeoposition : aliased constant Windows.IID := (3839221158, 62844, 22476, (182, 127, 41, 57, 169, 1, 218, 190 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IGeovisit_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGeovisit_Interface
      ; handler : Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.AsyncOperationCompletedHandler_IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IGeovisit : aliased constant Windows.IID := (2367460618, 61369, 21568, (166, 167, 130, 10, 131, 155, 224, 123 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGeovisit_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGeovisit_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGeovisit_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGeovisit_Interface
      ; items : Windows.Devices.Geolocation.IGeovisit_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGeovisit : aliased constant Windows.IID := (4112907316, 45144, 21317, (142, 40, 62, 105, 229, 245, 144, 112 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGeovisit_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGeovisit_Interface
      ; RetVal : access Windows.Devices.Geolocation.IIterator_IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGeovisit : aliased constant Windows.IID := (3581936009, 3903, 21664, (167, 73, 96, 0, 193, 225, 46, 88 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGeovisit_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGeovisit_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeovisit
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGeovisit_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGeovisit_Interface
      ; value : Windows.Devices.Geolocation.IGeovisit
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGeovisit_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.IGeovisit_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGeovisit : aliased constant Windows.IID := (2427270633, 61918, 23463, (171, 191, 4, 162, 25, 118, 211, 98 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGeopoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGeopoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGeopoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGeopoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGeopoint_Interface
      ; items : Windows.Devices.Geolocation.IGeopoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGeopoint : aliased constant Windows.IID := (2283952953, 35817, 23555, (151, 20, 143, 22, 66, 216, 164, 63 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGeopoint_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGeopoint_Interface
      ; RetVal : access Windows.Devices.Geolocation.IIterator_IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGeopoint : aliased constant Windows.IID := (3881926601, 11463, 23505, (188, 90, 244, 114, 96, 131, 78, 216 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGeopath_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGeopath_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGeopath_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGeopath_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGeopath_Interface
      ; items : Windows.Devices.Geolocation.IGeopath_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGeopath : aliased constant Windows.IID := (3474801666, 18260, 22503, (170, 224, 105, 202, 66, 203, 216, 242 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGeopath_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGeopath_Interface
      ; RetVal : access Windows.Devices.Geolocation.IIterator_IGeopath
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGeopath : aliased constant Windows.IID := (611307453, 43137, 24206, (153, 8, 193, 185, 235, 223, 236, 120 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGeopath_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGeopath_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGeopath_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGeopath_Interface
      ; value : Windows.Devices.Geolocation.IGeopath
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGeopath_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.IGeopath_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGeopath : aliased constant Windows.IID := (2821923275, 6996, 24424, (146, 52, 74, 130, 77, 51, 227, 113 ));
   
   ------------------------------------------------------------------------
   type IVector_IGeopath_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IGeopath_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IGeopath_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IGeopath_Interface
      ; RetVal : access Windows.Devices.Geolocation.IVectorView_IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IGeopath_Interface
      ; value : Windows.Devices.Geolocation.IGeopath
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IGeopath_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IGeopath_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IGeopath_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IGeopath_Interface
      ; value : Windows.Devices.Geolocation.IGeopath
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IGeopath_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IGeopath_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IGeopath_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Geolocation.IGeopath_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IGeopath_Interface
      ; items : Windows.Devices.Geolocation.IGeopath_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IGeopath : aliased constant Windows.IID := (2091482733, 26771, 22130, (160, 199, 98, 92, 80, 144, 56, 30 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGeopoint_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeopoint ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGeopoint_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGeopoint_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeopoint
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGeopoint : aliased constant Windows.IID := (1264529248, 6577, 21862, (157, 246, 146, 164, 34, 53, 203, 249 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGeoposition_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeoposition ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGeoposition_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGeoposition_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeoposition
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGeoposition : aliased constant Windows.IID := (1986569988, 9294, 24082, (141, 203, 146, 163, 41, 158, 186, 38 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGeolocator_add_PositionChanged_Interface(Callback : access procedure (sender : Windows.Devices.Geolocation.IGeolocator ; args : Windows.Devices.Geolocation.IPositionChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGeolocator_add_PositionChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGeolocator_add_PositionChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeolocator
      ; args : Windows.Devices.Geolocation.IPositionChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGeolocator_add_PositionChanged : aliased constant Windows.IID := (3745276260, 20091, 24206, (154, 126, 19, 218, 5, 157, 236, 30 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGeolocator_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Geolocation.IGeolocator ; args : Windows.Devices.Geolocation.IStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGeolocator_add_StatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGeolocator_add_StatusChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeolocator
      ; args : Windows.Devices.Geolocation.IStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGeolocator_add_StatusChanged : aliased constant Windows.IID := (2549937538, 56939, 23763, (150, 144, 226, 236, 187, 102, 218, 77 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_GeolocationAccessStatus : aliased constant Windows.IID := (4082257043, 58823, 23432, (190, 219, 211, 230, 55, 207, 242, 113 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface(Callback : access procedure (sender : Windows.Devices.Geolocation.IGeovisitMonitor ; args : Windows.Devices.Geolocation.IGeovisitStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeovisitMonitor
      ; args : Windows.Devices.Geolocation.IGeovisitStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged : aliased constant Windows.IID := (1990968810, 61007, 21393, (155, 80, 222, 202, 93, 67, 17, 201 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IGeovisit_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeovisit ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IGeovisit_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGeovisit_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeovisit
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IGeovisit : aliased constant Windows.IID := (3116165323, 11780, 21097, (155, 3, 22, 20, 208, 192, 11, 1 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Geopoint is Windows.Devices.Geolocation.IGeopoint;
   
   function Create
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeopoint;
   
   function CreateWithAltitudeReferenceSystem
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeopoint;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeopoint;
   
   subtype Geopath is Windows.Devices.Geolocation.IGeopath;
   
   function Create
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeopath;
   
   function CreateWithAltitudeReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeopath;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeopath;
   
   subtype GeoboundingBox is Windows.Devices.Geolocation.IGeoboundingBox;
   
   function Create
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   function CreateWithAltitudeReference
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   subtype GeocoordinateSatelliteData is Windows.Devices.Geolocation.IGeocoordinateSatelliteData;
   subtype VenueData is Windows.Devices.Geolocation.IVenueData;
   subtype Geocoordinate is Windows.Devices.Geolocation.IGeocoordinate;
   subtype CivicAddress is Windows.Devices.Geolocation.ICivicAddress;
   subtype Geoposition is Windows.Devices.Geolocation.IGeoposition;
   subtype PositionChangedEventArgs is Windows.Devices.Geolocation.IPositionChangedEventArgs;
   subtype StatusChangedEventArgs is Windows.Devices.Geolocation.IStatusChangedEventArgs;
   subtype Geolocator is Windows.Devices.Geolocation.IGeolocator;
   
   function CreateGeolocator return Windows.Devices.Geolocation.IGeolocator;
   
   subtype Geocircle is Windows.Devices.Geolocation.IGeocircle;
   
   function Create
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
   )
   return Windows.Devices.Geolocation.IGeocircle;
   
   function CreateWithAltitudeReferenceSystem
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeocircle;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeocircle;
   
   subtype Geovisit is Windows.Devices.Geolocation.IGeovisit;
   subtype GeovisitStateChangedEventArgs is Windows.Devices.Geolocation.IGeovisitStateChangedEventArgs;
   subtype GeovisitMonitor is Windows.Devices.Geolocation.IGeovisitMonitor;
   
   function CreateGeovisitMonitor return Windows.Devices.Geolocation.IGeovisitMonitor;
   
   subtype GeovisitTriggerDetails is Windows.Devices.Geolocation.IGeovisitTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function TryCompute
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   function TryComputeWithAltitudeReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   function TryComputeWithAltitudeReferenceAndSpatialReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeoboundingBox;
   
   function get_IsDefaultGeopositionRecommended
   return Windows.Boolean;
   
   procedure put_DefaultGeoposition
   (
      value : Windows.Devices.Geolocation.IReference_BasicGeoposition
   )
   ;
   
   function get_DefaultGeoposition
   return Windows.Devices.Geolocation.IReference_BasicGeoposition;
   
   function RequestAccessAsync
   return Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus;
   
   function GetGeopositionHistoryAsync
   (
      startTime : Windows.Foundation.DateTime
   )
   return Windows.Address;
   
   function GetGeopositionHistoryWithDurationAsync
   (
      startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address;
   
   function GetLastReportAsync
   return Windows.Devices.Geolocation.IAsyncOperation_IGeovisit;

end;
