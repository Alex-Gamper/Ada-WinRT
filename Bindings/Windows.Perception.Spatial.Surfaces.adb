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
with Windows.Graphics.DirectX;
with Windows.Storage.Streams;
with Windows.Perception.Spatial;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Perception.Spatial.Surfaces is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
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
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Perception.Spatial.Surfaces.IID_ISpatialSurfaceMeshOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSpatialSurfaceObserver return Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.Surfaces.SpatialSurfaceObserver");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Perception.Spatial.Surfaces.IID_ISpatialSurfaceObserver'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
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
