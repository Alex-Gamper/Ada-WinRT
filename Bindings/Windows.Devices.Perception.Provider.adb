--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Devices.Perception;
with Windows.Graphics.Imaging;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Perception.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access PerceptionStartFaceAuthenticationHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_PerceptionStartFaceAuthenticationHandler or riid.all = IID_IUnknown then
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
      This       : access PerceptionStartFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup(sender));
      return Hr;
   end;
   
   function QueryInterface(This : access PerceptionStopFaceAuthenticationHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_PerceptionStopFaceAuthenticationHandler or riid.all = IID_IUnknown then
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
      This       : access PerceptionStopFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup(sender));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreatePerceptionFrameProviderInfo return Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFrameProviderInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Perception.Provider.IID_IPerceptionFrameProviderInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
      ; startHandler : Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
      ; stopHandler : Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
   )
   return Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionFaceAuthenticationGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionFaceAuthenticationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(ids, startHandler, stopHandler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Perception.Provider.IPerceptionControlGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionControlGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionControlGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionControlGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(ids, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      relativeLocations : Windows.Devices.Perception.Provider.IIterable_IPerceptionCorrelation
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionCorrelationGroup");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionCorrelationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(relativeLocations, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      targetId : Windows.String
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionCorrelation");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionCorrelation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionCorrelationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(targetId, position, orientation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      maxOutstandingFrameCountForWrite : Windows.UInt32
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; resolution : Windows.Foundation.Size
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.Provider.PerceptionVideoFrameAllocator");
      m_Factory     : Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionVideoFrameAllocatorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(maxOutstandingFrameCountForWrite, format, resolution, alpha, RetVal'Access);
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
   

end;
