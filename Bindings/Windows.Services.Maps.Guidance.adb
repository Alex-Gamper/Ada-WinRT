--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
with Windows.UI;
with Windows.Devices.Geolocation;
with Windows.Services.Maps;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Services.Maps.Guidance is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), Windows.Services.Maps.Guidance.IGuidanceUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceReroutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), Windows.Services.Maps.Guidance.IGuidanceReroutedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface
      ; sender : Windows.Services.Maps.Guidance.IGuidanceNavigator
      ; args : Windows.Services.Maps.Guidance.IGuidanceAudioNotificationRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.Guidance.IGuidanceNavigator(sender), Windows.Services.Maps.Guidance.IGuidanceAudioNotificationRequestedEventArgs(args));
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
   
   function CanCreateFromMapRoute
   (
      mapRoute : Windows.Services.Maps.IMapRoute
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.Guidance.GuidanceRoute");
      m_Factory     : IGuidanceRouteStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGuidanceRouteStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CanCreateFromMapRoute(mapRoute, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateFromMapRoute
   (
      mapRoute : Windows.Services.Maps.IMapRoute
   )
   return Windows.Services.Maps.Guidance.IGuidanceRoute is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.Guidance.GuidanceRoute");
      m_Factory     : IGuidanceRouteStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.Guidance.IGuidanceRoute;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGuidanceRouteStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateFromMapRoute(mapRoute, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrent
   return Windows.Services.Maps.Guidance.IGuidanceNavigator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.Guidance.GuidanceNavigator");
      m_Factory     : IGuidanceNavigatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.Guidance.IGuidanceNavigator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGuidanceNavigatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UseAppProvidedVoice
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.Guidance.GuidanceNavigator");
      m_Factory     : IGuidanceNavigatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGuidanceNavigatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UseAppProvidedVoice(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrent
   return Windows.Services.Maps.Guidance.IGuidanceTelemetryCollector is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.Guidance.GuidanceTelemetryCollector");
      m_Factory     : IGuidanceTelemetryCollectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.Guidance.IGuidanceTelemetryCollector;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGuidanceTelemetryCollectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
