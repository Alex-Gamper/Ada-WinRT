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
with Windows.UI.Core;
with Windows.UI;
with Windows.Devices.Enumeration;
with Windows.UI.Popups;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.ViewManagement is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IApplicationView_add_Consolidated_Interface
      ; sender : Windows.UI.ViewManagement.IApplicationView
      ; args : Windows.UI.ViewManagement.IApplicationViewConsolidatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IApplicationView(sender), Windows.UI.ViewManagement.IApplicationViewConsolidatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Interface
      ; sender : Windows.UI.ViewManagement.IApplicationView
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IApplicationView(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInputPane_add_Showing_Interface
      ; sender : Windows.UI.ViewManagement.IInputPane
      ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IInputPane(sender), Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInputPane_add_Hiding_Interface
      ; sender : Windows.UI.ViewManagement.IInputPane
      ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IInputPane(sender), Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Interface
      ; sender : Windows.UI.ViewManagement.IAccessibilitySettings
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IAccessibilitySettings(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IUISettings(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings3_add_ColorValuesChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IUISettings(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IUISettings(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStatusBar_add_Showing_Interface
      ; sender : Windows.UI.ViewManagement.IStatusBar
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IStatusBar(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStatusBar_add_Hiding_Interface
      ; sender : Windows.UI.ViewManagement.IStatusBar
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ViewManagement.IStatusBar(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.UI.ViewManagement.IApplicationViewTransferContext is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewTransferContext");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.ViewManagement.IApplicationViewTransferContext) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.ViewManagement.IID_IApplicationViewTransferContext'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.UI.ViewManagement.IAccessibilitySettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.AccessibilitySettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.ViewManagement.IAccessibilitySettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.ViewManagement.IID_IAccessibilitySettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.UI.ViewManagement.IUISettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.UISettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.ViewManagement.IUISettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.ViewManagement.IID_IUISettings'Access, RetVal'access);
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
   
   function CreateDefault
   (
      mode : Windows.UI.ViewManagement.ApplicationViewMode
   )
   return Windows.UI.ViewManagement.IViewModePreferences is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ViewModePreferences");
      m_Factory     : IViewModePreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.IViewModePreferences;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IViewModePreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDefault(mode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryUnsnapToFullscreen
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewFullscreenStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewFullscreenStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryUnsnapToFullscreen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.IApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TerminateAppOnFinalViewClose
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TerminateAppOnFinalViewClose(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_TerminateAppOnFinalViewClose
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_TerminateAppOnFinalViewClose(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_PreferredLaunchWindowingMode
   return Windows.UI.ViewManagement.ApplicationViewWindowingMode is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.ApplicationViewWindowingMode;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PreferredLaunchWindowingMode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PreferredLaunchWindowingMode
   (
      value : Windows.UI.ViewManagement.ApplicationViewWindowingMode
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PreferredLaunchWindowingMode(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_PreferredLaunchViewSize
   return Windows.Foundation.Size is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Size;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PreferredLaunchViewSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PreferredLaunchViewSize
   (
      value : Windows.Foundation.Size
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PreferredLaunchViewSize(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetApplicationViewIdForWindow
   (
      window : Windows.UI.Core.ICoreWindow
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewInteropStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewInteropStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetApplicationViewIdForWindow(window, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Value
   return Windows.UI.ViewManagement.ApplicationViewState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.ApplicationViewState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Value(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryUnsnap
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationView");
      m_Factory     : IApplicationViewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryUnsnap(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DisableShowingMainViewOnActivation
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DisableShowingMainViewOnActivation;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TryShowAsStandaloneAsync
   (
      viewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryShowAsStandaloneAsync(viewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryShowAsStandaloneWithSizePreferenceAsync
   (
      viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync
   (
      viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; anchorViewId : Windows.Int32
      ; anchorSizePreference : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync(viewId, sizePreference, anchorViewId, anchorSizePreference, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SwitchAsync
   (
      viewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SwitchAsync(viewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SwitchFromViewAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SwitchFromViewAsync(toViewId, fromViewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SwitchFromViewWithOptionsAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SwitchFromViewWithOptionsAsync(toViewId, fromViewId, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PrepareForCustomAnimatedSwitchAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PrepareForCustomAnimatedSwitchAsync(toViewId, fromViewId, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DisableSystemViewActivationPolicy
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DisableSystemViewActivationPolicy;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TryShowAsViewModeAsync
   (
      viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryShowAsViewModeAsync(viewId, viewMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryShowAsViewModeWithPreferencesAsync
   (
      viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; viewModePreferences : Windows.UI.ViewManagement.IViewModePreferences
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewSwitcher");
      m_Factory     : IApplicationViewSwitcherStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewSwitcherStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryShowAsViewModeWithPreferencesAsync(viewId, viewMode, viewModePreferences, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DataPackageFormatId
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewTransferContext");
      m_Factory     : IApplicationViewTransferContextStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewTransferContextStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataPackageFormatId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IInputPane is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.InputPane");
      m_Factory     : IInputPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.IInputPane;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInputPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function StartProjectingWithDeviceInfoAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; displayDeviceInfo : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartProjectingWithDeviceInfoAsync(projectionViewId, anchorViewId, displayDeviceInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStartProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStartProjectingAsync(projectionViewId, anchorViewId, selection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStartProjectingWithPlacementAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
      ; prefferedPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStartProjectingWithPlacementAsync(projectionViewId, anchorViewId, selection, prefferedPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function StartProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartProjectingAsync(projectionViewId, anchorViewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SwapDisplaysForViewsAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SwapDisplaysForViewsAsync(projectionViewId, anchorViewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function StopProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StopProjectingAsync(projectionViewId, anchorViewId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProjectionDisplayAvailable
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProjectionDisplayAvailable(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_ProjectionDisplayAvailableChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ProjectionDisplayAvailableChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ProjectionDisplayAvailableChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ProjectionManager");
      m_Factory     : IProjectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProjectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ProjectionDisplayAvailableChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IUIViewSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.UIViewSettings");
      m_Factory     : IUIViewSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.IUIViewSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIViewSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IStatusBar is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.StatusBar");
      m_Factory     : IStatusBarStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ViewManagement.IStatusBar;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStatusBarStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DisableLayoutScaling
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewScaling");
      m_Factory     : IApplicationViewScalingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewScalingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DisableLayoutScaling(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetDisableLayoutScaling
   (
      disableLayoutScaling : Windows.Boolean
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ViewManagement.ApplicationViewScaling");
      m_Factory     : IApplicationViewScalingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationViewScalingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetDisableLayoutScaling(disableLayoutScaling, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
