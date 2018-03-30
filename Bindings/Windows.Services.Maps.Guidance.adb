--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
   
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_GuidanceUpdated or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_DestinationReached_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_DestinationReached or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_Rerouting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_Rerouting or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_Rerouted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_Rerouted or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_RerouteFailed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_RerouteFailed or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_UserLocationLost_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_UserLocationLost or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator_add_UserLocationRestored or riid.all = IID_IUnknown then
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
   
   function QueryInterface(This : access TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGuidanceNavigator2_add_AudioNotificationRequested or riid.all = IID_IUnknown then
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
