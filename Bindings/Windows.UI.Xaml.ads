--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
limited with Windows.UI.Xaml.Controls;
with Windows.Foundation;
limited with Windows.UI.Core;
limited with Windows.UI.Xaml.Interop;
limited with Windows.ApplicationModel;
limited with Windows.UI.Xaml.Media.Imaging;
limited with Windows.Graphics.Imaging;
limited with Windows.ApplicationModel.Core;
limited with Windows.ApplicationModel.DataTransfer;
limited with Windows.ApplicationModel.DataTransfer.DragDrop;
with Windows.Foundation.Collections;
limited with Windows.UI.Xaml.Media;
limited with Windows.UI.Xaml.Media.Animation;
limited with Windows.UI.Xaml.Input;
limited with Windows.UI.Xaml.Automation.Peers;
limited with Windows.UI.Xaml.Media.Media3D;
limited with Windows.UI.Input;
limited with Windows.UI.Xaml.Controls.Primitives;
limited with Windows.UI.Xaml.Data;
limited with Windows.ApplicationModel.Activation;
limited with Windows.UI.Composition;
--------------------------------------------------------------------------------
package Windows.UI.Xaml is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DurationType is (
      Automatic,
      TimeSpan,
      Forever
   );
   for DurationType use (
      Automatic => 0,
      TimeSpan => 1,
      Forever => 2
   );
   for DurationType'Size use 32;
   
   type DurationType_Ptr is access DurationType;
   
   type ElementHighContrastAdjustment is (
      None,
      Application_x,
      Auto
   );
   for ElementHighContrastAdjustment use (
      None => 0,
      Application_x => 2147483648,
      Auto => 4294967295
   );
   for ElementHighContrastAdjustment'Size use 32;
   
   type ElementHighContrastAdjustment_Ptr is access ElementHighContrastAdjustment;
   
   type ElementSoundKind is (
      Focus,
      Invoke,
      Show,
      Hide,
      MovePrevious,
      MoveNext,
      GoBack
   );
   for ElementSoundKind use (
      Focus => 0,
      Invoke => 1,
      Show => 2,
      Hide => 3,
      MovePrevious => 4,
      MoveNext => 5,
      GoBack => 6
   );
   for ElementSoundKind'Size use 32;
   
   type ElementSoundKind_Ptr is access ElementSoundKind;
   
   type ElementSoundMode is (
      Default,
      FocusOnly,
      Off
   );
   for ElementSoundMode use (
      Default => 0,
      FocusOnly => 1,
      Off => 2
   );
   for ElementSoundMode'Size use 32;
   
   type ElementSoundMode_Ptr is access ElementSoundMode;
   
   type ElementTheme is (
      Default,
      Light,
      Dark
   );
   for ElementTheme use (
      Default => 0,
      Light => 1,
      Dark => 2
   );
   for ElementTheme'Size use 32;
   
   type ElementTheme_Ptr is access ElementTheme;
   
   type FlowDirection is (
      LeftToRight,
      RightToLeft
   );
   for FlowDirection use (
      LeftToRight => 0,
      RightToLeft => 1
   );
   for FlowDirection'Size use 32;
   
   type FlowDirection_Ptr is access FlowDirection;
   
   type FocusState is (
      Unfocused,
      Pointer,
      Keyboard,
      Programmatic
   );
   for FocusState use (
      Unfocused => 0,
      Pointer => 1,
      Keyboard => 2,
      Programmatic => 3
   );
   for FocusState'Size use 32;
   
   type FocusState_Ptr is access FocusState;
   
   type FocusVisualKind is (
      DottedLine,
      HighVisibility
   );
   for FocusVisualKind use (
      DottedLine => 0,
      HighVisibility => 1
   );
   for FocusVisualKind'Size use 32;
   
   type FocusVisualKind_Ptr is access FocusVisualKind;
   
   type HorizontalAlignment is (
      Left,
      Center,
      Right,
      Stretch
   );
   for HorizontalAlignment use (
      Left => 0,
      Center => 1,
      Right => 2,
      Stretch => 3
   );
   for HorizontalAlignment'Size use 32;
   
   type HorizontalAlignment_Ptr is access HorizontalAlignment;
   
   type VerticalAlignment is (
      Top,
      Center,
      Bottom,
      Stretch
   );
   for VerticalAlignment use (
      Top => 0,
      Center => 1,
      Bottom => 2,
      Stretch => 3
   );
   for VerticalAlignment'Size use 32;
   
   type VerticalAlignment_Ptr is access VerticalAlignment;
   
   type Visibility is (
      Visible,
      Collapsed
   );
   for Visibility use (
      Visible => 0,
      Collapsed => 1
   );
   for Visibility'Size use 32;
   
   type Visibility_Ptr is access Visibility;
   
   type ApplicationHighContrastAdjustment is (
      None,
      Auto
   );
   for ApplicationHighContrastAdjustment use (
      None => 0,
      Auto => 4294967295
   );
   for ApplicationHighContrastAdjustment'Size use 32;
   
   type ApplicationHighContrastAdjustment_Ptr is access ApplicationHighContrastAdjustment;
   
   type ApplicationRequiresPointerMode is (
      Auto,
      WhenRequested
   );
   for ApplicationRequiresPointerMode use (
      Auto => 0,
      WhenRequested => 1
   );
   for ApplicationRequiresPointerMode'Size use 32;
   
   type ApplicationRequiresPointerMode_Ptr is access ApplicationRequiresPointerMode;
   
   type ApplicationTheme is (
      Light,
      Dark
   );
   for ApplicationTheme use (
      Light => 0,
      Dark => 1
   );
   for ApplicationTheme'Size use 32;
   
   type ApplicationTheme_Ptr is access ApplicationTheme;
   
   type AutomationTextAttributesEnum is (
      AnimationStyleAttribute,
      BackgroundColorAttribute,
      BulletStyleAttribute,
      CapStyleAttribute,
      CultureAttribute,
      FontNameAttribute,
      FontSizeAttribute,
      FontWeightAttribute,
      ForegroundColorAttribute,
      HorizontalTextAlignmentAttribute,
      IndentationFirstLineAttribute,
      IndentationLeadingAttribute,
      IndentationTrailingAttribute,
      IsHiddenAttribute,
      IsItalicAttribute,
      IsReadOnlyAttribute,
      IsSubscriptAttribute,
      IsSuperscriptAttribute,
      MarginBottomAttribute,
      MarginLeadingAttribute,
      MarginTopAttribute,
      MarginTrailingAttribute,
      OutlineStylesAttribute,
      OverlineColorAttribute,
      OverlineStyleAttribute,
      StrikethroughColorAttribute,
      StrikethroughStyleAttribute,
      TabsAttribute,
      TextFlowDirectionsAttribute,
      UnderlineColorAttribute,
      UnderlineStyleAttribute,
      AnnotationTypesAttribute,
      AnnotationObjectsAttribute,
      StyleNameAttribute,
      StyleIdAttribute,
      LinkAttribute,
      IsActiveAttribute,
      SelectionActiveEndAttribute,
      CaretPositionAttribute,
      CaretBidiModeAttribute
   );
   for AutomationTextAttributesEnum use (
      AnimationStyleAttribute => 40000,
      BackgroundColorAttribute => 40001,
      BulletStyleAttribute => 40002,
      CapStyleAttribute => 40003,
      CultureAttribute => 40004,
      FontNameAttribute => 40005,
      FontSizeAttribute => 40006,
      FontWeightAttribute => 40007,
      ForegroundColorAttribute => 40008,
      HorizontalTextAlignmentAttribute => 40009,
      IndentationFirstLineAttribute => 40010,
      IndentationLeadingAttribute => 40011,
      IndentationTrailingAttribute => 40012,
      IsHiddenAttribute => 40013,
      IsItalicAttribute => 40014,
      IsReadOnlyAttribute => 40015,
      IsSubscriptAttribute => 40016,
      IsSuperscriptAttribute => 40017,
      MarginBottomAttribute => 40018,
      MarginLeadingAttribute => 40019,
      MarginTopAttribute => 40020,
      MarginTrailingAttribute => 40021,
      OutlineStylesAttribute => 40022,
      OverlineColorAttribute => 40023,
      OverlineStyleAttribute => 40024,
      StrikethroughColorAttribute => 40025,
      StrikethroughStyleAttribute => 40026,
      TabsAttribute => 40027,
      TextFlowDirectionsAttribute => 40028,
      UnderlineColorAttribute => 40029,
      UnderlineStyleAttribute => 40030,
      AnnotationTypesAttribute => 40031,
      AnnotationObjectsAttribute => 40032,
      StyleNameAttribute => 40033,
      StyleIdAttribute => 40034,
      LinkAttribute => 40035,
      IsActiveAttribute => 40036,
      SelectionActiveEndAttribute => 40037,
      CaretPositionAttribute => 40038,
      CaretBidiModeAttribute => 40039
   );
   for AutomationTextAttributesEnum'Size use 32;
   
   type AutomationTextAttributesEnum_Ptr is access AutomationTextAttributesEnum;
   
   type ElementSoundPlayerState is (
      Auto,
      Off,
      On
   );
   for ElementSoundPlayerState use (
      Auto => 0,
      Off => 1,
      On => 2
   );
   for ElementSoundPlayerState'Size use 32;
   
   type ElementSoundPlayerState_Ptr is access ElementSoundPlayerState;
   
   type FontCapitals is (
      Normal,
      AllSmallCaps,
      SmallCaps,
      AllPetiteCaps,
      PetiteCaps,
      Unicase,
      Titling
   );
   for FontCapitals use (
      Normal => 0,
      AllSmallCaps => 1,
      SmallCaps => 2,
      AllPetiteCaps => 3,
      PetiteCaps => 4,
      Unicase => 5,
      Titling => 6
   );
   for FontCapitals'Size use 32;
   
   type FontCapitals_Ptr is access FontCapitals;
   
   type FontEastAsianLanguage is (
      Normal,
      HojoKanji,
      Jis04,
      Jis78,
      Jis83,
      Jis90,
      NlcKanji,
      Simplified,
      Traditional,
      TraditionalNames
   );
   for FontEastAsianLanguage use (
      Normal => 0,
      HojoKanji => 1,
      Jis04 => 2,
      Jis78 => 3,
      Jis83 => 4,
      Jis90 => 5,
      NlcKanji => 6,
      Simplified => 7,
      Traditional => 8,
      TraditionalNames => 9
   );
   for FontEastAsianLanguage'Size use 32;
   
   type FontEastAsianLanguage_Ptr is access FontEastAsianLanguage;
   
   type FontEastAsianWidths is (
      Normal,
      Full,
      Half,
      Proportional,
      Quarter,
      Third
   );
   for FontEastAsianWidths use (
      Normal => 0,
      Full => 1,
      Half => 2,
      Proportional => 3,
      Quarter => 4,
      Third => 5
   );
   for FontEastAsianWidths'Size use 32;
   
   type FontEastAsianWidths_Ptr is access FontEastAsianWidths;
   
   type FontFraction is (
      Normal,
      Stacked,
      Slashed
   );
   for FontFraction use (
      Normal => 0,
      Stacked => 1,
      Slashed => 2
   );
   for FontFraction'Size use 32;
   
   type FontFraction_Ptr is access FontFraction;
   
   type FontNumeralAlignment is (
      Normal,
      Proportional,
      Tabular
   );
   for FontNumeralAlignment use (
      Normal => 0,
      Proportional => 1,
      Tabular => 2
   );
   for FontNumeralAlignment'Size use 32;
   
   type FontNumeralAlignment_Ptr is access FontNumeralAlignment;
   
   type FontNumeralStyle is (
      Normal,
      Lining,
      OldStyle
   );
   for FontNumeralStyle use (
      Normal => 0,
      Lining => 1,
      OldStyle => 2
   );
   for FontNumeralStyle'Size use 32;
   
   type FontNumeralStyle_Ptr is access FontNumeralStyle;
   
   type FontVariants is (
      Normal,
      Superscript,
      Subscript,
      Ordinal,
      Inferior,
      Ruby
   );
   for FontVariants use (
      Normal => 0,
      Superscript => 1,
      Subscript => 2,
      Ordinal => 3,
      Inferior => 4,
      Ruby => 5
   );
   for FontVariants'Size use 32;
   
   type FontVariants_Ptr is access FontVariants;
   
   type GridUnitType is (
      Auto,
      Pixel,
      Star
   );
   for GridUnitType use (
      Auto => 0,
      Pixel => 1,
      Star => 2
   );
   for GridUnitType'Size use 32;
   
   type GridUnitType_Ptr is access GridUnitType;
   
   type LineStackingStrategy is (
      MaxHeight,
      BlockLineHeight,
      BaselineToBaseline
   );
   for LineStackingStrategy use (
      MaxHeight => 0,
      BlockLineHeight => 1,
      BaselineToBaseline => 2
   );
   for LineStackingStrategy'Size use 32;
   
   type LineStackingStrategy_Ptr is access LineStackingStrategy;
   
   type OpticalMarginAlignment is (
      None,
      TrimSideBearings
   );
   for OpticalMarginAlignment use (
      None => 0,
      TrimSideBearings => 1
   );
   for OpticalMarginAlignment'Size use 32;
   
   type OpticalMarginAlignment_Ptr is access OpticalMarginAlignment;
   
   
   type TextAlignment is new Windows.Int32;
   
   type TextAlignment_Ptr is access TextAlignment;
   
   type TextLineBounds is (
      Full,
      TrimToCapHeight,
      TrimToBaseline,
      Tight
   );
   for TextLineBounds use (
      Full => 0,
      TrimToCapHeight => 1,
      TrimToBaseline => 2,
      Tight => 3
   );
   for TextLineBounds'Size use 32;
   
   type TextLineBounds_Ptr is access TextLineBounds;
   
   type TextReadingOrder is (
      UseFlowDirection,
      DetectFromContent
   );
   for TextReadingOrder use (
      UseFlowDirection => 0,
      DetectFromContent => 1
   );
   for TextReadingOrder'Size use 32;
   
   type TextReadingOrder_Ptr is access TextReadingOrder;
   
   type TextTrimming is (
      None,
      CharacterEllipsis,
      WordEllipsis,
      Clip
   );
   for TextTrimming use (
      None => 0,
      CharacterEllipsis => 1,
      WordEllipsis => 2,
      Clip => 3
   );
   for TextTrimming'Size use 32;
   
   type TextTrimming_Ptr is access TextTrimming;
   
   type TextWrapping is (
      NoWrap,
      Wrap,
      WrapWholeWords
   );
   for TextWrapping use (
      NoWrap => 1,
      Wrap => 2,
      WrapWholeWords => 3
   );
   for TextWrapping'Size use 32;
   
   type TextWrapping_Ptr is access TextWrapping;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CornerRadius is record
      TopLeft : Windows.Double;
      TopRight : Windows.Double;
      BottomRight : Windows.Double;
      BottomLeft : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , CornerRadius);
   
   type CornerRadius_Ptr is access CornerRadius;
   
   type Duration is record
      TimeSpan : Windows.Foundation.TimeSpan;
      Type_x : Windows.UI.Xaml.DurationType;
   end record;
   pragma Convention (C_Pass_By_Copy , Duration);
   
   type Duration_Ptr is access Duration;
   
   type Thickness is record
      Left : Windows.Double;
      Top : Windows.Double;
      Right : Windows.Double;
      Bottom : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , Thickness);
   
   type Thickness_Ptr is access Thickness;
   
   type GridLength is record
      Value : Windows.Double;
      GridUnitType_x : Windows.UI.Xaml.GridUnitType;
   end record;
   pragma Convention (C_Pass_By_Copy , GridLength);
   
   type GridLength_Ptr is access GridLength;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type ApplicationInitializationCallback_Interface;
   type ApplicationInitializationCallback is access all ApplicationInitializationCallback_Interface'Class;
   type ApplicationInitializationCallback_Ptr is access all ApplicationInitializationCallback;
   type CreateDefaultValueCallback_Interface;
   type CreateDefaultValueCallback is access all CreateDefaultValueCallback_Interface'Class;
   type CreateDefaultValueCallback_Ptr is access all CreateDefaultValueCallback;
   type DependencyPropertyChangedCallback_Interface;
   type DependencyPropertyChangedCallback is access all DependencyPropertyChangedCallback_Interface'Class;
   type DependencyPropertyChangedCallback_Ptr is access all DependencyPropertyChangedCallback;
   type DependencyPropertyChangedEventHandler_Interface;
   type DependencyPropertyChangedEventHandler is access all DependencyPropertyChangedEventHandler_Interface'Class;
   type DependencyPropertyChangedEventHandler_Ptr is access all DependencyPropertyChangedEventHandler;
   type DragEventHandler_Interface;
   type DragEventHandler is access all DragEventHandler_Interface'Class;
   type DragEventHandler_Ptr is access all DragEventHandler;
   type EnteredBackgroundEventHandler_Interface;
   type EnteredBackgroundEventHandler is access all EnteredBackgroundEventHandler_Interface'Class;
   type EnteredBackgroundEventHandler_Ptr is access all EnteredBackgroundEventHandler;
   type ExceptionRoutedEventHandler_Interface;
   type ExceptionRoutedEventHandler is access all ExceptionRoutedEventHandler_Interface'Class;
   type ExceptionRoutedEventHandler_Ptr is access all ExceptionRoutedEventHandler;
   type LeavingBackgroundEventHandler_Interface;
   type LeavingBackgroundEventHandler is access all LeavingBackgroundEventHandler_Interface'Class;
   type LeavingBackgroundEventHandler_Ptr is access all LeavingBackgroundEventHandler;
   type PropertyChangedCallback_Interface;
   type PropertyChangedCallback is access all PropertyChangedCallback_Interface'Class;
   type PropertyChangedCallback_Ptr is access all PropertyChangedCallback;
   type RoutedEventHandler_Interface;
   type RoutedEventHandler is access all RoutedEventHandler_Interface'Class;
   type RoutedEventHandler_Ptr is access all RoutedEventHandler;
   type SizeChangedEventHandler_Interface;
   type SizeChangedEventHandler is access all SizeChangedEventHandler_Interface'Class;
   type SizeChangedEventHandler_Ptr is access all SizeChangedEventHandler;
   type SuspendingEventHandler_Interface;
   type SuspendingEventHandler is access all SuspendingEventHandler_Interface'Class;
   type SuspendingEventHandler_Ptr is access all SuspendingEventHandler;
   type UnhandledExceptionEventHandler_Interface;
   type UnhandledExceptionEventHandler is access all UnhandledExceptionEventHandler_Interface'Class;
   type UnhandledExceptionEventHandler_Ptr is access all UnhandledExceptionEventHandler;
   type VisualStateChangedEventHandler_Interface;
   type VisualStateChangedEventHandler is access all VisualStateChangedEventHandler_Interface'Class;
   type VisualStateChangedEventHandler_Ptr is access all VisualStateChangedEventHandler;
   type WindowActivatedEventHandler_Interface;
   type WindowActivatedEventHandler is access all WindowActivatedEventHandler_Interface'Class;
   type WindowActivatedEventHandler_Ptr is access all WindowActivatedEventHandler;
   type WindowClosedEventHandler_Interface;
   type WindowClosedEventHandler is access all WindowClosedEventHandler_Interface'Class;
   type WindowClosedEventHandler_Ptr is access all WindowClosedEventHandler;
   type WindowSizeChangedEventHandler_Interface;
   type WindowSizeChangedEventHandler is access all WindowSizeChangedEventHandler_Interface'Class;
   type WindowSizeChangedEventHandler_Ptr is access all WindowSizeChangedEventHandler;
   type WindowVisibilityChangedEventHandler_Interface;
   type WindowVisibilityChangedEventHandler is access all WindowVisibilityChangedEventHandler_Interface'Class;
   type WindowVisibilityChangedEventHandler_Ptr is access all WindowVisibilityChangedEventHandler;
   type BindingFailedEventHandler_Interface;
   type BindingFailedEventHandler is access all BindingFailedEventHandler_Interface'Class;
   type BindingFailedEventHandler_Ptr is access all BindingFailedEventHandler;
   type TypedEventHandler_IUIElement3_add_DragStarting_Interface;
   type TypedEventHandler_IUIElement3_add_DragStarting is access all TypedEventHandler_IUIElement3_add_DragStarting_Interface'Class;
   type TypedEventHandler_IUIElement3_add_DragStarting_Ptr is access all TypedEventHandler_IUIElement3_add_DragStarting;
   type TypedEventHandler_IUIElement3_add_DropCompleted_Interface;
   type TypedEventHandler_IUIElement3_add_DropCompleted is access all TypedEventHandler_IUIElement3_add_DropCompleted_Interface'Class;
   type TypedEventHandler_IUIElement3_add_DropCompleted_Ptr is access all TypedEventHandler_IUIElement3_add_DropCompleted;
   type TypedEventHandler_IUIElement4_add_ContextRequested_Interface;
   type TypedEventHandler_IUIElement4_add_ContextRequested is access all TypedEventHandler_IUIElement4_add_ContextRequested_Interface'Class;
   type TypedEventHandler_IUIElement4_add_ContextRequested_Ptr is access all TypedEventHandler_IUIElement4_add_ContextRequested;
   type TypedEventHandler_IUIElement4_add_ContextCanceled_Interface;
   type TypedEventHandler_IUIElement4_add_ContextCanceled is access all TypedEventHandler_IUIElement4_add_ContextCanceled_Interface'Class;
   type TypedEventHandler_IUIElement4_add_ContextCanceled_Ptr is access all TypedEventHandler_IUIElement4_add_ContextCanceled;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Interface;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested is access all TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Interface'Class;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Ptr is access all TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Interface;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed is access all TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Interface'Class;
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Ptr is access all TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed;
   type TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Interface;
   type TypedEventHandler_IUIElement4_add_AccessKeyInvoked is access all TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Interface'Class;
   type TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Ptr is access all TypedEventHandler_IUIElement4_add_AccessKeyInvoked;
   type TypedEventHandler_IUIElement5_add_GettingFocus_Interface;
   type TypedEventHandler_IUIElement5_add_GettingFocus is access all TypedEventHandler_IUIElement5_add_GettingFocus_Interface'Class;
   type TypedEventHandler_IUIElement5_add_GettingFocus_Ptr is access all TypedEventHandler_IUIElement5_add_GettingFocus;
   type TypedEventHandler_IUIElement5_add_LosingFocus_Interface;
   type TypedEventHandler_IUIElement5_add_LosingFocus is access all TypedEventHandler_IUIElement5_add_LosingFocus_Interface'Class;
   type TypedEventHandler_IUIElement5_add_LosingFocus_Ptr is access all TypedEventHandler_IUIElement5_add_LosingFocus;
   type TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Interface;
   type TypedEventHandler_IUIElement5_add_NoFocusCandidateFound is access all TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Interface'Class;
   type TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Ptr is access all TypedEventHandler_IUIElement5_add_NoFocusCandidateFound;
   type TypedEventHandler_IUIElement7_add_CharacterReceived_Interface;
   type TypedEventHandler_IUIElement7_add_CharacterReceived is access all TypedEventHandler_IUIElement7_add_CharacterReceived_Interface'Class;
   type TypedEventHandler_IUIElement7_add_CharacterReceived_Ptr is access all TypedEventHandler_IUIElement7_add_CharacterReceived;
   type TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Interface;
   type TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators is access all TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Interface'Class;
   type TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Ptr is access all TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators;
   type TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Interface;
   type TypedEventHandler_IFrameworkElement2_add_DataContextChanged is access all TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Interface'Class;
   type TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Ptr is access all TypedEventHandler_IFrameworkElement2_add_DataContextChanged;
   type TypedEventHandler_IFrameworkElement3_add_Loading_Interface;
   type TypedEventHandler_IFrameworkElement3_add_Loading is access all TypedEventHandler_IFrameworkElement3_add_Loading_Interface'Class;
   type TypedEventHandler_IFrameworkElement3_add_Loading_Ptr is access all TypedEventHandler_IFrameworkElement3_add_Loading;
   type TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Interface;
   type TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged is access all TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Interface'Class;
   type TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Ptr is access all TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDataTemplateExtension_Interface;
   type IDataTemplateExtension is access all IDataTemplateExtension_Interface'Class;
   type IDataTemplateExtension_Ptr is access all IDataTemplateExtension;
   type IDataTemplate_Interface;
   type IDataTemplate is access all IDataTemplate_Interface'Class;
   type IDataTemplate_Ptr is access all IDataTemplate;
   type IDataTemplateFactory_Interface;
   type IDataTemplateFactory is access all IDataTemplateFactory_Interface'Class;
   type IDataTemplateFactory_Ptr is access all IDataTemplateFactory;
   type IDataTemplateStatics2_Interface;
   type IDataTemplateStatics2 is access all IDataTemplateStatics2_Interface'Class;
   type IDataTemplateStatics2_Ptr is access all IDataTemplateStatics2;
   type IDispatcherTimer_Interface;
   type IDispatcherTimer is access all IDispatcherTimer_Interface'Class;
   type IDispatcherTimer_Ptr is access all IDispatcherTimer;
   type IDispatcherTimerFactory_Interface;
   type IDispatcherTimerFactory is access all IDispatcherTimerFactory_Interface'Class;
   type IDispatcherTimerFactory_Ptr is access all IDispatcherTimerFactory;
   type ICornerRadiusHelper_Interface;
   type ICornerRadiusHelper is access all ICornerRadiusHelper_Interface'Class;
   type ICornerRadiusHelper_Ptr is access all ICornerRadiusHelper;
   type ICornerRadiusHelperStatics_Interface;
   type ICornerRadiusHelperStatics is access all ICornerRadiusHelperStatics_Interface'Class;
   type ICornerRadiusHelperStatics_Ptr is access all ICornerRadiusHelperStatics;
   type IDurationHelper_Interface;
   type IDurationHelper is access all IDurationHelper_Interface'Class;
   type IDurationHelper_Ptr is access all IDurationHelper;
   type IDurationHelperStatics_Interface;
   type IDurationHelperStatics is access all IDurationHelperStatics_Interface'Class;
   type IDurationHelperStatics_Ptr is access all IDurationHelperStatics;
   type IThicknessHelper_Interface;
   type IThicknessHelper is access all IThicknessHelper_Interface'Class;
   type IThicknessHelper_Ptr is access all IThicknessHelper;
   type IThicknessHelperStatics_Interface;
   type IThicknessHelperStatics is access all IThicknessHelperStatics_Interface'Class;
   type IThicknessHelperStatics_Ptr is access all IThicknessHelperStatics;
   type IApplicationInitializationCallbackParams_Interface;
   type IApplicationInitializationCallbackParams is access all IApplicationInitializationCallbackParams_Interface'Class;
   type IApplicationInitializationCallbackParams_Ptr is access all IApplicationInitializationCallbackParams;
   type IBringIntoViewOptions_Interface;
   type IBringIntoViewOptions is access all IBringIntoViewOptions_Interface'Class;
   type IBringIntoViewOptions_Ptr is access all IBringIntoViewOptions;
   type IDataContextChangedEventArgs_Interface;
   type IDataContextChangedEventArgs is access all IDataContextChangedEventArgs_Interface'Class;
   type IDataContextChangedEventArgs_Ptr is access all IDataContextChangedEventArgs;
   type IDataTemplateKey_Interface;
   type IDataTemplateKey is access all IDataTemplateKey_Interface'Class;
   type IDataTemplateKey_Ptr is access all IDataTemplateKey;
   type IDataTemplateKeyFactory_Interface;
   type IDataTemplateKeyFactory is access all IDataTemplateKeyFactory_Interface'Class;
   type IDataTemplateKeyFactory_Ptr is access all IDataTemplateKeyFactory;
   type IDependencyObject_Interface;
   type IDependencyObject is access all IDependencyObject_Interface'Class;
   type IDependencyObject_Ptr is access all IDependencyObject;
   type IDependencyObjectFactory_Interface;
   type IDependencyObjectFactory is access all IDependencyObjectFactory_Interface'Class;
   type IDependencyObjectFactory_Ptr is access all IDependencyObjectFactory;
   type IDependencyObject2_Interface;
   type IDependencyObject2 is access all IDependencyObject2_Interface'Class;
   type IDependencyObject2_Ptr is access all IDependencyObject2;
   type IDependencyProperty_Interface;
   type IDependencyProperty is access all IDependencyProperty_Interface'Class;
   type IDependencyProperty_Ptr is access all IDependencyProperty;
   type IDependencyPropertyStatics_Interface;
   type IDependencyPropertyStatics is access all IDependencyPropertyStatics_Interface'Class;
   type IDependencyPropertyStatics_Ptr is access all IDependencyPropertyStatics;
   type IDependencyPropertyChangedEventArgs_Interface;
   type IDependencyPropertyChangedEventArgs is access all IDependencyPropertyChangedEventArgs_Interface'Class;
   type IDependencyPropertyChangedEventArgs_Ptr is access all IDependencyPropertyChangedEventArgs;
   type IDragOperationDeferral_Interface;
   type IDragOperationDeferral is access all IDragOperationDeferral_Interface'Class;
   type IDragOperationDeferral_Ptr is access all IDragOperationDeferral;
   type IDragUI_Interface;
   type IDragUI is access all IDragUI_Interface'Class;
   type IDragUI_Ptr is access all IDragUI;
   type IDragUIOverride_Interface;
   type IDragUIOverride is access all IDragUIOverride_Interface'Class;
   type IDragUIOverride_Ptr is access all IDragUIOverride;
   type IFrameworkView_Interface;
   type IFrameworkView is access all IFrameworkView_Interface'Class;
   type IFrameworkView_Ptr is access all IFrameworkView;
   type IPropertyMetadata_Interface;
   type IPropertyMetadata is access all IPropertyMetadata_Interface'Class;
   type IPropertyMetadata_Ptr is access all IPropertyMetadata;
   type IPropertyMetadataStatics_Interface;
   type IPropertyMetadataStatics is access all IPropertyMetadataStatics_Interface'Class;
   type IPropertyMetadataStatics_Ptr is access all IPropertyMetadataStatics;
   type IPropertyMetadataFactory_Interface;
   type IPropertyMetadataFactory is access all IPropertyMetadataFactory_Interface'Class;
   type IPropertyMetadataFactory_Ptr is access all IPropertyMetadataFactory;
   type IRoutedEvent_Interface;
   type IRoutedEvent is access all IRoutedEvent_Interface'Class;
   type IRoutedEvent_Ptr is access all IRoutedEvent;
   type IRoutedEventArgs_Interface;
   type IRoutedEventArgs is access all IRoutedEventArgs_Interface'Class;
   type IRoutedEventArgs_Ptr is access all IRoutedEventArgs;
   type IRoutedEventArgsFactory_Interface;
   type IRoutedEventArgsFactory is access all IRoutedEventArgsFactory_Interface'Class;
   type IRoutedEventArgsFactory_Ptr is access all IRoutedEventArgsFactory;
   type ISetterBaseCollection_Interface;
   type ISetterBaseCollection is access all ISetterBaseCollection_Interface'Class;
   type ISetterBaseCollection_Ptr is access all ISetterBaseCollection;
   type IVector_SetterBase_Interface;
   type IVector_SetterBase is access all IVector_SetterBase_Interface'Class;
   type IVector_SetterBase_Ptr is access all IVector_SetterBase;
   type IIterable_SetterBase_Interface;
   type IIterable_SetterBase is access all IIterable_SetterBase_Interface'Class;
   type IIterable_SetterBase_Ptr is access all IIterable_SetterBase;
   type ITargetPropertyPath_Interface;
   type ITargetPropertyPath is access all ITargetPropertyPath_Interface'Class;
   type ITargetPropertyPath_Ptr is access all ITargetPropertyPath;
   type ITargetPropertyPathFactory_Interface;
   type ITargetPropertyPathFactory is access all ITargetPropertyPathFactory_Interface'Class;
   type ITargetPropertyPathFactory_Ptr is access all ITargetPropertyPathFactory;
   type IVector_TriggerAction_Interface;
   type IVector_TriggerAction is access all IVector_TriggerAction_Interface'Class;
   type IVector_TriggerAction_Ptr is access all IVector_TriggerAction;
   type IIterable_TriggerAction_Interface;
   type IIterable_TriggerAction is access all IIterable_TriggerAction_Interface'Class;
   type IIterable_TriggerAction_Ptr is access all IIterable_TriggerAction;
   type IVector_TriggerBase_Interface;
   type IVector_TriggerBase is access all IVector_TriggerBase_Interface'Class;
   type IVector_TriggerBase_Ptr is access all IVector_TriggerBase;
   type IIterable_TriggerBase_Interface;
   type IIterable_TriggerBase is access all IIterable_TriggerBase_Interface'Class;
   type IIterable_TriggerBase_Ptr is access all IIterable_TriggerBase;
   type IUnhandledExceptionEventArgs_Interface;
   type IUnhandledExceptionEventArgs is access all IUnhandledExceptionEventArgs_Interface'Class;
   type IUnhandledExceptionEventArgs_Ptr is access all IUnhandledExceptionEventArgs;
   type IVisualStateChangedEventArgs_Interface;
   type IVisualStateChangedEventArgs is access all IVisualStateChangedEventArgs_Interface'Class;
   type IVisualStateChangedEventArgs_Ptr is access all IVisualStateChangedEventArgs;
   type IDependencyObjectCollectionFactory_Interface;
   type IDependencyObjectCollectionFactory is access all IDependencyObjectCollectionFactory_Interface'Class;
   type IDependencyObjectCollectionFactory_Ptr is access all IDependencyObjectCollectionFactory;
   type IObservableVector_DependencyObject_Interface;
   type IObservableVector_DependencyObject is access all IObservableVector_DependencyObject_Interface'Class;
   type IObservableVector_DependencyObject_Ptr is access all IObservableVector_DependencyObject;
   type IVector_DependencyObject_Interface;
   type IVector_DependencyObject is access all IVector_DependencyObject_Interface'Class;
   type IVector_DependencyObject_Ptr is access all IVector_DependencyObject;
   type IIterable_DependencyObject_Interface;
   type IIterable_DependencyObject is access all IIterable_DependencyObject_Interface'Class;
   type IIterable_DependencyObject_Ptr is access all IIterable_DependencyObject;
   type IDragEventArgs_Interface;
   type IDragEventArgs is access all IDragEventArgs_Interface'Class;
   type IDragEventArgs_Ptr is access all IDragEventArgs;
   type IDragEventArgs2_Interface;
   type IDragEventArgs2 is access all IDragEventArgs2_Interface'Class;
   type IDragEventArgs2_Ptr is access all IDragEventArgs2;
   type IDragEventArgs3_Interface;
   type IDragEventArgs3 is access all IDragEventArgs3_Interface'Class;
   type IDragEventArgs3_Ptr is access all IDragEventArgs3;
   type IDragStartingEventArgs_Interface;
   type IDragStartingEventArgs is access all IDragStartingEventArgs_Interface'Class;
   type IDragStartingEventArgs_Ptr is access all IDragStartingEventArgs;
   type IDragStartingEventArgs2_Interface;
   type IDragStartingEventArgs2 is access all IDragStartingEventArgs2_Interface'Class;
   type IDragStartingEventArgs2_Ptr is access all IDragStartingEventArgs2;
   type IDropCompletedEventArgs_Interface;
   type IDropCompletedEventArgs is access all IDropCompletedEventArgs_Interface'Class;
   type IDropCompletedEventArgs_Ptr is access all IDropCompletedEventArgs;
   type IExceptionRoutedEventArgs_Interface;
   type IExceptionRoutedEventArgs is access all IExceptionRoutedEventArgs_Interface'Class;
   type IExceptionRoutedEventArgs_Ptr is access all IExceptionRoutedEventArgs;
   type IExceptionRoutedEventArgsFactory_Interface;
   type IExceptionRoutedEventArgsFactory is access all IExceptionRoutedEventArgsFactory_Interface'Class;
   type IExceptionRoutedEventArgsFactory_Ptr is access all IExceptionRoutedEventArgsFactory;
   type IFrameworkTemplate_Interface;
   type IFrameworkTemplate is access all IFrameworkTemplate_Interface'Class;
   type IFrameworkTemplate_Ptr is access all IFrameworkTemplate;
   type IFrameworkTemplateFactory_Interface;
   type IFrameworkTemplateFactory is access all IFrameworkTemplateFactory_Interface'Class;
   type IFrameworkTemplateFactory_Ptr is access all IFrameworkTemplateFactory;
   type IPropertyPath_Interface;
   type IPropertyPath is access all IPropertyPath_Interface'Class;
   type IPropertyPath_Ptr is access all IPropertyPath;
   type IPropertyPathFactory_Interface;
   type IPropertyPathFactory is access all IPropertyPathFactory_Interface'Class;
   type IPropertyPathFactory_Ptr is access all IPropertyPathFactory;
   type IResourceDictionary_Interface;
   type IResourceDictionary is access all IResourceDictionary_Interface'Class;
   type IResourceDictionary_Ptr is access all IResourceDictionary;
   type IMap_Object_Object_Interface;
   type IMap_Object_Object is access all IMap_Object_Object_Interface'Class;
   type IMap_Object_Object_Ptr is access all IMap_Object_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IResourceDictionaryFactory_Interface;
   type IResourceDictionaryFactory is access all IResourceDictionaryFactory_Interface'Class;
   type IResourceDictionaryFactory_Ptr is access all IResourceDictionaryFactory;
   type ISetterBase_Interface;
   type ISetterBase is access all ISetterBase_Interface'Class;
   type ISetterBase_Ptr is access all ISetterBase;
   type ISetterBaseFactory_Interface;
   type ISetterBaseFactory is access all ISetterBaseFactory_Interface'Class;
   type ISetterBaseFactory_Ptr is access all ISetterBaseFactory;
   type ISizeChangedEventArgs_Interface;
   type ISizeChangedEventArgs is access all ISizeChangedEventArgs_Interface'Class;
   type ISizeChangedEventArgs_Ptr is access all ISizeChangedEventArgs;
   type IStateTriggerBase_Interface;
   type IStateTriggerBase is access all IStateTriggerBase_Interface'Class;
   type IStateTriggerBase_Ptr is access all IStateTriggerBase;
   type IStateTriggerBaseProtected_Interface;
   type IStateTriggerBaseProtected is access all IStateTriggerBaseProtected_Interface'Class;
   type IStateTriggerBaseProtected_Ptr is access all IStateTriggerBaseProtected;
   type IStateTriggerBaseFactory_Interface;
   type IStateTriggerBaseFactory is access all IStateTriggerBaseFactory_Interface'Class;
   type IStateTriggerBaseFactory_Ptr is access all IStateTriggerBaseFactory;
   type IStyle_Interface;
   type IStyle is access all IStyle_Interface'Class;
   type IStyle_Ptr is access all IStyle;
   type IStyleFactory_Interface;
   type IStyleFactory is access all IStyleFactory_Interface'Class;
   type IStyleFactory_Ptr is access all IStyleFactory;
   type ITriggerAction_Interface;
   type ITriggerAction is access all ITriggerAction_Interface'Class;
   type ITriggerAction_Ptr is access all ITriggerAction;
   type ITriggerActionFactory_Interface;
   type ITriggerActionFactory is access all ITriggerActionFactory_Interface'Class;
   type ITriggerActionFactory_Ptr is access all ITriggerActionFactory;
   type ITriggerBase_Interface;
   type ITriggerBase is access all ITriggerBase_Interface'Class;
   type ITriggerBase_Ptr is access all ITriggerBase;
   type ITriggerBaseFactory_Interface;
   type ITriggerBaseFactory is access all ITriggerBaseFactory_Interface'Class;
   type ITriggerBaseFactory_Ptr is access all ITriggerBaseFactory;
   type IUIElement_Interface;
   type IUIElement is access all IUIElement_Interface'Class;
   type IUIElement_Ptr is access all IUIElement;
   type IUIElementOverrides_Interface;
   type IUIElementOverrides is access all IUIElementOverrides_Interface'Class;
   type IUIElementOverrides_Ptr is access all IUIElementOverrides;
   type IUIElementStatics_Interface;
   type IUIElementStatics is access all IUIElementStatics_Interface'Class;
   type IUIElementStatics_Ptr is access all IUIElementStatics;
   type IUIElementFactory_Interface;
   type IUIElementFactory is access all IUIElementFactory_Interface'Class;
   type IUIElementFactory_Ptr is access all IUIElementFactory;
   type IUIElement2_Interface;
   type IUIElement2 is access all IUIElement2_Interface'Class;
   type IUIElement2_Ptr is access all IUIElement2;
   type IUIElementStatics2_Interface;
   type IUIElementStatics2 is access all IUIElementStatics2_Interface'Class;
   type IUIElementStatics2_Ptr is access all IUIElementStatics2;
   type IUIElement3_Interface;
   type IUIElement3 is access all IUIElement3_Interface'Class;
   type IUIElement3_Ptr is access all IUIElement3;
   type IUIElementStatics3_Interface;
   type IUIElementStatics3 is access all IUIElementStatics3_Interface'Class;
   type IUIElementStatics3_Ptr is access all IUIElementStatics3;
   type IUIElement4_Interface;
   type IUIElement4 is access all IUIElement4_Interface'Class;
   type IUIElement4_Ptr is access all IUIElement4;
   type IUIElementStatics4_Interface;
   type IUIElementStatics4 is access all IUIElementStatics4_Interface'Class;
   type IUIElementStatics4_Ptr is access all IUIElementStatics4;
   type IUIElement5_Interface;
   type IUIElement5 is access all IUIElement5_Interface'Class;
   type IUIElement5_Ptr is access all IUIElement5;
   type IUIElementStatics5_Interface;
   type IUIElementStatics5 is access all IUIElementStatics5_Interface'Class;
   type IUIElementStatics5_Ptr is access all IUIElementStatics5;
   type IUIElementStatics6_Interface;
   type IUIElementStatics6 is access all IUIElementStatics6_Interface'Class;
   type IUIElementStatics6_Ptr is access all IUIElementStatics6;
   type IUIElement7_Interface;
   type IUIElement7 is access all IUIElement7_Interface'Class;
   type IUIElement7_Ptr is access all IUIElement7;
   type IUIElementOverrides7_Interface;
   type IUIElementOverrides7 is access all IUIElementOverrides7_Interface'Class;
   type IUIElementOverrides7_Ptr is access all IUIElementOverrides7;
   type IUIElementStatics7_Interface;
   type IUIElementStatics7 is access all IUIElementStatics7_Interface'Class;
   type IUIElementStatics7_Ptr is access all IUIElementStatics7;
   type IVisualState_Interface;
   type IVisualState is access all IVisualState_Interface'Class;
   type IVisualState_Ptr is access all IVisualState;
   type IVisualState2_Interface;
   type IVisualState2 is access all IVisualState2_Interface'Class;
   type IVisualState2_Ptr is access all IVisualState2;
   type IVisualStateGroup_Interface;
   type IVisualStateGroup is access all IVisualStateGroup_Interface'Class;
   type IVisualStateGroup_Ptr is access all IVisualStateGroup;
   type IVisualTransition_Interface;
   type IVisualTransition is access all IVisualTransition_Interface'Class;
   type IVisualTransition_Ptr is access all IVisualTransition;
   type IVisualTransitionFactory_Interface;
   type IVisualTransitionFactory is access all IVisualTransitionFactory_Interface'Class;
   type IVisualTransitionFactory_Ptr is access all IVisualTransitionFactory;
   type IAdaptiveTrigger_Interface;
   type IAdaptiveTrigger is access all IAdaptiveTrigger_Interface'Class;
   type IAdaptiveTrigger_Ptr is access all IAdaptiveTrigger;
   type IAdaptiveTriggerStatics_Interface;
   type IAdaptiveTriggerStatics is access all IAdaptiveTriggerStatics_Interface'Class;
   type IAdaptiveTriggerStatics_Ptr is access all IAdaptiveTriggerStatics;
   type IAdaptiveTriggerFactory_Interface;
   type IAdaptiveTriggerFactory is access all IAdaptiveTriggerFactory_Interface'Class;
   type IAdaptiveTriggerFactory_Ptr is access all IAdaptiveTriggerFactory;
   type IEventTrigger_Interface;
   type IEventTrigger is access all IEventTrigger_Interface'Class;
   type IEventTrigger_Ptr is access all IEventTrigger;
   type IFrameworkElement_Interface;
   type IFrameworkElement is access all IFrameworkElement_Interface'Class;
   type IFrameworkElement_Ptr is access all IFrameworkElement;
   type IFrameworkElementOverrides_Interface;
   type IFrameworkElementOverrides is access all IFrameworkElementOverrides_Interface'Class;
   type IFrameworkElementOverrides_Ptr is access all IFrameworkElementOverrides;
   type IFrameworkElementStatics_Interface;
   type IFrameworkElementStatics is access all IFrameworkElementStatics_Interface'Class;
   type IFrameworkElementStatics_Ptr is access all IFrameworkElementStatics;
   type IFrameworkElementFactory_Interface;
   type IFrameworkElementFactory is access all IFrameworkElementFactory_Interface'Class;
   type IFrameworkElementFactory_Ptr is access all IFrameworkElementFactory;
   type IFrameworkElement2_Interface;
   type IFrameworkElement2 is access all IFrameworkElement2_Interface'Class;
   type IFrameworkElement2_Ptr is access all IFrameworkElement2;
   type IFrameworkElementOverrides2_Interface;
   type IFrameworkElementOverrides2 is access all IFrameworkElementOverrides2_Interface'Class;
   type IFrameworkElementOverrides2_Ptr is access all IFrameworkElementOverrides2;
   type IFrameworkElementStatics2_Interface;
   type IFrameworkElementStatics2 is access all IFrameworkElementStatics2_Interface'Class;
   type IFrameworkElementStatics2_Ptr is access all IFrameworkElementStatics2;
   type IFrameworkElement3_Interface;
   type IFrameworkElement3 is access all IFrameworkElement3_Interface'Class;
   type IFrameworkElement3_Ptr is access all IFrameworkElement3;
   type IFrameworkElement4_Interface;
   type IFrameworkElement4 is access all IFrameworkElement4_Interface'Class;
   type IFrameworkElement4_Ptr is access all IFrameworkElement4;
   type IFrameworkElementStatics4_Interface;
   type IFrameworkElementStatics4 is access all IFrameworkElementStatics4_Interface'Class;
   type IFrameworkElementStatics4_Ptr is access all IFrameworkElementStatics4;
   type IFrameworkElementStatics5_Interface;
   type IFrameworkElementStatics5 is access all IFrameworkElementStatics5_Interface'Class;
   type IFrameworkElementStatics5_Ptr is access all IFrameworkElementStatics5;
   type IFrameworkElement6_Interface;
   type IFrameworkElement6 is access all IFrameworkElement6_Interface'Class;
   type IFrameworkElement6_Ptr is access all IFrameworkElement6;
   type IFrameworkElementStatics6_Interface;
   type IFrameworkElementStatics6 is access all IFrameworkElementStatics6_Interface'Class;
   type IFrameworkElementStatics6_Ptr is access all IFrameworkElementStatics6;
   type IMediaFailedRoutedEventArgs_Interface;
   type IMediaFailedRoutedEventArgs is access all IMediaFailedRoutedEventArgs_Interface'Class;
   type IMediaFailedRoutedEventArgs_Ptr is access all IMediaFailedRoutedEventArgs;
   type ISetter_Interface;
   type ISetter is access all ISetter_Interface'Class;
   type ISetter_Ptr is access all ISetter;
   type ISetterFactory_Interface;
   type ISetterFactory is access all ISetterFactory_Interface'Class;
   type ISetterFactory_Ptr is access all ISetterFactory;
   type ISetter2_Interface;
   type ISetter2 is access all ISetter2_Interface'Class;
   type ISetter2_Ptr is access all ISetter2;
   type IStateTrigger_Interface;
   type IStateTrigger is access all IStateTrigger_Interface'Class;
   type IStateTrigger_Ptr is access all IStateTrigger;
   type IStateTriggerStatics_Interface;
   type IStateTriggerStatics is access all IStateTriggerStatics_Interface'Class;
   type IStateTriggerStatics_Ptr is access all IStateTriggerStatics;
   type IGridLengthHelper_Interface;
   type IGridLengthHelper is access all IGridLengthHelper_Interface'Class;
   type IGridLengthHelper_Ptr is access all IGridLengthHelper;
   type IGridLengthHelperStatics_Interface;
   type IGridLengthHelperStatics is access all IGridLengthHelperStatics_Interface'Class;
   type IGridLengthHelperStatics_Ptr is access all IGridLengthHelperStatics;
   type IBindingFailedEventArgs_Interface;
   type IBindingFailedEventArgs is access all IBindingFailedEventArgs_Interface'Class;
   type IBindingFailedEventArgs_Ptr is access all IBindingFailedEventArgs;
   type IDebugSettings_Interface;
   type IDebugSettings is access all IDebugSettings_Interface'Class;
   type IDebugSettings_Ptr is access all IDebugSettings;
   type IDebugSettings2_Interface;
   type IDebugSettings2 is access all IDebugSettings2_Interface'Class;
   type IDebugSettings2_Ptr is access all IDebugSettings2;
   type IDebugSettings3_Interface;
   type IDebugSettings3 is access all IDebugSettings3_Interface'Class;
   type IDebugSettings3_Ptr is access all IDebugSettings3;
   type IElementSoundPlayer_Interface;
   type IElementSoundPlayer is access all IElementSoundPlayer_Interface'Class;
   type IElementSoundPlayer_Ptr is access all IElementSoundPlayer;
   type IElementSoundPlayerStatics_Interface;
   type IElementSoundPlayerStatics is access all IElementSoundPlayerStatics_Interface'Class;
   type IElementSoundPlayerStatics_Ptr is access all IElementSoundPlayerStatics;
   type IApplication_Interface;
   type IApplication is access all IApplication_Interface'Class;
   type IApplication_Ptr is access all IApplication;
   type IApplicationOverrides_Interface;
   type IApplicationOverrides is access all IApplicationOverrides_Interface'Class;
   type IApplicationOverrides_Ptr is access all IApplicationOverrides;
   type IApplicationStatics_Interface;
   type IApplicationStatics is access all IApplicationStatics_Interface'Class;
   type IApplicationStatics_Ptr is access all IApplicationStatics;
   type IApplicationFactory_Interface;
   type IApplicationFactory is access all IApplicationFactory_Interface'Class;
   type IApplicationFactory_Ptr is access all IApplicationFactory;
   type IApplication2_Interface;
   type IApplication2 is access all IApplication2_Interface'Class;
   type IApplication2_Ptr is access all IApplication2;
   type IApplicationOverrides2_Interface;
   type IApplicationOverrides2 is access all IApplicationOverrides2_Interface'Class;
   type IApplicationOverrides2_Ptr is access all IApplicationOverrides2;
   type IApplication3_Interface;
   type IApplication3 is access all IApplication3_Interface'Class;
   type IApplication3_Ptr is access all IApplication3;
   type IFrameworkViewSource_Interface;
   type IFrameworkViewSource is access all IFrameworkViewSource_Interface'Class;
   type IFrameworkViewSource_Ptr is access all IFrameworkViewSource;
   type IPointHelper_Interface;
   type IPointHelper is access all IPointHelper_Interface'Class;
   type IPointHelper_Ptr is access all IPointHelper;
   type IPointHelperStatics_Interface;
   type IPointHelperStatics is access all IPointHelperStatics_Interface'Class;
   type IPointHelperStatics_Ptr is access all IPointHelperStatics;
   type IRectHelper_Interface;
   type IRectHelper is access all IRectHelper_Interface'Class;
   type IRectHelper_Ptr is access all IRectHelper;
   type IRectHelperStatics_Interface;
   type IRectHelperStatics is access all IRectHelperStatics_Interface'Class;
   type IRectHelperStatics_Ptr is access all IRectHelperStatics;
   type ISizeHelper_Interface;
   type ISizeHelper is access all ISizeHelper_Interface'Class;
   type ISizeHelper_Ptr is access all ISizeHelper;
   type ISizeHelperStatics_Interface;
   type ISizeHelperStatics is access all ISizeHelperStatics_Interface'Class;
   type ISizeHelperStatics_Ptr is access all ISizeHelperStatics;
   type IWindow_Interface;
   type IWindow is access all IWindow_Interface'Class;
   type IWindow_Ptr is access all IWindow;
   type IWindowStatics_Interface;
   type IWindowStatics is access all IWindowStatics_Interface'Class;
   type IWindowStatics_Ptr is access all IWindowStatics;
   type IWindow2_Interface;
   type IWindow2 is access all IWindow2_Interface'Class;
   type IWindow2_Ptr is access all IWindow2;
   type IWindow3_Interface;
   type IWindow3 is access all IWindow3_Interface'Class;
   type IWindow3_Ptr is access all IWindow3;
   type IWindowCreatedEventArgs_Interface;
   type IWindowCreatedEventArgs is access all IWindowCreatedEventArgs_Interface'Class;
   type IWindowCreatedEventArgs_Ptr is access all IWindowCreatedEventArgs;
   type IVisualStateManager_Interface;
   type IVisualStateManager is access all IVisualStateManager_Interface'Class;
   type IVisualStateManager_Ptr is access all IVisualStateManager;
   type IVisualStateManagerOverrides_Interface;
   type IVisualStateManagerOverrides is access all IVisualStateManagerOverrides_Interface'Class;
   type IVisualStateManagerOverrides_Ptr is access all IVisualStateManagerOverrides;
   type IVisualStateManagerProtected_Interface;
   type IVisualStateManagerProtected is access all IVisualStateManagerProtected_Interface'Class;
   type IVisualStateManagerProtected_Ptr is access all IVisualStateManagerProtected;
   type IVisualStateManagerStatics_Interface;
   type IVisualStateManagerStatics is access all IVisualStateManagerStatics_Interface'Class;
   type IVisualStateManagerStatics_Ptr is access all IVisualStateManagerStatics;
   type IVisualStateManagerFactory_Interface;
   type IVisualStateManagerFactory is access all IVisualStateManagerFactory_Interface'Class;
   type IVisualStateManagerFactory_Ptr is access all IVisualStateManagerFactory;
   type IFrameworkView_Imported_Interface;
   type IFrameworkView_Imported is access all IFrameworkView_Imported_Interface'Class;
   type IFrameworkView_Imported_Ptr is access all IFrameworkView_Imported;
   type IFrameworkViewSource_Imported_Interface;
   type IFrameworkViewSource_Imported is access all IFrameworkViewSource_Imported_Interface'Class;
   type IFrameworkViewSource_Imported_Ptr is access all IFrameworkViewSource_Imported;
   type IIterator_IUIElement_Interface;
   type IIterator_IUIElement is access all IIterator_IUIElement_Interface'Class;
   type IIterator_IUIElement_Ptr is access all IIterator_IUIElement;
   type IIterable_IUIElement_Interface;
   type IIterable_IUIElement is access all IIterable_IUIElement_Interface'Class;
   type IIterable_IUIElement_Ptr is access all IIterable_IUIElement;
   type IIterator_IResourceDictionary_Interface;
   type IIterator_IResourceDictionary is access all IIterator_IResourceDictionary_Interface'Class;
   type IIterator_IResourceDictionary_Ptr is access all IIterator_IResourceDictionary;
   type IIterable_IResourceDictionary_Interface;
   type IIterable_IResourceDictionary is access all IIterable_IResourceDictionary_Interface'Class;
   type IIterable_IResourceDictionary_Ptr is access all IIterable_IResourceDictionary;
   type IVectorView_IResourceDictionary_Interface;
   type IVectorView_IResourceDictionary is access all IVectorView_IResourceDictionary_Interface'Class;
   type IVectorView_IResourceDictionary_Ptr is access all IVectorView_IResourceDictionary;
   type IVector_IResourceDictionary_Interface;
   type IVector_IResourceDictionary is access all IVector_IResourceDictionary_Interface'Class;
   type IVector_IResourceDictionary_Ptr is access all IVector_IResourceDictionary;
   type IIterator_IDependencyObject_Interface;
   type IIterator_IDependencyObject is access all IIterator_IDependencyObject_Interface'Class;
   type IIterator_IDependencyObject_Ptr is access all IIterator_IDependencyObject;
   type IIterable_IDependencyObject_Interface;
   type IIterable_IDependencyObject is access all IIterable_IDependencyObject_Interface'Class;
   type IIterable_IDependencyObject_Ptr is access all IIterable_IDependencyObject;
   type IIterator_IStateTriggerBase_Interface;
   type IIterator_IStateTriggerBase is access all IIterator_IStateTriggerBase_Interface'Class;
   type IIterator_IStateTriggerBase_Ptr is access all IIterator_IStateTriggerBase;
   type IIterable_IStateTriggerBase_Interface;
   type IIterable_IStateTriggerBase is access all IIterable_IStateTriggerBase_Interface'Class;
   type IIterable_IStateTriggerBase_Ptr is access all IIterable_IStateTriggerBase;
   type IVectorView_IStateTriggerBase_Interface;
   type IVectorView_IStateTriggerBase is access all IVectorView_IStateTriggerBase_Interface'Class;
   type IVectorView_IStateTriggerBase_Ptr is access all IVectorView_IStateTriggerBase;
   type IVector_IStateTriggerBase_Interface;
   type IVector_IStateTriggerBase is access all IVector_IStateTriggerBase_Interface'Class;
   type IVector_IStateTriggerBase_Ptr is access all IVector_IStateTriggerBase;
   type IIterator_IVisualTransition_Interface;
   type IIterator_IVisualTransition is access all IIterator_IVisualTransition_Interface'Class;
   type IIterator_IVisualTransition_Ptr is access all IIterator_IVisualTransition;
   type IIterable_IVisualTransition_Interface;
   type IIterable_IVisualTransition is access all IIterable_IVisualTransition_Interface'Class;
   type IIterable_IVisualTransition_Ptr is access all IIterable_IVisualTransition;
   type IVectorView_IVisualTransition_Interface;
   type IVectorView_IVisualTransition is access all IVectorView_IVisualTransition_Interface'Class;
   type IVectorView_IVisualTransition_Ptr is access all IVectorView_IVisualTransition;
   type IVector_IVisualTransition_Interface;
   type IVector_IVisualTransition is access all IVector_IVisualTransition_Interface'Class;
   type IVector_IVisualTransition_Ptr is access all IVector_IVisualTransition;
   type IIterator_IVisualState_Interface;
   type IIterator_IVisualState is access all IIterator_IVisualState_Interface'Class;
   type IIterator_IVisualState_Ptr is access all IIterator_IVisualState;
   type IIterable_IVisualState_Interface;
   type IIterable_IVisualState is access all IIterable_IVisualState_Interface'Class;
   type IIterable_IVisualState_Ptr is access all IIterable_IVisualState;
   type IVectorView_IVisualState_Interface;
   type IVectorView_IVisualState is access all IVectorView_IVisualState_Interface'Class;
   type IVectorView_IVisualState_Ptr is access all IVectorView_IVisualState;
   type IVector_IVisualState_Interface;
   type IVector_IVisualState is access all IVector_IVisualState_Interface'Class;
   type IVector_IVisualState_Ptr is access all IVector_IVisualState;
   type IVectorView_IUIElement_Interface;
   type IVectorView_IUIElement is access all IVectorView_IUIElement_Interface'Class;
   type IVectorView_IUIElement_Ptr is access all IVectorView_IUIElement;
   type IVector_IUIElement_Interface;
   type IVector_IUIElement is access all IVector_IUIElement_Interface'Class;
   type IVector_IUIElement_Ptr is access all IVector_IUIElement;
   type IVectorView_IDependencyObject_Interface;
   type IVectorView_IDependencyObject is access all IVectorView_IDependencyObject_Interface'Class;
   type IVectorView_IDependencyObject_Ptr is access all IVectorView_IDependencyObject;
   type IVector_IDependencyObject_Interface;
   type IVector_IDependencyObject is access all IVector_IDependencyObject_Interface'Class;
   type IVector_IDependencyObject_Ptr is access all IVector_IDependencyObject;
   type IIterator_IVisualStateGroup_Interface;
   type IIterator_IVisualStateGroup is access all IIterator_IVisualStateGroup_Interface'Class;
   type IIterator_IVisualStateGroup_Ptr is access all IIterator_IVisualStateGroup;
   type IIterable_IVisualStateGroup_Interface;
   type IIterable_IVisualStateGroup is access all IIterable_IVisualStateGroup_Interface'Class;
   type IIterable_IVisualStateGroup_Ptr is access all IIterable_IVisualStateGroup;
   type IVectorView_IVisualStateGroup_Interface;
   type IVectorView_IVisualStateGroup is access all IVectorView_IVisualStateGroup_Interface'Class;
   type IVectorView_IVisualStateGroup_Ptr is access all IVectorView_IVisualStateGroup;
   type IVector_IVisualStateGroup_Interface;
   type IVector_IVisualStateGroup is access all IVector_IVisualStateGroup_Interface'Class;
   type IVector_IVisualStateGroup_Ptr is access all IVector_IVisualStateGroup;
   type IReference_Thickness_Interface;
   type IReference_Thickness is access all IReference_Thickness_Interface'Class;
   type IReference_Thickness_Ptr is access all IReference_Thickness;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplateExtension : aliased constant Windows.IID := (1499370823, 52735, 19346, (183, 115, 171, 57, 104, 120, 243, 83 ));
   
   type IDataTemplateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function ResetTemplate
   (
      This       : access IDataTemplateExtension_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ProcessBinding
   (
      This       : access IDataTemplateExtension_Interface
      ; phase : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ProcessBindings
   (
      This       : access IDataTemplateExtension_Interface
      ; arg : Windows.UI.Xaml.Controls.IContainerContentChangingEventArgs
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplate : aliased constant Windows.IID := (2568007367, 35509, 16664, (155, 198, 9, 244, 90, 53, 7, 61 ));
   
   type IDataTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadContent
   (
      This       : access IDataTemplate_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplateFactory : aliased constant Windows.IID := (1374526846, 11091, 18267, (156, 136, 12, 24, 50, 200, 53, 26 ));
   
   type IDataTemplateFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDataTemplateFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IDataTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplateStatics2 : aliased constant Windows.IID := (2331475315, 43521, 18206, (190, 221, 139, 173, 134, 33, 155, 119 ));
   
   type IDataTemplateStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtensionInstanceProperty
   (
      This       : access IDataTemplateStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetExtensionInstance
   (
      This       : access IDataTemplateStatics2_Interface
      ; element : Windows.UI.Xaml.IFrameworkElement
      ; RetVal : access Windows.UI.Xaml.IDataTemplateExtension
   )
   return Windows.HRESULT is abstract;
   
   function SetExtensionInstance
   (
      This       : access IDataTemplateStatics2_Interface
      ; element : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IDataTemplateExtension
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherTimer : aliased constant Windows.IID := (3512782406, 52514, 20319, (140, 151, 64, 230, 29, 163, 226, 220 ));
   
   type IDispatcherTimer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Interval
   (
      This       : access IDispatcherTimer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IDispatcherTimer_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IDispatcherTimer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Tick
   (
      This       : access IDispatcherTimer_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Tick
   (
      This       : access IDispatcherTimer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IDispatcherTimer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IDispatcherTimer_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherTimerFactory : aliased constant Windows.IID := (3918929518, 13862, 16442, (175, 224, 4, 13, 88, 22, 86, 50 ));
   
   type IDispatcherTimerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDispatcherTimerFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IDispatcherTimer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICornerRadiusHelper : aliased constant Windows.IID := (4252754306, 7387, 17032, (184, 200, 133, 238, 121, 41, 123, 252 ));
   
   type ICornerRadiusHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICornerRadiusHelperStatics : aliased constant Windows.IID := (4104255065, 54484, 17695, (163, 135, 214, 191, 75, 36, 81, 212 ));
   
   type ICornerRadiusHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromRadii
   (
      This       : access ICornerRadiusHelperStatics_Interface
      ; topLeft : Windows.Double
      ; topRight : Windows.Double
      ; bottomRight : Windows.Double
      ; bottomLeft : Windows.Double
      ; RetVal : access Windows.UI.Xaml.CornerRadius
   )
   return Windows.HRESULT is abstract;
   
   function FromUniformRadius
   (
      This       : access ICornerRadiusHelperStatics_Interface
      ; uniformRadius : Windows.Double
      ; RetVal : access Windows.UI.Xaml.CornerRadius
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDurationHelper : aliased constant Windows.IID := (633431455, 17559, 16693, (148, 15, 238, 150, 244, 214, 233, 52 ));
   
   type IDurationHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDurationHelperStatics : aliased constant Windows.IID := (3163031870, 13639, 20160, (181, 25, 255, 168, 249, 196, 131, 140 ));
   
   type IDurationHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Automatic
   (
      This       : access IDurationHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function get_Forever
   (
      This       : access IDurationHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function Compare
   (
      This       : access IDurationHelperStatics_Interface
      ; duration1 : Windows.UI.Xaml.Duration
      ; duration2 : Windows.UI.Xaml.Duration
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function FromTimeSpan
   (
      This       : access IDurationHelperStatics_Interface
      ; timeSpan : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function GetHasTimeSpan
   (
      This       : access IDurationHelperStatics_Interface
      ; target : Windows.UI.Xaml.Duration
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Add
   (
      This       : access IDurationHelperStatics_Interface
      ; target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access IDurationHelperStatics_Interface
      ; target : Windows.UI.Xaml.Duration
      ; value : Windows.UI.Xaml.Duration
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Subtract
   (
      This       : access IDurationHelperStatics_Interface
      ; target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IThicknessHelper : aliased constant Windows.IID := (2825629259, 7823, 20203, (144, 19, 11, 40, 56, 169, 123, 52 ));
   
   type IThicknessHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IThicknessHelperStatics : aliased constant Windows.IID := (3231259260, 1804, 19878, (135, 132, 1, 202, 128, 14, 183, 58 ));
   
   type IThicknessHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromLengths
   (
      This       : access IThicknessHelperStatics_Interface
      ; left : Windows.Double
      ; top : Windows.Double
      ; right : Windows.Double
      ; bottom : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function FromUniformLength
   (
      This       : access IThicknessHelperStatics_Interface
      ; uniformLength : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationInitializationCallbackParams : aliased constant Windows.IID := (1964734766, 22386, 17544, (139, 135, 245, 71, 250, 166, 68, 116 ));
   
   type IApplicationInitializationCallbackParams_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IBringIntoViewOptions : aliased constant Windows.IID := (431870389, 51147, 18137, (164, 221, 161, 187, 232, 62, 242, 251 ));
   
   type IBringIntoViewOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnimationDesired
   (
      This       : access IBringIntoViewOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AnimationDesired
   (
      This       : access IBringIntoViewOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetRect
   (
      This       : access IBringIntoViewOptions_Interface
      ; RetVal : access Windows.Foundation.IReference_Rect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetRect
   (
      This       : access IBringIntoViewOptions_Interface
      ; value : Windows.Foundation.IReference_Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataContextChangedEventArgs : aliased constant Windows.IID := (2108067361, 2959, 20383, (161, 67, 248, 231, 120, 1, 54, 162 ));
   
   type IDataContextChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewValue
   (
      This       : access IDataContextChangedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IDataContextChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IDataContextChangedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplateKey : aliased constant Windows.IID := (2268818472, 52459, 19297, (134, 250, 178, 206, 195, 156, 194, 250 ));
   
   type IDataTemplateKey_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataType
   (
      This       : access IDataTemplateKey_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_DataType
   (
      This       : access IDataTemplateKey_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTemplateKeyFactory : aliased constant Windows.IID := (3916114265, 55682, 16722, (145, 203, 222, 14, 77, 253, 118, 147 ));
   
   type IDataTemplateKeyFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDataTemplateKeyFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IDataTemplateKey
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithType
   (
      This       : access IDataTemplateKeyFactory_Interface
      ; dataType : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IDataTemplateKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyObject : aliased constant Windows.IID := (1548904037, 62990, 18706, (175, 89, 95, 224, 104, 15, 8, 157 ));
   
   type IDependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetValue
   (
      This       : access IDependencyObject_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IDependencyObject_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function ClearValue
   (
      This       : access IDependencyObject_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function ReadLocalValue
   (
      This       : access IDependencyObject_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetAnimationBaseValue
   (
      This       : access IDependencyObject_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access IDependencyObject_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyObjectFactory : aliased constant Windows.IID := (2583932818, 32138, 18743, (136, 79, 236, 243, 79, 224, 42, 203 ));
   
   type IDependencyObjectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDependencyObjectFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyObject2 : aliased constant Windows.IID := (704567389, 15650, 17313, (173, 208, 23, 2, 124, 8, 178, 18 ));
   
   type IDependencyObject2_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterPropertyChangedCallback
   (
      This       : access IDependencyObject2_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; callback : Windows.UI.Xaml.DependencyPropertyChangedCallback
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterPropertyChangedCallback
   (
      This       : access IDependencyObject2_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; token : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyProperty : aliased constant Windows.IID := (2242984304, 39876, 20118, (172, 241, 48, 200, 253, 61, 85, 200 ));
   
   type IDependencyProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMetadata
   (
      This       : access IDependencyProperty_Interface
      ; forType : Windows.UI.Xaml.Interop.TypeName
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyPropertyStatics : aliased constant Windows.IID := (1239806607, 33369, 19804, (170, 224, 131, 213, 109, 187, 104, 217 ));
   
   type IDependencyPropertyStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnsetValue
   (
      This       : access IDependencyPropertyStatics_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Register
   (
      This       : access IDependencyPropertyStatics_Interface
      ; name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; typeMetadata : Windows.UI.Xaml.IPropertyMetadata
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAttached
   (
      This       : access IDependencyPropertyStatics_Interface
      ; name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; defaultMetadata : Windows.UI.Xaml.IPropertyMetadata
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyPropertyChangedEventArgs : aliased constant Windows.IID := (2166434859, 9424, 18775, (171, 195, 34, 68, 112, 169, 58, 78 ));
   
   type IDependencyPropertyChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Property
   (
      This       : access IDependencyPropertyChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OldValue
   (
      This       : access IDependencyPropertyChangedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_NewValue
   (
      This       : access IDependencyPropertyChangedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragOperationDeferral : aliased constant Windows.IID := (3128159418, 7027, 16518, (179, 211, 194, 35, 190, 234, 22, 51 ));
   
   type IDragOperationDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IDragOperationDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragUI : aliased constant Windows.IID := (765188152, 31840, 18498, (145, 112, 52, 111, 225, 10, 34, 106 ));
   
   type IDragUI_Interface is interface and Windows.IInspectable_Interface;
   
   function SetContentFromBitmapImage
   (
      This       : access IDragUI_Interface
      ; bitmapImage : Windows.UI.Xaml.Media.Imaging.IBitmapImage
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromBitmapImageWithAnchorPoint
   (
      This       : access IDragUI_Interface
      ; bitmapImage : Windows.UI.Xaml.Media.Imaging.IBitmapImage
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromSoftwareBitmap
   (
      This       : access IDragUI_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromSoftwareBitmapWithAnchorPoint
   (
      This       : access IDragUI_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromDataPackage
   (
      This       : access IDragUI_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragUIOverride : aliased constant Windows.IID := (3178012154, 51553, 18529, (183, 165, 191, 79, 228, 168, 166, 239 ));
   
   type IDragUIOverride_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Caption
   (
      This       : access IDragUIOverride_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Caption
   (
      This       : access IDragUIOverride_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsContentVisible
   (
      This       : access IDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsContentVisible
   (
      This       : access IDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCaptionVisible
   (
      This       : access IDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCaptionVisible
   (
      This       : access IDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGlyphVisible
   (
      This       : access IDragUIOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsGlyphVisible
   (
      This       : access IDragUIOverride_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IDragUIOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromBitmapImage
   (
      This       : access IDragUIOverride_Interface
      ; bitmapImage : Windows.UI.Xaml.Media.Imaging.IBitmapImage
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromBitmapImageWithAnchorPoint
   (
      This       : access IDragUIOverride_Interface
      ; bitmapImage : Windows.UI.Xaml.Media.Imaging.IBitmapImage
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromSoftwareBitmap
   (
      This       : access IDragUIOverride_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function SetContentFromSoftwareBitmapWithAnchorPoint
   (
      This       : access IDragUIOverride_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; anchorPoint : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkView : aliased constant Windows.IID := (3719980619, 46595, 18346, (148, 45, 56, 51, 23, 79, 13, 128 ));
   
   type IFrameworkView_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyMetadata : aliased constant Windows.IID := (2169434893, 36120, 17546, (134, 68, 242, 203, 81, 231, 3, 128 ));
   
   type IPropertyMetadata_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultValue
   (
      This       : access IPropertyMetadata_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_CreateDefaultValueCallback
   (
      This       : access IPropertyMetadata_Interface
      ; RetVal : access Windows.UI.Xaml.CreateDefaultValueCallback
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyMetadataStatics : aliased constant Windows.IID := (989923194, 28166, 17897, (139, 92, 175, 36, 52, 88, 192, 98 ));
   
   type IPropertyMetadataStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithDefaultValue
   (
      This       : access IPropertyMetadataStatics_Interface
      ; defaultValue : Windows.Object
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithDefaultValueAndCallback
   (
      This       : access IPropertyMetadataStatics_Interface
      ; defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithFactory
   (
      This       : access IPropertyMetadataStatics_Interface
      ; createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithFactoryAndCallback
   (
      This       : access IPropertyMetadataStatics_Interface
      ; createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyMetadataFactory : aliased constant Windows.IID := (3250068672, 22477, 20271, (176, 169, 225, 128, 27, 40, 247, 107 ));
   
   type IPropertyMetadataFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithDefaultValue
   (
      This       : access IPropertyMetadataFactory_Interface
      ; defaultValue : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDefaultValueAndCallback
   (
      This       : access IPropertyMetadataFactory_Interface
      ; defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRoutedEvent : aliased constant Windows.IID := (2796705816, 17345, 19568, (134, 92, 123, 221, 90, 50, 227, 39 ));
   
   type IRoutedEvent_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRoutedEventArgs : aliased constant Windows.IID := (1553488582, 55298, 19256, (162, 35, 191, 7, 12, 67, 254, 223 ));
   
   type IRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OriginalSource
   (
      This       : access IRoutedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRoutedEventArgsFactory : aliased constant Windows.IID := (3055308167, 28901, 16686, (181, 32, 26, 65, 238, 118, 187, 244 ));
   
   type IRoutedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IRoutedEventArgsFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IRoutedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetterBaseCollection : aliased constant Windows.IID := (63179944, 37022, 16663, (129, 28, 164, 82, 148, 150, 189, 241 ));
   
   type ISetterBaseCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSealed
   (
      This       : access ISetterBaseCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_SetterBase : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_SetterBase_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_SetterBase_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_SetterBase_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_SetterBase_Interface
      ; RetVal : access Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_SetterBase_Interface
      ; value : Windows.UI.Xaml.ISetterBase
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_SetterBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_SetterBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_SetterBase_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_SetterBase_Interface
      ; value : Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_SetterBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_SetterBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_SetterBase_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.ISetterBase_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_SetterBase_Interface
      ; items : Windows.UI.Xaml.ISetterBase_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_SetterBase : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_SetterBase_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SetterBase_Interface
      ; RetVal : access Windows.UI.Xaml.ISetterBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetPropertyPath : aliased constant Windows.IID := (1081347982, 2143, 19693, (190, 112, 111, 71, 172, 241, 90, 208 ));
   
   type ITargetPropertyPath_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access ITargetPropertyPath_Interface
      ; RetVal : access Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function put_Path
   (
      This       : access ITargetPropertyPath_Interface
      ; value : Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function get_Target
   (
      This       : access ITargetPropertyPath_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Target
   (
      This       : access ITargetPropertyPath_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetPropertyPathFactory : aliased constant Windows.IID := (2297351368, 39394, 19012, (153, 7, 180, 75, 200, 110, 43, 190 ));
   
   type ITargetPropertyPathFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ITargetPropertyPathFactory_Interface
      ; targetProperty : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.UI.Xaml.ITargetPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_TriggerAction : aliased constant Windows.IID := (2760438621, 40956, 21072, (172, 25, 148, 22, 119, 123, 23, 90 ));
   
   type IVector_TriggerAction_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_TriggerAction_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_TriggerAction_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_TriggerAction_Interface
      ; RetVal : access Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_TriggerAction_Interface
      ; value : Windows.UI.Xaml.ITriggerAction
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_TriggerAction_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_TriggerAction_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_TriggerAction_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_TriggerAction_Interface
      ; value : Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_TriggerAction_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_TriggerAction_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_TriggerAction_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.ITriggerAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_TriggerAction_Interface
      ; items : Windows.UI.Xaml.ITriggerAction_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_TriggerAction : aliased constant Windows.IID := (2849195385, 35434, 22719, (133, 253, 15, 55, 50, 78, 35, 151 ));
   
   type IIterable_TriggerAction_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TriggerAction_Interface
      ; RetVal : access Windows.UI.Xaml.ITriggerAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_TriggerBase : aliased constant Windows.IID := (2437514811, 46987, 24502, (160, 161, 158, 191, 107, 188, 52, 7 ));
   
   type IVector_TriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_TriggerBase_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_TriggerBase_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_TriggerBase_Interface
      ; RetVal : access Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_TriggerBase_Interface
      ; value : Windows.UI.Xaml.ITriggerBase
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_TriggerBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_TriggerBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_TriggerBase_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_TriggerBase_Interface
      ; value : Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_TriggerBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_TriggerBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_TriggerBase_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.ITriggerBase_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_TriggerBase_Interface
      ; items : Windows.UI.Xaml.ITriggerBase_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_TriggerBase : aliased constant Windows.IID := (3600250447, 19989, 22664, (162, 165, 123, 76, 240, 235, 7, 165 ));
   
   type IIterable_TriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TriggerBase_Interface
      ; RetVal : access Windows.UI.Xaml.ITriggerBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUnhandledExceptionEventArgs : aliased constant Windows.IID := (1915758236, 1358, 19699, (134, 197, 190, 144, 235, 104, 99, 213 ));
   
   type IUnhandledExceptionEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exception
   (
      This       : access IUnhandledExceptionEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IUnhandledExceptionEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IUnhandledExceptionEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IUnhandledExceptionEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateChangedEventArgs : aliased constant Windows.IID := (4263602865, 62239, 18321, (137, 137, 199, 14, 29, 155, 89, 255 ));
   
   type IVisualStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldState
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function put_OldState
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; value : Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function get_NewState
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function put_NewState
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; value : Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function get_Control
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT is abstract;
   
   function put_Control
   (
      This       : access IVisualStateChangedEventArgs_Interface
      ; value : Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDependencyObjectCollectionFactory : aliased constant Windows.IID := (85883391, 45992, 18926, (181, 175, 172, 143, 104, 182, 73, 228 ));
   
   type IDependencyObjectCollectionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IDependencyObjectCollectionFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IObservableVector_DependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IObservableVector_DependencyObject : aliased constant Windows.IID := (4207342802, 38653, 23787, (128, 191, 70, 172, 101, 41, 252, 101 ));
   
   type IObservableVector_DependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_DependencyObject_Interface
      ; vhnd : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_DependencyObject_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_DependencyObject : aliased constant Windows.IID := (1998292350, 43868, 23992, (160, 33, 57, 124, 146, 205, 196, 76 ));
   
   type IVector_DependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_DependencyObject_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_DependencyObject_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_DependencyObject_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_DependencyObject_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_DependencyObject_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_DependencyObject_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_DependencyObject_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_DependencyObject_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_DependencyObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_DependencyObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_DependencyObject_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_DependencyObject_Interface
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_DependencyObject : aliased constant Windows.IID := (4134300627, 21940, 23483, (184, 42, 109, 156, 227, 131, 9, 26 ));
   
   type IIterable_DependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DependencyObject_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragEventArgs : aliased constant Windows.IID := (3024144323, 692, 18816, (147, 66, 37, 218, 225, 192, 241, 136 ));
   
   type IDragEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IDragEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IDragEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IDragEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IDragEventArgs_Interface
      ; value : Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access IDragEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragEventArgs2 : aliased constant Windows.IID := (640902744, 10519, 16669, (191, 195, 47, 34, 71, 28, 187, 231 ));
   
   type IDragEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataView
   (
      This       : access IDragEventArgs2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function get_DragUIOverride
   (
      This       : access IDragEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.IDragUIOverride
   )
   return Windows.HRESULT is abstract;
   
   function get_Modifiers
   (
      This       : access IDragEventArgs2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DragDrop.DragDropModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_AcceptedOperation
   (
      This       : access IDragEventArgs2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function put_AcceptedOperation
   (
      This       : access IDragEventArgs2_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDragEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.IDragOperationDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragEventArgs3 : aliased constant Windows.IID := (3494888390, 33049, 17018, (129, 82, 95, 149, 80, 204, 4, 22 ));
   
   type IDragEventArgs3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowedOperations
   (
      This       : access IDragEventArgs3_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragStartingEventArgs : aliased constant Windows.IID := (1744884730, 37048, 18169, (142, 48, 90, 194, 95, 115, 240, 249 ));
   
   type IDragStartingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cancel
   (
      This       : access IDragStartingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access IDragStartingEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IDragStartingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_DragUI
   (
      This       : access IDragStartingEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDragUI
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDragStartingEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDragOperationDeferral
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access IDragStartingEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragStartingEventArgs2 : aliased constant Windows.IID := (3629506702, 17590, 16913, (189, 11, 127, 221, 187, 110, 130, 49 ));
   
   type IDragStartingEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowedOperations
   (
      This       : access IDragStartingEventArgs2_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowedOperations
   (
      This       : access IDragStartingEventArgs2_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDropCompletedEventArgs : aliased constant Windows.IID := (1817166216, 38332, 16993, (158, 197, 33, 202, 182, 119, 183, 52 ));
   
   type IDropCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropResult
   (
      This       : access IDropCompletedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IExceptionRoutedEventArgs : aliased constant Windows.IID := (3718246762, 19298, 19052, (164, 157, 6, 113, 239, 97, 54, 190 ));
   
   type IExceptionRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorMessage
   (
      This       : access IExceptionRoutedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IExceptionRoutedEventArgsFactory : aliased constant Windows.IID := (3148448365, 23930, 17639, (184, 147, 178, 174, 13, 210, 66, 115 ));
   
   type IExceptionRoutedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkTemplate : aliased constant Windows.IID := (2715964632, 42054, 18983, (154, 157, 160, 245, 158, 18, 88, 165 ));
   
   type IFrameworkTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkTemplateFactory : aliased constant Windows.IID := (444113061, 37757, 18132, (131, 43, 148, 255, 20, 218, 176, 97 ));
   
   type IFrameworkTemplateFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IFrameworkTemplateFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IFrameworkTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyPath : aliased constant Windows.IID := (806247818, 8179, 19756, (149, 236, 39, 248, 29, 235, 172, 184 ));
   
   type IPropertyPath_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access IPropertyPath_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyPathFactory : aliased constant Windows.IID := (1313660825, 38950, 20054, (132, 124, 202, 5, 95, 22, 41, 5 ));
   
   type IPropertyPathFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPropertyPathFactory_Interface
      ; path : Windows.String
      ; RetVal : access Windows.UI.Xaml.IPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceDictionary : aliased constant Windows.IID := (3253358372, 55006, 16785, (142, 58, 244, 134, 1, 247, 72, 156 ));
   
   type IResourceDictionary_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IResourceDictionary_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IResourceDictionary_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_MergedDictionaries
   (
      This       : access IResourceDictionary_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IResourceDictionary -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ThemeDictionaries
   (
      This       : access IResourceDictionary_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_Object_Object : aliased constant Windows.IID := (4126577703, 21997, 21778, (132, 41, 212, 246, 98, 109, 252, 221 ));
   
   type IMap_Object_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_Object_Object_Interface
      ; key : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_Object_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_Object_Object_Interface
      ; key : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_Object_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_Object_Object_Interface
      ; key : Windows.Object
      ; value : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_Object_Object_Interface
      ; key : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_Object_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceDictionaryFactory : aliased constant Windows.IID := (3929422261, 12727, 17009, (146, 201, 124, 149, 132, 169, 28, 34 ));
   
   type IResourceDictionaryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IResourceDictionaryFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetterBase : aliased constant Windows.IID := (1099686524, 10948, 20258, (128, 151, 222, 163, 174, 235, 47, 179 ));
   
   type ISetterBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSealed
   (
      This       : access ISetterBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetterBaseFactory : aliased constant Windows.IID := (2180558176, 7400, 18077, (166, 103, 22, 227, 124, 239, 139, 169 ));
   
   type ISetterBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISizeChangedEventArgs : aliased constant Windows.IID := (3576770144, 23745, 17057, (146, 12, 26, 244, 107, 226, 249, 134 ));
   
   type ISizeChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreviousSize
   (
      This       : access ISizeChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_NewSize
   (
      This       : access ISizeChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStateTriggerBase : aliased constant Windows.IID := (1219626648, 44806, 18028, (128, 82, 147, 102, 109, 222, 14, 73 ));
   
   type IStateTriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IStateTriggerBaseProtected : aliased constant Windows.IID := (1010950739, 36116, 16918, (153, 76, 249, 147, 4, 41, 246, 229 ));
   
   type IStateTriggerBaseProtected_Interface is interface and Windows.IInspectable_Interface;
   
   function SetActive
   (
      This       : access IStateTriggerBaseProtected_Interface
      ; IsActive : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStateTriggerBaseFactory : aliased constant Windows.IID := (2534288459, 49071, 18352, (190, 66, 193, 215, 17, 187, 46, 159 ));
   
   type IStateTriggerBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IStateTriggerBaseFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStyle : aliased constant Windows.IID := (3299471909, 40375, 19069, (182, 209, 247, 78, 219, 146, 147, 194 ));
   
   type IStyle_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSealed
   (
      This       : access IStyle_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Setters
   (
      This       : access IStyle_Interface
      ; RetVal : access Windows.UI.Xaml.ISetterBaseCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetType
   (
      This       : access IStyle_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetType
   (
      This       : access IStyle_Interface
      ; value : Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function get_BasedOn
   (
      This       : access IStyle_Interface
      ; RetVal : access Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_BasedOn
   (
      This       : access IStyle_Interface
      ; value : Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is abstract;
   
   function Seal
   (
      This       : access IStyle_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStyleFactory : aliased constant Windows.IID := (2741511395, 15745, 19685, (170, 81, 139, 65, 15, 96, 47, 205 ));
   
   type IStyleFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IStyleFactory_Interface
      ; targetType : Windows.UI.Xaml.Interop.TypeName
      ; RetVal : access Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITriggerAction : aliased constant Windows.IID := (2730548994, 25557, 19270, (155, 131, 8, 104, 211, 7, 150, 33 ));
   
   type ITriggerAction_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITriggerActionFactory : aliased constant Windows.IID := (1758642361, 12937, 16719, (143, 110, 198, 185, 122, 237, 218, 3 ));
   
   type ITriggerActionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITriggerBase : aliased constant Windows.IID := (3890881071, 57062, 17299, (168, 178, 137, 35, 214, 65, 243, 149 ));
   
   type ITriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITriggerBaseFactory : aliased constant Windows.IID := (1782292055, 64605, 17104, (140, 185, 202, 80, 102, 122, 247, 70 ));
   
   type ITriggerBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement : aliased constant Windows.IID := (1735199721, 46684, 16838, (186, 64, 88, 207, 135, 242, 1, 193 ));
   
   type IUIElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredSize
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowDrop
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowDrop
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Opacity
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IUIElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Clip
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IRectangleGeometry
   )
   return Windows.HRESULT is abstract;
   
   function put_Clip
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Media.IRectangleGeometry
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderTransform
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function put_RenderTransform
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   function get_Projection
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IProjection
   )
   return Windows.HRESULT is abstract;
   
   function put_Projection
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Media.IProjection
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderTransformOrigin
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_RenderTransformOrigin
   (
      This       : access IUIElement_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHitTestVisible
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHitTestVisible
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Visibility
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Visibility
   )
   return Windows.HRESULT is abstract;
   
   function put_Visibility
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Visibility
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderSize
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_UseLayoutRounding
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_UseLayoutRounding
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Transitions
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IVector_Transition
   )
   return Windows.HRESULT is abstract;
   
   function put_Transitions
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IVector_Transition
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheMode
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ICacheMode
   )
   return Windows.HRESULT is abstract;
   
   function put_CacheMode
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Media.ICacheMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTapEnabled
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTapEnabled
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDoubleTapEnabled
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDoubleTapEnabled
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRightTapEnabled
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRightTapEnabled
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHoldingEnabled
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHoldingEnabled
   (
      This       : access IUIElement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationMode
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Input.ManipulationModes
   )
   return Windows.HRESULT is abstract;
   
   function put_ManipulationMode
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationModes
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCaptures
   (
      This       : access IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IVectorView_IPointer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyUp
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.KeyEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyUp
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyDown
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.KeyEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyDown
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GotFocus
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GotFocus
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LostFocus
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LostFocus
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DragEnter
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.DragEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragEnter
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DragLeave
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.DragEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragLeave
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DragOver
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.DragEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragOver
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Drop
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.DragEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Drop
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerPressed
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerPressed
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerMoved
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerMoved
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerReleased
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerReleased
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerEntered
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerEntered
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerExited
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerExited
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerCaptureLost
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerCaptureLost
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerCanceled
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerCanceled
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerWheelChanged
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.PointerEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerWheelChanged
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Tapped
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.TappedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Tapped
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DoubleTapped
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.DoubleTappedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DoubleTapped
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Holding
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.HoldingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Holding
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RightTapped
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.RightTappedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RightTapped
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationStarting
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationStartingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationStarting
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationInertiaStarting
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationInertiaStartingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationInertiaStarting
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationStarted
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationStartedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationStarted
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationDelta
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationDeltaEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationDelta
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationCompleted
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationCompletedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationCompleted
   (
      This       : access IUIElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Measure
   (
      This       : access IUIElement_Interface
      ; availableSize : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function Arrange
   (
      This       : access IUIElement_Interface
      ; finalRect : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CapturePointer
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.IPointer
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReleasePointerCapture
   (
      This       : access IUIElement_Interface
      ; value : Windows.UI.Xaml.Input.IPointer
   )
   return Windows.HRESULT is abstract;
   
   function ReleasePointerCaptures
   (
      This       : access IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AddHandler
   (
      This       : access IUIElement_Interface
      ; routedEvent : Windows.UI.Xaml.IRoutedEvent
      ; handler : Windows.Object
      ; handledEventsToo : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RemoveHandler
   (
      This       : access IUIElement_Interface
      ; routedEvent : Windows.UI.Xaml.IRoutedEvent
      ; handler : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function TransformToVisual
   (
      This       : access IUIElement_Interface
      ; visual : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Media.IGeneralTransform
   )
   return Windows.HRESULT is abstract;
   
   function InvalidateMeasure
   (
      This       : access IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function InvalidateArrange
   (
      This       : access IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function UpdateLayout
   (
      This       : access IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementOverrides : aliased constant Windows.IID := (1619865373, 30808, 19179, (137, 228, 181, 78, 44, 126, 211, 211 ));
   
   type IUIElementOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnCreateAutomationPeer
   (
      This       : access IUIElementOverrides_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.IAutomationPeer
   )
   return Windows.HRESULT is abstract;
   
   function OnDisconnectVisualChildren
   (
      This       : access IUIElementOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   function FindSubElementsForTouchTargeting
   (
      This       : access IUIElementOverrides_Interface
      ; point : Windows.Foundation.Point
      ; boundingRect : Windows.Foundation.Rect
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics : aliased constant Windows.IID := (1490245435, 62764, 17854, (152, 139, 165, 134, 149, 100, 135, 60 ));
   
   type IUIElementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyDownEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyUpEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerEnteredEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerPressedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerMovedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerReleasedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerExitedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCaptureLostEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCanceledEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerWheelChangedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_TappedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_DoubleTappedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_HoldingEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_RightTappedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationStartingEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationInertiaStartingEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationStartedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationDeltaEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationCompletedEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_DragEnterEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_DragLeaveEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_DragOverEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEvent
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowDropProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OpacityProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClipProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderTransformProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderTransformOriginProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHitTestVisibleProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibilityProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_UseLayoutRoundingProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitionsProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheModeProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTapEnabledProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDoubleTapEnabledProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRightTapEnabledProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHoldingEnabledProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationModeProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCapturesProperty
   (
      This       : access IUIElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementFactory : aliased constant Windows.IID := (3119420414, 41784, 16799, (172, 50, 145, 220, 170, 223, 93, 8 ));
   
   type IUIElementFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement2 : aliased constant Windows.IID := (1735199737, 46700, 16854, (186, 80, 88, 207, 135, 242, 1, 209 ));
   
   type IUIElement2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompositeMode
   (
      This       : access IUIElement2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ElementCompositeMode
   )
   return Windows.HRESULT is abstract;
   
   function put_CompositeMode
   (
      This       : access IUIElement2_Interface
      ; value : Windows.UI.Xaml.Media.ElementCompositeMode
   )
   return Windows.HRESULT is abstract;
   
   function CancelDirectManipulations
   (
      This       : access IUIElement2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics2 : aliased constant Windows.IID := (1490245451, 62780, 17854, (152, 155, 165, 134, 149, 100, 135, 76 ));
   
   type IUIElementStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompositeModeProperty
   (
      This       : access IUIElementStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement3 : aliased constant Windows.IID := (3156945137, 9970, 19115, (178, 86, 59, 83, 80, 136, 30, 55 ));
   
   type IUIElement3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Transform3D
   (
      This       : access IUIElement3_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.ITransform3D
   )
   return Windows.HRESULT is abstract;
   
   function put_Transform3D
   (
      This       : access IUIElement3_Interface
      ; value : Windows.UI.Xaml.Media.Media3D.ITransform3D
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDrag
   (
      This       : access IUIElement3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanDrag
   (
      This       : access IUIElement3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_DragStarting
   (
      This       : access IUIElement3_Interface
      ; value : TypedEventHandler_IUIElement3_add_DragStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DragStarting
   (
      This       : access IUIElement3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DropCompleted
   (
      This       : access IUIElement3_Interface
      ; value : TypedEventHandler_IUIElement3_add_DropCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DropCompleted
   (
      This       : access IUIElement3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartDragAsync
   (
      This       : access IUIElement3_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics3 : aliased constant Windows.IID := (3522722526, 60577, 17761, (163, 43, 100, 96, 27, 78, 5, 151 ));
   
   type IUIElementStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Transform3DProperty
   (
      This       : access IUIElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDragProperty
   (
      This       : access IUIElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function TryStartDirectManipulation
   (
      This       : access IUIElementStatics3_Interface
      ; value : Windows.UI.Xaml.Input.IPointer
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement4 : aliased constant Windows.IID := (1762942164, 6554, 18007, (158, 87, 233, 158, 143, 19, 103, 18 ));
   
   type IUIElement4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContextFlyout
   (
      This       : access IUIElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   function put_ContextFlyout
   (
      This       : access IUIElement4_Interface
      ; value : Windows.UI.Xaml.Controls.Primitives.IFlyoutBase
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitDisplayModeOnAccessKeyInvoked
   (
      This       : access IUIElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitDisplayModeOnAccessKeyInvoked
   (
      This       : access IUIElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAccessKeyScope
   (
      This       : access IUIElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAccessKeyScope
   (
      This       : access IUIElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyScopeOwner
   (
      This       : access IUIElement4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_AccessKeyScopeOwner
   (
      This       : access IUIElement4_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKey
   (
      This       : access IUIElement4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AccessKey
   (
      This       : access IUIElement4_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ContextRequested
   (
      This       : access IUIElement4_Interface
      ; value : TypedEventHandler_IUIElement4_add_ContextRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContextRequested
   (
      This       : access IUIElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ContextCanceled
   (
      This       : access IUIElement4_Interface
      ; value : TypedEventHandler_IUIElement4_add_ContextCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContextCanceled
   (
      This       : access IUIElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyDisplayRequested
   (
      This       : access IUIElement4_Interface
      ; value : TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyDisplayRequested
   (
      This       : access IUIElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyDisplayDismissed
   (
      This       : access IUIElement4_Interface
      ; value : TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyDisplayDismissed
   (
      This       : access IUIElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyInvoked
   (
      This       : access IUIElement4_Interface
      ; value : TypedEventHandler_IUIElement4_add_AccessKeyInvoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyInvoked
   (
      This       : access IUIElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics4 : aliased constant Windows.IID := (487947617, 5807, 16671, (183, 116, 39, 35, 117, 164, 172, 44 ));
   
   type IUIElementStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContextFlyoutProperty
   (
      This       : access IUIElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitDisplayModeOnAccessKeyInvokedProperty
   (
      This       : access IUIElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAccessKeyScopeProperty
   (
      This       : access IUIElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyScopeOwnerProperty
   (
      This       : access IUIElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyProperty
   (
      This       : access IUIElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement5 : aliased constant Windows.IID := (2397936578, 42380, 17491, (175, 15, 169, 46, 224, 109, 3, 23 ));
   
   type IUIElement5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Lights
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_IXamlLight -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipPlacementMode
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.KeyTipPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipPlacementMode
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.KeyTipPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipHorizontalOffset
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipHorizontalOffset
   (
      This       : access IUIElement5_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipVerticalOffset
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipVerticalOffset
   (
      This       : access IUIElement5_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusKeyboardNavigation
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusKeyboardNavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusKeyboardNavigation
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusKeyboardNavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUpNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusUpNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDownNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusDownNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusLeftNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusLeftNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRightNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusRightNavigationStrategy
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_HighContrastAdjustment
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.ElementHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   function put_HighContrastAdjustment
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.ElementHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   function get_TabFocusNavigation
   (
      This       : access IUIElement5_Interface
      ; RetVal : access Windows.UI.Xaml.Input.KeyboardNavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_TabFocusNavigation
   (
      This       : access IUIElement5_Interface
      ; value : Windows.UI.Xaml.Input.KeyboardNavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function add_GettingFocus
   (
      This       : access IUIElement5_Interface
      ; value : TypedEventHandler_IUIElement5_add_GettingFocus
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GettingFocus
   (
      This       : access IUIElement5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LosingFocus
   (
      This       : access IUIElement5_Interface
      ; value : TypedEventHandler_IUIElement5_add_LosingFocus
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LosingFocus
   (
      This       : access IUIElement5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NoFocusCandidateFound
   (
      This       : access IUIElement5_Interface
      ; value : TypedEventHandler_IUIElement5_add_NoFocusCandidateFound
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NoFocusCandidateFound
   (
      This       : access IUIElement5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartBringIntoView
   (
      This       : access IUIElement5_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartBringIntoViewWithOptions
   (
      This       : access IUIElement5_Interface
      ; options : Windows.UI.Xaml.IBringIntoViewOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics5 : aliased constant Windows.IID := (1505590673, 36771, 19557, (186, 27, 64, 223, 56, 85, 108, 187 ));
   
   type IUIElementStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LightsProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipPlacementModeProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipHorizontalOffsetProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipVerticalOffsetProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusKeyboardNavigationProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUpNavigationStrategyProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDownNavigationStrategyProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusLeftNavigationStrategyProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRightNavigationStrategyProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HighContrastAdjustmentProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TabFocusNavigationProperty
   (
      This       : access IUIElementStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics6 : aliased constant Windows.IID := (1685980087, 874, 19946, (149, 64, 29, 215, 253, 18, 102, 241 ));
   
   type IUIElementStatics6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GettingFocusEvent
   (
      This       : access IUIElementStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_LosingFocusEvent
   (
      This       : access IUIElementStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_NoFocusCandidateFoundEvent
   (
      This       : access IUIElementStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElement7 : aliased constant Windows.IID := (3405531496, 25449, 16969, (128, 249, 61, 101, 99, 25, 232, 17 ));
   
   type IUIElement7_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyboardAccelerators
   (
      This       : access IUIElement7_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IVector_IKeyboardAccelerator -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_CharacterReceived
   (
      This       : access IUIElement7_Interface
      ; value : TypedEventHandler_IUIElement7_add_CharacterReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CharacterReceived
   (
      This       : access IUIElement7_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProcessKeyboardAccelerators
   (
      This       : access IUIElement7_Interface
      ; value : TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProcessKeyboardAccelerators
   (
      This       : access IUIElement7_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PreviewKeyDown
   (
      This       : access IUIElement7_Interface
      ; value : Windows.UI.Xaml.Input.KeyEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PreviewKeyDown
   (
      This       : access IUIElement7_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PreviewKeyUp
   (
      This       : access IUIElement7_Interface
      ; value : Windows.UI.Xaml.Input.KeyEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PreviewKeyUp
   (
      This       : access IUIElement7_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryInvokeKeyboardAccelerator
   (
      This       : access IUIElement7_Interface
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementOverrides7 : aliased constant Windows.IID := (3112140648, 49819, 19609, (161, 195, 149, 38, 25, 214, 231, 32 ));
   
   type IUIElementOverrides7_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChildrenInTabFocusOrder
   (
      This       : access IUIElementOverrides7_Interface
      ; RetVal : access Windows.UI.Xaml.IIterable_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OnProcessKeyboardAccelerators
   (
      This       : access IUIElementOverrides7_Interface
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUIElementStatics7 : aliased constant Windows.IID := (3667608723, 42645, 16709, (174, 147, 136, 128, 36, 57, 106, 15 ));
   
   type IUIElementStatics7_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreviewKeyDownEvent
   (
      This       : access IUIElementStatics7_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterReceivedEvent
   (
      This       : access IUIElementStatics7_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviewKeyUpEvent
   (
      This       : access IUIElementStatics7_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualState : aliased constant Windows.IID := (1663086588, 49946, 17488, (175, 222, 246, 234, 123, 209, 245, 134 ));
   
   type IVisualState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IVisualState_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Storyboard
   (
      This       : access IVisualState_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   function put_Storyboard
   (
      This       : access IVisualState_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualState2 : aliased constant Windows.IID := (262207638, 25792, 17915, (141, 36, 251, 131, 41, 140, 13, 147 ));
   
   type IVisualState2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Setters
   (
      This       : access IVisualState2_Interface
      ; RetVal : access Windows.UI.Xaml.ISetterBaseCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_StateTriggers
   (
      This       : access IVisualState2_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IStateTriggerBase -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateGroup : aliased constant Windows.IID := (3841579428, 57384, 17630, (155, 21, 73, 41, 174, 10, 38, 194 ));
   
   type IVisualStateGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IVisualStateGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Transitions
   (
      This       : access IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IVisualTransition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_States
   (
      This       : access IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_IVisualState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentState
   (
      This       : access IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentStateChanged
   (
      This       : access IVisualStateGroup_Interface
      ; value : Windows.UI.Xaml.VisualStateChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentStateChanged
   (
      This       : access IVisualStateGroup_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentStateChanging
   (
      This       : access IVisualStateGroup_Interface
      ; value : Windows.UI.Xaml.VisualStateChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentStateChanging
   (
      This       : access IVisualStateGroup_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualTransition : aliased constant Windows.IID := (1439010910, 11207, 16397, (170, 164, 26, 41, 129, 73, 30, 224 ));
   
   type IVisualTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GeneratedDuration
   (
      This       : access IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function put_GeneratedDuration
   (
      This       : access IVisualTransition_Interface
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is abstract;
   
   function get_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function put_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access IVisualTransition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access IVisualTransition_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access IVisualTransition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IVisualTransition_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Storyboard
   (
      This       : access IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   function put_Storyboard
   (
      This       : access IVisualTransition_Interface
      ; value : Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualTransitionFactory : aliased constant Windows.IID := (3933570639, 53728, 19886, (180, 41, 137, 252, 50, 39, 36, 244 ));
   
   type IVisualTransitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IVisualTransitionFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveTrigger : aliased constant Windows.IID := (2783985945, 3289, 18929, (162, 63, 68, 229, 71, 171, 159, 26 ));
   
   type IAdaptiveTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveTriggerStatics : aliased constant Windows.IID := (3106810346, 5653, 17232, (156, 59, 146, 178, 152, 107, 244, 68 ));
   
   type IAdaptiveTriggerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinWindowWidthProperty
   (
      This       : access IAdaptiveTriggerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinWindowHeightProperty
   (
      This       : access IAdaptiveTriggerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveTriggerFactory : aliased constant Windows.IID := (3378959490, 23275, 18497, (146, 71, 193, 160, 189, 214, 245, 159 ));
   
   type IAdaptiveTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAdaptiveTriggerFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IAdaptiveTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEventTrigger : aliased constant Windows.IID := (3740858453, 2889, 16519, (177, 169, 184, 179, 132, 136, 247, 134 ));
   
   type IEventTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RoutedEvent
   (
      This       : access IEventTrigger_Interface
      ; RetVal : access Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function put_RoutedEvent
   (
      This       : access IEventTrigger_Interface
      ; value : Windows.UI.Xaml.IRoutedEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_Actions
   (
      This       : access IEventTrigger_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_TriggerAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElement : aliased constant Windows.IID := (2744242331, 19097, 19324, (157, 141, 111, 165, 208, 31, 111, 191 ));
   
   type IFrameworkElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Triggers
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.IVector_TriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function get_Resources
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function put_Resources
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualWidth
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualHeight
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Width
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Height
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinWidth
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MinWidth
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWidth
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxWidth
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinHeight
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MinHeight
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHeight
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxHeight
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_Margin
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_Margin
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseUri
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DataContext
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_DataContext
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Style
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_Style
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_Parent
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowDirection
   (
      This       : access IFrameworkElement_Interface
      ; RetVal : access Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_FlowDirection
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function add_Loaded
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Loaded
   (
      This       : access IFrameworkElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Unloaded
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Unloaded
   (
      This       : access IFrameworkElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SizeChanged
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.UI.Xaml.SizeChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SizeChanged
   (
      This       : access IFrameworkElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindName
   (
      This       : access IFrameworkElement_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetBinding
   (
      This       : access IFrameworkElement_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; binding : Windows.UI.Xaml.Data.IBindingBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementOverrides : aliased constant Windows.IID := (3657465428, 46018, 19354, (170, 142, 211, 240, 113, 38, 43, 151 ));
   
   type IFrameworkElementOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function MeasureOverride
   (
      This       : access IFrameworkElementOverrides_Interface
      ; availableSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function ArrangeOverride
   (
      This       : access IFrameworkElementOverrides_Interface
      ; finalSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function OnApplyTemplate
   (
      This       : access IFrameworkElementOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementStatics : aliased constant Windows.IID := (1211641906, 64491, 20362, (174, 210, 238, 33, 251, 39, 165, 123 ));
   
   type IFrameworkElementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TagProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualWidthProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualHeightProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_WidthProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HeightProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinWidthProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWidthProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinHeightProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHeightProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalAlignmentProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalAlignmentProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MarginProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_NameProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DataContextProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowDirectionProperty
   (
      This       : access IFrameworkElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementFactory : aliased constant Windows.IID := (3736002854, 970, 18790, (181, 118, 96, 76, 206, 147, 181, 232 ));
   
   type IFrameworkElementFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IFrameworkElementFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElement2 : aliased constant Windows.IID := (4052812990, 16938, 18692, (165, 47, 238, 114, 1, 4, 41, 229 ));
   
   type IFrameworkElement2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedTheme
   (
      This       : access IFrameworkElement2_Interface
      ; RetVal : access Windows.UI.Xaml.ElementTheme
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestedTheme
   (
      This       : access IFrameworkElement2_Interface
      ; value : Windows.UI.Xaml.ElementTheme
   )
   return Windows.HRESULT is abstract;
   
   function add_DataContextChanged
   (
      This       : access IFrameworkElement2_Interface
      ; value : TypedEventHandler_IFrameworkElement2_add_DataContextChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataContextChanged
   (
      This       : access IFrameworkElement2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetBindingExpression
   (
      This       : access IFrameworkElement2_Interface
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.UI.Xaml.Data.IBindingExpression
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementOverrides2 : aliased constant Windows.IID := (3411858105, 58292, 17804, (182, 78, 20, 52, 253, 27, 216, 138 ));
   
   type IFrameworkElementOverrides2_Interface is interface and Windows.IInspectable_Interface;
   
   function GoToElementStateCore
   (
      This       : access IFrameworkElementOverrides2_Interface
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementStatics2 : aliased constant Windows.IID := (2526403330, 49368, 20386, (177, 0, 63, 162, 223, 139, 149, 56 ));
   
   type IFrameworkElementStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedThemeProperty
   (
      This       : access IFrameworkElementStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElement3 : aliased constant Windows.IID := (3357288224, 23634, 19390, (161, 153, 43, 30, 52, 240, 15, 112 ));
   
   type IFrameworkElement3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Loading
   (
      This       : access IFrameworkElement3_Interface
      ; value : TypedEventHandler_IFrameworkElement3_add_Loading
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Loading
   (
      This       : access IFrameworkElement3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElement4 : aliased constant Windows.IID := (1802918835, 64419, 17412, (189, 238, 26, 69, 209, 202, 95, 33 ));
   
   type IFrameworkElement4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowFocusOnInteraction
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowFocusOnInteraction
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualMargin
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualMargin
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualSecondaryThickness
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualSecondaryThickness
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualPrimaryThickness
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualPrimaryThickness
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualSecondaryBrush
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualSecondaryBrush
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualPrimaryBrush
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualPrimaryBrush
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowFocusWhenDisabled
   (
      This       : access IFrameworkElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowFocusWhenDisabled
   (
      This       : access IFrameworkElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementStatics4 : aliased constant Windows.IID := (2621550933, 50648, 18019, (191, 242, 216, 213, 79, 181, 219, 179 ));
   
   type IFrameworkElementStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowFocusOnInteractionProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualMarginProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualSecondaryThicknessProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualPrimaryThicknessProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualSecondaryBrushProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusVisualPrimaryBrushProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowFocusWhenDisabledProperty
   (
      This       : access IFrameworkElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementStatics5 : aliased constant Windows.IID := (1381841217, 2876, 19430, (153, 120, 25, 168, 2, 92, 9, 216 ));
   
   type IFrameworkElementStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function DeferTree
   (
      This       : access IFrameworkElementStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElement6 : aliased constant Windows.IID := (2032819601, 25249, 16575, (160, 206, 249, 193, 49, 252, 183, 167 ));
   
   type IFrameworkElement6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActualTheme
   (
      This       : access IFrameworkElement6_Interface
      ; RetVal : access Windows.UI.Xaml.ElementTheme
   )
   return Windows.HRESULT is abstract;
   
   function add_ActualThemeChanged
   (
      This       : access IFrameworkElement6_Interface
      ; value : TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActualThemeChanged
   (
      This       : access IFrameworkElement6_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkElementStatics6 : aliased constant Windows.IID := (4240528026, 27099, 17794, (167, 190, 207, 106, 28, 253, 172, 208 ));
   
   type IFrameworkElementStatics6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActualThemeProperty
   (
      This       : access IFrameworkElementStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaFailedRoutedEventArgs : aliased constant Windows.IID := (1188166285, 20809, 16723, (186, 60, 176, 62, 100, 238, 83, 30 ));
   
   type IMediaFailedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorTrace
   (
      This       : access IMediaFailedRoutedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetter : aliased constant Windows.IID := (2805853481, 46254, 19073, (190, 133, 230, 144, 186, 13, 59, 110 ));
   
   type ISetter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Property
   (
      This       : access ISetter_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function put_Property
   (
      This       : access ISetter_Interface
      ; value : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ISetter_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access ISetter_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetterFactory : aliased constant Windows.IID := (3553246530, 2481, 18901, (136, 145, 231, 181, 100, 142, 2, 162 ));
   
   type ISetterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ISetterFactory_Interface
      ; targetProperty : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
      ; RetVal : access Windows.UI.Xaml.ISetter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISetter2 : aliased constant Windows.IID := (1880528225, 1457, 20387, (157, 83, 142, 12, 140, 116, 122, 252 ));
   
   type ISetter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Target
   (
      This       : access ISetter2_Interface
      ; RetVal : access Windows.UI.Xaml.ITargetPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   function put_Target
   (
      This       : access ISetter2_Interface
      ; value : Windows.UI.Xaml.ITargetPropertyPath
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStateTrigger : aliased constant Windows.IID := (1739452206, 55513, 18935, (161, 253, 46, 53, 238, 221, 35, 205 ));
   
   type IStateTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsActive
   (
      This       : access IStateTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsActive
   (
      This       : access IStateTrigger_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStateTriggerStatics : aliased constant Windows.IID := (1911118992, 46078, 19923, (168, 168, 68, 162, 206, 37, 224, 184 ));
   
   type IStateTriggerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsActiveProperty
   (
      This       : access IStateTriggerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridLengthHelper : aliased constant Windows.IID := (2055367905, 1952, 16515, (182, 209, 177, 217, 23, 185, 118, 172 ));
   
   type IGridLengthHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridLengthHelperStatics : aliased constant Windows.IID := (2638576539, 415, 16998, (136, 114, 33, 95, 25, 143, 106, 157 ));
   
   type IGridLengthHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Auto
   (
      This       : access IGridLengthHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.GridLength
   )
   return Windows.HRESULT is abstract;
   
   function FromPixels
   (
      This       : access IGridLengthHelperStatics_Interface
      ; pixels : Windows.Double
      ; RetVal : access Windows.UI.Xaml.GridLength
   )
   return Windows.HRESULT is abstract;
   
   function FromValueAndType
   (
      This       : access IGridLengthHelperStatics_Interface
      ; value : Windows.Double
      ; type_x : Windows.UI.Xaml.GridUnitType
      ; RetVal : access Windows.UI.Xaml.GridLength
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAbsolute
   (
      This       : access IGridLengthHelperStatics_Interface
      ; target : Windows.UI.Xaml.GridLength
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAuto
   (
      This       : access IGridLengthHelperStatics_Interface
      ; target : Windows.UI.Xaml.GridLength
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetIsStar
   (
      This       : access IGridLengthHelperStatics_Interface
      ; target : Windows.UI.Xaml.GridLength
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access IGridLengthHelperStatics_Interface
      ; target : Windows.UI.Xaml.GridLength
      ; value : Windows.UI.Xaml.GridLength
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBindingFailedEventArgs : aliased constant Windows.IID := (851562515, 19901, 17517, (187, 184, 13, 227, 80, 72, 164, 73 ));
   
   type IBindingFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IBindingFailedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDebugSettings : aliased constant Windows.IID := (1027940248, 50855, 19735, (131, 152, 216, 58, 6, 113, 131, 216 ));
   
   type IDebugSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableFrameRateCounter
   (
      This       : access IDebugSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableFrameRateCounter
   (
      This       : access IDebugSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBindingTracingEnabled
   (
      This       : access IDebugSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsBindingTracingEnabled
   (
      This       : access IDebugSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverdrawHeatMapEnabled
   (
      This       : access IDebugSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOverdrawHeatMapEnabled
   (
      This       : access IDebugSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_BindingFailed
   (
      This       : access IDebugSettings_Interface
      ; value : Windows.UI.Xaml.BindingFailedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BindingFailed
   (
      This       : access IDebugSettings_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDebugSettings2 : aliased constant Windows.IID := (1221817733, 57766, 18075, (131, 200, 48, 130, 80, 55, 17, 158 ));
   
   type IDebugSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnableRedrawRegions
   (
      This       : access IDebugSettings2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableRedrawRegions
   (
      This       : access IDebugSettings2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDebugSettings3 : aliased constant Windows.IID := (3871035426, 1573, 18335, (142, 50, 75, 88, 61, 115, 183, 172 ));
   
   type IDebugSettings3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTextPerformanceVisualizationEnabled
   (
      This       : access IDebugSettings3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTextPerformanceVisualizationEnabled
   (
      This       : access IDebugSettings3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IElementSoundPlayer : aliased constant Windows.IID := (947352485, 61494, 17932, (155, 129, 243, 214, 234, 67, 246, 242 ));
   
   type IElementSoundPlayer_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IElementSoundPlayerStatics : aliased constant Windows.IID := (561680388, 38941, 16841, (177, 82, 173, 169, 17, 164, 177, 58 ));
   
   type IElementSoundPlayerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Volume
   (
      This       : access IElementSoundPlayerStatics_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Volume
   (
      This       : access IElementSoundPlayerStatics_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IElementSoundPlayerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.ElementSoundPlayerState
   )
   return Windows.HRESULT is abstract;
   
   function put_State
   (
      This       : access IElementSoundPlayerStatics_Interface
      ; value : Windows.UI.Xaml.ElementSoundPlayerState
   )
   return Windows.HRESULT is abstract;
   
   function Play
   (
      This       : access IElementSoundPlayerStatics_Interface
      ; sound : Windows.UI.Xaml.ElementSoundKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplication : aliased constant Windows.IID := (1958240673, 29831, 18089, (154, 110, 199, 139, 81, 39, 38, 197 ));
   
   type IApplication_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Resources
   (
      This       : access IApplication_Interface
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function put_Resources
   (
      This       : access IApplication_Interface
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function get_DebugSettings
   (
      This       : access IApplication_Interface
      ; RetVal : access Windows.UI.Xaml.IDebugSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedTheme
   (
      This       : access IApplication_Interface
      ; RetVal : access Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestedTheme
   (
      This       : access IApplication_Interface
      ; value : Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is abstract;
   
   function add_UnhandledException
   (
      This       : access IApplication_Interface
      ; value : Windows.UI.Xaml.UnhandledExceptionEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnhandledException
   (
      This       : access IApplication_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Suspending
   (
      This       : access IApplication_Interface
      ; value : Windows.UI.Xaml.SuspendingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Suspending
   (
      This       : access IApplication_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Resuming
   (
      This       : access IApplication_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Resuming
   (
      This       : access IApplication_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Exit_x
   (
      This       : access IApplication_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationOverrides : aliased constant Windows.IID := (637116407, 37703, 17818, (159, 172, 178, 208, 225, 28, 26, 15 ));
   
   type IApplicationOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnLaunched
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.ILaunchActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnFileActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.IFileActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnSearchActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.ISearchActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnShareTargetActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.IShareTargetActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnFileOpenPickerActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.IFileOpenPickerActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnFileSavePickerActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.IFileSavePickerActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnCachedFileUpdaterActivated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.ApplicationModel.Activation.ICachedFileUpdaterActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function OnWindowCreated
   (
      This       : access IApplicationOverrides_Interface
      ; args : Windows.UI.Xaml.IWindowCreatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationStatics : aliased constant Windows.IID := (105486743, 63412, 17918, (183, 99, 117, 119, 209, 211, 203, 74 ));
   
   type IApplicationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IApplicationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IApplication
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IApplicationStatics_Interface
      ; callback : Windows.UI.Xaml.ApplicationInitializationCallback
   )
   return Windows.HRESULT is abstract;
   
   function LoadComponent
   (
      This       : access IApplicationStatics_Interface
      ; component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function LoadComponentWithResourceLocation
   (
      This       : access IApplicationStatics_Interface
      ; component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
      ; componentResourceLocation : Windows.UI.Xaml.Controls.Primitives.ComponentResourceLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationFactory : aliased constant Windows.IID := (2478564193, 48730, 20195, (180, 163, 149, 17, 141, 201, 122, 137 ));
   
   type IApplicationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IApplicationFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IApplication
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplication2 : aliased constant Windows.IID := (26281150, 21034, 22788, (245, 47, 222, 114, 1, 4, 41, 224 ));
   
   type IApplication2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusVisualKind
   (
      This       : access IApplication2_Interface
      ; RetVal : access Windows.UI.Xaml.FocusVisualKind
   )
   return Windows.HRESULT is abstract;
   
   function put_FocusVisualKind
   (
      This       : access IApplication2_Interface
      ; value : Windows.UI.Xaml.FocusVisualKind
   )
   return Windows.HRESULT is abstract;
   
   function get_RequiresPointerMode
   (
      This       : access IApplication2_Interface
      ; RetVal : access Windows.UI.Xaml.ApplicationRequiresPointerMode
   )
   return Windows.HRESULT is abstract;
   
   function put_RequiresPointerMode
   (
      This       : access IApplication2_Interface
      ; value : Windows.UI.Xaml.ApplicationRequiresPointerMode
   )
   return Windows.HRESULT is abstract;
   
   function add_LeavingBackground
   (
      This       : access IApplication2_Interface
      ; value : Windows.UI.Xaml.LeavingBackgroundEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LeavingBackground
   (
      This       : access IApplication2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnteredBackground
   (
      This       : access IApplication2_Interface
      ; value : Windows.UI.Xaml.EnteredBackgroundEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnteredBackground
   (
      This       : access IApplication2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationOverrides2 : aliased constant Windows.IID := (3680293561, 54196, 21900, (198, 78, 4, 52, 253, 27, 216, 137 ));
   
   type IApplicationOverrides2_Interface is interface and Windows.IInspectable_Interface;
   
   function OnBackgroundActivated
   (
      This       : access IApplicationOverrides2_Interface
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplication3 : aliased constant Windows.IID := (3077942652, 6328, 17866, (161, 176, 220, 72, 62, 75, 16, 40 ));
   
   type IApplication3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HighContrastAdjustment
   (
      This       : access IApplication3_Interface
      ; RetVal : access Windows.UI.Xaml.ApplicationHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   function put_HighContrastAdjustment
   (
      This       : access IApplication3_Interface
      ; value : Windows.UI.Xaml.ApplicationHighContrastAdjustment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkViewSource : aliased constant Windows.IID := (3819993050, 13741, 19209, (181, 178, 39, 66, 0, 65, 186, 159 ));
   
   type IFrameworkViewSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPointHelper : aliased constant Windows.IID := (1920720274, 25776, 18895, (163, 33, 169, 121, 62, 115, 226, 231 ));
   
   type IPointHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPointHelperStatics : aliased constant Windows.IID := (22727285, 30424, 19326, (138, 51, 125, 121, 32, 70, 145, 238 ));
   
   type IPointHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromCoordinates
   (
      This       : access IPointHelperStatics_Interface
      ; x : Windows.Single
      ; y : Windows.Single
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRectHelper : aliased constant Windows.IID := (2743566818, 19451, 20194, (175, 229, 137, 243, 27, 55, 71, 141 ));
   
   type IRectHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRectHelperStatics : aliased constant Windows.IID := (1591829476, 49534, 18767, (181, 128, 47, 5, 116, 252, 58, 21 ));
   
   type IRectHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Empty
   (
      This       : access IRectHelperStatics_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function FromCoordinatesAndDimensions
   (
      This       : access IRectHelperStatics_Interface
      ; x : Windows.Single
      ; y : Windows.Single
      ; width : Windows.Single
      ; height : Windows.Single
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function FromPoints
   (
      This       : access IRectHelperStatics_Interface
      ; point1 : Windows.Foundation.Point
      ; point2 : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function FromLocationAndSize
   (
      This       : access IRectHelperStatics_Interface
      ; location : Windows.Foundation.Point
      ; size : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetIsEmpty
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetBottom
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetLeft
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetRight
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetTop
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function Contains
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; value : Windows.Foundation.Rect
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Intersect
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function UnionWithPoint
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function UnionWithRect
   (
      This       : access IRectHelperStatics_Interface
      ; target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISizeHelper : aliased constant Windows.IID := (3877788308, 23811, 18947, (186, 148, 150, 127, 198, 143, 206, 254 ));
   
   type ISizeHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISizeHelperStatics : aliased constant Windows.IID := (1652999602, 53112, 18709, (170, 64, 118, 0, 74, 22, 95, 94 ));
   
   type ISizeHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Empty
   (
      This       : access ISizeHelperStatics_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function FromDimensions
   (
      This       : access ISizeHelperStatics_Interface
      ; width : Windows.Single
      ; height : Windows.Single
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function GetIsEmpty
   (
      This       : access ISizeHelperStatics_Interface
      ; target : Windows.Foundation.Size
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access ISizeHelperStatics_Interface
      ; target : Windows.Foundation.Size
      ; value : Windows.Foundation.Size
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindow : aliased constant Windows.IID := (846599805, 51702, 17965, (157, 226, 174, 76, 31, 216, 194, 229 ));
   
   type IWindow_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bounds
   (
      This       : access IWindow_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access IWindow_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access IWindow_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IWindow_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_CoreWindow
   (
      This       : access IWindow_Interface
      ; RetVal : access Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access IWindow_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   function add_Activated
   (
      This       : access IWindow_Interface
      ; value : Windows.UI.Xaml.WindowActivatedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Activated
   (
      This       : access IWindow_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IWindow_Interface
      ; value : Windows.UI.Xaml.WindowClosedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IWindow_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SizeChanged
   (
      This       : access IWindow_Interface
      ; value : Windows.UI.Xaml.WindowSizeChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SizeChanged
   (
      This       : access IWindow_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VisibilityChanged
   (
      This       : access IWindow_Interface
      ; value : Windows.UI.Xaml.WindowVisibilityChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisibilityChanged
   (
      This       : access IWindow_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Activate
   (
      This       : access IWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindowStatics : aliased constant Windows.IID := (2469561353, 20129, 19194, (131, 220, 12, 78, 115, 232, 139, 177 ));
   
   type IWindowStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IWindowStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindow2 : aliased constant Windows.IID := (3548673439, 13558, 17538, (132, 53, 245, 82, 249, 178, 76, 200 ));
   
   type IWindow2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetTitleBar
   (
      This       : access IWindow2_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindow3 : aliased constant Windows.IID := (3071007901, 7221, 17962, (155, 151, 128, 141, 90, 249, 242, 142 ));
   
   type IWindow3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Compositor
   (
      This       : access IWindow3_Interface
      ; RetVal : access Windows.UI.Composition.ICompositor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindowCreatedEventArgs : aliased constant Windows.IID := (834081904, 65279, 18004, (175, 72, 155, 57, 138, 181, 119, 43 ));
   
   type IWindowCreatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Window
   (
      This       : access IWindowCreatedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateManager : aliased constant Windows.IID := (1876598682, 28587, 16658, (146, 88, 16, 6, 163, 195, 71, 110 ));
   
   type IVisualStateManager_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateManagerOverrides : aliased constant Windows.IID := (1248235790, 31097, 17352, (143, 244, 236, 97, 34, 117, 0, 6 ));
   
   type IVisualStateManagerOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function GoToStateCore
   (
      This       : access IVisualStateManagerOverrides_Interface
      ; control : Windows.UI.Xaml.Controls.IControl
      ; templateRoot : Windows.UI.Xaml.IFrameworkElement
      ; stateName : Windows.String
      ; group : Windows.UI.Xaml.IVisualStateGroup
      ; state : Windows.UI.Xaml.IVisualState
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateManagerProtected : aliased constant Windows.IID := (1262192192, 45239, 16460, (158, 244, 217, 73, 100, 14, 36, 93 ));
   
   type IVisualStateManagerProtected_Interface is interface and Windows.IInspectable_Interface;
   
   function RaiseCurrentStateChanging
   (
      This       : access IVisualStateManagerProtected_Interface
      ; stateGroup : Windows.UI.Xaml.IVisualStateGroup
      ; oldState : Windows.UI.Xaml.IVisualState
      ; newState : Windows.UI.Xaml.IVisualState
      ; control : Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT is abstract;
   
   function RaiseCurrentStateChanged
   (
      This       : access IVisualStateManagerProtected_Interface
      ; stateGroup : Windows.UI.Xaml.IVisualStateGroup
      ; oldState : Windows.UI.Xaml.IVisualState
      ; newState : Windows.UI.Xaml.IVisualState
      ; control : Windows.UI.Xaml.Controls.IControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateManagerStatics : aliased constant Windows.IID := (30468576, 55059, 16718, (167, 78, 230, 62, 199, 172, 140, 61 ));
   
   type IVisualStateManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetVisualStateGroups
   (
      This       : access IVisualStateManagerStatics_Interface
      ; obj : Windows.UI.Xaml.IFrameworkElement
      ; RetVal : access Windows.UI.Xaml.IVector_IVisualStateGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVisualStateManagerProperty
   (
      This       : access IVisualStateManagerStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetCustomVisualStateManager
   (
      This       : access IVisualStateManagerStatics_Interface
      ; obj : Windows.UI.Xaml.IFrameworkElement
      ; RetVal : access Windows.UI.Xaml.IVisualStateManager
   )
   return Windows.HRESULT is abstract;
   
   function SetCustomVisualStateManager
   (
      This       : access IVisualStateManagerStatics_Interface
      ; obj : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IVisualStateManager
   )
   return Windows.HRESULT is abstract;
   
   function GoToState
   (
      This       : access IVisualStateManagerStatics_Interface
      ; control : Windows.UI.Xaml.Controls.IControl
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualStateManagerFactory : aliased constant Windows.IID := (2246416637, 42357, 18358, (158, 48, 56, 60, 208, 133, 133, 242 ));
   
   type IVisualStateManagerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IVisualStateManagerFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.IVisualStateManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IFrameworkView_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Initialize
   (
      This       : access IFrameworkView_Imported_Interface
      ; applicationView : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function SetWindow
   (
      This       : access IFrameworkView_Imported_Interface
      ; window : Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   function Load
   (
      This       : access IFrameworkView_Imported_Interface
      ; entryPoint : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Run
   (
      This       : access IFrameworkView_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Uninitialize
   (
      This       : access IFrameworkView_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IFrameworkViewSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateView
   (
      This       : access IFrameworkViewSource_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Core.IFrameworkView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUIElement : aliased constant Windows.IID := (488611168, 54587, 22519, (177, 68, 143, 124, 72, 120, 70, 232 ));
   
   type IIterator_IUIElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUIElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUIElement_Interface
      ; items : Windows.UI.Xaml.IUIElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUIElement : aliased constant Windows.IID := (1122134753, 54103, 22504, (187, 72, 247, 92, 159, 246, 157, 145 ));
   
   type IIterable_IUIElement_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IUIElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IResourceDictionary : aliased constant Windows.IID := (2224697146, 11870, 22696, (183, 110, 115, 69, 14, 166, 128, 192 ));
   
   type IIterator_IResourceDictionary_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IResourceDictionary_Interface
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IResourceDictionary_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IResourceDictionary_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IResourceDictionary_Interface
      ; items : Windows.UI.Xaml.IResourceDictionary_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IResourceDictionary : aliased constant Windows.IID := (3941729845, 42082, 21399, (190, 225, 247, 160, 149, 4, 101, 59 ));
   
   type IIterable_IResourceDictionary_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IResourceDictionary_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IResourceDictionary : aliased constant Windows.IID := (919506648, 49577, 21943, (134, 220, 180, 27, 142, 216, 237, 244 ));
   
   type IVectorView_IResourceDictionary_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IResourceDictionary_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IResourceDictionary_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IResourceDictionary_Interface
      ; value : Windows.UI.Xaml.IResourceDictionary
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IResourceDictionary_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IResourceDictionary_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IResourceDictionary : aliased constant Windows.IID := (4269935116, 26957, 20875, (142, 197, 55, 41, 147, 246, 206, 175 ));
   
   type IVector_IResourceDictionary_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IResourceDictionary_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IResourceDictionary_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IResourceDictionary_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IResourceDictionary_Interface
      ; value : Windows.UI.Xaml.IResourceDictionary
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IResourceDictionary_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IResourceDictionary_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IResourceDictionary_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IResourceDictionary_Interface
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IResourceDictionary_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IResourceDictionary_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IResourceDictionary_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IResourceDictionary_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IResourceDictionary_Interface
      ; items : Windows.UI.Xaml.IResourceDictionary_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IDependencyObject : aliased constant Windows.IID := (704173140, 36957, 22654, (185, 216, 191, 212, 24, 128, 90, 101 ));
   
   type IIterator_IDependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDependencyObject_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDependencyObject_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDependencyObject_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDependencyObject_Interface
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IDependencyObject : aliased constant Windows.IID := (4134300627, 21940, 23483, (184, 42, 109, 156, 227, 131, 9, 26 ));
   
   type IIterable_IDependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDependencyObject_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IStateTriggerBase : aliased constant Windows.IID := (3616250917, 12820, 21702, (132, 5, 71, 147, 68, 48, 146, 119 ));
   
   type IIterator_IStateTriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStateTriggerBase_Interface
      ; RetVal : access Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStateTriggerBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStateTriggerBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStateTriggerBase_Interface
      ; items : Windows.UI.Xaml.IStateTriggerBase_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IStateTriggerBase : aliased constant Windows.IID := (120792508, 36623, 22232, (181, 33, 107, 228, 118, 68, 197, 84 ));
   
   type IIterable_IStateTriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStateTriggerBase_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IStateTriggerBase : aliased constant Windows.IID := (737388921, 42716, 22827, (152, 238, 204, 124, 61, 156, 170, 178 ));
   
   type IVectorView_IStateTriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStateTriggerBase_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStateTriggerBase_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStateTriggerBase_Interface
      ; value : Windows.UI.Xaml.IStateTriggerBase
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStateTriggerBase_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IStateTriggerBase_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IStateTriggerBase : aliased constant Windows.IID := (1926998576, 36886, 20953, (133, 0, 75, 33, 91, 92, 180, 104 ));
   
   type IVector_IStateTriggerBase_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; value : Windows.UI.Xaml.IStateTriggerBase
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; value : Windows.UI.Xaml.IStateTriggerBase
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IStateTriggerBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IStateTriggerBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IStateTriggerBase_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IStateTriggerBase_Interface
      ; items : Windows.UI.Xaml.IStateTriggerBase_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVisualTransition : aliased constant Windows.IID := (1524943729, 43192, 20587, (179, 27, 98, 219, 17, 246, 98, 87 ));
   
   type IIterator_IVisualTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVisualTransition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVisualTransition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVisualTransition_Interface
      ; items : Windows.UI.Xaml.IVisualTransition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVisualTransition : aliased constant Windows.IID := (24809136, 59714, 24357, (169, 69, 32, 90, 148, 112, 185, 252 ));
   
   type IIterable_IVisualTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVisualTransition : aliased constant Windows.IID := (3141356847, 13318, 24361, (129, 42, 187, 30, 67, 120, 99, 218 ));
   
   type IVectorView_IVisualTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVisualTransition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVisualTransition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVisualTransition_Interface
      ; value : Windows.UI.Xaml.IVisualTransition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVisualTransition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualTransition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVisualTransition : aliased constant Windows.IID := (1525410700, 32503, 22901, (186, 10, 108, 25, 165, 41, 187, 114 ));
   
   type IVector_IVisualTransition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVisualTransition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVisualTransition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVisualTransition_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVisualTransition_Interface
      ; value : Windows.UI.Xaml.IVisualTransition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVisualTransition_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVisualTransition_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVisualTransition_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVisualTransition_Interface
      ; value : Windows.UI.Xaml.IVisualTransition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVisualTransition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVisualTransition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVisualTransition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualTransition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVisualTransition_Interface
      ; items : Windows.UI.Xaml.IVisualTransition_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVisualState : aliased constant Windows.IID := (4060862652, 28122, 23665, (189, 57, 197, 113, 55, 197, 164, 237 ));
   
   type IIterator_IVisualState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVisualState_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVisualState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVisualState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVisualState_Interface
      ; items : Windows.UI.Xaml.IVisualState_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVisualState : aliased constant Windows.IID := (531657123, 41060, 22041, (169, 78, 35, 192, 26, 76, 191, 58 ));
   
   type IIterable_IVisualState_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVisualState_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IVisualState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVisualState : aliased constant Windows.IID := (3942849464, 32808, 20836, (150, 153, 30, 178, 136, 56, 63, 168 ));
   
   type IVectorView_IVisualState_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVisualState_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVisualState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVisualState_Interface
      ; value : Windows.UI.Xaml.IVisualState
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVisualState_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualState_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVisualState : aliased constant Windows.IID := (1533876664, 48140, 23159, (164, 6, 192, 28, 18, 253, 70, 195 ));
   
   type IVector_IVisualState_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVisualState_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVisualState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVisualState_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVisualState_Interface
      ; value : Windows.UI.Xaml.IVisualState
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVisualState_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVisualState_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVisualState_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVisualState_Interface
      ; value : Windows.UI.Xaml.IVisualState
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVisualState_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVisualState_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVisualState_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualState_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVisualState_Interface
      ; items : Windows.UI.Xaml.IVisualState_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUIElement : aliased constant Windows.IID := (4085664784, 5284, 21782, (177, 217, 99, 182, 87, 148, 41, 177 ));
   
   type IVectorView_IUIElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUIElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUIElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUIElement_Interface
      ; value : Windows.UI.Xaml.IUIElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUIElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IUIElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IUIElement : aliased constant Windows.IID := (3032605612, 34664, 23453, (166, 97, 246, 51, 48, 184, 80, 123 ));
   
   type IVector_IUIElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IUIElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IUIElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IUIElement_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IUIElement_Interface
      ; value : Windows.UI.Xaml.IUIElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IUIElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IUIElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IUIElement_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IUIElement_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IUIElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IUIElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IUIElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IUIElement_Interface
      ; items : Windows.UI.Xaml.IUIElement_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IDependencyObject : aliased constant Windows.IID := (4269084023, 4871, 24050, (160, 33, 28, 122, 141, 107, 128, 173 ));
   
   type IVectorView_IDependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IDependencyObject_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IDependencyObject_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IDependencyObject_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IDependencyObject_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IDependencyObject : aliased constant Windows.IID := (1998292350, 43868, 23992, (160, 33, 57, 124, 146, 205, 196, 76 ));
   
   type IVector_IDependencyObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IDependencyObject_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IDependencyObject_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IDependencyObject_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IDependencyObject_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IDependencyObject_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IDependencyObject_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IDependencyObject_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IDependencyObject_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IDependencyObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IDependencyObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IDependencyObject_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IDependencyObject_Interface
      ; items : Windows.UI.Xaml.IDependencyObject_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVisualStateGroup : aliased constant Windows.IID := (166288124, 12438, 20673, (176, 90, 172, 174, 26, 140, 185, 46 ));
   
   type IIterator_IVisualStateGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVisualStateGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVisualStateGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVisualStateGroup_Interface
      ; items : Windows.UI.Xaml.IVisualStateGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVisualStateGroup : aliased constant Windows.IID := (1570419729, 59793, 21936, (177, 108, 164, 0, 165, 10, 147, 223 ));
   
   type IIterable_IVisualStateGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IIterator_IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVisualStateGroup : aliased constant Windows.IID := (2918282350, 35126, 21610, (151, 51, 134, 38, 136, 12, 76, 225 ));
   
   type IVectorView_IVisualStateGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVisualStateGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVisualStateGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVisualStateGroup_Interface
      ; value : Windows.UI.Xaml.IVisualStateGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVisualStateGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualStateGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVisualStateGroup : aliased constant Windows.IID := (1922696082, 26462, 22756, (182, 163, 4, 87, 187, 158, 169, 104 ));
   
   type IVector_IVisualStateGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; RetVal : access Windows.UI.Xaml.IVectorView_IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; value : Windows.UI.Xaml.IVisualStateGroup
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; value : Windows.UI.Xaml.IVisualStateGroup
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVisualStateGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVisualStateGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.IVisualStateGroup_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVisualStateGroup_Interface
      ; items : Windows.UI.Xaml.IVisualStateGroup_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Thickness : aliased constant Windows.IID := (2711583656, 55501, 24050, (171, 68, 254, 253, 38, 100, 68, 132 ));
   
   type IReference_Thickness_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Thickness_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ApplicationInitializationCallback : aliased constant Windows.IID := (3056933973, 49796, 18148, (131, 16, 251, 9, 103, 250, 183, 111 ));
   
   type ApplicationInitializationCallback_Interface(Callback : access procedure (p : Windows.UI.Xaml.IApplicationInitializationCallbackParams)) is new Windows.IMulticastDelegate_Interface(IID_ApplicationInitializationCallback'access) with null record;
   function Invoke
   (
      This       : access ApplicationInitializationCallback_Interface
      ; p : Windows.UI.Xaml.IApplicationInitializationCallbackParams
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_CreateDefaultValueCallback : aliased constant Windows.IID := (3605836076, 5557, 20168, (185, 92, 205, 210, 8, 240, 129, 83 ));
   
   type CreateDefaultValueCallback_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_CreateDefaultValueCallback'access) with null record;
   function Invoke
   (
      This       : access CreateDefaultValueCallback_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DependencyPropertyChangedCallback : aliased constant Windows.IID := (1166556438, 10175, 19393, (172, 38, 148, 193, 96, 31, 58, 73 ));
   
   type DependencyPropertyChangedCallback_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IDependencyObject ; dp : Windows.UI.Xaml.IDependencyProperty)) is new Windows.IMulticastDelegate_Interface(IID_DependencyPropertyChangedCallback'access) with null record;
   function Invoke
   (
      This       : access DependencyPropertyChangedCallback_Interface
      ; sender : Windows.UI.Xaml.IDependencyObject
      ; dp : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DependencyPropertyChangedEventHandler : aliased constant Windows.IID := (153239130, 30142, 17561, (129, 128, 29, 220, 0, 84, 33, 192 ));
   
   type DependencyPropertyChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_DependencyPropertyChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access DependencyPropertyChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DragEventHandler : aliased constant Windows.IID := (716284421, 7795, 19407, (170, 188, 87, 185, 126, 33, 150, 29 ));
   
   type DragEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IDragEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_DragEventHandler'access) with null record;
   function Invoke
   (
      This       : access DragEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IDragEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EnteredBackgroundEventHandler : aliased constant Windows.IID := (2477348526, 7551, 17291, (183, 184, 34, 125, 150, 182, 9, 192 ));
   
   type EnteredBackgroundEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EnteredBackgroundEventHandler'access) with null record;
   function Invoke
   (
      This       : access EnteredBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ExceptionRoutedEventHandler : aliased constant Windows.IID := (1759569936, 63210, 17084, (133, 91, 93, 155, 103, 230, 162, 98 ));
   
   type ExceptionRoutedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IExceptionRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ExceptionRoutedEventHandler'access) with null record;
   function Invoke
   (
      This       : access ExceptionRoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IExceptionRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_LeavingBackgroundEventHandler : aliased constant Windows.IID := (2863488429, 20422, 19108, (183, 207, 135, 126, 54, 173, 164, 246 ));
   
   type LeavingBackgroundEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_LeavingBackgroundEventHandler'access) with null record;
   function Invoke
   (
      This       : access LeavingBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_PropertyChangedCallback : aliased constant Windows.IID := (1520405029, 53570, 17572, (130, 49, 253, 103, 103, 36, 242, 155 ));
   
   type PropertyChangedCallback_Interface(Callback : access procedure (d : Windows.UI.Xaml.IDependencyObject ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_PropertyChangedCallback'access) with null record;
   function Invoke
   (
      This       : access PropertyChangedCallback_Interface
      ; d : Windows.UI.Xaml.IDependencyObject
      ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_RoutedEventHandler : aliased constant Windows.IID := (2824267380, 45238, 19395, (187, 168, 27, 160, 110, 64, 212, 181 ));
   
   type RoutedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_RoutedEventHandler'access) with null record;
   function Invoke
   (
      This       : access RoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_SizeChangedEventHandler : aliased constant Windows.IID := (286634300, 9682, 18443, (137, 220, 235, 61, 203, 214, 183, 250 ));
   
   type SizeChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.ISizeChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_SizeChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access SizeChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.ISizeChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_SuspendingEventHandler : aliased constant Windows.IID := (591565925, 58218, 16610, (177, 57, 164, 112, 70, 2, 166, 225 ));
   
   type SuspendingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.ISuspendingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_SuspendingEventHandler'access) with null record;
   function Invoke
   (
      This       : access SuspendingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ISuspendingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_UnhandledExceptionEventHandler : aliased constant Windows.IID := (2457134781, 18849, 18776, (190, 238, 208, 225, 149, 135, 182, 227 ));
   
   type UnhandledExceptionEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IUnhandledExceptionEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_UnhandledExceptionEventHandler'access) with null record;
   function Invoke
   (
      This       : access UnhandledExceptionEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IUnhandledExceptionEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_VisualStateChangedEventHandler : aliased constant Windows.IID := (3872766933, 57385, 17318, (179, 109, 132, 168, 16, 66, 215, 116 ));
   
   type VisualStateChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IVisualStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_VisualStateChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access VisualStateChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IVisualStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_WindowActivatedEventHandler : aliased constant Windows.IID := (402809672, 34329, 19579, (181, 52, 206, 212, 93, 157, 226, 25 ));
   
   type WindowActivatedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Core.IWindowActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_WindowActivatedEventHandler'access) with null record;
   function Invoke
   (
      This       : access WindowActivatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IWindowActivatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_WindowClosedEventHandler : aliased constant Windows.IID := (230199649, 8407, 17887, (145, 34, 186, 137, 87, 103, 3, 186 ));
   
   type WindowClosedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Core.ICoreWindowEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_WindowClosedEventHandler'access) with null record;
   function Invoke
   (
      This       : access WindowClosedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_WindowSizeChangedEventHandler : aliased constant Windows.IID := (1545717570, 11501, 20441, (186, 56, 113, 24, 212, 14, 150, 107 ));
   
   type WindowSizeChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Core.IWindowSizeChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_WindowSizeChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access WindowSizeChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IWindowSizeChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_WindowVisibilityChangedEventHandler : aliased constant Windows.IID := (272657110, 45200, 19018, (178, 173, 214, 130, 223, 39, 19, 15 ));
   
   type WindowVisibilityChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Core.IVisibilityChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_WindowVisibilityChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access WindowVisibilityChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IVisibilityChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_BindingFailedEventHandler : aliased constant Windows.IID := (325785474, 21690, 16909, (161, 170, 130, 130, 135, 33, 205, 230 ));
   
   type BindingFailedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.IBindingFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_BindingFailedEventHandler'access) with null record;
   function Invoke
   (
      This       : access BindingFailedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IBindingFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement3_add_DragStarting : aliased constant Windows.IID := (3972313403, 5228, 22883, (184, 179, 2, 76, 91, 155, 149, 228 ));
   
   type TypedEventHandler_IUIElement3_add_DragStarting_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.IDragStartingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement3_add_DragStarting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement3_add_DragStarting_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IDragStartingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement3_add_DropCompleted : aliased constant Windows.IID := (4292292216, 60447, 23500, (157, 19, 255, 95, 187, 4, 5, 98 ));
   
   type TypedEventHandler_IUIElement3_add_DropCompleted_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.IDropCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement3_add_DropCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement3_add_DropCompleted_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IDropCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement4_add_ContextRequested : aliased constant Windows.IID := (1104571283, 53627, 22962, (185, 22, 142, 129, 63, 236, 185, 189 ));
   
   type TypedEventHandler_IUIElement4_add_ContextRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IContextRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement4_add_ContextRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_ContextRequested_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IContextRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement4_add_ContextCanceled : aliased constant Windows.IID := (1702832298, 35958, 20511, (176, 50, 216, 220, 147, 89, 94, 118 ));
   
   type TypedEventHandler_IUIElement4_add_ContextCanceled_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.IRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement4_add_ContextCanceled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_ContextCanceled_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested : aliased constant Windows.IID := (1483833882, 9361, 23788, (164, 87, 33, 153, 108, 164, 239, 175 ));
   
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed : aliased constant Windows.IID := (674336831, 25950, 21604, (130, 140, 86, 168, 180, 198, 95, 30 ));
   
   type TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement4_add_AccessKeyInvoked : aliased constant Windows.IID := (2781454647, 63254, 23949, (146, 196, 2, 241, 113, 147, 111, 161 ));
   
   type TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement4_add_AccessKeyInvoked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement5_add_GettingFocus : aliased constant Windows.IID := (888359799, 60498, 24246, (175, 252, 34, 12, 181, 44, 160, 147 ));
   
   type TypedEventHandler_IUIElement5_add_GettingFocus_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IGettingFocusEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement5_add_GettingFocus'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_GettingFocus_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IGettingFocusEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement5_add_LosingFocus : aliased constant Windows.IID := (2700386143, 50022, 22170, (137, 90, 58, 130, 216, 128, 31, 228 ));
   
   type TypedEventHandler_IUIElement5_add_LosingFocus_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.ILosingFocusEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement5_add_LosingFocus'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_LosingFocus_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.ILosingFocusEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement5_add_NoFocusCandidateFound : aliased constant Windows.IID := (3588113429, 46396, 21266, (158, 27, 172, 42, 25, 240, 78, 113 ));
   
   type TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.INoFocusCandidateFoundEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement5_add_NoFocusCandidateFound'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.INoFocusCandidateFoundEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement7_add_CharacterReceived : aliased constant Windows.IID := (607322391, 21972, 22409, (138, 162, 108, 171, 29, 6, 98, 160 ));
   
   type TypedEventHandler_IUIElement7_add_CharacterReceived_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement7_add_CharacterReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement7_add_CharacterReceived_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators : aliased constant Windows.IID := (3241464393, 18282, 20806, (181, 212, 108, 152, 244, 232, 20, 97 ));
   
   type TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IUIElement ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IFrameworkElement2_add_DataContextChanged : aliased constant Windows.IID := (2954660385, 56943, 24285, (135, 150, 48, 14, 63, 230, 99, 130 ));
   
   type TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IFrameworkElement ; args : Windows.UI.Xaml.IDataContextChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IFrameworkElement2_add_DataContextChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.UI.Xaml.IDataContextChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IFrameworkElement3_add_Loading : aliased constant Windows.IID := (3257528914, 57054, 23874, (160, 26, 132, 121, 213, 106, 125, 47 ));
   
   type TypedEventHandler_IFrameworkElement3_add_Loading_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IFrameworkElement ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IFrameworkElement3_add_Loading'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement3_add_Loading_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged : aliased constant Windows.IID := (3257528914, 57054, 23874, (160, 26, 132, 121, 213, 106, 125, 47 ));
   
   type TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Interface(Callback : access procedure (sender : Windows.UI.Xaml.IFrameworkElement ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DispatcherTimer is Windows.UI.Xaml.IDispatcherTimer;
   
   type IDispatcherTimer_Interface_Impl is new IDispatcherTimer_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IDispatcherTimer := null;
      m_IDispatcherTimer : IDispatcherTimer := null;
   end record;
   
   type IDispatcherTimer_Impl is access all IDispatcherTimer_Interface_Impl'Class;
   type IDispatcherTimer_Impl_Ptr is access all IDispatcherTimer_Impl;
   
   function QueryInterface
   (
      This       : access IDispatcherTimer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IDispatcherTimer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IDispatcherTimer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IDispatcherTimer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Interval
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT;
   
   function put_Interval
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT;
   
   function get_IsEnabled
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function add_Tick
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Tick
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function Start
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.HRESULT;
   
   function Stop
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.HRESULT;
   
   
   subtype CornerRadiusHelper is Windows.UI.Xaml.ICornerRadiusHelper;
   subtype DurationHelper is Windows.UI.Xaml.IDurationHelper;
   subtype ThicknessHelper is Windows.UI.Xaml.IThicknessHelper;
   subtype ApplicationInitializationCallbackParams is Windows.UI.Xaml.IApplicationInitializationCallbackParams;
   subtype DependencyObject is Windows.UI.Xaml.IDependencyObject;
   
   type IDependencyObject_Interface_Impl is new IDependencyObject_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IDependencyObject := null;
      m_IDependencyObject : IDependencyObject := null;
   end record;
   
   type IDependencyObject_Impl is access all IDependencyObject_Interface_Impl'Class;
   type IDependencyObject_Impl_Ptr is access all IDependencyObject_Impl;
   
   function QueryInterface
   (
      This       : access IDependencyObject_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IDependencyObject_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IDependencyObject_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IDependencyObject_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IDependencyObject_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IDependencyObject_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function GetValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function SetValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function ClearValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT;
   
   function ReadLocalValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function GetAnimationBaseValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function get_Dispatcher
   (
      This       : access IDependencyObject_Interface_Impl
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT;
   
   
   subtype DependencyProperty is Windows.UI.Xaml.IDependencyProperty;
   subtype DependencyPropertyChangedEventArgs is Windows.UI.Xaml.IDependencyPropertyChangedEventArgs;
   subtype RoutedEventArgs is Windows.UI.Xaml.IRoutedEventArgs;
   
   type IRoutedEventArgs_Interface_Impl is new IRoutedEventArgs_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IRoutedEventArgs := null;
      m_IRoutedEventArgs : IRoutedEventArgs := null;
   end record;
   
   type IRoutedEventArgs_Impl is access all IRoutedEventArgs_Interface_Impl'Class;
   type IRoutedEventArgs_Impl_Ptr is access all IRoutedEventArgs_Impl;
   
   function QueryInterface
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_OriginalSource
   (
      This       : access IRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   
   subtype UnhandledExceptionEventArgs is Windows.UI.Xaml.IUnhandledExceptionEventArgs;
   subtype VisualStateChangedEventArgs is Windows.UI.Xaml.IVisualStateChangedEventArgs;
   
   function CreateVisualStateChangedEventArgs return Windows.UI.Xaml.IVisualStateChangedEventArgs;
   
   subtype BringIntoViewOptions is Windows.UI.Xaml.IBringIntoViewOptions;
   
   function CreateBringIntoViewOptions return Windows.UI.Xaml.IBringIntoViewOptions;
   
   subtype DataContextChangedEventArgs is Windows.UI.Xaml.IDataContextChangedEventArgs;
   subtype DataTemplateKey is Windows.UI.Xaml.IDataTemplateKey;
   
   type IDataTemplateKey_Interface_Impl is new IDataTemplateKey_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IDataTemplateKey := null;
      m_IDataTemplateKey : IDataTemplateKey := null;
   end record;
   
   type IDataTemplateKey_Impl is access all IDataTemplateKey_Interface_Impl'Class;
   type IDataTemplateKey_Impl_Ptr is access all IDataTemplateKey_Impl;
   
   function QueryInterface
   (
      This       : access IDataTemplateKey_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IDataTemplateKey_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IDataTemplateKey_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IDataTemplateKey_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IDataTemplateKey_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IDataTemplateKey_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_DataType
   (
      This       : access IDataTemplateKey_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_DataType
   (
      This       : access IDataTemplateKey_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   
   subtype PropertyMetadata is Windows.UI.Xaml.IPropertyMetadata;
   
   subtype DragOperationDeferral is Windows.UI.Xaml.IDragOperationDeferral;
   subtype DragUI is Windows.UI.Xaml.IDragUI;
   subtype DragUIOverride is Windows.UI.Xaml.IDragUIOverride;
   subtype FrameworkView is Windows.UI.Xaml.IFrameworkView;
   
   function CreateFrameworkView return Windows.UI.Xaml.IFrameworkView;
   
   subtype RoutedEvent is Windows.UI.Xaml.IRoutedEvent;
   subtype SetterBaseCollection is Windows.UI.Xaml.ISetterBaseCollection;
   
   function CreateSetterBaseCollection return Windows.UI.Xaml.ISetterBaseCollection;
   
   subtype TargetPropertyPath is Windows.UI.Xaml.ITargetPropertyPath;
   
   function CreateTargetPropertyPath return Windows.UI.Xaml.ITargetPropertyPath;
   
   subtype TriggerActionCollection is Windows.UI.Xaml.IVector_TriggerAction;
   
   function CreateTriggerActionCollection return Windows.UI.Xaml.IVector_TriggerAction;
   
   subtype TriggerCollection is Windows.UI.Xaml.IVector_TriggerBase;
   subtype DependencyObjectCollection is Windows.UI.Xaml.IObservableVector_DependencyObject;
   
   subtype DragEventArgs is Windows.UI.Xaml.IDragEventArgs;
   subtype DragStartingEventArgs is Windows.UI.Xaml.IDragStartingEventArgs;
   subtype DropCompletedEventArgs is Windows.UI.Xaml.IDropCompletedEventArgs;
   subtype ExceptionRoutedEventArgs is Windows.UI.Xaml.IExceptionRoutedEventArgs;
   
   subtype FrameworkTemplate is Windows.UI.Xaml.IFrameworkTemplate;
   
   type IFrameworkTemplate_Interface_Impl is new IFrameworkTemplate_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IFrameworkTemplate := null;
      m_IFrameworkTemplate : IFrameworkTemplate := null;
   end record;
   
   type IFrameworkTemplate_Impl is access all IFrameworkTemplate_Interface_Impl'Class;
   type IFrameworkTemplate_Impl_Ptr is access all IFrameworkTemplate_Impl;
   
   function QueryInterface
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFrameworkTemplate_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFrameworkTemplate_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype DataTemplate is Windows.UI.Xaml.IDataTemplate;
   
   type IDataTemplate_Interface_Impl is new IDataTemplate_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IDataTemplate := null;
      m_IDataTemplate : IDataTemplate := null;
   end record;
   
   type IDataTemplate_Impl is access all IDataTemplate_Interface_Impl'Class;
   type IDataTemplate_Impl_Ptr is access all IDataTemplate_Impl;
   
   function QueryInterface
   (
      This       : access IDataTemplate_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IDataTemplate_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IDataTemplate_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IDataTemplate_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IDataTemplate_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IDataTemplate_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function LoadContent
   (
      This       : access IDataTemplate_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT;
   
   
   subtype PropertyPath is Windows.UI.Xaml.IPropertyPath;
   function CreateInstance
   (
      path : Windows.String
   )
   return Windows.UI.Xaml.IPropertyPath;
   
   
   subtype ResourceDictionary is Windows.UI.Xaml.IResourceDictionary;
   
   type IResourceDictionary_Interface_Impl is new IResourceDictionary_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IResourceDictionary := null;
      m_IResourceDictionary : IResourceDictionary := null;
   end record;
   
   type IResourceDictionary_Impl is access all IResourceDictionary_Interface_Impl'Class;
   type IResourceDictionary_Impl_Ptr is access all IResourceDictionary_Impl;
   
   function QueryInterface
   (
      This       : access IResourceDictionary_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IResourceDictionary_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IResourceDictionary_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IResourceDictionary_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IResourceDictionary_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IResourceDictionary_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Source
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT;
   
   function put_Source
   (
      This       : access IResourceDictionary_Interface_Impl
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT;
   
   function get_MergedDictionaries
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IVector_IResourceDictionary -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function get_ThemeDictionaries
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   
   subtype SetterBase is Windows.UI.Xaml.ISetterBase;
   
   subtype SizeChangedEventArgs is Windows.UI.Xaml.ISizeChangedEventArgs;
   subtype StateTriggerBase is Windows.UI.Xaml.IStateTriggerBase;
   
   type IStateTriggerBase_Interface_Impl is new IStateTriggerBase_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IStateTriggerBase := null;
      m_IStateTriggerBase : IStateTriggerBase := null;
   end record;
   
   type IStateTriggerBase_Impl is access all IStateTriggerBase_Interface_Impl'Class;
   type IStateTriggerBase_Impl_Ptr is access all IStateTriggerBase_Impl;
   
   function QueryInterface
   (
      This       : access IStateTriggerBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IStateTriggerBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IStateTriggerBase_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IStateTriggerBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IStateTriggerBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IStateTriggerBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype Style is Windows.UI.Xaml.IStyle;
   function CreateInstance
   (
      targetType : Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.UI.Xaml.IStyle;
   
   
   subtype TriggerAction is Windows.UI.Xaml.ITriggerAction;
   
   subtype TriggerBase is Windows.UI.Xaml.ITriggerBase;
   
   subtype UIElement is Windows.UI.Xaml.IUIElement;
   
   subtype VisualState is Windows.UI.Xaml.IVisualState;
   
   function CreateVisualState return Windows.UI.Xaml.IVisualState;
   
   subtype VisualStateGroup is Windows.UI.Xaml.IVisualStateGroup;
   
   function CreateVisualStateGroup return Windows.UI.Xaml.IVisualStateGroup;
   
   subtype VisualTransition is Windows.UI.Xaml.IVisualTransition;
   
   type IVisualTransition_Interface_Impl is new IVisualTransition_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IVisualTransition := null;
      m_IVisualTransition : IVisualTransition := null;
   end record;
   
   type IVisualTransition_Impl is access all IVisualTransition_Interface_Impl'Class;
   type IVisualTransition_Impl_Ptr is access all IVisualTransition_Impl;
   
   function QueryInterface
   (
      This       : access IVisualTransition_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IVisualTransition_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IVisualTransition_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IVisualTransition_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IVisualTransition_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IVisualTransition_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_GeneratedDuration
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT;
   
   function put_GeneratedDuration
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT;
   
   function get_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT;
   
   function put_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT;
   
   function get_To
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_To
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_From
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_From
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_Storyboard
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT;
   
   function put_Storyboard
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT;
   
   
   subtype AdaptiveTrigger is Windows.UI.Xaml.IAdaptiveTrigger;
   
   type IAdaptiveTrigger_Interface_Impl is new IAdaptiveTrigger_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IAdaptiveTrigger := null;
      m_IAdaptiveTrigger : IAdaptiveTrigger := null;
   end record;
   
   type IAdaptiveTrigger_Impl is access all IAdaptiveTrigger_Interface_Impl'Class;
   type IAdaptiveTrigger_Impl_Ptr is access all IAdaptiveTrigger_Impl;
   
   function QueryInterface
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IAdaptiveTrigger_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IAdaptiveTrigger_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   
   subtype EventTrigger is Windows.UI.Xaml.IEventTrigger;
   
   function CreateEventTrigger return Windows.UI.Xaml.IEventTrigger;
   
   subtype FrameworkElement is Windows.UI.Xaml.IFrameworkElement;
   
   type IFrameworkElementOverrides_Interface_Impl is new IFrameworkElementOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IFrameworkElementOverrides := null;
      m_IFrameworkElement : IFrameworkElement := null;
   end record;
   
   type IFrameworkElementOverrides_Impl is access all IFrameworkElementOverrides_Interface_Impl'Class;
   type IFrameworkElementOverrides_Impl_Ptr is access all IFrameworkElementOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function MeasureOverride
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
      ; availableSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT;
   
   function ArrangeOverride
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
      ; finalSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT;
   
   function OnApplyTemplate
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.HRESULT;
   
   
   type IFrameworkElementOverrides2_Interface_Impl is new IFrameworkElementOverrides2_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IFrameworkElementOverrides2 := null;
      m_IFrameworkElement : IFrameworkElement := null;
   end record;
   
   type IFrameworkElementOverrides2_Impl is access all IFrameworkElementOverrides2_Interface_Impl'Class;
   type IFrameworkElementOverrides2_Impl_Ptr is access all IFrameworkElementOverrides2_Impl;
   
   function QueryInterface
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function GoToElementStateCore
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   
   type IFrameworkElement_Interface_Impl is new IFrameworkElement_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IFrameworkElement := null;
      m_IFrameworkElement : IFrameworkElement := null;
   end record;
   
   type IFrameworkElement_Impl is access all IFrameworkElement_Interface_Impl'Class;
   type IFrameworkElement_Impl_Ptr is access all IFrameworkElement_Impl;
   
   function QueryInterface
   (
      This       : access IFrameworkElement_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IFrameworkElement_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IFrameworkElement_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IFrameworkElement_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElement_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElement_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Triggers
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IVector_TriggerBase
   )
   return Windows.HRESULT;
   
   function get_Resources
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT;
   
   function put_Resources
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT;
   
   function get_Tag
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_Tag
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function get_Language
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_Language
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_ActualWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_ActualHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function get_Width
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Width
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_Height
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_Height
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_MinWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MinWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_MaxWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MaxWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_MinHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MinHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_MaxHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_MaxHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function put_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT;
   
   function get_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function put_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT;
   
   function get_Margin
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_Margin
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function get_Name
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT;
   
   function put_Name
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT;
   
   function get_BaseUri
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT;
   
   function get_DataContext
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function put_DataContext
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT;
   
   function get_Style
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT;
   
   function put_Style
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT;
   
   function get_Parent
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT;
   
   function get_FlowDirection
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT;
   
   function put_FlowDirection
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT;
   
   function add_Loaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Loaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Unloaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Unloaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_SizeChanged
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.SizeChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_SizeChanged
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function FindName
   (
      This       : access IFrameworkElement_Interface_Impl
      ; name : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   function SetBinding
   (
      This       : access IFrameworkElement_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; binding : Windows.UI.Xaml.Data.IBindingBase
   )
   return Windows.HRESULT;
   
   
   subtype MediaFailedRoutedEventArgs is Windows.UI.Xaml.IMediaFailedRoutedEventArgs;
   subtype Setter is Windows.UI.Xaml.ISetter;
   
   function CreateSetter return Windows.UI.Xaml.ISetter;
   
   subtype StateTrigger is Windows.UI.Xaml.IStateTrigger;
   
   function CreateStateTrigger return Windows.UI.Xaml.IStateTrigger;
   
   subtype GridLengthHelper is Windows.UI.Xaml.IGridLengthHelper;
   subtype BindingFailedEventArgs is Windows.UI.Xaml.IBindingFailedEventArgs;
   subtype DebugSettings is Windows.UI.Xaml.IDebugSettings;
   subtype ElementSoundPlayer is Windows.UI.Xaml.IElementSoundPlayer;
   subtype WindowCreatedEventArgs is Windows.UI.Xaml.IWindowCreatedEventArgs;
   subtype Application is Windows.UI.Xaml.IApplication;
   
   type IApplicationOverrides_Interface_Impl is new IApplicationOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IApplicationOverrides := null;
      m_IApplication : IApplication := null;
   end record;
   
   type IApplicationOverrides_Impl is access all IApplicationOverrides_Interface_Impl'Class;
   type IApplicationOverrides_Impl_Ptr is access all IApplicationOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IApplicationOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IApplicationOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IApplicationOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IApplicationOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IApplicationOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IApplicationOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function OnActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnLaunched
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ILaunchActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnFileActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnSearchActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ISearchActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnShareTargetActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IShareTargetActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnFileOpenPickerActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileOpenPickerActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnFileSavePickerActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileSavePickerActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnCachedFileUpdaterActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ICachedFileUpdaterActivatedEventArgs
   )
   return Windows.HRESULT;
   
   function OnWindowCreated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.UI.Xaml.IWindowCreatedEventArgs
   )
   return Windows.HRESULT;
   
   
   type IApplicationOverrides2_Interface_Impl is new IApplicationOverrides2_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IApplicationOverrides2 := null;
      m_IApplication : IApplication := null;
   end record;
   
   type IApplicationOverrides2_Impl is access all IApplicationOverrides2_Interface_Impl'Class;
   type IApplicationOverrides2_Impl_Ptr is access all IApplicationOverrides2_Impl;
   
   function QueryInterface
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IApplicationOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IApplicationOverrides2_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function OnBackgroundActivated
   (
      This       : access IApplicationOverrides2_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT;
   
   
   type IApplication_Interface_Impl is new IApplication_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IApplication := null;
      m_IApplication : IApplication := null;
   end record;
   
   type IApplication_Impl is access all IApplication_Interface_Impl'Class;
   type IApplication_Impl_Ptr is access all IApplication_Impl;
   
   function QueryInterface
   (
      This       : access IApplication_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IApplication_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IApplication_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IApplication_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Resources
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT;
   
   function put_Resources
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT;
   
   function get_DebugSettings
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDebugSettings
   )
   return Windows.HRESULT;
   
   function get_RequestedTheme
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT;
   
   function put_RequestedTheme
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT;
   
   function add_UnhandledException
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.UnhandledExceptionEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_UnhandledException
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Suspending
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.SuspendingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Suspending
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_Resuming
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Resuming
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function Exit_x
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.HRESULT;
   
   
   subtype FrameworkViewSource is Windows.UI.Xaml.IFrameworkViewSource;
   
   function CreateFrameworkViewSource return Windows.UI.Xaml.IFrameworkViewSource;
   
   subtype PointHelper is Windows.UI.Xaml.IPointHelper;
   subtype RectHelper is Windows.UI.Xaml.IRectHelper;
   subtype SizeHelper is Windows.UI.Xaml.ISizeHelper;
   subtype Window is Windows.UI.Xaml.IWindow;
   subtype VisualStateManager is Windows.UI.Xaml.IVisualStateManager;
   
   type IVisualStateManagerOverrides_Interface_Impl is new IVisualStateManagerOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IVisualStateManagerOverrides := null;
      m_IVisualStateManager : IVisualStateManager := null;
   end record;
   
   type IVisualStateManagerOverrides_Impl is access all IVisualStateManagerOverrides_Interface_Impl'Class;
   type IVisualStateManagerOverrides_Impl_Ptr is access all IVisualStateManagerOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function GoToStateCore
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
      ; control : Windows.UI.Xaml.Controls.IControl
      ; templateRoot : Windows.UI.Xaml.IFrameworkElement
      ; stateName : Windows.String
      ; group : Windows.UI.Xaml.IVisualStateGroup
      ; state : Windows.UI.Xaml.IVisualState
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   
   type IVisualStateManager_Interface_Impl is new IVisualStateManager_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IVisualStateManager := null;
      m_IVisualStateManager : IVisualStateManager := null;
   end record;
   
   type IVisualStateManager_Impl is access all IVisualStateManager_Interface_Impl'Class;
   type IVisualStateManager_Impl_Ptr is access all IVisualStateManager_Impl;
   
   function QueryInterface
   (
      This       : access IVisualStateManager_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IVisualStateManager_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IVisualStateManager_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IVisualStateManager_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IVisualStateManager_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IVisualStateManager_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDispatcherTimer;
   
   function FromRadii
   (
      topLeft : Windows.Double
      ; topRight : Windows.Double
      ; bottomRight : Windows.Double
      ; bottomLeft : Windows.Double
   )
   return Windows.UI.Xaml.CornerRadius;
   
   function FromUniformRadius
   (
      uniformRadius : Windows.Double
   )
   return Windows.UI.Xaml.CornerRadius;
   
   function get_Automatic
   return Windows.UI.Xaml.Duration;
   
   function get_Forever
   return Windows.UI.Xaml.Duration;
   
   function Compare
   (
      duration1 : Windows.UI.Xaml.Duration
      ; duration2 : Windows.UI.Xaml.Duration
   )
   return Windows.Int32;
   
   function FromTimeSpan
   (
      timeSpan : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Duration;
   
   function GetHasTimeSpan
   (
      target : Windows.UI.Xaml.Duration
   )
   return Windows.Boolean;
   
   function Add
   (
      target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
   )
   return Windows.UI.Xaml.Duration;
   
   function Equals
   (
      target : Windows.UI.Xaml.Duration
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.Boolean;
   
   function Subtract
   (
      target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
   )
   return Windows.UI.Xaml.Duration;
   
   function FromLengths
   (
      left : Windows.Double
      ; top : Windows.Double
      ; right : Windows.Double
      ; bottom : Windows.Double
   )
   return Windows.UI.Xaml.Thickness;
   
   function FromUniformLength
   (
      uniformLength : Windows.Double
   )
   return Windows.UI.Xaml.Thickness;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function get_UnsetValue
   return Windows.Object;
   
   function Register
   (
      name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; typeMetadata : Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.UI.Xaml.IDependencyProperty;
   
   function RegisterAttached
   (
      name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; defaultMetadata : Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IRoutedEventArgs;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplateKey;
   
   function CreateInstanceWithType
   (
      dataType : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplateKey;
   
   function CreateWithDefaultValue
   (
      defaultValue : Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateWithDefaultValueAndCallback
   (
      defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateWithFactory
   (
      createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateWithFactoryAndCallback
   (
      createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateInstanceWithDefaultValue
   (
      defaultValue : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateInstanceWithDefaultValueAndCallback
   (
      defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IObservableVector_DependencyObject;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IFrameworkTemplate;
   
   function get_ExtensionInstanceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetExtensionInstance
   (
      element : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IDataTemplateExtension;
   
   procedure SetExtensionInstance
   (
      element : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IDataTemplateExtension
   )
   ;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplate;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IResourceDictionary;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IStateTriggerBase;
   
   function get_CompositeModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PreviewKeyDownEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_CharacterReceivedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PreviewKeyUpEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_LightsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipPlacementModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusKeyboardNavigationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusUpNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusDownNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusLeftNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusRightNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HighContrastAdjustmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TabFocusNavigationProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyDownEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_KeyUpEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerEnteredEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerPressedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerMovedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerReleasedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerExitedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerCaptureLostEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerCanceledEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_PointerWheelChangedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_TappedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_DoubleTappedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_HoldingEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_RightTappedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_ManipulationStartingEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_ManipulationInertiaStartingEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_ManipulationStartedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_ManipulationDeltaEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_ManipulationCompletedEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_DragEnterEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_DragLeaveEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_DragOverEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_DropEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_AllowDropProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OpacityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ClipProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RenderTransformProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ProjectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RenderTransformOriginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsHitTestVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VisibilityProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_UseLayoutRoundingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TransitionsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CacheModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsDoubleTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsRightTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsHoldingEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ManipulationModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointerCapturesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Transform3DProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CanDragProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function TryStartDirectManipulation
   (
      value : Windows.UI.Xaml.Input.IPointer
   )
   return Windows.Boolean;
   
   function get_ContextFlyoutProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitDisplayModeOnAccessKeyInvokedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsAccessKeyScopeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AccessKeyScopeOwnerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_GettingFocusEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_LosingFocusEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function get_NoFocusCandidateFoundEvent
   return Windows.UI.Xaml.IRoutedEvent;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IVisualTransition;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IAdaptiveTrigger;
   
   function get_MinWindowWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinWindowHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IFrameworkElement;
   
   function get_TagProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LanguageProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ActualWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ActualHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_WidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaxWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MinHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MaxHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HorizontalAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_VerticalAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MarginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_NameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DataContextProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StyleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FlowDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RequestedThemeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowFocusOnInteractionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusVisualMarginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusVisualSecondaryThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusVisualPrimaryThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusVisualSecondaryBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusVisualPrimaryBrushProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowFocusWhenDisabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   procedure DeferTree
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   ;
   
   function get_ActualThemeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsActiveProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Auto
   return Windows.UI.Xaml.GridLength;
   
   function FromPixels
   (
      pixels : Windows.Double
   )
   return Windows.UI.Xaml.GridLength;
   
   function FromValueAndType
   (
      value : Windows.Double
      ; type_x : Windows.UI.Xaml.GridUnitType
   )
   return Windows.UI.Xaml.GridLength;
   
   function GetIsAbsolute
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean;
   
   function GetIsAuto
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean;
   
   function GetIsStar
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean;
   
   function Equals
   (
      target : Windows.UI.Xaml.GridLength
      ; value : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean;
   
   function get_Volume
   return Windows.Double;
   
   procedure put_Volume
   (
      value : Windows.Double
   )
   ;
   
   function get_State
   return Windows.UI.Xaml.ElementSoundPlayerState;
   
   procedure put_State
   (
      value : Windows.UI.Xaml.ElementSoundPlayerState
   )
   ;
   
   procedure Play
   (
      sound : Windows.UI.Xaml.ElementSoundKind
   )
   ;
   
   function get_Current
   return Windows.UI.Xaml.IApplication;
   
   procedure Start
   (
      callback : Windows.UI.Xaml.ApplicationInitializationCallback
   )
   ;
   
   procedure LoadComponent
   (
      component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
   )
   ;
   
   procedure LoadComponentWithResourceLocation
   (
      component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
      ; componentResourceLocation : Windows.UI.Xaml.Controls.Primitives.ComponentResourceLocation
   )
   ;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IApplication;
   
   function FromCoordinates
   (
      x : Windows.Single
      ; y : Windows.Single
   )
   return Windows.Foundation.Point;
   
   function get_Empty
   return Windows.Foundation.Rect;
   
   function FromCoordinatesAndDimensions
   (
      x : Windows.Single
      ; y : Windows.Single
      ; width : Windows.Single
      ; height : Windows.Single
   )
   return Windows.Foundation.Rect;
   
   function FromPoints
   (
      point1 : Windows.Foundation.Point
      ; point2 : Windows.Foundation.Point
   )
   return Windows.Foundation.Rect;
   
   function FromLocationAndSize
   (
      location : Windows.Foundation.Point
      ; size : Windows.Foundation.Size
   )
   return Windows.Foundation.Rect;
   
   function GetIsEmpty
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Boolean;
   
   function GetBottom
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single;
   
   function GetLeft
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single;
   
   function GetRight
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single;
   
   function GetTop
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single;
   
   function Contains
   (
      target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
   )
   return Windows.Boolean;
   
   function Equals
   (
      target : Windows.Foundation.Rect
      ; value : Windows.Foundation.Rect
   )
   return Windows.Boolean;
   
   function Intersect
   (
      target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
   )
   return Windows.Foundation.Rect;
   
   function UnionWithPoint
   (
      target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
   )
   return Windows.Foundation.Rect;
   
   function UnionWithRect
   (
      target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
   )
   return Windows.Foundation.Rect;
   
   function get_Empty
   return Windows.Foundation.Size;
   
   function FromDimensions
   (
      width : Windows.Single
      ; height : Windows.Single
   )
   return Windows.Foundation.Size;
   
   function GetIsEmpty
   (
      target : Windows.Foundation.Size
   )
   return Windows.Boolean;
   
   function Equals
   (
      target : Windows.Foundation.Size
      ; value : Windows.Foundation.Size
   )
   return Windows.Boolean;
   
   function get_Current
   return Windows.UI.Xaml.IWindow;
   
   function GetVisualStateGroups
   (
      obj : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IVector_IVisualStateGroup;
   
   function get_CustomVisualStateManagerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetCustomVisualStateManager
   (
      obj : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IVisualStateManager;
   
   procedure SetCustomVisualStateManager
   (
      obj : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IVisualStateManager
   )
   ;
   
   function GoToState
   (
      control : Windows.UI.Xaml.Controls.IControl
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
   )
   return Windows.Boolean;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IVisualStateManager;
   
end;
