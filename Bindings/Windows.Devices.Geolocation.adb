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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Geolocation is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IGeopoint_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IGeopoint or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IGeopoint_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeopoint
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IGeoposition_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IGeoposition or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IGeoposition_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeoposition
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGeolocator_add_PositionChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGeolocator_add_PositionChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGeolocator_add_PositionChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeolocator
      ; args : Windows.Devices.Geolocation.IPositionChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Geolocation.IGeolocator(sender), Windows.Devices.Geolocation.IPositionChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGeolocator_add_StatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGeolocator_add_StatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGeolocator_add_StatusChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeolocator
      ; args : Windows.Devices.Geolocation.IStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Geolocation.IGeolocator(sender), Windows.Devices.Geolocation.IStatusChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_GeolocationAccessStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_GeolocationAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGeovisitMonitor_add_VisitStateChanged_Interface
      ; sender : Windows.Devices.Geolocation.IGeovisitMonitor
      ; args : Windows.Devices.Geolocation.IGeovisitStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Geolocation.IGeovisitMonitor(sender), Windows.Devices.Geolocation.IGeovisitStateChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IGeovisit_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IGeovisit or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IGeovisit_Interface
      ; asyncInfo : Windows.Devices.Geolocation.IAsyncOperation_IGeovisit
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeopoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopoint");
      m_Factory     : Windows.Devices.Geolocation.IGeopointFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopoint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopointFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(position, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceSystem
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeopoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopoint");
      m_Factory     : Windows.Devices.Geolocation.IGeopointFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopoint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopointFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceSystem(position, altitudeReferenceSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeopoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopoint");
      m_Factory     : Windows.Devices.Geolocation.IGeopointFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopoint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopointFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, altitudeReferenceSystem, spatialReferenceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeopath is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopath");
      m_Factory     : Windows.Devices.Geolocation.IGeopathFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopath := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopathFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(positions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeopath is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopath");
      m_Factory     : Windows.Devices.Geolocation.IGeopathFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopath := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopathFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReference(positions, altitudeReferenceSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeopath is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geopath");
      m_Factory     : Windows.Devices.Geolocation.IGeopathFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopath := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeopathFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceAndSpatialReference(positions, altitudeReferenceSystem, spatialReferenceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : Windows.Devices.Geolocation.IGeoboundingBoxFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(northwestCorner, southeastCorner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReference
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : Windows.Devices.Geolocation.IGeoboundingBoxFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReference(northwestCorner, southeastCorner, altitudeReferenceSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceAndSpatialReference
   (
      northwestCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; southeastCorner : Windows.Devices.Geolocation.BasicGeoposition
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : Windows.Devices.Geolocation.IGeoboundingBoxFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceAndSpatialReference(northwestCorner, southeastCorner, altitudeReferenceSystem, spatialReferenceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateGeolocator return Windows.Devices.Geolocation.IGeolocator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeolocator := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Geolocation.IID_IGeolocator'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
   )
   return Windows.Devices.Geolocation.IGeocircle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geocircle");
      m_Factory     : Windows.Devices.Geolocation.IGeocircleFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeocircle := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeocircleFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(position, radius, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceSystem
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeocircle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geocircle");
      m_Factory     : Windows.Devices.Geolocation.IGeocircleFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeocircle := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeocircleFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceSystem(position, radius, altitudeReferenceSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAltitudeReferenceSystemAndSpatialReferenceId
   (
      position : Windows.Devices.Geolocation.BasicGeoposition
      ; radius : Windows.Double
      ; altitudeReferenceSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeocircle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geocircle");
      m_Factory     : Windows.Devices.Geolocation.IGeocircleFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeocircle := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeocircleFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, radius, altitudeReferenceSystem, spatialReferenceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateGeovisitMonitor return Windows.Devices.Geolocation.IGeovisitMonitor is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeovisitMonitor");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeovisitMonitor := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Geolocation.IID_IGeovisitMonitor'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function TryCompute
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : IGeoboundingBoxStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCompute(positions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryComputeWithAltitudeReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : IGeoboundingBoxStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryComputeWithAltitudeReference(positions, altitudeRefSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryComputeWithAltitudeReferenceAndSpatialReference
   (
      positions : Windows.Devices.Geolocation.IIterable_BasicGeoposition
      ; altitudeRefSystem : Windows.Devices.Geolocation.AltitudeReferenceSystem
      ; spatialReferenceId : Windows.UInt32
   )
   return Windows.Devices.Geolocation.IGeoboundingBox is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeoboundingBox");
      m_Factory     : IGeoboundingBoxStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeoboundingBox;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeoboundingBoxStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryComputeWithAltitudeReferenceAndSpatialReference(positions, altitudeRefSystem, spatialReferenceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsDefaultGeopositionRecommended
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDefaultGeopositionRecommended(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_DefaultGeoposition
   (
      value : Windows.Devices.Geolocation.IReference_BasicGeoposition
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_DefaultGeoposition(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DefaultGeoposition
   return Windows.Devices.Geolocation.IReference_BasicGeoposition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IReference_BasicGeoposition;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultGeoposition(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IAsyncOperation_GeolocationAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetGeopositionHistoryAsync
   (
      startTime : Windows.Foundation.DateTime
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetGeopositionHistoryAsync(startTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetGeopositionHistoryWithDurationAsync
   (
      startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.Geolocator");
      m_Factory     : IGeolocatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeolocatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetGeopositionHistoryWithDurationAsync(startTime, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLastReportAsync
   return Windows.Devices.Geolocation.IAsyncOperation_IGeovisit is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Geolocation.GeovisitMonitor");
      m_Factory     : IGeovisitMonitorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IAsyncOperation_IGeovisit;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeovisitMonitorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLastReportAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
