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
with Windows.Foundation;
limited with Windows.UI.Core;
limited with Windows.Devices.Enumeration;
limited with Windows.UI.Popups;
--------------------------------------------------------------------------------
package Windows.UI.ViewManagement is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ApplicationViewState is (
      FullScreenLandscape,
      Filled,
      Snapped,
      FullScreenPortrait
   );
   for ApplicationViewState use (
      FullScreenLandscape => 0,
      Filled => 1,
      Snapped => 2,
      FullScreenPortrait => 3
   );
   for ApplicationViewState'Size use 32;
   
   type ApplicationViewState_Ptr is access ApplicationViewState;
   
   type ApplicationViewOrientation is (
      Landscape,
      Portrait
   );
   for ApplicationViewOrientation use (
      Landscape => 0,
      Portrait => 1
   );
   for ApplicationViewOrientation'Size use 32;
   
   type ApplicationViewOrientation_Ptr is access ApplicationViewOrientation;
   
   type ApplicationViewSwitchingOptions is (
      Default,
      SkipAnimation,
      ConsolidateViews
   );
   for ApplicationViewSwitchingOptions use (
      Default => 0,
      SkipAnimation => 1,
      ConsolidateViews => 2
   );
   for ApplicationViewSwitchingOptions'Size use 32;
   
   type ApplicationViewSwitchingOptions_Ptr is access ApplicationViewSwitchingOptions;
   
   type ViewSizePreference is (
      Default,
      UseLess,
      UseHalf,
      UseMore,
      UseMinimum,
      UseNone,
      Custom
   );
   for ViewSizePreference use (
      Default => 0,
      UseLess => 1,
      UseHalf => 2,
      UseMore => 3,
      UseMinimum => 4,
      UseNone => 5,
      Custom => 6
   );
   for ViewSizePreference'Size use 32;
   
   type ViewSizePreference_Ptr is access ViewSizePreference;
   
   type ApplicationViewBoundsMode is (
      UseVisible,
      UseCoreWindow
   );
   for ApplicationViewBoundsMode use (
      UseVisible => 0,
      UseCoreWindow => 1
   );
   for ApplicationViewBoundsMode'Size use 32;
   
   type ApplicationViewBoundsMode_Ptr is access ApplicationViewBoundsMode;
   
   type FullScreenSystemOverlayMode is (
      Standard_x,
      Minimal
   );
   for FullScreenSystemOverlayMode use (
      Standard_x => 0,
      Minimal => 1
   );
   for FullScreenSystemOverlayMode'Size use 32;
   
   type FullScreenSystemOverlayMode_Ptr is access FullScreenSystemOverlayMode;
   
   type ApplicationViewWindowingMode is (
      Auto,
      PreferredLaunchViewSize,
      FullScreen
   );
   for ApplicationViewWindowingMode use (
      Auto => 0,
      PreferredLaunchViewSize => 1,
      FullScreen => 2
   );
   for ApplicationViewWindowingMode'Size use 32;
   
   type ApplicationViewWindowingMode_Ptr is access ApplicationViewWindowingMode;
   
   type ApplicationViewMode is (
      Default,
      CompactOverlay
   );
   for ApplicationViewMode use (
      Default => 0,
      CompactOverlay => 1
   );
   for ApplicationViewMode'Size use 32;
   
   type ApplicationViewMode_Ptr is access ApplicationViewMode;
   
   type UserInteractionMode is (
      Mouse,
      Touch
   );
   for UserInteractionMode use (
      Mouse => 0,
      Touch => 1
   );
   for UserInteractionMode'Size use 32;
   
   type UserInteractionMode_Ptr is access UserInteractionMode;
   
   type HandPreference is (
      LeftHanded,
      RightHanded
   );
   for HandPreference use (
      LeftHanded => 0,
      RightHanded => 1
   );
   for HandPreference'Size use 32;
   
   type HandPreference_Ptr is access HandPreference;
   
   type UIColorType is (
      Background,
      Foreground,
      AccentDark3,
      AccentDark2,
      AccentDark1,
      Accent,
      AccentLight1,
      AccentLight2,
      AccentLight3,
      Complement
   );
   for UIColorType use (
      Background => 0,
      Foreground => 1,
      AccentDark3 => 2,
      AccentDark2 => 3,
      AccentDark1 => 4,
      Accent => 5,
      AccentLight1 => 6,
      AccentLight2 => 7,
      AccentLight3 => 8,
      Complement => 9
   );
   for UIColorType'Size use 32;
   
   type UIColorType_Ptr is access UIColorType;
   
   type UIElementType is (
      ActiveCaption,
      Background,
      ButtonFace,
      ButtonText,
      CaptionText,
      GrayText,
      Highlight,
      HighlightText,
      Hotlight,
      InactiveCaption,
      InactiveCaptionText,
      Window,
      WindowText,
      AccentColor,
      TextHigh,
      TextMedium,
      TextLow,
      TextContrastWithHigh,
      NonTextHigh,
      NonTextMediumHigh,
      NonTextMedium,
      NonTextMediumLow,
      NonTextLow,
      PageBackground,
      PopupBackground,
      OverlayOutsidePopup
   );
   for UIElementType use (
      ActiveCaption => 0,
      Background => 1,
      ButtonFace => 2,
      ButtonText => 3,
      CaptionText => 4,
      GrayText => 5,
      Highlight => 6,
      HighlightText => 7,
      Hotlight => 8,
      InactiveCaption => 9,
      InactiveCaptionText => 10,
      Window => 11,
      WindowText => 12,
      AccentColor => 1000,
      TextHigh => 1001,
      TextMedium => 1002,
      TextLow => 1003,
      TextContrastWithHigh => 1004,
      NonTextHigh => 1005,
      NonTextMediumHigh => 1006,
      NonTextMedium => 1007,
      NonTextMediumLow => 1008,
      NonTextLow => 1009,
      PageBackground => 1010,
      PopupBackground => 1011,
      OverlayOutsidePopup => 1012
   );
   for UIElementType'Size use 32;
   
   type UIElementType_Ptr is access UIElementType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ViewManagementViewScalingContract is null record;
   pragma Convention (C_Pass_By_Copy , ViewManagementViewScalingContract);
   
   type ViewManagementViewScalingContract_Ptr is access ViewManagementViewScalingContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IApplicationView_add_Consolidated_Interface;
   type TypedEventHandler_IApplicationView_add_Consolidated is access all TypedEventHandler_IApplicationView_add_Consolidated_Interface'Class;
   type TypedEventHandler_IApplicationView_add_Consolidated_Ptr is access all TypedEventHandler_IApplicationView_add_Consolidated;
   type TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Interface;
   type TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged is access all TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Interface'Class;
   type TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Ptr is access all TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged;
   type TypedEventHandler_IInputPane_add_Showing_Interface;
   type TypedEventHandler_IInputPane_add_Showing is access all TypedEventHandler_IInputPane_add_Showing_Interface'Class;
   type TypedEventHandler_IInputPane_add_Showing_Ptr is access all TypedEventHandler_IInputPane_add_Showing;
   type TypedEventHandler_IInputPane_add_Hiding_Interface;
   type TypedEventHandler_IInputPane_add_Hiding is access all TypedEventHandler_IInputPane_add_Hiding_Interface'Class;
   type TypedEventHandler_IInputPane_add_Hiding_Ptr is access all TypedEventHandler_IInputPane_add_Hiding;
   type TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Interface;
   type TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged is access all TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Interface'Class;
   type TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Ptr is access all TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged;
   type TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Interface;
   type TypedEventHandler_IUISettings2_add_TextScaleFactorChanged is access all TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Interface'Class;
   type TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Ptr is access all TypedEventHandler_IUISettings2_add_TextScaleFactorChanged;
   type TypedEventHandler_IUISettings3_add_ColorValuesChanged_Interface;
   type TypedEventHandler_IUISettings3_add_ColorValuesChanged is access all TypedEventHandler_IUISettings3_add_ColorValuesChanged_Interface'Class;
   type TypedEventHandler_IUISettings3_add_ColorValuesChanged_Ptr is access all TypedEventHandler_IUISettings3_add_ColorValuesChanged;
   type TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Interface;
   type TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged is access all TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Interface'Class;
   type TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Ptr is access all TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged;
   type TypedEventHandler_IStatusBar_add_Showing_Interface;
   type TypedEventHandler_IStatusBar_add_Showing is access all TypedEventHandler_IStatusBar_add_Showing_Interface'Class;
   type TypedEventHandler_IStatusBar_add_Showing_Ptr is access all TypedEventHandler_IStatusBar_add_Showing;
   type TypedEventHandler_IStatusBar_add_Hiding_Interface;
   type TypedEventHandler_IStatusBar_add_Hiding is access all TypedEventHandler_IStatusBar_add_Hiding_Interface'Class;
   type TypedEventHandler_IStatusBar_add_Hiding_Ptr is access all TypedEventHandler_IStatusBar_add_Hiding;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IViewModePreferences_Interface;
   type IViewModePreferences is access all IViewModePreferences_Interface'Class;
   type IViewModePreferences_Ptr is access all IViewModePreferences;
   type IViewModePreferencesStatics_Interface;
   type IViewModePreferencesStatics is access all IViewModePreferencesStatics_Interface'Class;
   type IViewModePreferencesStatics_Ptr is access all IViewModePreferencesStatics;
   type IApplicationViewSwitcherStatics_Interface;
   type IApplicationViewSwitcherStatics is access all IApplicationViewSwitcherStatics_Interface'Class;
   type IApplicationViewSwitcherStatics_Ptr is access all IApplicationViewSwitcherStatics;
   type IApplicationViewSwitcherStatics2_Interface;
   type IApplicationViewSwitcherStatics2 is access all IApplicationViewSwitcherStatics2_Interface'Class;
   type IApplicationViewSwitcherStatics2_Ptr is access all IApplicationViewSwitcherStatics2;
   type IApplicationViewSwitcherStatics3_Interface;
   type IApplicationViewSwitcherStatics3 is access all IApplicationViewSwitcherStatics3_Interface'Class;
   type IApplicationViewSwitcherStatics3_Ptr is access all IApplicationViewSwitcherStatics3;
   type IApplicationViewInteropStatics_Interface;
   type IApplicationViewInteropStatics is access all IApplicationViewInteropStatics_Interface'Class;
   type IApplicationViewInteropStatics_Ptr is access all IApplicationViewInteropStatics;
   type IApplicationViewStatics_Interface;
   type IApplicationViewStatics is access all IApplicationViewStatics_Interface'Class;
   type IApplicationViewStatics_Ptr is access all IApplicationViewStatics;
   type IApplicationViewStatics2_Interface;
   type IApplicationViewStatics2 is access all IApplicationViewStatics2_Interface'Class;
   type IApplicationViewStatics2_Ptr is access all IApplicationViewStatics2;
   type IApplicationViewStatics3_Interface;
   type IApplicationViewStatics3 is access all IApplicationViewStatics3_Interface'Class;
   type IApplicationViewStatics3_Ptr is access all IApplicationViewStatics3;
   type IApplicationView_Interface;
   type IApplicationView is access all IApplicationView_Interface'Class;
   type IApplicationView_Ptr is access all IApplicationView;
   type IApplicationView2_Interface;
   type IApplicationView2 is access all IApplicationView2_Interface'Class;
   type IApplicationView2_Ptr is access all IApplicationView2;
   type IApplicationViewTitleBar_Interface;
   type IApplicationViewTitleBar is access all IApplicationViewTitleBar_Interface'Class;
   type IApplicationViewTitleBar_Ptr is access all IApplicationViewTitleBar;
   type IApplicationView3_Interface;
   type IApplicationView3 is access all IApplicationView3_Interface'Class;
   type IApplicationView3_Ptr is access all IApplicationView3;
   type IApplicationViewFullscreenStatics_Interface;
   type IApplicationViewFullscreenStatics is access all IApplicationViewFullscreenStatics_Interface'Class;
   type IApplicationViewFullscreenStatics_Ptr is access all IApplicationViewFullscreenStatics;
   type IApplicationView4_Interface;
   type IApplicationView4 is access all IApplicationView4_Interface'Class;
   type IApplicationView4_Ptr is access all IApplicationView4;
   type IApplicationViewConsolidatedEventArgs_Interface;
   type IApplicationViewConsolidatedEventArgs is access all IApplicationViewConsolidatedEventArgs_Interface'Class;
   type IApplicationViewConsolidatedEventArgs_Ptr is access all IApplicationViewConsolidatedEventArgs;
   type IApplicationViewConsolidatedEventArgs2_Interface;
   type IApplicationViewConsolidatedEventArgs2 is access all IApplicationViewConsolidatedEventArgs2_Interface'Class;
   type IApplicationViewConsolidatedEventArgs2_Ptr is access all IApplicationViewConsolidatedEventArgs2;
   type IActivationViewSwitcher_Interface;
   type IActivationViewSwitcher is access all IActivationViewSwitcher_Interface'Class;
   type IActivationViewSwitcher_Ptr is access all IActivationViewSwitcher;
   type IApplicationViewTransferContext_Interface;
   type IApplicationViewTransferContext is access all IApplicationViewTransferContext_Interface'Class;
   type IApplicationViewTransferContext_Ptr is access all IApplicationViewTransferContext;
   type IApplicationViewTransferContextStatics_Interface;
   type IApplicationViewTransferContextStatics is access all IApplicationViewTransferContextStatics_Interface'Class;
   type IApplicationViewTransferContextStatics_Ptr is access all IApplicationViewTransferContextStatics;
   type IInputPaneVisibilityEventArgs_Interface;
   type IInputPaneVisibilityEventArgs is access all IInputPaneVisibilityEventArgs_Interface'Class;
   type IInputPaneVisibilityEventArgs_Ptr is access all IInputPaneVisibilityEventArgs;
   type IInputPane_Interface;
   type IInputPane is access all IInputPane_Interface'Class;
   type IInputPane_Ptr is access all IInputPane;
   type IInputPane2_Interface;
   type IInputPane2 is access all IInputPane2_Interface'Class;
   type IInputPane2_Ptr is access all IInputPane2;
   type IInputPaneControl_Interface;
   type IInputPaneControl is access all IInputPaneControl_Interface'Class;
   type IInputPaneControl_Ptr is access all IInputPaneControl;
   type IInputPaneStatics_Interface;
   type IInputPaneStatics is access all IInputPaneStatics_Interface'Class;
   type IInputPaneStatics_Ptr is access all IInputPaneStatics;
   type IProjectionManagerStatics_Interface;
   type IProjectionManagerStatics is access all IProjectionManagerStatics_Interface'Class;
   type IProjectionManagerStatics_Ptr is access all IProjectionManagerStatics;
   type IProjectionManagerStatics2_Interface;
   type IProjectionManagerStatics2 is access all IProjectionManagerStatics2_Interface'Class;
   type IProjectionManagerStatics2_Ptr is access all IProjectionManagerStatics2;
   type IUIViewSettings_Interface;
   type IUIViewSettings is access all IUIViewSettings_Interface'Class;
   type IUIViewSettings_Ptr is access all IUIViewSettings;
   type IUIViewSettingsStatics_Interface;
   type IUIViewSettingsStatics is access all IUIViewSettingsStatics_Interface'Class;
   type IUIViewSettingsStatics_Ptr is access all IUIViewSettingsStatics;
   type IAccessibilitySettings_Interface;
   type IAccessibilitySettings is access all IAccessibilitySettings_Interface'Class;
   type IAccessibilitySettings_Ptr is access all IAccessibilitySettings;
   type IUISettings_Interface;
   type IUISettings is access all IUISettings_Interface'Class;
   type IUISettings_Ptr is access all IUISettings;
   type IUISettings2_Interface;
   type IUISettings2 is access all IUISettings2_Interface'Class;
   type IUISettings2_Ptr is access all IUISettings2;
   type IUISettings3_Interface;
   type IUISettings3 is access all IUISettings3_Interface'Class;
   type IUISettings3_Ptr is access all IUISettings3;
   type IUISettings4_Interface;
   type IUISettings4 is access all IUISettings4_Interface'Class;
   type IUISettings4_Ptr is access all IUISettings4;
   type IStatusBarStatics_Interface;
   type IStatusBarStatics is access all IStatusBarStatics_Interface'Class;
   type IStatusBarStatics_Ptr is access all IStatusBarStatics;
   type IStatusBar_Interface;
   type IStatusBar is access all IStatusBar_Interface'Class;
   type IStatusBar_Ptr is access all IStatusBar;
   type IStatusBarProgressIndicator_Interface;
   type IStatusBarProgressIndicator is access all IStatusBarProgressIndicator_Interface'Class;
   type IStatusBarProgressIndicator_Ptr is access all IStatusBarProgressIndicator;
   type IApplicationViewScaling_Interface;
   type IApplicationViewScaling is access all IApplicationViewScaling_Interface'Class;
   type IApplicationViewScaling_Ptr is access all IApplicationViewScaling;
   type IApplicationViewScalingStatics_Interface;
   type IApplicationViewScalingStatics is access all IApplicationViewScalingStatics_Interface'Class;
   type IApplicationViewScalingStatics_Ptr is access all IApplicationViewScalingStatics;
   type IReference_UIElementType_Interface;
   type IReference_UIElementType is access all IReference_UIElementType_Interface'Class;
   type IReference_UIElementType_Ptr is access all IReference_UIElementType;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IViewModePreferences : aliased constant Windows.IID := (2274348346, 2969, 17097, (132, 208, 211, 241, 212, 3, 85, 75 ));
   
   type IViewModePreferences_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewSizePreference
   (
      This       : access IViewModePreferences_Interface
      ; RetVal : access Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewSizePreference
   (
      This       : access IViewModePreferences_Interface
      ; value : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomSize
   (
      This       : access IViewModePreferences_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomSize
   (
      This       : access IViewModePreferences_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IViewModePreferencesStatics : aliased constant Windows.IID := (1773537893, 24037, 16600, (131, 6, 56, 51, 223, 122, 34, 116 ));
   
   type IViewModePreferencesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDefault
   (
      This       : access IViewModePreferencesStatics_Interface
      ; mode : Windows.UI.ViewManagement.ApplicationViewMode
      ; RetVal : access Windows.UI.ViewManagement.IViewModePreferences
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewSwitcherStatics : aliased constant Windows.IID := (2539597598, 58966, 19550, (160, 161, 113, 124, 111, 250, 125, 100 ));
   
   type IApplicationViewSwitcherStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function DisableShowingMainViewOnActivation
   (
      This       : access IApplicationViewSwitcherStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryShowAsStandaloneAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; viewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryShowAsStandaloneWithSizePreferenceAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; anchorViewId : Windows.Int32
      ; anchorSizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SwitchAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; viewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SwitchFromViewAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SwitchFromViewWithOptionsAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function PrepareForCustomAnimatedSwitchAsync
   (
      This       : access IApplicationViewSwitcherStatics_Interface
      ; toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewSwitcherStatics2 : aliased constant Windows.IID := (1625920973, 20418, 18628, (184, 227, 57, 95, 43, 159, 15, 193 ));
   
   type IApplicationViewSwitcherStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function DisableSystemViewActivationPolicy
   (
      This       : access IApplicationViewSwitcherStatics2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewSwitcherStatics3 : aliased constant Windows.IID := (2449839136, 32935, 18541, (178, 31, 199, 164, 162, 66, 163, 131 ));
   
   type IApplicationViewSwitcherStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function TryShowAsViewModeAsync
   (
      This       : access IApplicationViewSwitcherStatics3_Interface
      ; viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryShowAsViewModeWithPreferencesAsync
   (
      This       : access IApplicationViewSwitcherStatics3_Interface
      ; viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; viewModePreferences : Windows.UI.ViewManagement.IViewModePreferences
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewInteropStatics : aliased constant Windows.IID := (3292986205, 18323, 18582, (168, 226, 190, 87, 168, 187, 15, 80 ));
   
   type IApplicationViewInteropStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetApplicationViewIdForWindow
   (
      This       : access IApplicationViewInteropStatics_Interface
      ; window : Windows.UI.Core.ICoreWindow
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewStatics : aliased constant Windows.IID := (17457926, 50227, 17637, (169, 242, 189, 132, 212, 3, 10, 149 ));
   
   type IApplicationViewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IApplicationViewStatics_Interface
      ; RetVal : access Windows.UI.ViewManagement.ApplicationViewState
   )
   return Windows.HRESULT is abstract;
   
   function TryUnsnap
   (
      This       : access IApplicationViewStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewStatics2 : aliased constant Windows.IID := (2939390693, 53092, 16956, (133, 229, 243, 231, 36, 72, 251, 35 ));
   
   type IApplicationViewStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IApplicationViewStatics2_Interface
      ; RetVal : access Windows.UI.ViewManagement.IApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function get_TerminateAppOnFinalViewClose
   (
      This       : access IApplicationViewStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TerminateAppOnFinalViewClose
   (
      This       : access IApplicationViewStatics2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewStatics3 : aliased constant Windows.IID := (2727179668, 35905, 19987, (151, 25, 81, 100, 121, 111, 228, 199 ));
   
   type IApplicationViewStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreferredLaunchWindowingMode
   (
      This       : access IApplicationViewStatics3_Interface
      ; RetVal : access Windows.UI.ViewManagement.ApplicationViewWindowingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredLaunchWindowingMode
   (
      This       : access IApplicationViewStatics3_Interface
      ; value : Windows.UI.ViewManagement.ApplicationViewWindowingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredLaunchViewSize
   (
      This       : access IApplicationViewStatics3_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredLaunchViewSize
   (
      This       : access IApplicationViewStatics3_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationView : aliased constant Windows.IID := (3525498137, 17249, 17694, (150, 196, 96, 244, 249, 116, 45, 176 ));
   
   type IApplicationView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Orientation
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.UI.ViewManagement.ApplicationViewOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_AdjacentToLeftDisplayEdge
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AdjacentToRightDisplayEdge
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFullScreen
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnLockScreen
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsScreenCaptureEnabled
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsScreenCaptureEnabled
   (
      This       : access IApplicationView_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IApplicationView_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IApplicationView_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function add_Consolidated
   (
      This       : access IApplicationView_Interface
      ; handler : TypedEventHandler_IApplicationView_add_Consolidated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Consolidated
   (
      This       : access IApplicationView_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationView2 : aliased constant Windows.IID := (3900092822, 42309, 16604, (181, 148, 69, 12, 186, 104, 204, 0 ));
   
   type IApplicationView2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SuppressSystemOverlays
   (
      This       : access IApplicationView2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SuppressSystemOverlays
   (
      This       : access IApplicationView2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibleBounds
   (
      This       : access IApplicationView2_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function add_VisibleBoundsChanged
   (
      This       : access IApplicationView2_Interface
      ; handler : TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisibleBoundsChanged
   (
      This       : access IApplicationView2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetDesiredBoundsMode
   (
      This       : access IApplicationView2_Interface
      ; boundsMode : Windows.UI.ViewManagement.ApplicationViewBoundsMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredBoundsMode
   (
      This       : access IApplicationView2_Interface
      ; RetVal : access Windows.UI.ViewManagement.ApplicationViewBoundsMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewTitleBar : aliased constant Windows.IID := (9587392, 37675, 19051, (156, 75, 220, 56, 200, 36, 120, 206 ));
   
   type IApplicationViewTitleBar_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonHoverForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonHoverForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonHoverBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonHoverBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonPressedForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonPressedForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonPressedBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonPressedBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InactiveForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_InactiveForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InactiveBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_InactiveBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonInactiveForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonInactiveForegroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ButtonInactiveBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonInactiveBackgroundColor
   (
      This       : access IApplicationViewTitleBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationView3 : aliased constant Windows.IID := (2419891429, 31034, 20447, (162, 178, 175, 26, 194, 30, 49, 8 ));
   
   type IApplicationView3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TitleBar
   (
      This       : access IApplicationView3_Interface
      ; RetVal : access Windows.UI.ViewManagement.IApplicationViewTitleBar
   )
   return Windows.HRESULT is abstract;
   
   function get_FullScreenSystemOverlayMode
   (
      This       : access IApplicationView3_Interface
      ; RetVal : access Windows.UI.ViewManagement.FullScreenSystemOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   function put_FullScreenSystemOverlayMode
   (
      This       : access IApplicationView3_Interface
      ; value : Windows.UI.ViewManagement.FullScreenSystemOverlayMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFullScreenMode
   (
      This       : access IApplicationView3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryEnterFullScreenMode
   (
      This       : access IApplicationView3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ExitFullScreenMode
   (
      This       : access IApplicationView3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ShowStandardSystemOverlays
   (
      This       : access IApplicationView3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryResizeView
   (
      This       : access IApplicationView3_Interface
      ; value : Windows.Foundation.Size
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetPreferredMinSize
   (
      This       : access IApplicationView3_Interface
      ; minSize : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewFullscreenStatics : aliased constant Windows.IID := (3162058429, 25854, 19301, (160, 192, 144, 28, 226, 182, 134, 54 ));
   
   type IApplicationViewFullscreenStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryUnsnapToFullscreen
   (
      This       : access IApplicationViewFullscreenStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationView4 : aliased constant Windows.IID := (367381484, 40463, 18101, (188, 63, 155, 246, 83, 231, 75, 94 ));
   
   type IApplicationView4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewMode
   (
      This       : access IApplicationView4_Interface
      ; RetVal : access Windows.UI.ViewManagement.ApplicationViewMode
   )
   return Windows.HRESULT is abstract;
   
   function IsViewModeSupported
   (
      This       : access IApplicationView4_Interface
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryEnterViewModeAsync
   (
      This       : access IApplicationView4_Interface
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryEnterViewModeWithPreferencesAsync
   (
      This       : access IApplicationView4_Interface
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; viewModePreferences : Windows.UI.ViewManagement.IViewModePreferences
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryConsolidateAsync
   (
      This       : access IApplicationView4_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewConsolidatedEventArgs : aliased constant Windows.IID := (1363429868, 32418, 19943, (166, 166, 125, 251, 170, 235, 182, 251 ));
   
   type IApplicationViewConsolidatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsUserInitiated
   (
      This       : access IApplicationViewConsolidatedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewConsolidatedEventArgs2 : aliased constant Windows.IID := (471441100, 28097, 16628, (175, 238, 7, 217, 234, 41, 100, 48 ));
   
   type IApplicationViewConsolidatedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAppInitiated
   (
      This       : access IApplicationViewConsolidatedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivationViewSwitcher : aliased constant Windows.IID := (3701939126, 29520, 18731, (170, 199, 200, 161, 61, 114, 36, 173 ));
   
   type IActivationViewSwitcher_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAsStandaloneAsync
   (
      This       : access IActivationViewSwitcher_Interface
      ; viewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsStandaloneWithSizePreferenceAsync
   (
      This       : access IActivationViewSwitcher_Interface
      ; viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function IsViewPresentedOnActivationVirtualDesktop
   (
      This       : access IActivationViewSwitcher_Interface
      ; viewId : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewTransferContext : aliased constant Windows.IID := (2239020131, 15383, 16526, (148, 8, 138, 26, 158, 168, 27, 250 ));
   
   type IApplicationViewTransferContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewId
   (
      This       : access IApplicationViewTransferContext_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewId
   (
      This       : access IApplicationViewTransferContext_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewTransferContextStatics : aliased constant Windows.IID := (363371922, 56697, 19211, (188, 71, 213, 241, 149, 241, 70, 97 ));
   
   type IApplicationViewTransferContextStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataPackageFormatId
   (
      This       : access IApplicationViewTransferContextStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputPaneVisibilityEventArgs : aliased constant Windows.IID := (3527663638, 55559, 20428, (187, 141, 247, 123, 170, 80, 40, 241 ));
   
   type IInputPaneVisibilityEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OccludedRect
   (
      This       : access IInputPaneVisibilityEventArgs_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_EnsuredFocusedElementInView
   (
      This       : access IInputPaneVisibilityEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_EnsuredFocusedElementInView
   (
      This       : access IInputPaneVisibilityEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputPane : aliased constant Windows.IID := (1678432880, 1779, 19591, (166, 120, 152, 41, 201, 18, 124, 40 ));
   
   type IInputPane_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Showing
   (
      This       : access IInputPane_Interface
      ; handler : TypedEventHandler_IInputPane_add_Showing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Showing
   (
      This       : access IInputPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Hiding
   (
      This       : access IInputPane_Interface
      ; handler : TypedEventHandler_IInputPane_add_Hiding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Hiding
   (
      This       : access IInputPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_OccludedRect
   (
      This       : access IInputPane_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputPane2 : aliased constant Windows.IID := (2322284326, 28816, 18323, (148, 76, 195, 242, 205, 226, 98, 118 ));
   
   type IInputPane2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryShow
   (
      This       : access IInputPane2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryHide
   (
      This       : access IInputPane2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputPaneControl : aliased constant Windows.IID := (143372879, 38447, 18589, (170, 110, 198, 190, 26, 10, 110, 82 ));
   
   type IInputPaneControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Visible
   (
      This       : access IInputPaneControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Visible
   (
      This       : access IInputPaneControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputPaneStatics : aliased constant Windows.IID := (2515840826, 61255, 16970, (151, 65, 253, 40, 21, 235, 162, 189 ));
   
   type IInputPaneStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IInputPaneStatics_Interface
      ; RetVal : access Windows.UI.ViewManagement.IInputPane
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProjectionManagerStatics : aliased constant Windows.IID := (3059716413, 58096, 20477, (186, 149, 52, 36, 22, 71, 228, 92 ));
   
   type IProjectionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function StartProjectingAsync
   (
      This       : access IProjectionManagerStatics_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SwapDisplaysForViewsAsync
   (
      This       : access IProjectionManagerStatics_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopProjectingAsync
   (
      This       : access IProjectionManagerStatics_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionDisplayAvailable
   (
      This       : access IProjectionManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ProjectionDisplayAvailableChanged
   (
      This       : access IProjectionManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProjectionDisplayAvailableChanged
   (
      This       : access IProjectionManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProjectionManagerStatics2 : aliased constant Windows.IID := (4080873283, 10057, 19678, (185, 119, 192, 196, 30, 116, 21, 209 ));
   
   type IProjectionManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function StartProjectingWithDeviceInfoAsync
   (
      This       : access IProjectionManagerStatics2_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; displayDeviceInfo : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestStartProjectingAsync
   (
      This       : access IProjectionManagerStatics2_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStartProjectingWithPlacementAsync
   (
      This       : access IProjectionManagerStatics2_Interface
      ; projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
      ; prefferedPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IProjectionManagerStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIViewSettings : aliased constant Windows.IID := (3325450230, 34896, 18189, (136, 248, 69, 94, 22, 234, 44, 38 ));
   
   type IUIViewSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserInteractionMode
   (
      This       : access IUIViewSettings_Interface
      ; RetVal : access Windows.UI.ViewManagement.UserInteractionMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIViewSettingsStatics : aliased constant Windows.IID := (1499240357, 63734, 16847, (176, 251, 170, 205, 184, 31, 213, 246 ));
   
   type IUIViewSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IUIViewSettingsStatics_Interface
      ; RetVal : access Windows.UI.ViewManagement.IUIViewSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccessibilitySettings : aliased constant Windows.IID := (4262363463, 50368, 17762, (185, 98, 19, 39, 181, 42, 213, 185 ));
   
   type IAccessibilitySettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HighContrast
   (
      This       : access IAccessibilitySettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HighContrastScheme
   (
      This       : access IAccessibilitySettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_HighContrastChanged
   (
      This       : access IAccessibilitySettings_Interface
      ; handler : TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HighContrastChanged
   (
      This       : access IAccessibilitySettings_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUISettings : aliased constant Windows.IID := (2234914304, 7267, 17959, (188, 177, 58, 137, 224, 188, 156, 85 ));
   
   type IUISettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HandPreference
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UI.ViewManagement.HandPreference
   )
   return Windows.HRESULT is abstract;
   
   function get_CursorSize
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollBarSize
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollBarArrowSize
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollBarThumbBoxSize
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageDuration
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AnimationsEnabled
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CaretBrowsingEnabled
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CaretBlinkRate
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CaretWidth
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DoubleClickTime
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MouseHoverTime
   (
      This       : access IUISettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function UIElementColor
   (
      This       : access IUISettings_Interface
      ; desiredElement : Windows.UI.ViewManagement.UIElementType
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUISettings2 : aliased constant Windows.IID := (3134727169, 10017, 17657, (187, 145, 43, 178, 40, 190, 68, 47 ));
   
   type IUISettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextScaleFactor
   (
      This       : access IUISettings2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function add_TextScaleFactorChanged
   (
      This       : access IUISettings2_Interface
      ; handler : TypedEventHandler_IUISettings2_add_TextScaleFactorChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TextScaleFactorChanged
   (
      This       : access IUISettings2_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUISettings3 : aliased constant Windows.IID := (50469860, 21076, 18305, (129, 148, 81, 104, 247, 208, 109, 123 ));
   
   type IUISettings3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetColorValue
   (
      This       : access IUISettings3_Interface
      ; desiredColor : Windows.UI.ViewManagement.UIColorType
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorValuesChanged
   (
      This       : access IUISettings3_Interface
      ; handler : TypedEventHandler_IUISettings3_add_ColorValuesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorValuesChanged
   (
      This       : access IUISettings3_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUISettings4 : aliased constant Windows.IID := (1387999234, 37275, 19819, (155, 120, 141, 214, 111, 244, 185, 59 ));
   
   type IUISettings4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdvancedEffectsEnabled
   (
      This       : access IUISettings4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_AdvancedEffectsEnabledChanged
   (
      This       : access IUISettings4_Interface
      ; handler : TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AdvancedEffectsEnabledChanged
   (
      This       : access IUISettings4_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStatusBarStatics : aliased constant Windows.IID := (2336636895, 16943, 17761, (136, 6, 251, 18, 137, 202, 223, 183 ));
   
   type IStatusBarStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IStatusBarStatics_Interface
      ; RetVal : access Windows.UI.ViewManagement.IStatusBar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStatusBar : aliased constant Windows.IID := (268223935, 39120, 18532, (177, 232, 179, 244, 2, 11, 232, 180 ));
   
   type IStatusBar_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAsync
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function HideAsync
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundOpacity
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundOpacity
   (
      This       : access IStatusBar_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundColor
   (
      This       : access IStatusBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IStatusBar_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ProgressIndicator
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.UI.ViewManagement.IStatusBarProgressIndicator
   )
   return Windows.HRESULT is abstract;
   
   function get_OccludedRect
   (
      This       : access IStatusBar_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function add_Showing
   (
      This       : access IStatusBar_Interface
      ; eventHandler : TypedEventHandler_IStatusBar_add_Showing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Showing
   (
      This       : access IStatusBar_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Hiding
   (
      This       : access IStatusBar_Interface
      ; eventHandler : TypedEventHandler_IStatusBar_add_Hiding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Hiding
   (
      This       : access IStatusBar_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStatusBarProgressIndicator : aliased constant Windows.IID := (1993025136, 41943, 18895, (130, 0, 79, 62, 237, 202, 39, 187 ));
   
   type IStatusBarProgressIndicator_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAsync
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function HideAsync
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProgressValue
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProgressValue
   (
      This       : access IStatusBarProgressIndicator_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewScaling : aliased constant Windows.IID := (487447587, 9203, 19245, (132, 254, 116, 191, 55, 180, 139, 102 ));
   
   type IApplicationViewScaling_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewScalingStatics : aliased constant Windows.IID := (2962222320, 47430, 17864, (165, 227, 113, 245, 170, 120, 248, 97 ));
   
   type IApplicationViewScalingStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisableLayoutScaling
   (
      This       : access IApplicationViewScalingStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetDisableLayoutScaling
   (
      This       : access IApplicationViewScalingStatics_Interface
      ; disableLayoutScaling : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_UIElementType : aliased constant Windows.IID := (3783133385, 32235, 20945, (132, 135, 51, 78, 179, 254, 70, 145 ));
   
   type IReference_UIElementType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UIElementType_Interface
      ; RetVal : access Windows.UI.ViewManagement.UIElementType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IApplicationView_add_Consolidated : aliased constant Windows.IID := (1178361962, 35970, 23081, (162, 189, 4, 7, 129, 242, 83, 72 ));
   
   type TypedEventHandler_IApplicationView_add_Consolidated_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IApplicationView ; args : Windows.UI.ViewManagement.IApplicationViewConsolidatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IApplicationView_add_Consolidated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IApplicationView_add_Consolidated_Interface
      ; sender : Windows.UI.ViewManagement.IApplicationView
      ; args : Windows.UI.ViewManagement.IApplicationViewConsolidatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged : aliased constant Windows.IID := (12712323, 51254, 22108, (139, 191, 112, 83, 5, 91, 219, 76 ));
   
   type TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IApplicationView ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IApplicationView2_add_VisibleBoundsChanged_Interface
      ; sender : Windows.UI.ViewManagement.IApplicationView
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IInputPane_add_Showing : aliased constant Windows.IID := (3088307844, 55635, 23178, (155, 48, 120, 183, 159, 185, 20, 123 ));
   
   type TypedEventHandler_IInputPane_add_Showing_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IInputPane ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IInputPane_add_Showing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IInputPane_add_Showing_Interface
      ; sender : Windows.UI.ViewManagement.IInputPane
      ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IInputPane_add_Hiding : aliased constant Windows.IID := (3088307844, 55635, 23178, (155, 48, 120, 183, 159, 185, 20, 123 ));
   
   type TypedEventHandler_IInputPane_add_Hiding_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IInputPane ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IInputPane_add_Hiding'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IInputPane_add_Hiding_Interface
      ; sender : Windows.UI.ViewManagement.IInputPane
      ; args : Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged : aliased constant Windows.IID := (4119953007, 23231, 24165, (181, 180, 27, 156, 141, 148, 231, 136 ));
   
   type TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IAccessibilitySettings ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAccessibilitySettings_add_HighContrastChanged_Interface
      ; sender : Windows.UI.ViewManagement.IAccessibilitySettings
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUISettings2_add_TextScaleFactorChanged : aliased constant Windows.IID := (767408797, 8410, 20893, (144, 120, 9, 248, 53, 188, 91, 199 ));
   
   type TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IUISettings ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUISettings2_add_TextScaleFactorChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings2_add_TextScaleFactorChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUISettings3_add_ColorValuesChanged : aliased constant Windows.IID := (767408797, 8410, 20893, (144, 120, 9, 248, 53, 188, 91, 199 ));
   
   type TypedEventHandler_IUISettings3_add_ColorValuesChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IUISettings ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUISettings3_add_ColorValuesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings3_add_ColorValuesChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged : aliased constant Windows.IID := (767408797, 8410, 20893, (144, 120, 9, 248, 53, 188, 91, 199 ));
   
   type TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IUISettings ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUISettings4_add_AdvancedEffectsEnabledChanged_Interface
      ; sender : Windows.UI.ViewManagement.IUISettings
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStatusBar_add_Showing : aliased constant Windows.IID := (941968750, 34198, 21016, (187, 97, 93, 157, 185, 53, 170, 2 ));
   
   type TypedEventHandler_IStatusBar_add_Showing_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IStatusBar ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStatusBar_add_Showing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IStatusBar_add_Showing_Interface
      ; sender : Windows.UI.ViewManagement.IStatusBar
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStatusBar_add_Hiding : aliased constant Windows.IID := (941968750, 34198, 21016, (187, 97, 93, 157, 185, 53, 170, 2 ));
   
   type TypedEventHandler_IStatusBar_add_Hiding_Interface(Callback : access procedure (sender : Windows.UI.ViewManagement.IStatusBar ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStatusBar_add_Hiding'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IStatusBar_add_Hiding_Interface
      ; sender : Windows.UI.ViewManagement.IStatusBar
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ViewModePreferences is Windows.UI.ViewManagement.IViewModePreferences;
   subtype ApplicationView is Windows.UI.ViewManagement.IApplicationView;
   subtype ApplicationViewConsolidatedEventArgs is Windows.UI.ViewManagement.IApplicationViewConsolidatedEventArgs;
   subtype ApplicationViewTitleBar is Windows.UI.ViewManagement.IApplicationViewTitleBar;
   subtype ActivationViewSwitcher is Windows.UI.ViewManagement.IActivationViewSwitcher;
   subtype ApplicationViewTransferContext is Windows.UI.ViewManagement.IApplicationViewTransferContext;
   function CreateApplicationViewTransferContext return Windows.UI.ViewManagement.IApplicationViewTransferContext;
   
   subtype InputPaneVisibilityEventArgs is Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs;
   subtype InputPane is Windows.UI.ViewManagement.IInputPane;
   subtype UIViewSettings is Windows.UI.ViewManagement.IUIViewSettings;
   subtype AccessibilitySettings is Windows.UI.ViewManagement.IAccessibilitySettings;
   function CreateAccessibilitySettings return Windows.UI.ViewManagement.IAccessibilitySettings;
   
   subtype UISettings is Windows.UI.ViewManagement.IUISettings;
   function CreateUISettings return Windows.UI.ViewManagement.IUISettings;
   
   subtype StatusBar is Windows.UI.ViewManagement.IStatusBar;
   subtype StatusBarProgressIndicator is Windows.UI.ViewManagement.IStatusBarProgressIndicator;
   subtype ApplicationViewScaling is Windows.UI.ViewManagement.IApplicationViewScaling;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateDefault
   (
      mode : Windows.UI.ViewManagement.ApplicationViewMode
   )
   return Windows.UI.ViewManagement.IViewModePreferences;
   
   function TryUnsnapToFullscreen
   return Windows.Boolean;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IApplicationView;
   
   function get_TerminateAppOnFinalViewClose
   return Windows.Boolean;
   
   procedure put_TerminateAppOnFinalViewClose
   (
      value : Windows.Boolean
   )
   ;
   
   function get_PreferredLaunchWindowingMode
   return Windows.UI.ViewManagement.ApplicationViewWindowingMode;
   
   procedure put_PreferredLaunchWindowingMode
   (
      value : Windows.UI.ViewManagement.ApplicationViewWindowingMode
   )
   ;
   
   function get_PreferredLaunchViewSize
   return Windows.Foundation.Size;
   
   procedure put_PreferredLaunchViewSize
   (
      value : Windows.Foundation.Size
   )
   ;
   
   function get_Value
   return Windows.UI.ViewManagement.ApplicationViewState;
   
   function TryUnsnap
   return Windows.Boolean;
   
   function GetApplicationViewIdForWindow
   (
      window : Windows.UI.Core.ICoreWindow
   )
   return Windows.Int32;
   
   function TryShowAsViewModeAsync
   (
      viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function TryShowAsViewModeWithPreferencesAsync
   (
      viewId : Windows.Int32
      ; viewMode : Windows.UI.ViewManagement.ApplicationViewMode
      ; viewModePreferences : Windows.UI.ViewManagement.IViewModePreferences
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   procedure DisableShowingMainViewOnActivation
   ;
   
   function TryShowAsStandaloneAsync
   (
      viewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function TryShowAsStandaloneWithSizePreferenceAsync
   (
      viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync
   (
      viewId : Windows.Int32
      ; sizePreference : Windows.UI.ViewManagement.ViewSizePreference
      ; anchorViewId : Windows.Int32
      ; anchorSizePreference : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function SwitchAsync
   (
      viewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction;
   
   function SwitchFromViewAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction;
   
   function SwitchFromViewWithOptionsAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
   )
   return Windows.Foundation.IAsyncAction;
   
   function PrepareForCustomAnimatedSwitchAsync
   (
      toViewId : Windows.Int32
      ; fromViewId : Windows.Int32
      ; options : Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   procedure DisableSystemViewActivationPolicy
   ;
   
   function get_DataPackageFormatId
   return Windows.String;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IInputPane;
   
   function StartProjectingWithDeviceInfoAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; displayDeviceInfo : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Foundation.IAsyncAction;
   
   function RequestStartProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function RequestStartProjectingWithPlacementAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
      ; selection : Windows.Foundation.Rect
      ; prefferedPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function GetDeviceSelector
   return Windows.String;
   
   function StartProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction;
   
   function SwapDisplaysForViewsAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction;
   
   function StopProjectingAsync
   (
      projectionViewId : Windows.Int32
      ; anchorViewId : Windows.Int32
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_ProjectionDisplayAvailable
   return Windows.Boolean;
   
   function add_ProjectionDisplayAvailableChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ProjectionDisplayAvailableChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IUIViewSettings;
   
   function GetForCurrentView
   return Windows.UI.ViewManagement.IStatusBar;
   
   function get_DisableLayoutScaling
   return Windows.Boolean;
   
   function TrySetDisableLayoutScaling
   (
      disableLayoutScaling : Windows.Boolean
   )
   return Windows.Boolean;
   
end;
