--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI.Core;
with Windows.UI.Input.Inking;
with Windows.UI.Composition;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Inking.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateCoreInkPresenterHost return Windows.UI.Input.Inking.Core.ICoreInkPresenterHost is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreInkPresenterHost");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreInkPresenterHost := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.Core.IID_ICoreInkPresenterHost'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
      ; pointTransform : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreIncrementalInkStroke");
      m_Factory     : Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreIncrementalInkStrokeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(drawingAttributes, pointTransform, RetVal'Access);
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
   
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreInkIndependentInputSource");
      m_Factory     : ICoreInkIndependentInputSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreInkIndependentInputSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreWetStrokeUpdateSource");
      m_Factory     : ICoreWetStrokeUpdateSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWetStrokeUpdateSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
