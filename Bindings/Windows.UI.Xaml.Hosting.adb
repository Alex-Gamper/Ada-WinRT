--------------------------------------------------------------------------------
-- <auto-generated>                                                           --
--     This code was generated by a tool.                                     --
--                                                                            --
--     Changes to this file may cause incorrect behavior and will be lost if  --
--     the code is regenerated.                                               --
-- </auto-generated>                                                          --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.UI.Composition;
with Windows.UI.WindowManagement;
with Windows.UI.Xaml;
with Windows.UI.Xaml.Controls;
with Windows.UI.Xaml.Controls.Primitives;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Hosting is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
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
   
   function Invoke
   (
      This       : access TypedEventHandler_IDesktopWindowXamlSource_add_GotFocus_Interface
      ; sender : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource
      ; args : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceGotFocusEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource(sender), Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceGotFocusEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDesktopWindowXamlSource_add_TakeFocusRequested_Interface
      ; sender : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource
      ; args : Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceTakeFocusRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource(sender), Windows.UI.Xaml.Hosting.IDesktopWindowXamlSourceTakeFocusRequestedEventArgs(args));
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
   
   function CreateInstance
   (
      reason : Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationReason
   )
   return Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest");
      m_Factory     : Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlSourceFocusNavigationRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(reason, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithHintRect
   (
      reason : Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationReason
      ; hintRect : Windows.Foundation.Rect
   )
   return Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest");
      m_Factory     : Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlSourceFocusNavigationRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithHintRect(reason, hintRect, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithHintRectAndCorrelationId
   (
      reason : Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationReason
      ; hintRect : Windows.Foundation.Rect
      ; correlationId : Windows.Guid
   )
   return Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest");
      m_Factory     : Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlSourceFocusNavigationRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithHintRectAndCorrelationId(reason, hintRect, correlationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      focusMoved : Windows.Boolean
   )
   return Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationResult");
      m_Factory     : Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationResultFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationResult := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlSourceFocusNavigationResultFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(focusMoved, RetVal'Access);
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
      This       : access IDesktopWindowXamlSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IDesktopWindowXamlSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl;
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
      This       : access IDesktopWindowXamlSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Content
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Content
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_HasFocus
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_TakeFocusRequested
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; handler : TypedEventHandler_IDesktopWindowXamlSource_add_TakeFocusRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_TakeFocusRequested
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_GotFocus
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; handler : TypedEventHandler_IDesktopWindowXamlSource_add_GotFocus
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_GotFocus
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function NavigateFocus
   (
      This       : access IDesktopWindowXamlSource_Interface_Impl
      ; request : Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationRequest
      ; RetVal : access Windows.UI.Xaml.Hosting.IXamlSourceFocusNavigationResult
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      baseInterface : Windows.Object
      ; innerInterface : access Windows.Object
   )
   return Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.DesktopWindowXamlSource");
      m_Factory     : IDesktopWindowXamlSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IDesktopWindowXamlSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDesktopWindowXamlSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(baseInterface, innerInterface, RetVal'Access);
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
   
   function GetAppWindowContent
   (
      appWindow : Windows.UI.WindowManagement.IAppWindow
   )
   return Windows.UI.Xaml.IUIElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IUIElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppWindowContent(appWindow, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetAppWindowContent
   (
      appWindow : Windows.UI.WindowManagement.IAppWindow
      ; xamlContent : Windows.UI.Xaml.IUIElement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAppWindowContent(appWindow, xamlContent);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function InitializeForCurrentThread
   return Windows.UI.Xaml.Hosting.IWindowsXamlManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.WindowsXamlManager");
      m_Factory     : IWindowsXamlManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IWindowsXamlManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowsXamlManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InitializeForCurrentThread(RetVal'Access);
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
   
end;
