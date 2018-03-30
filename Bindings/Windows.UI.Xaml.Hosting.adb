--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI.Composition;
with Windows.UI.Xaml;
with Windows.UI.Xaml.Controls;
with Windows.UI.Xaml.Controls.Primitives;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Hosting is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDesignerAppManager_add_DesignerAppExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface
      ; sender : Windows.UI.Xaml.Hosting.IDesignerAppManager
      ; args : Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Hosting.IDesignerAppManager(sender), Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDesignerAppView_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDesignerAppView or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IDesignerAppView_Interface
      ; asyncInfo : Windows.UI.Xaml.Hosting.IAsyncOperation_IDesignerAppView
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
      appUserModelId : Windows.String
   )
   return Windows.UI.Xaml.Hosting.IDesignerAppManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.DesignerAppManager");
      m_Factory     : Windows.UI.Xaml.Hosting.IDesignerAppManagerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IDesignerAppManager := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDesignerAppManagerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(appUserModelId, RetVal'Access);
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
   
   
   function GetElementVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.IVisual;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetElementVisual(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.IVisual;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetElementChildVisual(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
      ; visual : Windows.UI.Composition.IVisual
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetElementChildVisual(element, visual);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetScrollViewerManipulationPropertySet
   (
      scrollViewer : Windows.UI.Xaml.Controls.IScrollViewer
   )
   return Windows.UI.Composition.ICompositionPropertySet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionPropertySet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetScrollViewerManipulationPropertySet(scrollViewer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetImplicitShowAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImplicitShowAnimation(element, animation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetImplicitHideAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImplicitHideAnimation(element, animation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetIsTranslationEnabled
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsTranslationEnabled(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetPointerPositionPropertySet
   (
      targetElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.ICompositionPropertySet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionPropertySet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPointerPositionPropertySet(targetElement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteTimelinesAutomatically
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteTimelinesAutomatically(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_CompleteTimelinesAutomatically
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_CompleteTimelinesAutomatically(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetHost
   (
      host : Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetHost(host);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure NotifyWindowSizeChanged
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.NotifyWindowSizeChanged;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetFlyoutPlacementTargetInfo
   (
      placementTarget : Windows.UI.Xaml.IFrameworkElement
      ; preferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; targetPreferredPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : access Windows.Boolean
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlyoutPlacementTargetInfo(placementTarget, preferredPlacement, targetPreferredPlacement, allowFallbacks, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFlyoutPlacement
   (
      placementTargetBounds : Windows.Foundation.Rect
      ; controlSize : Windows.Foundation.Size
      ; minControlSize : Windows.Foundation.Size
      ; containerRect : Windows.Foundation.Rect
      ; targetPreferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : Windows.Boolean
      ; chosenPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlyoutPlacement(placementTargetBounds, controlSize, minControlSize, containerRect, targetPreferredPlacement, allowFallbacks, chosenPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
