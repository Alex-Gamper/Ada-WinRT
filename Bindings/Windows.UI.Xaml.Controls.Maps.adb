--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Devices.Geolocation;
with Windows.Storage.Streams;
with Windows.UI.Xaml;
with Windows.UI;
with Windows.Services.Maps;
with Windows.Services.Maps.LocalSearch;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Controls.Maps is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMapModel3D_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMapModel3D or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IMapModel3D_Interface
      ; asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapScene_add_TargetCameraChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapScene_add_TargetCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapScene
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapScene(sender), Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStreetsidePanorama_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStreetsidePanorama or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStreetsidePanorama_Interface
      ; asyncInfo : Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource(sender), Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHttpMapTileDataSource_add_UriRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHttpMapTileDataSource_add_UriRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource(sender), Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ILocalMapTileDataSource_add_UriRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ILocalMapTileDataSource_add_UriRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource(sender), Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapElementsLayer_add_MapElementClick or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapElementsLayer(sender), Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapElementsLayer(sender), Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapElementsLayer_add_MapElementPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapElementsLayer(sender), Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapElementsLayer_add_MapContextRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapElementsLayer_add_MapContextRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapElementsLayer
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapElementsLayer(sender), Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_CenterChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_CenterChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_CenterChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_HeadingChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_HeadingChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_HeadingChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_LoadingStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_LoadingStatusChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_MapDoubleTapped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_MapDoubleTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_MapHolding_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_MapHolding or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_MapHolding_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_MapTapped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_MapTapped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_MapTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_PitchChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_PitchChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_PitchChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_TransformOriginChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_TransformOriginChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl_add_ZoomLevelChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl_add_ZoomLevelChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_MapElementClick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_MapElementClick or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_MapElementClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_MapElementPointerEntered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_MapElementPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_MapElementPointerExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_MapElementPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_ActualCameraChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_ActualCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_ActualCameraChanging or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_ActualCameraChanging_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_TargetCameraChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_TargetCameraChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl2_add_CustomExperienceChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl2_add_CustomExperienceChanged_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl3_add_MapRightTapped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl3_add_MapRightTapped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl3_add_MapRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControl5_add_MapContextRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControl5_add_MapContextRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControl5_add_MapContextRequested_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureClick_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper_add_BusinessLandmarkRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper_add_TransitFeatureRightTapped_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerEntered_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper2_add_BusinessLandmarkPointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMapControlDataHelper2_add_TransitFeaturePointerExited_Interface
      ; sender : Windows.UI.Xaml.Controls.Maps.IMapControl
      ; args : Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Controls.Maps.IMapControl(sender), Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateMapActualCameraChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapActualCameraChangedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapActualCameraChangedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapActualCameraChangingEventArgs return Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapActualCameraChangingEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapActualCameraChangingEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapActualCameraChangingEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapContextRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapContextRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapContextRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapContextRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapCustomExperienceChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCustomExperienceChangedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCustomExperienceChangedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapCustomExperienceChangedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementClickEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementClickEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementClickEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementPointerEnteredEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementPointerEnteredEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementPointerEnteredEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementPointerExitedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementPointerExitedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementPointerExitedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementsLayerClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayerClickEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementsLayerClickEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementsLayerClickEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementsLayerContextRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayerContextRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementsLayerContextRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementsLayerContextRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementsLayerPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayerPointerEnteredEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerEnteredEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementsLayerPointerEnteredEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementsLayerPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayerPointerExitedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementsLayerPointerExitedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementsLayerPointerExitedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapRightTappedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapRightTappedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapRightTappedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTargetCameraChangedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTargetCameraChangedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTargetCameraChangedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTargetCameraChangedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileBitmapRequestDeferral return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestDeferral is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequestDeferral");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestDeferral := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileBitmapRequestDeferral'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileBitmapRequest return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequest := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileBitmapRequest'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileBitmapRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileBitmapRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileBitmapRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileUriRequestDeferral return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestDeferral is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileUriRequestDeferral");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestDeferral := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileUriRequestDeferral'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileUriRequest return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileUriRequest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileUriRequest := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileUriRequest'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapTileUriRequestedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileUriRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileUriRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapTileUriRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithLocation
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCamera");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapCameraFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCamera := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapCameraFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithLocation(location, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithLocationAndHeading
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCamera");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapCameraFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCamera := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapCameraFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithLocationAndHeading(location, headingInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithLocationHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCamera");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapCameraFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCamera := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapCameraFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithLocationHeadingAndPitch(location, headingInDegrees, pitchInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithLocationHeadingPitchRollAndFieldOfView
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; rollInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCamera is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCamera");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapCameraFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCamera := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapCameraFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithLocationHeadingPitchRollAndFieldOfView(location, headingInDegrees, pitchInDegrees, rollInDegrees, fieldOfViewInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapInputEventArgs return Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapInputEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapInputEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapInputEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapItemsControl return Windows.UI.Xaml.Controls.Maps.IMapItemsControl is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapItemsControl");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapItemsControl := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapItemsControl'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceFromCamera
   (
      camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.UI.Xaml.Controls.Maps.IMapBillboard is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapBillboard");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapBillboardFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapBillboard := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapBillboardFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceFromCamera(camera, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElement3D return Windows.UI.Xaml.Controls.Maps.IMapElement3D is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElement3D := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElement3D'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapElementsLayer return Windows.UI.Xaml.Controls.Maps.IMapElementsLayer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElementsLayer := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapElementsLayer'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapIcon return Windows.UI.Xaml.Controls.Maps.IMapIcon is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapIcon");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapIcon := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapIcon'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapPolygon return Windows.UI.Xaml.Controls.Maps.IMapPolygon is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolygon");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapPolygon := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapPolygon'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapPolyline return Windows.UI.Xaml.Controls.Maps.IMapPolyline is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolyline");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapPolyline := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapPolyline'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithPanorama
   (
      panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
   )
   return Windows.UI.Xaml.Controls.Maps.IStreetsideExperience is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.StreetsideExperience");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IStreetsideExperienceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IStreetsideExperience := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreetsideExperienceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithPanorama(panorama, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithPanoramaHeadingPitchAndFieldOfView
   (
      panorama : Windows.UI.Xaml.Controls.Maps.IStreetsidePanorama
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
      ; fieldOfViewInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IStreetsideExperience is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.StreetsideExperience");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IStreetsideExperienceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IStreetsideExperience := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreetsideExperienceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithPanoramaHeadingPitchAndFieldOfView(panorama, headingInDegrees, pitchInDegrees, fieldOfViewInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControl return Windows.UI.Xaml.Controls.Maps.IMapControl is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControl := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControl'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlBusinessLandmarkClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkClickEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkClickEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlBusinessLandmarkClickEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlTransitFeatureClickEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeatureClickEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureClickEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlTransitFeatureClickEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlBusinessLandmarkRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkRightTappedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkRightTappedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlBusinessLandmarkRightTappedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlTransitFeatureRightTappedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeatureRightTappedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeatureRightTappedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlTransitFeatureRightTappedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlBusinessLandmarkPointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkPointerEnteredEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerEnteredEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlBusinessLandmarkPointerEnteredEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlTransitFeaturePointerEnteredEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeaturePointerEnteredEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerEnteredEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlTransitFeaturePointerEnteredEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlBusinessLandmarkPointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkPointerExitedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlBusinessLandmarkPointerExitedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlBusinessLandmarkPointerExitedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControlTransitFeaturePointerExitedEventArgs return Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeaturePointerExitedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlTransitFeaturePointerExitedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Controls.Maps.IID_IMapControlTransitFeaturePointerExitedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      map : Windows.UI.Xaml.Controls.Maps.IMapControl
   )
   return Windows.UI.Xaml.Controls.Maps.IMapControlDataHelper is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlDataHelper");
      m_Factory     : Windows.UI.Xaml.Controls.Maps.IMapControlDataHelperFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControlDataHelper := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlDataHelperFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(map, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapCustomExperience_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapCustomExperience , Windows.Address); 
   
   begin
      if riid.all = IID_IMapCustomExperience or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapCustomExperience_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapCustomExperience_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapCustomExperience_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapCustomExperience_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapCustomExperience");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapCustomExperience_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapElement_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapElement , Windows.Address); 
   
   begin
      if riid.all = IID_IMapElement or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapElement_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapElement_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapElement_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapElement_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapElement");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapElement_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_ZIndex
   (
      This       : access IMapElement_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_ZIndex
   (
      This       : access IMapElement_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Visible
   (
      This       : access IMapElement_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Visible
   (
      This       : access IMapElement_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapLayer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapLayer , Windows.Address); 
   
   begin
      if riid.all = IID_IMapLayer or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapLayer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapLayer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapLayer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapLayer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapLayer");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapLayer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_MapTabIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MapTabIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Visible
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Visible
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ZIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_ZIndex
   (
      This       : access IMapLayer_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapModel3D_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapModel3D , Windows.Address); 
   
   begin
      if riid.all = IID_IMapModel3D or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapModel3D_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapModel3D_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapModel3D_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapModel3D_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapModel3D");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapModel3D_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapTileDataSource , Windows.Address); 
   
   begin
      if riid.all = IID_IMapTileDataSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapTileDataSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMapTileSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IMapTileSource , Windows.Address); 
   
   begin
      if riid.all = IID_IMapTileSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IMapTileSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IMapTileSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IMapTileSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IMapTileSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IMapTileSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMapTileSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_DataSource
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_DataSource
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Layer
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Layer
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.MapTileLayer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_ZoomLevelRange
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Bounds
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Bounds
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_AllowOverstretch
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_AllowOverstretch
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_IsFadingEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_IsTransparencyEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_IsRetryEnabled
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ZIndex
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_ZIndex
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_TilePixelSize
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_TilePixelSize
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Visible
   (
      This       : access IMapTileSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Visible
   (
      This       : access IMapTileSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(ICustomMapTileDataSource , Windows.Address); 
   
   begin
      if riid.all = IID_ICustomMapTileDataSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ICustomMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function add_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_ICustomMapTileDataSource_add_BitmapRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_BitmapRequested
   (
      This       : access ICustomMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IHttpMapTileDataSource , Windows.Address); 
   
   begin
      if riid.all = IID_IHttpMapTileDataSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IHttpMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_UriFormatString
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_AdditionalRequestHeaders
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_AllowCaching
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_IHttpMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_UriRequested
   (
      This       : access IHttpMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(ILocalMapTileDataSource , Windows.Address); 
   
   begin
      if riid.all = IID_ILocalMapTileDataSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ILocalMapTileDataSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_UriFormatString
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; value : TypedEventHandler_ILocalMapTileDataSource_add_UriRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_UriRequested
   (
      This       : access ILocalMapTileDataSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Area
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Area(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Airport
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Airport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Cemetery
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Cemetery(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Continent
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Continent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Education
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Education(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IndigenousPeoplesReserve
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IndigenousPeoplesReserve(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Island
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Island(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Medical
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Medical(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Military
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Military(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Nautical
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Nautical(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Neighborhood
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Neighborhood(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Runway
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Runway(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sand
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sand(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShoppingCenter
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShoppingCenter(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Stadium
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Stadium(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Vegetation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Vegetation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Forest
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Forest(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GolfCourse
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GolfCourse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Park
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Park(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PlayingField
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PlayingField(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Reserve
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Reserve(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Point
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Point(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NaturalPoint
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NaturalPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Peak
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Peak(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VolcanicPeak
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VolcanicPeak(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WaterPoint
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WaterPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointOfInterest
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointOfInterest(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Business
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Business(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FoodPoint
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FoodPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PopulatedPlace
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PopulatedPlace(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Capital
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Capital(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AdminDistrictCapital
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AdminDistrictCapital(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CountryRegionCapital
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CountryRegionCapital(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RoadShield
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RoadShield(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RoadExit
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RoadExit(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Transit
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Transit(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Political
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Political(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CountryRegion
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CountryRegion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AdminDistrict
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AdminDistrict(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_District
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_District(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Structure
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Structure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Building
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Building(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EducationBuilding
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EducationBuilding(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MedicalBuilding
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MedicalBuilding(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TransitBuilding
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TransitBuilding(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Transportation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Transportation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Road
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Road(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ControlledAccessHighway
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ControlledAccessHighway(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HighSpeedRamp
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HighSpeedRamp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Highway
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Highway(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MajorRoad
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MajorRoad(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ArterialRoad
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ArterialRoad(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Street
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Street(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ramp
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ramp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UnpavedStreet
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UnpavedStreet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TollRoad
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TollRoad(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Railway
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Railway(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Trail
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Trail(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WaterRoute
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WaterRoute(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Water
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Water(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_River
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_River(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RouteLine
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RouteLine(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WalkingRoute
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WalkingRoute(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DrivingRoute
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries");
      m_Factory     : IMapStyleSheetEntriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DrivingRoute(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Disabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates");
      m_Factory     : IMapStyleSheetEntryStatesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntryStatesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Disabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hover
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates");
      m_Factory     : IMapStyleSheetEntryStatesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntryStatesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hover(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Selected
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates");
      m_Factory     : IMapStyleSheetEntryStatesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetEntryStatesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Selected(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapCustomExperience is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapCustomExperience");
      m_Factory     : IMapCustomExperienceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapCustomExperience;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapCustomExperienceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapTabIndexProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapTabIndexProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZIndexProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZIndexProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapStyleSheetEntryProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapStyleSheetEntryProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapStyleSheetEntryStateProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapStyleSheetEntryStateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TagProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TagProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement");
      m_Factory     : IMapElementFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemsSourceProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapItemsControl");
      m_Factory     : IMapItemsControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapItemsControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemsSourceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapItemsControl");
      m_Factory     : IMapItemsControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapItemsControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemTemplateProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapItemsControl");
      m_Factory     : IMapItemsControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapItemsControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemTemplateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapTabIndexProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapLayer");
      m_Factory     : IMapLayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapTabIndexProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VisibleProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapLayer");
      m_Factory     : IMapLayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZIndexProperty_IMapLayer
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapLayer");
      m_Factory     : IMapLayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZIndexProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapLayer");
      m_Factory     : IMapLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapLayer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFrom3MFAsync
   (
      source : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapModel3D");
      m_Factory     : IMapModel3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapModel3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFrom3MFAsync(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFrom3MFWithShadingOptionAsync
   (
      source : Windows.Storage.Streams.IRandomAccessStreamReference
      ; shadingOption : Windows.UI.Xaml.Controls.Maps.MapModel3DShadingOption
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapModel3D");
      m_Factory     : IMapModel3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IMapModel3D;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapModel3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFrom3MFWithShadingOptionAsync(source, shadingOption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapModel3D is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapModel3D");
      m_Factory     : IMapModel3DFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapModel3D;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapModel3DFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithMapRoute
   (
      route : Windows.Services.Maps.IMapRoute
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapRouteView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapRouteView");
      m_Factory     : IMapRouteViewFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapRouteView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteViewFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithMapRoute(route, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBoundingBox
   (
      bounds : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBoundingBox(bounds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBoundingBoxWithHeadingAndPitch
   (
      bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBoundingBoxWithHeadingAndPitch(bounds, headingInDegrees, pitchInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromCamera
   (
      camera : Windows.UI.Xaml.Controls.Maps.IMapCamera
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromCamera(camera, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocation
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocation(location, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocationWithHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocationWithHeadingAndPitch(location, headingInDegrees, pitchInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocationAndRadius
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocationAndRadius(location, radiusInMeters, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocationAndRadiusWithHeadingAndPitch
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocationAndRadiusWithHeadingAndPitch(location, radiusInMeters, headingInDegrees, pitchInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocations
   (
      locations : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocations(locations, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocationsWithHeadingAndPitch
   (
      locations : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; headingInDegrees : Windows.Double
      ; pitchInDegrees : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IMapScene is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapScene");
      m_Factory     : IMapSceneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapScene;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapSceneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocationsWithHeadingAndPitch(locations, headingInDegrees, pitchInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Aerial
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Aerial(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AerialWithOverlay
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AerialWithOverlay(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RoadLight
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RoadLight(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RoadDark
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RoadDark(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RoadHighContrastLight
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RoadHighContrastLight(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RoadHighContrastDark
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RoadHighContrastDark(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Combine
   (
      styleSheets : Windows.UI.Xaml.Controls.Maps.IIterable_IMapStyleSheet
   )
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Combine(styleSheets, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ParseFromJson
   (
      styleAsJson : Windows.String
   )
   return Windows.UI.Xaml.Controls.Maps.IMapStyleSheet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapStyleSheet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ParseFromJson(styleAsJson, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParseFromJson
   (
      styleAsJson : Windows.String
      ; styleSheet : access Windows.UI.Xaml.Controls.Maps.IMapStyleSheet
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapStyleSheet");
      m_Factory     : IMapStyleSheetStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapStyleSheetStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParseFromJson(styleAsJson, styleSheet, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileDataSource");
      m_Factory     : IMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDataSource
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDataSource(dataSource, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDataSourceAndZoomRange
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDataSourceAndZoomRange(dataSource, zoomLevelRange, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDataSourceZoomRangeAndBounds
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDataSourceZoomRangeAndBounds(dataSource, zoomLevelRange, bounds, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize
   (
      dataSource : Windows.UI.Xaml.Controls.Maps.IMapTileDataSource
      ; zoomLevelRange : Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
      ; bounds : Windows.Devices.Geolocation.IGeoboundingBox
      ; tileSizeInPixels : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IMapTileSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapTileSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize(dataSource, zoomLevelRange, bounds, tileSizeInPixels, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DataSourceProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataSourceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LayerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LayerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZoomLevelRangeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZoomLevelRangeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BoundsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BoundsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowOverstretchProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowOverstretchProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsFadingEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsFadingEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsTransparencyEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsTransparencyEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsRetryEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsRetryEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZIndexProperty_IMapTileSource
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZIndexProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TilePixelSizeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TilePixelSizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VisibleProperty_IMapTileSource
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapTileSource");
      m_Factory     : IMapTileSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapTileSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNearbyWithLocationAsync
   (
      location : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.StreetsidePanorama");
      m_Factory     : IStreetsidePanoramaStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreetsidePanoramaStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNearbyWithLocationAsync(location, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNearbyWithLocationAndRadiusAsync
   (
      location : Windows.Devices.Geolocation.IGeopoint
      ; radiusInMeters : Windows.Double
   )
   return Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.StreetsidePanorama");
      m_Factory     : IStreetsidePanoramaStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IAsyncOperation_IStreetsidePanorama;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreetsidePanoramaStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNearbyWithLocationAndRadiusAsync(location, radiusInMeters, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.CustomMapTileDataSource");
      m_Factory     : ICustomMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.ICustomMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICustomMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.HttpMapTileDataSource");
      m_Factory     : IHttpMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithUriFormatString
   (
      uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.HttpMapTileDataSource");
      m_Factory     : IHttpMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IHttpMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithUriFormatString(uriFormatString, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.LocalMapTileDataSource");
      m_Factory     : ILocalMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithUriFormatString
   (
      uriFormatString : Windows.String
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.LocalMapTileDataSource");
      m_Factory     : ILocalMapTileDataSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.ILocalMapTileDataSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalMapTileDataSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithUriFormatString(uriFormatString, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapBillboard");
      m_Factory     : IMapBillboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapBillboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NormalizedAnchorPointProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapBillboard");
      m_Factory     : IMapBillboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapBillboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NormalizedAnchorPointProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CollisionBehaviorDesiredProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapBillboard");
      m_Factory     : IMapBillboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapBillboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CollisionBehaviorDesiredProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationProperty_IMapElement3D
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      m_Factory     : IMapElement3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElement3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeadingProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      m_Factory     : IMapElement3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElement3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeadingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PitchProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      m_Factory     : IMapElement3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElement3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PitchProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RollProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      m_Factory     : IMapElement3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElement3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RollProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScaleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElement3D");
      m_Factory     : IMapElement3DStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElement3DStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScaleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapElementsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapElementsLayer");
      m_Factory     : IMapElementsLayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapElementsLayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapElementsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapIcon");
      m_Factory     : IMapIconStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapIconStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TitleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapIcon");
      m_Factory     : IMapIconStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapIconStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TitleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NormalizedAnchorPointProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapIcon");
      m_Factory     : IMapIconStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapIconStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NormalizedAnchorPointProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CollisionBehaviorDesiredProperty_IMapIcon
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapIcon");
      m_Factory     : IMapIconStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapIconStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CollisionBehaviorDesiredProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PathProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolygon");
      m_Factory     : IMapPolygonStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapPolygonStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PathProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StrokeThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolygon");
      m_Factory     : IMapPolygonStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapPolygonStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StrokeThicknessProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StrokeDashedProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolygon");
      m_Factory     : IMapPolygonStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapPolygonStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StrokeDashedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PathProperty_IMapPolyline
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolyline");
      m_Factory     : IMapPolylineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapPolylineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PathProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StrokeDashedProperty_IMapPolyline
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapPolyline");
      m_Factory     : IMapPolylineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapPolylineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StrokeDashedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CenterProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CenterProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ChildrenProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ChildrenProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColorSchemeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColorSchemeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DesiredPitchProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DesiredPitchProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeadingProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeadingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LandmarksVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LandmarksVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LoadingStatusProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LoadingStatusProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapServiceTokenProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapServiceTokenProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PedestrianFeaturesVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PedestrianFeaturesVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PitchProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PitchProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StyleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StyleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TrafficFlowVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TrafficFlowVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TransformOriginProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TransformOriginProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WatermarkModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WatermarkModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZoomLevelProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZoomLevelProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapElementsProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapElementsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RoutesProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RoutesProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TileSourcesProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TileSourcesProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLocation
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Devices.Geolocation.IGeopoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IGeopoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLocation(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLocation
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Devices.Geolocation.IGeopoint
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLocation(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_NormalizedAnchorPointProperty_IMapControl
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NormalizedAnchorPointProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetNormalizedAnchorPoint
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Foundation.Point is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Point;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetNormalizedAnchorPoint(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetNormalizedAnchorPoint
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Foundation.Point
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetNormalizedAnchorPoint(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_BusinessLandmarksVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BusinessLandmarksVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TransitFeaturesVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TransitFeaturesVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PanInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PanInteractionModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RotateInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RotateInteractionModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TiltInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TiltInteractionModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZoomInteractionModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZoomInteractionModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Is3DSupportedProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Is3DSupportedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsStreetsideSupportedProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsStreetsideSupportedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SceneProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SceneProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BusinessLandmarksEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BusinessLandmarksEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TransitFeaturesEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TransitFeaturesEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LayersProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LayersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MapProjectionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MapProjectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StyleSheetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StyleSheetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ViewPaddingProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControl");
      m_Factory     : IMapControlStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ViewPaddingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapControl
   (
      rasterRenderMode : Windows.Boolean
   )
   return Windows.UI.Xaml.Controls.Maps.IMapControl is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Controls.Maps.MapControlDataHelper");
      m_Factory     : IMapControlDataHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Controls.Maps.IMapControl;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapControlDataHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMapControl(rasterRenderMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
