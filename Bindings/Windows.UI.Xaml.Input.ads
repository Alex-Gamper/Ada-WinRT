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
limited with Windows.Devices.Input;
limited with Windows.System;
with Windows.Foundation;
limited with Windows.UI.Core;
limited with Windows.UI.Input;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Input is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type FocusInputDeviceKind is (
      None,
      Mouse,
      Touch,
      Pen,
      Keyboard,
      GameController
   );
   for FocusInputDeviceKind use (
      None => 0,
      Mouse => 1,
      Touch => 2,
      Pen => 3,
      Keyboard => 4,
      GameController => 5
   );
   for FocusInputDeviceKind'Size use 32;
   
   type FocusInputDeviceKind_Ptr is access FocusInputDeviceKind;
   
   type FocusNavigationDirection is (
      Next,
      Previous,
      Up,
      Down,
      Left,
      Right,
      None
   );
   for FocusNavigationDirection use (
      Next => 0,
      Previous => 1,
      Up => 2,
      Down => 3,
      Left => 4,
      Right => 5,
      None => 6
   );
   for FocusNavigationDirection'Size use 32;
   
   type FocusNavigationDirection_Ptr is access FocusNavigationDirection;
   
   type InputScopeNameValue is (
      Default,
      Url,
      EmailSmtpAddress,
      PersonalFullName,
      CurrencyAmountAndSymbol,
      CurrencyAmount,
      DateMonthNumber,
      DateDayNumber,
      DateYear,
      Digits_x,
      Number,
      Password,
      TelephoneNumber,
      TelephoneCountryCode,
      TelephoneAreaCode,
      TelephoneLocalNumber,
      TimeHour,
      TimeMinutesOrSeconds,
      NumberFullWidth,
      AlphanumericHalfWidth,
      AlphanumericFullWidth,
      Hiragana,
      KatakanaHalfWidth,
      KatakanaFullWidth,
      Hanja,
      HangulHalfWidth,
      HangulFullWidth,
      Search,
      Formula,
      SearchIncremental,
      ChineseHalfWidth,
      ChineseFullWidth,
      NativeScript,
      Text,
      Chat,
      NameOrPhoneNumber,
      EmailNameOrAddress,
      Maps,
      NumericPassword,
      NumericPin,
      AlphanumericPin,
      FormulaNumber,
      ChatWithoutEmoji
   );
   for InputScopeNameValue use (
      Default => 0,
      Url => 1,
      EmailSmtpAddress => 5,
      PersonalFullName => 7,
      CurrencyAmountAndSymbol => 20,
      CurrencyAmount => 21,
      DateMonthNumber => 23,
      DateDayNumber => 24,
      DateYear => 25,
      Digits_x => 28,
      Number => 29,
      Password => 31,
      TelephoneNumber => 32,
      TelephoneCountryCode => 33,
      TelephoneAreaCode => 34,
      TelephoneLocalNumber => 35,
      TimeHour => 37,
      TimeMinutesOrSeconds => 38,
      NumberFullWidth => 39,
      AlphanumericHalfWidth => 40,
      AlphanumericFullWidth => 41,
      Hiragana => 44,
      KatakanaHalfWidth => 45,
      KatakanaFullWidth => 46,
      Hanja => 47,
      HangulHalfWidth => 48,
      HangulFullWidth => 49,
      Search => 50,
      Formula => 51,
      SearchIncremental => 52,
      ChineseHalfWidth => 53,
      ChineseFullWidth => 54,
      NativeScript => 55,
      Text => 57,
      Chat => 58,
      NameOrPhoneNumber => 59,
      EmailNameOrAddress => 60,
      Maps => 62,
      NumericPassword => 63,
      NumericPin => 64,
      AlphanumericPin => 65,
      FormulaNumber => 67,
      ChatWithoutEmoji => 68
   );
   for InputScopeNameValue'Size use 32;
   
   type InputScopeNameValue_Ptr is access InputScopeNameValue;
   
   type KeyboardNavigationMode is (
      Local,
      Cycle,
      Once
   );
   for KeyboardNavigationMode use (
      Local => 0,
      Cycle => 1,
      Once => 2
   );
   for KeyboardNavigationMode'Size use 32;
   
   type KeyboardNavigationMode_Ptr is access KeyboardNavigationMode;
   
   type KeyTipPlacementMode is (
      Auto,
      Bottom,
      Top,
      Left,
      Right,
      Center,
      Hidden
   );
   for KeyTipPlacementMode use (
      Auto => 0,
      Bottom => 1,
      Top => 2,
      Left => 3,
      Right => 4,
      Center => 5,
      Hidden => 6
   );
   for KeyTipPlacementMode'Size use 32;
   
   type KeyTipPlacementMode_Ptr is access KeyTipPlacementMode;
   
   type ManipulationModes is (
      None,
      TranslateX,
      TranslateY,
      TranslateRailsX,
      TranslateRailsY,
      Rotate,
      Scale,
      TranslateInertia,
      RotateInertia,
      ScaleInertia,
      All_x,
      System
   );
   for ManipulationModes use (
      None => 0,
      TranslateX => 1,
      TranslateY => 2,
      TranslateRailsX => 4,
      TranslateRailsY => 8,
      Rotate => 16,
      Scale => 32,
      TranslateInertia => 64,
      RotateInertia => 128,
      ScaleInertia => 256,
      All_x => 65535,
      System => 65536
   );
   for ManipulationModes'Size use 32;
   
   type ManipulationModes_Ptr is access ManipulationModes;
   
   type XYFocusKeyboardNavigationMode is (
      Auto,
      Enabled,
      Disabled
   );
   for XYFocusKeyboardNavigationMode use (
      Auto => 0,
      Enabled => 1,
      Disabled => 2
   );
   for XYFocusKeyboardNavigationMode'Size use 32;
   
   type XYFocusKeyboardNavigationMode_Ptr is access XYFocusKeyboardNavigationMode;
   
   type XYFocusNavigationStrategy is (
      Auto,
      Projection,
      NavigationDirectionDistance,
      RectilinearDistance
   );
   for XYFocusNavigationStrategy use (
      Auto => 0,
      Projection => 1,
      NavigationDirectionDistance => 2,
      RectilinearDistance => 3
   );
   for XYFocusNavigationStrategy'Size use 32;
   
   type XYFocusNavigationStrategy_Ptr is access XYFocusNavigationStrategy;
   
   type XYFocusNavigationStrategyOverride is (
      None,
      Auto,
      Projection,
      NavigationDirectionDistance,
      RectilinearDistance
   );
   for XYFocusNavigationStrategyOverride use (
      None => 0,
      Auto => 1,
      Projection => 2,
      NavigationDirectionDistance => 3,
      RectilinearDistance => 4
   );
   for XYFocusNavigationStrategyOverride'Size use 32;
   
   type XYFocusNavigationStrategyOverride_Ptr is access XYFocusNavigationStrategyOverride;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DoubleTappedEventHandler_Interface;
   type DoubleTappedEventHandler is access all DoubleTappedEventHandler_Interface'Class;
   type DoubleTappedEventHandler_Ptr is access all DoubleTappedEventHandler;
   type HoldingEventHandler_Interface;
   type HoldingEventHandler is access all HoldingEventHandler_Interface'Class;
   type HoldingEventHandler_Ptr is access all HoldingEventHandler;
   type KeyEventHandler_Interface;
   type KeyEventHandler is access all KeyEventHandler_Interface'Class;
   type KeyEventHandler_Ptr is access all KeyEventHandler;
   type ManipulationCompletedEventHandler_Interface;
   type ManipulationCompletedEventHandler is access all ManipulationCompletedEventHandler_Interface'Class;
   type ManipulationCompletedEventHandler_Ptr is access all ManipulationCompletedEventHandler;
   type ManipulationDeltaEventHandler_Interface;
   type ManipulationDeltaEventHandler is access all ManipulationDeltaEventHandler_Interface'Class;
   type ManipulationDeltaEventHandler_Ptr is access all ManipulationDeltaEventHandler;
   type ManipulationInertiaStartingEventHandler_Interface;
   type ManipulationInertiaStartingEventHandler is access all ManipulationInertiaStartingEventHandler_Interface'Class;
   type ManipulationInertiaStartingEventHandler_Ptr is access all ManipulationInertiaStartingEventHandler;
   type ManipulationStartedEventHandler_Interface;
   type ManipulationStartedEventHandler is access all ManipulationStartedEventHandler_Interface'Class;
   type ManipulationStartedEventHandler_Ptr is access all ManipulationStartedEventHandler;
   type ManipulationStartingEventHandler_Interface;
   type ManipulationStartingEventHandler is access all ManipulationStartingEventHandler_Interface'Class;
   type ManipulationStartingEventHandler_Ptr is access all ManipulationStartingEventHandler;
   type PointerEventHandler_Interface;
   type PointerEventHandler is access all PointerEventHandler_Interface'Class;
   type PointerEventHandler_Ptr is access all PointerEventHandler;
   type RightTappedEventHandler_Interface;
   type RightTappedEventHandler is access all RightTappedEventHandler_Interface'Class;
   type RightTappedEventHandler_Ptr is access all RightTappedEventHandler;
   type TappedEventHandler_Interface;
   type TappedEventHandler is access all TappedEventHandler_Interface'Class;
   type TappedEventHandler_Ptr is access all TappedEventHandler;
   type TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface;
   type TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged is access all TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface'Class;
   type TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Ptr is access all TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged;
   type TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface;
   type TypedEventHandler_IKeyboardAccelerator_add_Invoked is access all TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface'Class;
   type TypedEventHandler_IKeyboardAccelerator_add_Invoked_Ptr is access all TypedEventHandler_IKeyboardAccelerator_add_Invoked;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICommand_Interface;
   type ICommand is access all ICommand_Interface'Class;
   type ICommand_Ptr is access all ICommand;
   type IAccessKeyDisplayDismissedEventArgs_Interface;
   type IAccessKeyDisplayDismissedEventArgs is access all IAccessKeyDisplayDismissedEventArgs_Interface'Class;
   type IAccessKeyDisplayDismissedEventArgs_Ptr is access all IAccessKeyDisplayDismissedEventArgs;
   type IAccessKeyDisplayRequestedEventArgs_Interface;
   type IAccessKeyDisplayRequestedEventArgs is access all IAccessKeyDisplayRequestedEventArgs_Interface'Class;
   type IAccessKeyDisplayRequestedEventArgs_Ptr is access all IAccessKeyDisplayRequestedEventArgs;
   type IAccessKeyInvokedEventArgs_Interface;
   type IAccessKeyInvokedEventArgs is access all IAccessKeyInvokedEventArgs_Interface'Class;
   type IAccessKeyInvokedEventArgs_Ptr is access all IAccessKeyInvokedEventArgs;
   type IAccessKeyManager_Interface;
   type IAccessKeyManager is access all IAccessKeyManager_Interface'Class;
   type IAccessKeyManager_Ptr is access all IAccessKeyManager;
   type IAccessKeyManagerStatics_Interface;
   type IAccessKeyManagerStatics is access all IAccessKeyManagerStatics_Interface'Class;
   type IAccessKeyManagerStatics_Ptr is access all IAccessKeyManagerStatics;
   type IAccessKeyManagerStatics2_Interface;
   type IAccessKeyManagerStatics2 is access all IAccessKeyManagerStatics2_Interface'Class;
   type IAccessKeyManagerStatics2_Ptr is access all IAccessKeyManagerStatics2;
   type IInertiaExpansionBehavior_Interface;
   type IInertiaExpansionBehavior is access all IInertiaExpansionBehavior_Interface'Class;
   type IInertiaExpansionBehavior_Ptr is access all IInertiaExpansionBehavior;
   type IInertiaRotationBehavior_Interface;
   type IInertiaRotationBehavior is access all IInertiaRotationBehavior_Interface'Class;
   type IInertiaRotationBehavior_Ptr is access all IInertiaRotationBehavior;
   type IInertiaTranslationBehavior_Interface;
   type IInertiaTranslationBehavior is access all IInertiaTranslationBehavior_Interface'Class;
   type IInertiaTranslationBehavior_Ptr is access all IInertiaTranslationBehavior;
   type IKeyboardAcceleratorInvokedEventArgs_Interface;
   type IKeyboardAcceleratorInvokedEventArgs is access all IKeyboardAcceleratorInvokedEventArgs_Interface'Class;
   type IKeyboardAcceleratorInvokedEventArgs_Ptr is access all IKeyboardAcceleratorInvokedEventArgs;
   type IManipulationPivot_Interface;
   type IManipulationPivot is access all IManipulationPivot_Interface'Class;
   type IManipulationPivot_Ptr is access all IManipulationPivot;
   type IManipulationPivotFactory_Interface;
   type IManipulationPivotFactory is access all IManipulationPivotFactory_Interface'Class;
   type IManipulationPivotFactory_Ptr is access all IManipulationPivotFactory;
   type IPointer_Interface;
   type IPointer is access all IPointer_Interface'Class;
   type IPointer_Ptr is access all IPointer;
   type IProcessKeyboardAcceleratorEventArgs_Interface;
   type IProcessKeyboardAcceleratorEventArgs is access all IProcessKeyboardAcceleratorEventArgs_Interface'Class;
   type IProcessKeyboardAcceleratorEventArgs_Ptr is access all IProcessKeyboardAcceleratorEventArgs;
   type ICharacterReceivedRoutedEventArgs_Interface;
   type ICharacterReceivedRoutedEventArgs is access all ICharacterReceivedRoutedEventArgs_Interface'Class;
   type ICharacterReceivedRoutedEventArgs_Ptr is access all ICharacterReceivedRoutedEventArgs;
   type IContextRequestedEventArgs_Interface;
   type IContextRequestedEventArgs is access all IContextRequestedEventArgs_Interface'Class;
   type IContextRequestedEventArgs_Ptr is access all IContextRequestedEventArgs;
   type IDoubleTappedRoutedEventArgs_Interface;
   type IDoubleTappedRoutedEventArgs is access all IDoubleTappedRoutedEventArgs_Interface'Class;
   type IDoubleTappedRoutedEventArgs_Ptr is access all IDoubleTappedRoutedEventArgs;
   type IGettingFocusEventArgs_Interface;
   type IGettingFocusEventArgs is access all IGettingFocusEventArgs_Interface'Class;
   type IGettingFocusEventArgs_Ptr is access all IGettingFocusEventArgs;
   type IHoldingRoutedEventArgs_Interface;
   type IHoldingRoutedEventArgs is access all IHoldingRoutedEventArgs_Interface'Class;
   type IHoldingRoutedEventArgs_Ptr is access all IHoldingRoutedEventArgs;
   type IInputScope_Interface;
   type IInputScope is access all IInputScope_Interface'Class;
   type IInputScope_Ptr is access all IInputScope;
   type IInputScopeName_Interface;
   type IInputScopeName is access all IInputScopeName_Interface'Class;
   type IInputScopeName_Ptr is access all IInputScopeName;
   type IInputScopeNameFactory_Interface;
   type IInputScopeNameFactory is access all IInputScopeNameFactory_Interface'Class;
   type IInputScopeNameFactory_Ptr is access all IInputScopeNameFactory;
   type IKeyboardAccelerator_Interface;
   type IKeyboardAccelerator is access all IKeyboardAccelerator_Interface'Class;
   type IKeyboardAccelerator_Ptr is access all IKeyboardAccelerator;
   type IKeyboardAcceleratorStatics_Interface;
   type IKeyboardAcceleratorStatics is access all IKeyboardAcceleratorStatics_Interface'Class;
   type IKeyboardAcceleratorStatics_Ptr is access all IKeyboardAcceleratorStatics;
   type IKeyboardAcceleratorFactory_Interface;
   type IKeyboardAcceleratorFactory is access all IKeyboardAcceleratorFactory_Interface'Class;
   type IKeyboardAcceleratorFactory_Ptr is access all IKeyboardAcceleratorFactory;
   type IKeyRoutedEventArgs_Interface;
   type IKeyRoutedEventArgs is access all IKeyRoutedEventArgs_Interface'Class;
   type IKeyRoutedEventArgs_Ptr is access all IKeyRoutedEventArgs;
   type IKeyRoutedEventArgs2_Interface;
   type IKeyRoutedEventArgs2 is access all IKeyRoutedEventArgs2_Interface'Class;
   type IKeyRoutedEventArgs2_Ptr is access all IKeyRoutedEventArgs2;
   type IKeyRoutedEventArgs3_Interface;
   type IKeyRoutedEventArgs3 is access all IKeyRoutedEventArgs3_Interface'Class;
   type IKeyRoutedEventArgs3_Ptr is access all IKeyRoutedEventArgs3;
   type ILosingFocusEventArgs_Interface;
   type ILosingFocusEventArgs is access all ILosingFocusEventArgs_Interface'Class;
   type ILosingFocusEventArgs_Ptr is access all ILosingFocusEventArgs;
   type IManipulationCompletedRoutedEventArgs_Interface;
   type IManipulationCompletedRoutedEventArgs is access all IManipulationCompletedRoutedEventArgs_Interface'Class;
   type IManipulationCompletedRoutedEventArgs_Ptr is access all IManipulationCompletedRoutedEventArgs;
   type IManipulationDeltaRoutedEventArgs_Interface;
   type IManipulationDeltaRoutedEventArgs is access all IManipulationDeltaRoutedEventArgs_Interface'Class;
   type IManipulationDeltaRoutedEventArgs_Ptr is access all IManipulationDeltaRoutedEventArgs;
   type IManipulationInertiaStartingRoutedEventArgs_Interface;
   type IManipulationInertiaStartingRoutedEventArgs is access all IManipulationInertiaStartingRoutedEventArgs_Interface'Class;
   type IManipulationInertiaStartingRoutedEventArgs_Ptr is access all IManipulationInertiaStartingRoutedEventArgs;
   type IManipulationStartedRoutedEventArgs_Interface;
   type IManipulationStartedRoutedEventArgs is access all IManipulationStartedRoutedEventArgs_Interface'Class;
   type IManipulationStartedRoutedEventArgs_Ptr is access all IManipulationStartedRoutedEventArgs;
   type IManipulationStartedRoutedEventArgsFactory_Interface;
   type IManipulationStartedRoutedEventArgsFactory is access all IManipulationStartedRoutedEventArgsFactory_Interface'Class;
   type IManipulationStartedRoutedEventArgsFactory_Ptr is access all IManipulationStartedRoutedEventArgsFactory;
   type IManipulationStartingRoutedEventArgs_Interface;
   type IManipulationStartingRoutedEventArgs is access all IManipulationStartingRoutedEventArgs_Interface'Class;
   type IManipulationStartingRoutedEventArgs_Ptr is access all IManipulationStartingRoutedEventArgs;
   type INoFocusCandidateFoundEventArgs_Interface;
   type INoFocusCandidateFoundEventArgs is access all INoFocusCandidateFoundEventArgs_Interface'Class;
   type INoFocusCandidateFoundEventArgs_Ptr is access all INoFocusCandidateFoundEventArgs;
   type IPointerRoutedEventArgs_Interface;
   type IPointerRoutedEventArgs is access all IPointerRoutedEventArgs_Interface'Class;
   type IPointerRoutedEventArgs_Ptr is access all IPointerRoutedEventArgs;
   type IPointerRoutedEventArgs2_Interface;
   type IPointerRoutedEventArgs2 is access all IPointerRoutedEventArgs2_Interface'Class;
   type IPointerRoutedEventArgs2_Ptr is access all IPointerRoutedEventArgs2;
   type IRightTappedRoutedEventArgs_Interface;
   type IRightTappedRoutedEventArgs is access all IRightTappedRoutedEventArgs_Interface'Class;
   type IRightTappedRoutedEventArgs_Ptr is access all IRightTappedRoutedEventArgs;
   type ITappedRoutedEventArgs_Interface;
   type ITappedRoutedEventArgs is access all ITappedRoutedEventArgs_Interface'Class;
   type ITappedRoutedEventArgs_Ptr is access all ITappedRoutedEventArgs;
   type IFindNextElementOptions_Interface;
   type IFindNextElementOptions is access all IFindNextElementOptions_Interface'Class;
   type IFindNextElementOptions_Ptr is access all IFindNextElementOptions;
   type IFocusManager_Interface;
   type IFocusManager is access all IFocusManager_Interface'Class;
   type IFocusManager_Ptr is access all IFocusManager;
   type IFocusManagerStatics_Interface;
   type IFocusManagerStatics is access all IFocusManagerStatics_Interface'Class;
   type IFocusManagerStatics_Ptr is access all IFocusManagerStatics;
   type IFocusManagerStatics2_Interface;
   type IFocusManagerStatics2 is access all IFocusManagerStatics2_Interface'Class;
   type IFocusManagerStatics2_Ptr is access all IFocusManagerStatics2;
   type IFocusManagerStatics3_Interface;
   type IFocusManagerStatics3 is access all IFocusManagerStatics3_Interface'Class;
   type IFocusManagerStatics3_Ptr is access all IFocusManagerStatics3;
   type IFocusManagerStatics4_Interface;
   type IFocusManagerStatics4 is access all IFocusManagerStatics4_Interface'Class;
   type IFocusManagerStatics4_Ptr is access all IFocusManagerStatics4;
   type IIterator_IPointer_Interface;
   type IIterator_IPointer is access all IIterator_IPointer_Interface'Class;
   type IIterator_IPointer_Ptr is access all IIterator_IPointer;
   type IIterable_IPointer_Interface;
   type IIterable_IPointer is access all IIterable_IPointer_Interface'Class;
   type IIterable_IPointer_Ptr is access all IIterable_IPointer;
   type IVectorView_IPointer_Interface;
   type IVectorView_IPointer is access all IVectorView_IPointer_Interface'Class;
   type IVectorView_IPointer_Ptr is access all IVectorView_IPointer;
   type IIterator_IKeyboardAccelerator_Interface;
   type IIterator_IKeyboardAccelerator is access all IIterator_IKeyboardAccelerator_Interface'Class;
   type IIterator_IKeyboardAccelerator_Ptr is access all IIterator_IKeyboardAccelerator;
   type IIterable_IKeyboardAccelerator_Interface;
   type IIterable_IKeyboardAccelerator is access all IIterable_IKeyboardAccelerator_Interface'Class;
   type IIterable_IKeyboardAccelerator_Ptr is access all IIterable_IKeyboardAccelerator;
   type IVectorView_IKeyboardAccelerator_Interface;
   type IVectorView_IKeyboardAccelerator is access all IVectorView_IKeyboardAccelerator_Interface'Class;
   type IVectorView_IKeyboardAccelerator_Ptr is access all IVectorView_IKeyboardAccelerator;
   type IVector_IKeyboardAccelerator_Interface;
   type IVector_IKeyboardAccelerator is access all IVector_IKeyboardAccelerator_Interface'Class;
   type IVector_IKeyboardAccelerator_Ptr is access all IVector_IKeyboardAccelerator;
   type IIterator_IInputScopeName_Interface;
   type IIterator_IInputScopeName is access all IIterator_IInputScopeName_Interface'Class;
   type IIterator_IInputScopeName_Ptr is access all IIterator_IInputScopeName;
   type IIterable_IInputScopeName_Interface;
   type IIterable_IInputScopeName is access all IIterable_IInputScopeName_Interface'Class;
   type IIterable_IInputScopeName_Ptr is access all IIterable_IInputScopeName;
   type IVectorView_IInputScopeName_Interface;
   type IVectorView_IInputScopeName is access all IVectorView_IInputScopeName_Interface'Class;
   type IVectorView_IInputScopeName_Ptr is access all IVectorView_IInputScopeName;
   type IVector_IInputScopeName_Interface;
   type IVector_IInputScopeName is access all IVector_IInputScopeName_Interface'Class;
   type IVector_IInputScopeName_Ptr is access all IVector_IInputScopeName;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICommand : aliased constant Windows.IID := (3853464898, 51815, 16513, (153, 91, 112, 157, 209, 55, 146, 223 ));
   
   type ICommand_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CanExecuteChanged
   (
      This       : access ICommand_Interface
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CanExecuteChanged
   (
      This       : access ICommand_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CanExecute
   (
      This       : access ICommand_Interface
      ; parameter : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Execute
   (
      This       : access ICommand_Interface
      ; parameter : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyDisplayDismissedEventArgs : aliased constant Windows.IID := (2321616326, 55085, 19624, (159, 102, 85, 111, 53, 181, 19, 218 ));
   
   type IAccessKeyDisplayDismissedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyDisplayRequestedEventArgs : aliased constant Windows.IID := (201825877, 5118, 19715, (166, 29, 225, 47, 6, 86, 114, 134 ));
   
   type IAccessKeyDisplayRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PressedKeys
   (
      This       : access IAccessKeyDisplayRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyInvokedEventArgs : aliased constant Windows.IID := (3488206231, 50968, 16529, (183, 221, 173, 241, 192, 114, 177, 225 ));
   
   type IAccessKeyInvokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IAccessKeyInvokedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IAccessKeyInvokedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyManager : aliased constant Windows.IID := (3972625328, 12009, 19228, (152, 215, 110, 14, 129, 109, 51, 75 ));
   
   type IAccessKeyManager_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyManagerStatics : aliased constant Windows.IID := (1285615590, 55752, 20156, (180, 199, 48, 209, 131, 138, 129, 241 ));
   
   type IAccessKeyManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDisplayModeEnabled
   (
      This       : access IAccessKeyManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_IsDisplayModeEnabledChanged
   (
      This       : access IAccessKeyManagerStatics_Interface
      ; value : TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsDisplayModeEnabledChanged
   (
      This       : access IAccessKeyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ExitDisplayMode
   (
      This       : access IAccessKeyManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccessKeyManagerStatics2 : aliased constant Windows.IID := (2519446932, 10931, 18373, (149, 75, 112, 146, 243, 85, 247, 151 ));
   
   type IAccessKeyManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AreKeyTipsEnabled
   (
      This       : access IAccessKeyManagerStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AreKeyTipsEnabled
   (
      This       : access IAccessKeyManagerStatics2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInertiaExpansionBehavior : aliased constant Windows.IID := (1964869605, 36162, 17605, (150, 94, 60, 211, 12, 201, 214, 247 ));
   
   type IInertiaExpansionBehavior_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredDeceleration
   (
      This       : access IInertiaExpansionBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredDeceleration
   (
      This       : access IInertiaExpansionBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredExpansion
   (
      This       : access IInertiaExpansionBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredExpansion
   (
      This       : access IInertiaExpansionBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInertiaRotationBehavior : aliased constant Windows.IID := (1112341294, 48125, 17957, (174, 120, 32, 198, 91, 241, 239, 175 ));
   
   type IInertiaRotationBehavior_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredDeceleration
   (
      This       : access IInertiaRotationBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredDeceleration
   (
      This       : access IInertiaRotationBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredRotation
   (
      This       : access IInertiaRotationBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredRotation
   (
      This       : access IInertiaRotationBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInertiaTranslationBehavior : aliased constant Windows.IID := (1171498258, 15154, 18562, (164, 194, 236, 250, 45, 75, 109, 240 ));
   
   type IInertiaTranslationBehavior_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredDeceleration
   (
      This       : access IInertiaTranslationBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredDeceleration
   (
      This       : access IInertiaTranslationBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredDisplacement
   (
      This       : access IInertiaTranslationBehavior_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredDisplacement
   (
      This       : access IInertiaTranslationBehavior_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyboardAcceleratorInvokedEventArgs : aliased constant Windows.IID := (3221947378, 1255, 17429, (177, 125, 215, 107, 148, 144, 222, 43 ));
   
   type IKeyboardAcceleratorInvokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IKeyboardAcceleratorInvokedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IKeyboardAcceleratorInvokedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Element
   (
      This       : access IKeyboardAcceleratorInvokedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationPivot : aliased constant Windows.IID := (775436453, 59074, 18840, (130, 172, 24, 116, 139, 20, 22, 102 ));
   
   type IManipulationPivot_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Center
   (
      This       : access IManipulationPivot_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Center
   (
      This       : access IManipulationPivot_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Radius
   (
      This       : access IManipulationPivot_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Radius
   (
      This       : access IManipulationPivot_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationPivotFactory : aliased constant Windows.IID := (1829089337, 14082, 17302, (173, 155, 168, 37, 239, 166, 58, 59 ));
   
   type IManipulationPivotFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithCenterAndRadius
   (
      This       : access IManipulationPivotFactory_Interface
      ; center : Windows.Foundation.Point
      ; radius : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Input.IManipulationPivot
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointer : aliased constant Windows.IID := (1592325023, 29821, 16753, (144, 230, 205, 55, 169, 223, 251, 17 ));
   
   type IPointer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerId
   (
      This       : access IPointer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerDeviceType
   (
      This       : access IPointer_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInContact
   (
      This       : access IPointer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInRange
   (
      This       : access IPointer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessKeyboardAcceleratorEventArgs : aliased constant Windows.IID := (4219060758, 38699, 17420, (155, 131, 43, 65, 152, 220, 240, 157 ));
   
   type IProcessKeyboardAcceleratorEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Key
   (
      This       : access IProcessKeyboardAcceleratorEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_Modifiers
   (
      This       : access IProcessKeyboardAcceleratorEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IProcessKeyboardAcceleratorEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IProcessKeyboardAcceleratorEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICharacterReceivedRoutedEventArgs : aliased constant Windows.IID := (2018114946, 18660, 17485, (148, 25, 147, 171, 136, 146, 193, 7 ));
   
   type ICharacterReceivedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Character
   (
      This       : access ICharacterReceivedRoutedEventArgs_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access ICharacterReceivedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access ICharacterReceivedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ICharacterReceivedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContextRequestedEventArgs : aliased constant Windows.IID := (1113689610, 7350, 18171, (131, 116, 10, 236, 104, 170, 94, 81 ));
   
   type IContextRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IContextRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IContextRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPosition
   (
      This       : access IContextRequestedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; point : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDoubleTappedRoutedEventArgs : aliased constant Windows.IID := (2940224548, 9951, 17652, (135, 20, 147, 89, 36, 155, 98, 211 ));
   
   type IDoubleTappedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IDoubleTappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IDoubleTappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IDoubleTappedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access IDoubleTappedRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGettingFocusEventArgs : aliased constant Windows.IID := (4194679246, 50812, 19432, (143, 212, 196, 77, 103, 135, 126, 13 ));
   
   type IGettingFocusEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldFocusedElement
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_NewFocusedElement
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_NewFocusedElement
   (
      This       : access IGettingFocusEventArgs_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusState
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.FocusState
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IGettingFocusEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InputDevice
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusInputDeviceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Cancel
   (
      This       : access IGettingFocusEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access IGettingFocusEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHoldingRoutedEventArgs : aliased constant Windows.IID := (3259432739, 55309, 17630, (141, 185, 13, 129, 94, 38, 154, 192 ));
   
   type IHoldingRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IHoldingRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_HoldingState
   (
      This       : access IHoldingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.HoldingState
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IHoldingRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IHoldingRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access IHoldingRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputScope : aliased constant Windows.IID := (1544521203, 63960, 16928, (182, 102, 4, 93, 7, 77, 155, 250 ));
   
   type IInputScope_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Names
   (
      This       : access IInputScope_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IVector_IInputScopeName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputScopeName : aliased constant Windows.IID := (4248725911, 2299, 19642, (160, 33, 121, 45, 117, 137, 253, 90 ));
   
   type IInputScopeName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NameValue
   (
      This       : access IInputScopeName_Interface
      ; RetVal : access Windows.UI.Xaml.Input.InputScopeNameValue
   )
   return Windows.HRESULT is abstract;
   
   function put_NameValue
   (
      This       : access IInputScopeName_Interface
      ; value : Windows.UI.Xaml.Input.InputScopeNameValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputScopeNameFactory : aliased constant Windows.IID := (1245756242, 19415, 20052, (134, 23, 28, 218, 138, 30, 218, 127 ));
   
   type IInputScopeNameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IInputScopeNameFactory_Interface
      ; nameValue : Windows.UI.Xaml.Input.InputScopeNameValue
      ; RetVal : access Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyboardAccelerator : aliased constant Windows.IID := (2464552990, 6574, 18010, (155, 60, 167, 30, 233, 234, 116, 32 ));
   
   type IKeyboardAccelerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Key
   (
      This       : access IKeyboardAccelerator_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_Key
   (
      This       : access IKeyboardAccelerator_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function add_Invoked
   (
      This       : access IKeyboardAccelerator_Interface
      ; value : TypedEventHandler_IKeyboardAccelerator_add_Invoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Invoked
   (
      This       : access IKeyboardAccelerator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyboardAcceleratorStatics : aliased constant Windows.IID := (1003765073, 39859, 17773, (191, 21, 128, 74, 223, 184, 98, 97 ));
   
   type IKeyboardAcceleratorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyProperty
   (
      This       : access IKeyboardAcceleratorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ModifiersProperty
   (
      This       : access IKeyboardAcceleratorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabledProperty
   (
      This       : access IKeyboardAcceleratorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScopeOwnerProperty
   (
      This       : access IKeyboardAcceleratorStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyboardAcceleratorFactory : aliased constant Windows.IID := (1155041945, 19453, 19015, (168, 147, 81, 95, 56, 134, 35, 246 ));
   
   type IKeyboardAcceleratorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IKeyboardAcceleratorFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyRoutedEventArgs : aliased constant Windows.IID := (3570220542, 16505, 17129, (163, 154, 48, 149, 211, 240, 73, 198 ));
   
   type IKeyRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Key
   (
      This       : access IKeyRoutedEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access IKeyRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IKeyRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IKeyRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyRoutedEventArgs2 : aliased constant Windows.IID := (453170554, 38452, 20244, (145, 178, 19, 62, 66, 253, 179, 205 ));
   
   type IKeyRoutedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OriginalKey
   (
      This       : access IKeyRoutedEventArgs2_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyRoutedEventArgs3 : aliased constant Windows.IID := (662304180, 51777, 16667, (168, 239, 244, 252, 120, 231, 128, 87 ));
   
   type IKeyRoutedEventArgs3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IKeyRoutedEventArgs3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILosingFocusEventArgs : aliased constant Windows.IID := (4193682375, 55177, 18219, (170, 147, 109, 65, 5, 230, 218, 190 ));
   
   type ILosingFocusEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldFocusedElement
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_NewFocusedElement
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_NewFocusedElement
   (
      This       : access ILosingFocusEventArgs_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusState
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.FocusState
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ILosingFocusEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InputDevice
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusInputDeviceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Cancel
   (
      This       : access ILosingFocusEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access ILosingFocusEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationCompletedRoutedEventArgs : aliased constant Windows.IID := (3048053539, 12097, 18830, (131, 25, 1, 94, 232, 167, 83, 70 ));
   
   type IManipulationCompletedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Container
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInertial
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationCompletedRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationDeltaRoutedEventArgs : aliased constant Windows.IID := (1074616212, 19567, 18717, (130, 214, 53, 23, 16, 147, 153, 198 ));
   
   type IManipulationDeltaRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Container
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInertial
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Delta
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function Complete
   (
      This       : access IManipulationDeltaRoutedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationInertiaStartingRoutedEventArgs : aliased constant Windows.IID := (610963881, 51779, 19467, (172, 239, 129, 232, 184, 20, 117, 32 ));
   
   type IManipulationInertiaStartingRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Container
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpansionBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IInertiaExpansionBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpansionBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Input.IInertiaExpansionBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IInertiaRotationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Input.IInertiaRotationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslationBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IInertiaTranslationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslationBehavior
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Input.IInertiaTranslationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Delta
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationInertiaStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationStartedRoutedEventArgs : aliased constant Windows.IID := (1571924485, 40832, 18614, (174, 108, 79, 17, 157, 232, 255, 19 ));
   
   type IManipulationStartedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Container
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function Complete
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationStartedRoutedEventArgsFactory : aliased constant Windows.IID := (2227296935, 29298, 17507, (182, 195, 164, 11, 155, 161, 81, 252 ));
   
   type IManipulationStartedRoutedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IManipulationStartedRoutedEventArgsFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IManipulationStartingRoutedEventArgs : aliased constant Windows.IID := (416691895, 21412, 19477, (164, 152, 243, 169, 202, 33, 42, 66 ));
   
   type IManipulationStartingRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.ManipulationModes
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Input.ManipulationModes
   )
   return Windows.HRESULT is abstract;
   
   function get_Container
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_Container
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Pivot
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IManipulationPivot
   )
   return Windows.HRESULT is abstract;
   
   function put_Pivot
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; value : Windows.UI.Xaml.Input.IManipulationPivot
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IManipulationStartingRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INoFocusCandidateFoundEventArgs : aliased constant Windows.IID := (3962962343, 4103, 18681, (182, 179, 237, 11, 234, 83, 147, 125 ));
   
   type INoFocusCandidateFoundEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Direction
   (
      This       : access INoFocusCandidateFoundEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access INoFocusCandidateFoundEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access INoFocusCandidateFoundEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InputDevice
   (
      This       : access INoFocusCandidateFoundEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.FocusInputDeviceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerRoutedEventArgs : aliased constant Windows.IID := (3663892234, 38738, 18914, (189, 226, 73, 236, 202, 185, 25, 77 ));
   
   type IPointerRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Pointer
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyModifiers
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentPoint
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function GetIntermediatePoints
   (
      This       : access IPointerRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Input.IVector_IPointerPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerRoutedEventArgs2 : aliased constant Windows.IID := (136442516, 7654, 18193, (186, 124, 141, 75, 139, 9, 17, 208 ));
   
   type IPointerRoutedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsGenerated
   (
      This       : access IPointerRoutedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRightTappedRoutedEventArgs : aliased constant Windows.IID := (1748272797, 31701, 16435, (178, 55, 23, 47, 121, 171, 227, 147 ));
   
   type IRightTappedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IRightTappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IRightTappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IRightTappedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access IRightTappedRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITappedRoutedEventArgs : aliased constant Windows.IID := (2694440638, 58916, 17818, (187, 29, 224, 92, 115, 226, 204, 102 ));
   
   type ITappedRoutedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access ITappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access ITappedRoutedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ITappedRoutedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPosition
   (
      This       : access ITappedRoutedEventArgs_Interface
      ; relativeTo : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFindNextElementOptions : aliased constant Windows.IID := (3632980523, 18114, 16892, (137, 126, 181, 150, 25, 119, 184, 157 ));
   
   type IFindNextElementOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SearchRoot
   (
      This       : access IFindNextElementOptions_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchRoot
   (
      This       : access IFindNextElementOptions_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ExclusionRect
   (
      This       : access IFindNextElementOptions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_ExclusionRect
   (
      This       : access IFindNextElementOptions_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_HintRect
   (
      This       : access IFindNextElementOptions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_HintRect
   (
      This       : access IFindNextElementOptions_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusNavigationStrategyOverride
   (
      This       : access IFindNextElementOptions_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategyOverride
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusNavigationStrategyOverride
   (
      This       : access IFindNextElementOptions_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategyOverride
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFocusManager : aliased constant Windows.IID := (3359896843, 15235, 19873, (157, 111, 85, 124, 17, 105, 243, 65 ));
   
   type IFocusManager_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFocusManagerStatics : aliased constant Windows.IID := (516739878, 33154, 17538, (130, 106, 9, 24, 233, 237, 154, 247 ));
   
   type IFocusManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFocusedElement
   (
      This       : access IFocusManagerStatics_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFocusManagerStatics2 : aliased constant Windows.IID := (2837501793, 56711, 20273, (190, 218, 239, 65, 127, 231, 192, 74 ));
   
   type IFocusManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryMoveFocus
   (
      This       : access IFocusManagerStatics2_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFocusManagerStatics3 : aliased constant Windows.IID := (1619025599, 45385, 16765, (131, 241, 186, 235, 86, 14, 42, 71 ));
   
   type IFocusManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function FindNextFocusableElement
   (
      This       : access IFocusManagerStatics3_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function FindNextFocusableElementWithHint
   (
      This       : access IFocusManagerStatics3_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; hintRect : Windows.Foundation.Rect
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFocusManagerStatics4 : aliased constant Windows.IID := (690450076, 7276, 16714, (186, 28, 150, 239, 213, 150, 43, 205 ));
   
   type IFocusManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function TryMoveFocusWithOptions
   (
      This       : access IFocusManagerStatics4_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function FindNextElement
   (
      This       : access IFocusManagerStatics4_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function FindFirstFocusableElement
   (
      This       : access IFocusManagerStatics4_Interface
      ; searchScope : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function FindLastFocusableElement
   (
      This       : access IFocusManagerStatics4_Interface
      ; searchScope : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function FindNextElementWithOptions
   (
      This       : access IFocusManagerStatics4_Interface
      ; focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPointer : aliased constant Windows.IID := (2360423549, 34952, 24499, (191, 253, 230, 202, 246, 27, 79, 3 ));
   
   type IIterator_IPointer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPointer_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPointer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPointer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPointer_Interface
      ; items : Windows.UI.Xaml.Input.IPointer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPointer : aliased constant Windows.IID := (1828321369, 8756, 20749, (134, 10, 219, 50, 128, 48, 203, 204 ));
   
   type IIterable_IPointer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPointer_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IIterator_IPointer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPointer : aliased constant Windows.IID := (1649473439, 30312, 20969, (134, 163, 56, 33, 33, 122, 102, 49 ));
   
   type IVectorView_IPointer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPointer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Input.IPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPointer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPointer_Interface
      ; value : Windows.UI.Xaml.Input.IPointer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPointer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Input.IPointer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IKeyboardAccelerator : aliased constant Windows.IID := (2339029400, 60064, 20710, (154, 53, 50, 223, 223, 31, 89, 225 ));
   
   type IIterator_IKeyboardAccelerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IKeyboardAccelerator_Interface
      ; items : Windows.UI.Xaml.Input.IKeyboardAccelerator_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyboardAccelerator : aliased constant Windows.IID := (2938003441, 54552, 21793, (180, 14, 111, 82, 77, 4, 193, 41 ));
   
   type IIterable_IKeyboardAccelerator_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IIterator_IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IKeyboardAccelerator : aliased constant Windows.IID := (1298021640, 57980, 23813, (161, 220, 152, 133, 165, 28, 55, 33 ));
   
   type IVectorView_IKeyboardAccelerator_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IKeyboardAccelerator_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IKeyboardAccelerator_Interface
      ; value : Windows.UI.Xaml.Input.IKeyboardAccelerator
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IKeyboardAccelerator_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Input.IKeyboardAccelerator_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IKeyboardAccelerator : aliased constant Windows.IID := (3834806251, 7754, 23523, (189, 163, 98, 207, 78, 82, 2, 88 ));
   
   type IVector_IKeyboardAccelerator_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IVectorView_IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; value : Windows.UI.Xaml.Input.IKeyboardAccelerator
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; value : Windows.UI.Xaml.Input.IKeyboardAccelerator
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IKeyboardAccelerator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IKeyboardAccelerator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Input.IKeyboardAccelerator_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IKeyboardAccelerator_Interface
      ; items : Windows.UI.Xaml.Input.IKeyboardAccelerator_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInputScopeName : aliased constant Windows.IID := (2059497460, 22615, 20481, (184, 127, 50, 112, 147, 246, 131, 146 ));
   
   type IIterator_IInputScopeName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInputScopeName_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInputScopeName_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInputScopeName_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInputScopeName_Interface
      ; items : Windows.UI.Xaml.Input.IInputScopeName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInputScopeName : aliased constant Windows.IID := (2168545942, 38352, 20736, (181, 155, 190, 161, 194, 125, 32, 2 ));
   
   type IIterable_IInputScopeName_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInputScopeName_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IIterator_IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IInputScopeName : aliased constant Windows.IID := (4241906306, 21288, 21436, (168, 132, 194, 9, 170, 250, 191, 120 ));
   
   type IVectorView_IInputScopeName_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IInputScopeName_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IInputScopeName_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IInputScopeName_Interface
      ; value : Windows.UI.Xaml.Input.IInputScopeName
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IInputScopeName_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Input.IInputScopeName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IInputScopeName : aliased constant Windows.IID := (1883234595, 55142, 22063, (178, 16, 25, 128, 187, 42, 13, 51 ));
   
   type IVector_IInputScopeName_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IInputScopeName_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IInputScopeName_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IInputScopeName_Interface
      ; RetVal : access Windows.UI.Xaml.Input.IVectorView_IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IInputScopeName_Interface
      ; value : Windows.UI.Xaml.Input.IInputScopeName
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IInputScopeName_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IInputScopeName_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IInputScopeName_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IInputScopeName_Interface
      ; value : Windows.UI.Xaml.Input.IInputScopeName
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IInputScopeName_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IInputScopeName_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IInputScopeName_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Input.IInputScopeName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IInputScopeName_Interface
      ; items : Windows.UI.Xaml.Input.IInputScopeName_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DoubleTappedEventHandler : aliased constant Windows.IID := (824496165, 1191, 19781, (130, 94, 130, 4, 166, 36, 219, 244 ));
   
   type DoubleTappedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_DoubleTappedEventHandler'access) with null record;
   function Invoke
   (
      This       : access DoubleTappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_HoldingEventHandler : aliased constant Windows.IID := (3970862285, 36446, 20414, (152, 70, 48, 166, 55, 10, 252, 223 ));
   
   type HoldingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IHoldingRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_HoldingEventHandler'access) with null record;
   function Invoke
   (
      This       : access HoldingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IHoldingRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_KeyEventHandler : aliased constant Windows.IID := (2086916837, 31246, 19986, (185, 106, 119, 21, 170, 111, 241, 200 ));
   
   type KeyEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IKeyRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_KeyEventHandler'access) with null record;
   function Invoke
   (
      This       : access KeyEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IKeyRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ManipulationCompletedEventHandler : aliased constant Windows.IID := (955206415, 5368, 17119, (154, 30, 164, 188, 196, 175, 119, 244 ));
   
   type ManipulationCompletedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ManipulationCompletedEventHandler'access) with null record;
   function Invoke
   (
      This       : access ManipulationCompletedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ManipulationDeltaEventHandler : aliased constant Windows.IID := (2853265611, 57273, 19542, (171, 220, 113, 27, 99, 200, 235, 148 ));
   
   type ManipulationDeltaEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ManipulationDeltaEventHandler'access) with null record;
   function Invoke
   (
      This       : access ManipulationDeltaEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ManipulationInertiaStartingEventHandler : aliased constant Windows.IID := (3550307106, 31900, 18459, (130, 123, 200, 178, 217, 187, 111, 199 ));
   
   type ManipulationInertiaStartingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ManipulationInertiaStartingEventHandler'access) with null record;
   function Invoke
   (
      This       : access ManipulationInertiaStartingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ManipulationStartedEventHandler : aliased constant Windows.IID := (4169352696, 57507, 19426, (185, 12, 220, 32, 230, 216, 190, 176 ));
   
   type ManipulationStartedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ManipulationStartedEventHandler'access) with null record;
   function Invoke
   (
      This       : access ManipulationStartedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ManipulationStartingEventHandler : aliased constant Windows.IID := (282112078, 49124, 17099, (130, 60, 63, 236, 216, 119, 14, 248 ));
   
   type ManipulationStartingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_ManipulationStartingEventHandler'access) with null record;
   function Invoke
   (
      This       : access ManipulationStartingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_PointerEventHandler : aliased constant Windows.IID := (3828898089, 49156, 19407, (137, 112, 53, 148, 134, 227, 159, 136 ));
   
   type PointerEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IPointerRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_PointerEventHandler'access) with null record;
   function Invoke
   (
      This       : access PointerEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IPointerRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_RightTappedEventHandler : aliased constant Windows.IID := (624074850, 62535, 18768, (156, 70, 241, 227, 74, 44, 34, 56 ));
   
   type RightTappedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_RightTappedEventHandler'access) with null record;
   function Invoke
   (
      This       : access RightTappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TappedEventHandler : aliased constant Windows.IID := (1759068364, 40944, 18894, (177, 65, 63, 7, 236, 71, 123, 151 ));
   
   type TappedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Input.ITappedRoutedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TappedEventHandler'access) with null record;
   function Invoke
   (
      This       : access TappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.ITappedRoutedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged : aliased constant Windows.IID := (3353763042, 64213, 24123, (156, 88, 24, 108, 168, 193, 221, 87 ));
   
   type TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IKeyboardAccelerator_add_Invoked : aliased constant Windows.IID := (4150522798, 45547, 21906, (160, 145, 213, 8, 243, 43, 11, 44 ));
   
   type TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Input.IKeyboardAccelerator ; args : Windows.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IKeyboardAccelerator_add_Invoked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface
      ; sender : Windows.UI.Xaml.Input.IKeyboardAccelerator
      ; args : Windows.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Pointer is Windows.UI.Xaml.Input.IPointer;
   subtype AccessKeyDisplayRequestedEventArgs is Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs;
   function CreateAccessKeyDisplayRequestedEventArgs return Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs;
   
   subtype AccessKeyDisplayDismissedEventArgs is Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs;
   function CreateAccessKeyDisplayDismissedEventArgs return Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs;
   
   subtype AccessKeyInvokedEventArgs is Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs;
   function CreateAccessKeyInvokedEventArgs return Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs;
   
   subtype ProcessKeyboardAcceleratorEventArgs is Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs;
   subtype AccessKeyManager is Windows.UI.Xaml.Input.IAccessKeyManager;
   subtype InertiaExpansionBehavior is Windows.UI.Xaml.Input.IInertiaExpansionBehavior;
   subtype InertiaRotationBehavior is Windows.UI.Xaml.Input.IInertiaRotationBehavior;
   subtype InertiaTranslationBehavior is Windows.UI.Xaml.Input.IInertiaTranslationBehavior;
   subtype KeyboardAcceleratorInvokedEventArgs is Windows.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs;
   subtype ManipulationPivot is Windows.UI.Xaml.Input.IManipulationPivot;
   function CreateManipulationPivot return Windows.UI.Xaml.Input.IManipulationPivot;
   
   subtype CharacterReceivedRoutedEventArgs is Windows.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs;
   subtype ContextRequestedEventArgs is Windows.UI.Xaml.Input.IContextRequestedEventArgs;
   function CreateContextRequestedEventArgs return Windows.UI.Xaml.Input.IContextRequestedEventArgs;
   
   subtype DoubleTappedRoutedEventArgs is Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs;
   function CreateDoubleTappedRoutedEventArgs return Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs;
   
   subtype GettingFocusEventArgs is Windows.UI.Xaml.Input.IGettingFocusEventArgs;
   subtype HoldingRoutedEventArgs is Windows.UI.Xaml.Input.IHoldingRoutedEventArgs;
   function CreateHoldingRoutedEventArgs return Windows.UI.Xaml.Input.IHoldingRoutedEventArgs;
   
   subtype InputScope is Windows.UI.Xaml.Input.IInputScope;
   function CreateInputScope return Windows.UI.Xaml.Input.IInputScope;
   
   subtype InputScopeName is Windows.UI.Xaml.Input.IInputScopeName;
   function CreateInstance
   (
      nameValue : Windows.UI.Xaml.Input.InputScopeNameValue
   )
   return Windows.UI.Xaml.Input.IInputScopeName;
   
   subtype KeyboardAccelerator is Windows.UI.Xaml.Input.IKeyboardAccelerator;
   
   type IKeyboardAccelerator_Interface_Impl is new IKeyboardAccelerator_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IKeyboardAccelerator := null;
      m_IKeyboardAccelerator : IKeyboardAccelerator := null;
   end record;
   type IKeyboardAccelerator_Impl is access all IKeyboardAccelerator_Interface_Impl'Class;
   type IKeyboardAccelerator_Impl_Ptr is access all IKeyboardAccelerator_Impl;
   
   function QueryInterface
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IKeyboardAccelerator_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IKeyboardAccelerator_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Key
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT;
   
   function put_Key
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT;
   
   function get_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT;
   
   function put_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT;
   
   function get_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT;
   
   function put_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT;
   
   function add_Invoked
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : TypedEventHandler_IKeyboardAccelerator_add_Invoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Invoked
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   subtype KeyRoutedEventArgs is Windows.UI.Xaml.Input.IKeyRoutedEventArgs;
   subtype LosingFocusEventArgs is Windows.UI.Xaml.Input.ILosingFocusEventArgs;
   subtype ManipulationCompletedRoutedEventArgs is Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs;
   function CreateManipulationCompletedRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs;
   
   subtype ManipulationDeltaRoutedEventArgs is Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs;
   function CreateManipulationDeltaRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs;
   
   subtype ManipulationInertiaStartingRoutedEventArgs is Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs;
   function CreateManipulationInertiaStartingRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs;
   
   subtype ManipulationStartedRoutedEventArgs is Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs;
   
   type IManipulationStartedRoutedEventArgs_Interface_Impl is new IManipulationStartedRoutedEventArgs_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IManipulationStartedRoutedEventArgs := null;
      m_IManipulationStartedRoutedEventArgs : IManipulationStartedRoutedEventArgs := null;
   end record;
   type IManipulationStartedRoutedEventArgs_Impl is access all IManipulationStartedRoutedEventArgs_Interface_Impl'Class;
   type IManipulationStartedRoutedEventArgs_Impl_Ptr is access all IManipulationStartedRoutedEventArgs_Impl;
   
   function QueryInterface
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Container
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT;
   
   function get_Position
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT;
   
   function get_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   function put_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT;
   
   function get_Cumulative
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT;
   
   function Complete
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.HRESULT;
   
   subtype ManipulationStartingRoutedEventArgs is Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs;
   function CreateManipulationStartingRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs;
   
   subtype NoFocusCandidateFoundEventArgs is Windows.UI.Xaml.Input.INoFocusCandidateFoundEventArgs;
   subtype PointerRoutedEventArgs is Windows.UI.Xaml.Input.IPointerRoutedEventArgs;
   subtype RightTappedRoutedEventArgs is Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs;
   function CreateRightTappedRoutedEventArgs return Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs;
   
   subtype TappedRoutedEventArgs is Windows.UI.Xaml.Input.ITappedRoutedEventArgs;
   function CreateTappedRoutedEventArgs return Windows.UI.Xaml.Input.ITappedRoutedEventArgs;
   
   subtype FindNextElementOptions is Windows.UI.Xaml.Input.IFindNextElementOptions;
   function CreateFindNextElementOptions return Windows.UI.Xaml.Input.IFindNextElementOptions;
   
   subtype FocusManager is Windows.UI.Xaml.Input.IFocusManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_IsDisplayModeEnabled
   return Windows.Boolean;
   
   function add_IsDisplayModeEnabledChanged
   (
      value : TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_IsDisplayModeEnabledChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   procedure ExitDisplayMode
   ;
   
   function get_AreKeyTipsEnabled
   return Windows.Boolean;
   
   procedure put_AreKeyTipsEnabled
   (
      value : Windows.Boolean
   )
   ;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Input.IKeyboardAccelerator;
   
   function get_KeyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ModifiersProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScopeOwnerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs;
   
   function TryMoveFocus
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.Boolean;
   
   function FindNextFocusableElement
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.UI.Xaml.IUIElement;
   
   function FindNextFocusableElementWithHint
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; hintRect : Windows.Foundation.Rect
   )
   return Windows.UI.Xaml.IUIElement;
   
   function TryMoveFocusWithOptions
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
   )
   return Windows.Boolean;
   
   function FindNextElement
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function FindFirstFocusableElement
   (
      searchScope : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function FindLastFocusableElement
   (
      searchScope : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function FindNextElementWithOptions
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
   )
   return Windows.UI.Xaml.IDependencyObject;
   
   function GetFocusedElement
   return Windows.Object;
   
end;
