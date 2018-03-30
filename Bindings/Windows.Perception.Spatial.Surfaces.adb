--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Graphics.DirectX;
with Windows.Storage.Streams;
with Windows.Perception.Spatial;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Perception.Spatial.Surfaces is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpatialSurfaceMesh or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface
      ; asyncInfo : Windows.Perception.Spatial.Surfaces.IAsyncOperation_ISpatialSurfaceMesh
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface
      ; sender : Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateSpatialSurfaceMeshOptions return Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Perception.Spatial.Surfaces.IID_ISpatialSurfaceMeshOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSpatialSurfaceObserver return Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Perception.Spatial.Surfaces.IID_ISpatialSurfaceObserver'Access, RetVal'Address);
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
   
   
   function get_SupportedVertexPositionFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions");
      m_Factory     : ISpatialSurfaceMeshOptionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialSurfaceMeshOptionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedVertexPositionFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedTriangleIndexFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions");
      m_Factory     : ISpatialSurfaceMeshOptionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialSurfaceMeshOptionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedTriangleIndexFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedVertexNormalFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions");
      m_Factory     : ISpatialSurfaceMeshOptionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialSurfaceMeshOptionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedVertexNormalFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver");
      m_Factory     : ISpatialSurfaceObserverStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialSurfaceObserverStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver");
      m_Factory     : ISpatialSurfaceObserverStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialSurfaceObserverStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
