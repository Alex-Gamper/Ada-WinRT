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
with Windows.Foundation;
limited with Windows.System;
limited with Windows.UI.Input;
with Windows.Foundation.Collections;
limited with Windows.UI.Popups;
--------------------------------------------------------------------------------
package Windows.UI.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppViewBackButtonVisibility is (
      Visible,
      Collapsed,
      Disabled
   );
   for AppViewBackButtonVisibility use (
      Visible => 0,
      Collapsed => 1,
      Disabled => 2
   );
   for AppViewBackButtonVisibility'Size use 32;
   
   type AppViewBackButtonVisibility_Ptr is access AppViewBackButtonVisibility;
   
   type CoreWindowActivationState is (
      CodeActivated,
      Deactivated,
      PointerActivated
   );
   for CoreWindowActivationState use (
      CodeActivated => 0,
      Deactivated => 1,
      PointerActivated => 2
   );
   for CoreWindowActivationState'Size use 32;
   
   type CoreWindowActivationState_Ptr is access CoreWindowActivationState;
   
   type CoreWindowActivationMode is (
      None,
      Deactivated,
      ActivatedNotForeground,
      ActivatedInForeground
   );
   for CoreWindowActivationMode use (
      None => 0,
      Deactivated => 1,
      ActivatedNotForeground => 2,
      ActivatedInForeground => 3
   );
   for CoreWindowActivationMode'Size use 32;
   
   type CoreWindowActivationMode_Ptr is access CoreWindowActivationMode;
   
   type CoreCursorType is (
      Arrow,
      Cross,
      Custom,
      Hand,
      Help,
      IBeam,
      SizeAll,
      SizeNortheastSouthwest,
      SizeNorthSouth,
      SizeNorthwestSoutheast,
      SizeWestEast,
      UniversalNo,
      UpArrow,
      Wait,
      Pin,
      Person
   );
   for CoreCursorType use (
      Arrow => 0,
      Cross => 1,
      Custom => 2,
      Hand => 3,
      Help => 4,
      IBeam => 5,
      SizeAll => 6,
      SizeNortheastSouthwest => 7,
      SizeNorthSouth => 8,
      SizeNorthwestSoutheast => 9,
      SizeWestEast => 10,
      UniversalNo => 11,
      UpArrow => 12,
      Wait => 13,
      Pin => 14,
      Person => 15
   );
   for CoreCursorType'Size use 32;
   
   type CoreCursorType_Ptr is access CoreCursorType;
   
   type CoreDispatcherPriority is (
      Idle,
      Low,
      Normal,
      High
   );
   for CoreDispatcherPriority use (
      Idle => -2,
      Low => -1,
      Normal => 0,
      High => 1
   );
   for CoreDispatcherPriority'Size use 32;
   
   type CoreDispatcherPriority_Ptr is access CoreDispatcherPriority;
   
   type CoreProcessEventsOption is (
      ProcessOneAndAllPending,
      ProcessOneIfPresent,
      ProcessUntilQuit,
      ProcessAllIfPresent
   );
   for CoreProcessEventsOption use (
      ProcessOneAndAllPending => 0,
      ProcessOneIfPresent => 1,
      ProcessUntilQuit => 2,
      ProcessAllIfPresent => 3
   );
   for CoreProcessEventsOption'Size use 32;
   
   type CoreProcessEventsOption_Ptr is access CoreProcessEventsOption;
   
   type CoreWindowFlowDirection is (
      LeftToRight,
      RightToLeft
   );
   for CoreWindowFlowDirection use (
      LeftToRight => 0,
      RightToLeft => 1
   );
   for CoreWindowFlowDirection'Size use 32;
   
   type CoreWindowFlowDirection_Ptr is access CoreWindowFlowDirection;
   
   type CoreVirtualKeyStates is (
      None,
      Down,
      Locked
   );
   for CoreVirtualKeyStates use (
      None => 0,
      Down => 1,
      Locked => 2
   );
   for CoreVirtualKeyStates'Size use 32;
   
   type CoreVirtualKeyStates_Ptr is access CoreVirtualKeyStates;
   
   type CoreAcceleratorKeyEventType is (
      KeyDown,
      KeyUp,
      Character,
      DeadCharacter,
      SystemKeyDown,
      SystemKeyUp,
      SystemCharacter,
      SystemDeadCharacter,
      UnicodeCharacter
   );
   for CoreAcceleratorKeyEventType use (
      KeyDown => 0,
      KeyUp => 1,
      Character => 2,
      DeadCharacter => 3,
      SystemKeyDown => 4,
      SystemKeyUp => 5,
      SystemCharacter => 6,
      SystemDeadCharacter => 7,
      UnicodeCharacter => 8
   );
   for CoreAcceleratorKeyEventType'Size use 32;
   
   type CoreAcceleratorKeyEventType_Ptr is access CoreAcceleratorKeyEventType;
   
   type CoreProximityEvaluationScore is (
      Closest,
      Farthest
   );
   for CoreProximityEvaluationScore use (
      Closest => 0,
      Farthest => 2147483647
   );
   for CoreProximityEvaluationScore'Size use 32;
   
   type CoreProximityEvaluationScore_Ptr is access CoreProximityEvaluationScore;
   
   type CoreInputDeviceTypes is (
      None,
      Touch,
      Pen,
      Mouse
   );
   for CoreInputDeviceTypes use (
      None => 0,
      Touch => 1,
      Pen => 2,
      Mouse => 4
   );
   for CoreInputDeviceTypes'Size use 32;
   
   type CoreInputDeviceTypes_Ptr is access CoreInputDeviceTypes;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CorePhysicalKeyStatus is record
      RepeatCount : Windows.UInt32;
      ScanCode : Windows.UInt32;
      IsExtendedKey : Windows.Boolean;
      IsMenuKeyDown : Windows.Boolean;
      WasKeyDown : Windows.Boolean;
      IsKeyReleased : Windows.Boolean;
   end record;
   pragma Convention (C_Pass_By_Copy , CorePhysicalKeyStatus);
   
   type CorePhysicalKeyStatus_Ptr is access CorePhysicalKeyStatus;
   
   type CoreProximityEvaluation is record
      Score : Windows.Int32;
      AdjustedPoint : Windows.Foundation.Point;
   end record;
   pragma Convention (C_Pass_By_Copy , CoreProximityEvaluation);
   
   type CoreProximityEvaluation_Ptr is access CoreProximityEvaluation;
   
   type CoreWindowDialogsContract is null record;
   pragma Convention (C_Pass_By_Copy , CoreWindowDialogsContract);
   
   type CoreWindowDialogsContract_Ptr is access CoreWindowDialogsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DispatchedHandler_Interface;
   type DispatchedHandler is access all DispatchedHandler_Interface'Class;
   type DispatchedHandler_Ptr is access all DispatchedHandler;
   type IdleDispatchedHandler_Interface;
   type IdleDispatchedHandler is access all IdleDispatchedHandler_Interface'Class;
   type IdleDispatchedHandler_Ptr is access all IdleDispatchedHandler;
   type EventHandler_IBackRequestedEventArgs_Interface;
   type EventHandler_IBackRequestedEventArgs is access all EventHandler_IBackRequestedEventArgs_Interface'Class;
   type EventHandler_IBackRequestedEventArgs_Ptr is access all EventHandler_IBackRequestedEventArgs;
   type TypedEventHandler_ICoreWindow_add_Activated_Interface;
   type TypedEventHandler_ICoreWindow_add_Activated is access all TypedEventHandler_ICoreWindow_add_Activated_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_Activated_Ptr is access all TypedEventHandler_ICoreWindow_add_Activated;
   type TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Interface;
   type TypedEventHandler_ICoreWindow_add_AutomationProviderRequested is access all TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Ptr is access all TypedEventHandler_ICoreWindow_add_AutomationProviderRequested;
   type TypedEventHandler_ICoreWindow_add_CharacterReceived_Interface;
   type TypedEventHandler_ICoreWindow_add_CharacterReceived is access all TypedEventHandler_ICoreWindow_add_CharacterReceived_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_CharacterReceived_Ptr is access all TypedEventHandler_ICoreWindow_add_CharacterReceived;
   type TypedEventHandler_ICoreWindow_add_Closed_Interface;
   type TypedEventHandler_ICoreWindow_add_Closed is access all TypedEventHandler_ICoreWindow_add_Closed_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_Closed_Ptr is access all TypedEventHandler_ICoreWindow_add_Closed;
   type TypedEventHandler_ICoreWindow_add_InputEnabled_Interface;
   type TypedEventHandler_ICoreWindow_add_InputEnabled is access all TypedEventHandler_ICoreWindow_add_InputEnabled_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_InputEnabled_Ptr is access all TypedEventHandler_ICoreWindow_add_InputEnabled;
   type TypedEventHandler_ICoreWindow_add_KeyDown_Interface;
   type TypedEventHandler_ICoreWindow_add_KeyDown is access all TypedEventHandler_ICoreWindow_add_KeyDown_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_KeyDown_Ptr is access all TypedEventHandler_ICoreWindow_add_KeyDown;
   type TypedEventHandler_ICoreWindow_add_KeyUp_Interface;
   type TypedEventHandler_ICoreWindow_add_KeyUp is access all TypedEventHandler_ICoreWindow_add_KeyUp_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_KeyUp_Ptr is access all TypedEventHandler_ICoreWindow_add_KeyUp;
   type TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerCaptureLost is access all TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerCaptureLost;
   type TypedEventHandler_ICoreWindow_add_PointerEntered_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerEntered is access all TypedEventHandler_ICoreWindow_add_PointerEntered_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerEntered_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerEntered;
   type TypedEventHandler_ICoreWindow_add_PointerExited_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerExited is access all TypedEventHandler_ICoreWindow_add_PointerExited_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerExited_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerExited;
   type TypedEventHandler_ICoreWindow_add_PointerMoved_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerMoved is access all TypedEventHandler_ICoreWindow_add_PointerMoved_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerMoved_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerMoved;
   type TypedEventHandler_ICoreWindow_add_PointerPressed_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerPressed is access all TypedEventHandler_ICoreWindow_add_PointerPressed_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerPressed_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerPressed;
   type TypedEventHandler_ICoreWindow_add_PointerReleased_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerReleased is access all TypedEventHandler_ICoreWindow_add_PointerReleased_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerReleased_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerReleased;
   type TypedEventHandler_ICoreWindow_add_TouchHitTesting_Interface;
   type TypedEventHandler_ICoreWindow_add_TouchHitTesting is access all TypedEventHandler_ICoreWindow_add_TouchHitTesting_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_TouchHitTesting_Ptr is access all TypedEventHandler_ICoreWindow_add_TouchHitTesting;
   type TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Interface;
   type TypedEventHandler_ICoreWindow_add_PointerWheelChanged is access all TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Ptr is access all TypedEventHandler_ICoreWindow_add_PointerWheelChanged;
   type TypedEventHandler_ICoreWindow_add_SizeChanged_Interface;
   type TypedEventHandler_ICoreWindow_add_SizeChanged is access all TypedEventHandler_ICoreWindow_add_SizeChanged_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_SizeChanged_Ptr is access all TypedEventHandler_ICoreWindow_add_SizeChanged;
   type TypedEventHandler_ICoreWindow_add_VisibilityChanged_Interface;
   type TypedEventHandler_ICoreWindow_add_VisibilityChanged is access all TypedEventHandler_ICoreWindow_add_VisibilityChanged_Interface'Class;
   type TypedEventHandler_ICoreWindow_add_VisibilityChanged_Ptr is access all TypedEventHandler_ICoreWindow_add_VisibilityChanged;
   type TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Interface;
   type TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested is access all TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Interface'Class;
   type TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Ptr is access all TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested;
   type TypedEventHandler_ICoreWindow4_add_ResizeStarted_Interface;
   type TypedEventHandler_ICoreWindow4_add_ResizeStarted is access all TypedEventHandler_ICoreWindow4_add_ResizeStarted_Interface'Class;
   type TypedEventHandler_ICoreWindow4_add_ResizeStarted_Ptr is access all TypedEventHandler_ICoreWindow4_add_ResizeStarted;
   type TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Interface;
   type TypedEventHandler_ICoreWindow4_add_ResizeCompleted is access all TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Interface'Class;
   type TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Ptr is access all TypedEventHandler_ICoreWindow4_add_ResizeCompleted;
   type TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Interface;
   type TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated is access all TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Interface'Class;
   type TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Ptr is access all TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated;
   type TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Interface;
   type TypedEventHandler_ICoreInputSourceBase_add_InputEnabled is access all TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Interface'Class;
   type TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Ptr is access all TypedEventHandler_ICoreInputSourceBase_add_InputEnabled;
   type TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost is access all TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost;
   type TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerEntered is access all TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerEntered;
   type TypedEventHandler_ICorePointerInputSource_add_PointerExited_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerExited is access all TypedEventHandler_ICorePointerInputSource_add_PointerExited_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerExited_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerExited;
   type TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerMoved is access all TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerMoved;
   type TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerPressed is access all TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerPressed;
   type TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerReleased is access all TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerReleased;
   type TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Interface;
   type TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged is access all TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Interface'Class;
   type TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Ptr is access all TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged;
   type TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Interface;
   type TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived is access all TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Interface'Class;
   type TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Ptr is access all TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Interface;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown is access all TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Interface'Class;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Ptr is access all TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Interface;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp is access all TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Interface'Class;
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Ptr is access all TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp;
   type TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Interface;
   type TypedEventHandler_ICoreComponentFocusable_add_GotFocus is access all TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Interface'Class;
   type TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Ptr is access all TypedEventHandler_ICoreComponentFocusable_add_GotFocus;
   type TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Interface;
   type TypedEventHandler_ICoreComponentFocusable_add_LostFocus is access all TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Interface'Class;
   type TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Ptr is access all TypedEventHandler_ICoreComponentFocusable_add_LostFocus;
   type TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Interface;
   type TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting is access all TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Interface'Class;
   type TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Ptr is access all TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting;
   type TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Interface;
   type TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested is access all TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Interface'Class;
   type TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Ptr is access all TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Interface;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Interface'Class;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Ptr is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Interface;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Interface'Class;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Ptr is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Interface;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Interface'Class;
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Ptr is access all TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased;
   type TypedEventHandler_ICoreWindowDialog_add_Showing_Interface;
   type TypedEventHandler_ICoreWindowDialog_add_Showing is access all TypedEventHandler_ICoreWindowDialog_add_Showing_Interface'Class;
   type TypedEventHandler_ICoreWindowDialog_add_Showing_Ptr is access all TypedEventHandler_ICoreWindowDialog_add_Showing;
   type TypedEventHandler_ICoreWindowFlyout_add_Showing_Interface;
   type TypedEventHandler_ICoreWindowFlyout_add_Showing is access all TypedEventHandler_ICoreWindowFlyout_add_Showing_Interface'Class;
   type TypedEventHandler_ICoreWindowFlyout_add_Showing_Ptr is access all TypedEventHandler_ICoreWindowFlyout_add_Showing;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISystemNavigationManager_Interface;
   type ISystemNavigationManager is access all ISystemNavigationManager_Interface'Class;
   type ISystemNavigationManager_Ptr is access all ISystemNavigationManager;
   type ISystemNavigationManager2_Interface;
   type ISystemNavigationManager2 is access all ISystemNavigationManager2_Interface'Class;
   type ISystemNavigationManager2_Ptr is access all ISystemNavigationManager2;
   type ISystemNavigationManagerStatics_Interface;
   type ISystemNavigationManagerStatics is access all ISystemNavigationManagerStatics_Interface'Class;
   type ISystemNavigationManagerStatics_Ptr is access all ISystemNavigationManagerStatics;
   type IBackRequestedEventArgs_Interface;
   type IBackRequestedEventArgs is access all IBackRequestedEventArgs_Interface'Class;
   type IBackRequestedEventArgs_Ptr is access all IBackRequestedEventArgs;
   type ICoreWindowEventArgs_Interface;
   type ICoreWindowEventArgs is access all ICoreWindowEventArgs_Interface'Class;
   type ICoreWindowEventArgs_Ptr is access all ICoreWindowEventArgs;
   type IAutomationProviderRequestedEventArgs_Interface;
   type IAutomationProviderRequestedEventArgs is access all IAutomationProviderRequestedEventArgs_Interface'Class;
   type IAutomationProviderRequestedEventArgs_Ptr is access all IAutomationProviderRequestedEventArgs;
   type ICharacterReceivedEventArgs_Interface;
   type ICharacterReceivedEventArgs is access all ICharacterReceivedEventArgs_Interface'Class;
   type ICharacterReceivedEventArgs_Ptr is access all ICharacterReceivedEventArgs;
   type IInputEnabledEventArgs_Interface;
   type IInputEnabledEventArgs is access all IInputEnabledEventArgs_Interface'Class;
   type IInputEnabledEventArgs_Ptr is access all IInputEnabledEventArgs;
   type IKeyEventArgs_Interface;
   type IKeyEventArgs is access all IKeyEventArgs_Interface'Class;
   type IKeyEventArgs_Ptr is access all IKeyEventArgs;
   type IKeyEventArgs2_Interface;
   type IKeyEventArgs2 is access all IKeyEventArgs2_Interface'Class;
   type IKeyEventArgs2_Ptr is access all IKeyEventArgs2;
   type IPointerEventArgs_Interface;
   type IPointerEventArgs is access all IPointerEventArgs_Interface'Class;
   type IPointerEventArgs_Ptr is access all IPointerEventArgs;
   type ITouchHitTestingEventArgs_Interface;
   type ITouchHitTestingEventArgs is access all ITouchHitTestingEventArgs_Interface'Class;
   type ITouchHitTestingEventArgs_Ptr is access all ITouchHitTestingEventArgs;
   type IClosestInteractiveBoundsRequestedEventArgs_Interface;
   type IClosestInteractiveBoundsRequestedEventArgs is access all IClosestInteractiveBoundsRequestedEventArgs_Interface'Class;
   type IClosestInteractiveBoundsRequestedEventArgs_Ptr is access all IClosestInteractiveBoundsRequestedEventArgs;
   type IWindowActivatedEventArgs_Interface;
   type IWindowActivatedEventArgs is access all IWindowActivatedEventArgs_Interface'Class;
   type IWindowActivatedEventArgs_Ptr is access all IWindowActivatedEventArgs;
   type IWindowSizeChangedEventArgs_Interface;
   type IWindowSizeChangedEventArgs is access all IWindowSizeChangedEventArgs_Interface'Class;
   type IWindowSizeChangedEventArgs_Ptr is access all IWindowSizeChangedEventArgs;
   type IVisibilityChangedEventArgs_Interface;
   type IVisibilityChangedEventArgs is access all IVisibilityChangedEventArgs_Interface'Class;
   type IVisibilityChangedEventArgs_Ptr is access all IVisibilityChangedEventArgs;
   type ICoreWindow_Interface;
   type ICoreWindow is access all ICoreWindow_Interface'Class;
   type ICoreWindow_Ptr is access all ICoreWindow;
   type ICoreWindow2_Interface;
   type ICoreWindow2 is access all ICoreWindow2_Interface'Class;
   type ICoreWindow2_Ptr is access all ICoreWindow2;
   type ICoreWindow3_Interface;
   type ICoreWindow3 is access all ICoreWindow3_Interface'Class;
   type ICoreWindow3_Ptr is access all ICoreWindow3;
   type ICoreWindow4_Interface;
   type ICoreWindow4 is access all ICoreWindow4_Interface'Class;
   type ICoreWindow4_Ptr is access all ICoreWindow4;
   type ICoreWindow5_Interface;
   type ICoreWindow5 is access all ICoreWindow5_Interface'Class;
   type ICoreWindow5_Ptr is access all ICoreWindow5;
   type ICoreWindowStatic_Interface;
   type ICoreWindowStatic is access all ICoreWindowStatic_Interface'Class;
   type ICoreWindowStatic_Ptr is access all ICoreWindowStatic;
   type IAcceleratorKeyEventArgs_Interface;
   type IAcceleratorKeyEventArgs is access all IAcceleratorKeyEventArgs_Interface'Class;
   type IAcceleratorKeyEventArgs_Ptr is access all IAcceleratorKeyEventArgs;
   type IAcceleratorKeyEventArgs2_Interface;
   type IAcceleratorKeyEventArgs2 is access all IAcceleratorKeyEventArgs2_Interface'Class;
   type IAcceleratorKeyEventArgs2_Ptr is access all IAcceleratorKeyEventArgs2;
   type ICoreAcceleratorKeys_Interface;
   type ICoreAcceleratorKeys is access all ICoreAcceleratorKeys_Interface'Class;
   type ICoreAcceleratorKeys_Ptr is access all ICoreAcceleratorKeys;
   type ICoreDispatcher_Interface;
   type ICoreDispatcher is access all ICoreDispatcher_Interface'Class;
   type ICoreDispatcher_Ptr is access all ICoreDispatcher;
   type ICoreDispatcher2_Interface;
   type ICoreDispatcher2 is access all ICoreDispatcher2_Interface'Class;
   type ICoreDispatcher2_Ptr is access all ICoreDispatcher2;
   type ICoreDispatcherWithTaskPriority_Interface;
   type ICoreDispatcherWithTaskPriority is access all ICoreDispatcherWithTaskPriority_Interface'Class;
   type ICoreDispatcherWithTaskPriority_Ptr is access all ICoreDispatcherWithTaskPriority;
   type IIdleDispatchedHandlerArgs_Interface;
   type IIdleDispatchedHandlerArgs is access all IIdleDispatchedHandlerArgs_Interface'Class;
   type IIdleDispatchedHandlerArgs_Ptr is access all IIdleDispatchedHandlerArgs;
   type ICoreCursor_Interface;
   type ICoreCursor is access all ICoreCursor_Interface'Class;
   type ICoreCursor_Ptr is access all ICoreCursor;
   type ICoreCursorFactory_Interface;
   type ICoreCursorFactory is access all ICoreCursorFactory_Interface'Class;
   type ICoreCursorFactory_Ptr is access all ICoreCursorFactory;
   type IInitializeWithCoreWindow_Interface;
   type IInitializeWithCoreWindow is access all IInitializeWithCoreWindow_Interface'Class;
   type IInitializeWithCoreWindow_Ptr is access all IInitializeWithCoreWindow;
   type ICoreWindowResizeManager_Interface;
   type ICoreWindowResizeManager is access all ICoreWindowResizeManager_Interface'Class;
   type ICoreWindowResizeManager_Ptr is access all ICoreWindowResizeManager;
   type ICoreWindowResizeManagerLayoutCapability_Interface;
   type ICoreWindowResizeManagerLayoutCapability is access all ICoreWindowResizeManagerLayoutCapability_Interface'Class;
   type ICoreWindowResizeManagerLayoutCapability_Ptr is access all ICoreWindowResizeManagerLayoutCapability;
   type ICoreWindowResizeManagerStatics_Interface;
   type ICoreWindowResizeManagerStatics is access all ICoreWindowResizeManagerStatics_Interface'Class;
   type ICoreWindowResizeManagerStatics_Ptr is access all ICoreWindowResizeManagerStatics;
   type ICoreInputSourceBase_Interface;
   type ICoreInputSourceBase is access all ICoreInputSourceBase_Interface'Class;
   type ICoreInputSourceBase_Ptr is access all ICoreInputSourceBase;
   type ICorePointerInputSource_Interface;
   type ICorePointerInputSource is access all ICorePointerInputSource_Interface'Class;
   type ICorePointerInputSource_Ptr is access all ICorePointerInputSource;
   type ICorePointerInputSource2_Interface;
   type ICorePointerInputSource2 is access all ICorePointerInputSource2_Interface'Class;
   type ICorePointerInputSource2_Ptr is access all ICorePointerInputSource2;
   type ICoreKeyboardInputSource_Interface;
   type ICoreKeyboardInputSource is access all ICoreKeyboardInputSource_Interface'Class;
   type ICoreKeyboardInputSource_Ptr is access all ICoreKeyboardInputSource;
   type ICoreKeyboardInputSource2_Interface;
   type ICoreKeyboardInputSource2 is access all ICoreKeyboardInputSource2_Interface'Class;
   type ICoreKeyboardInputSource2_Ptr is access all ICoreKeyboardInputSource2;
   type ICoreComponentFocusable_Interface;
   type ICoreComponentFocusable is access all ICoreComponentFocusable_Interface'Class;
   type ICoreComponentFocusable_Ptr is access all ICoreComponentFocusable;
   type ICoreTouchHitTesting_Interface;
   type ICoreTouchHitTesting is access all ICoreTouchHitTesting_Interface'Class;
   type ICoreTouchHitTesting_Ptr is access all ICoreTouchHitTesting;
   type ICoreClosestInteractiveBoundsRequested_Interface;
   type ICoreClosestInteractiveBoundsRequested is access all ICoreClosestInteractiveBoundsRequested_Interface'Class;
   type ICoreClosestInteractiveBoundsRequested_Ptr is access all ICoreClosestInteractiveBoundsRequested;
   type ICorePointerRedirector_Interface;
   type ICorePointerRedirector is access all ICorePointerRedirector_Interface'Class;
   type ICorePointerRedirector_Ptr is access all ICorePointerRedirector;
   type ICoreWindowPopupShowingEventArgs_Interface;
   type ICoreWindowPopupShowingEventArgs is access all ICoreWindowPopupShowingEventArgs_Interface'Class;
   type ICoreWindowPopupShowingEventArgs_Ptr is access all ICoreWindowPopupShowingEventArgs;
   type ICoreWindowDialog_Interface;
   type ICoreWindowDialog is access all ICoreWindowDialog_Interface'Class;
   type ICoreWindowDialog_Ptr is access all ICoreWindowDialog;
   type ICoreWindowDialogFactory_Interface;
   type ICoreWindowDialogFactory is access all ICoreWindowDialogFactory_Interface'Class;
   type ICoreWindowDialogFactory_Ptr is access all ICoreWindowDialogFactory;
   type ICoreWindowFlyout_Interface;
   type ICoreWindowFlyout is access all ICoreWindowFlyout_Interface'Class;
   type ICoreWindowFlyout_Ptr is access all ICoreWindowFlyout;
   type ICoreWindowFlyoutFactory_Interface;
   type ICoreWindowFlyoutFactory is access all ICoreWindowFlyoutFactory_Interface'Class;
   type ICoreWindowFlyoutFactory_Ptr is access all ICoreWindowFlyoutFactory;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationManager : aliased constant Windows.IID := (2466394392, 53072, 17062, (151, 6, 105, 16, 127, 161, 34, 225 ));
   
   type ISystemNavigationManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BackRequested
   (
      This       : access ISystemNavigationManager_Interface
      ; handler : Windows.UI.Core.EventHandler_IBackRequestedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BackRequested
   (
      This       : access ISystemNavigationManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationManager2 : aliased constant Windows.IID := (2354119681, 26558, 18862, (149, 9, 103, 28, 30, 84, 163, 137 ));
   
   type ISystemNavigationManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppViewBackButtonVisibility
   (
      This       : access ISystemNavigationManager2_Interface
      ; RetVal : access Windows.UI.Core.AppViewBackButtonVisibility
   )
   return Windows.HRESULT is abstract;
   
   function put_AppViewBackButtonVisibility
   (
      This       : access ISystemNavigationManager2_Interface
      ; value : Windows.UI.Core.AppViewBackButtonVisibility
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationManagerStatics : aliased constant Windows.IID := (3696408014, 48864, 17157, (140, 84, 104, 34, 142, 214, 131, 181 ));
   
   type ISystemNavigationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISystemNavigationManagerStatics_Interface
      ; RetVal : access Windows.UI.Core.ISystemNavigationManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackRequestedEventArgs : aliased constant Windows.IID := (3590574730, 58385, 19022, (186, 65, 106, 50, 122, 134, 117, 188 ));
   
   type IBackRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IBackRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IBackRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowEventArgs : aliased constant Windows.IID := (657137395, 50739, 19877, (162, 108, 198, 208, 245, 107, 41, 218 ));
   
   type ICoreWindowEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access ICoreWindowEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ICoreWindowEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationProviderRequestedEventArgs : aliased constant Windows.IID := (2518676056, 8639, 19266, (162, 152, 250, 71, 157, 76, 82, 226 ));
   
   type IAutomationProviderRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutomationProvider
   (
      This       : access IAutomationProviderRequestedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_AutomationProvider
   (
      This       : access IAutomationProviderRequestedEventArgs_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICharacterReceivedEventArgs : aliased constant Windows.IID := (3313788319, 39346, 19404, (189, 51, 4, 230, 63, 66, 144, 46 ));
   
   type ICharacterReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyCode
   (
      This       : access ICharacterReceivedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access ICharacterReceivedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputEnabledEventArgs : aliased constant Windows.IID := (2151095631, 12248, 19492, (170, 134, 49, 99, 168, 123, 78, 90 ));
   
   type IInputEnabledEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputEnabled
   (
      This       : access IInputEnabledEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyEventArgs : aliased constant Windows.IID := (1609951536, 9540, 18967, (189, 120, 31, 47, 222, 187, 16, 107 ));
   
   type IKeyEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VirtualKey
   (
      This       : access IKeyEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access IKeyEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyEventArgs2 : aliased constant Windows.IID := (1480252824, 1936, 17777, (155, 18, 100, 94, 249, 215, 158, 66 ));
   
   type IKeyEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IKeyEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerEventArgs : aliased constant Windows.IID := (2450365617, 42492, 18977, (140, 9, 73, 223, 230, 255, 226, 95 ));
   
   type IPointerEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentPoint
   (
      This       : access IPointerEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyModifiers
   (
      This       : access IPointerEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function GetIntermediatePoints
   (
      This       : access IPointerEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IVector_IPointerPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITouchHitTestingEventArgs : aliased constant Windows.IID := (586397731, 2940, 16974, (157, 247, 51, 212, 249, 98, 147, 27 ));
   
   type ITouchHitTestingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProximityEvaluation
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CoreProximityEvaluation
   )
   return Windows.HRESULT is abstract;
   
   function put_ProximityEvaluation
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; value : Windows.UI.Core.CoreProximityEvaluation
   )
   return Windows.HRESULT is abstract;
   
   function get_Point
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingBox
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function EvaluateProximityToRect
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; controlBoundingBox : Windows.Foundation.Rect
      ; RetVal : access Windows.UI.Core.CoreProximityEvaluation
   )
   return Windows.HRESULT is abstract;
   
   function EvaluateProximityToPolygon
   (
      This       : access ITouchHitTestingEventArgs_Interface
      ; controlVertices : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.UI.Core.CoreProximityEvaluation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClosestInteractiveBoundsRequestedEventArgs : aliased constant Windows.IID := (880546263, 63224, 16611, (178, 159, 174, 80, 211, 232, 100, 134 ));
   
   type IClosestInteractiveBoundsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerPosition
   (
      This       : access IClosestInteractiveBoundsRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchBounds
   (
      This       : access IClosestInteractiveBoundsRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosestInteractiveBounds
   (
      This       : access IClosestInteractiveBoundsRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosestInteractiveBounds
   (
      This       : access IClosestInteractiveBoundsRequestedEventArgs_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindowActivatedEventArgs : aliased constant Windows.IID := (396191207, 18008, 19638, (170, 19, 65, 208, 148, 234, 37, 94 ));
   
   type IWindowActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WindowActivationState
   (
      This       : access IWindowActivatedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CoreWindowActivationState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindowSizeChangedEventArgs : aliased constant Windows.IID := (1512050375, 1062, 18396, (184, 108, 111, 71, 89, 21, 228, 81 ));
   
   type IWindowSizeChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IWindowSizeChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisibilityChangedEventArgs : aliased constant Windows.IID := (3214481642, 55297, 17764, (164, 149, 177, 232, 79, 138, 208, 133 ));
   
   type IVisibilityChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Visible
   (
      This       : access IVisibilityChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindow : aliased constant Windows.IID := (2042222066, 34718, 19337, (183, 152, 121, 228, 117, 152, 3, 12 ));
   
   type ICoreWindow_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutomationHostProvider
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomProperties
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowDirection
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.UI.Core.CoreWindowFlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_FlowDirection
   (
      This       : access ICoreWindow_Interface
      ; value : Windows.UI.Core.CoreWindowFlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInputEnabled
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInputEnabled
   (
      This       : access ICoreWindow_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCursor
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.UI.Core.ICoreCursor
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerCursor
   (
      This       : access ICoreWindow_Interface
      ; value : Windows.UI.Core.ICoreCursor
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerPosition
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access ICoreWindow_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Activate
   (
      This       : access ICoreWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access ICoreWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetAsyncKeyState
   (
      This       : access ICoreWindow_Interface
      ; virtualKey : Windows.System.VirtualKey
      ; RetVal : access Windows.UI.Core.CoreVirtualKeyStates
   )
   return Windows.HRESULT is abstract;
   
   function GetKeyState
   (
      This       : access ICoreWindow_Interface
      ; virtualKey : Windows.System.VirtualKey
      ; RetVal : access Windows.UI.Core.CoreVirtualKeyStates
   )
   return Windows.HRESULT is abstract;
   
   function ReleasePointerCapture
   (
      This       : access ICoreWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetPointerCapture
   (
      This       : access ICoreWindow_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Activated
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_Activated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Activated
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AutomationProviderRequested
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_AutomationProviderRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AutomationProviderRequested
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CharacterReceived
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_CharacterReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CharacterReceived
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_InputEnabled
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_InputEnabled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InputEnabled
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyDown
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_KeyDown
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyDown
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyUp
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_KeyUp
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyUp
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerCaptureLost
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerCaptureLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerCaptureLost
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerEntered
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerEntered
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerExited
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerExited
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerMoved
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerMoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerMoved
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerPressed
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerPressed
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerReleased
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerReleased
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TouchHitTesting
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_TouchHitTesting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TouchHitTesting
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerWheelChanged
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_PointerWheelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerWheelChanged
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SizeChanged
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_SizeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SizeChanged
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VisibilityChanged
   (
      This       : access ICoreWindow_Interface
      ; handler : TypedEventHandler_ICoreWindow_add_VisibilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisibilityChanged
   (
      This       : access ICoreWindow_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindow2 : aliased constant Windows.IID := (2083199877, 26903, 17249, (156, 2, 13, 158, 58, 66, 11, 149 ));
   
   type ICoreWindow2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PointerPosition
   (
      This       : access ICoreWindow2_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindow3 : aliased constant Windows.IID := (851578328, 64239, 17269, (162, 171, 50, 100, 14, 72, 21, 199 ));
   
   type ICoreWindow3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ClosestInteractiveBoundsRequested
   (
      This       : access ICoreWindow3_Interface
      ; handler : TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ClosestInteractiveBoundsRequested
   (
      This       : access ICoreWindow3_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentKeyEventDeviceId
   (
      This       : access ICoreWindow3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindow4 : aliased constant Windows.IID := (902492368, 18416, 17260, (175, 151, 13, 216, 143, 111, 95, 2 ));
   
   type ICoreWindow4_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ResizeStarted
   (
      This       : access ICoreWindow4_Interface
      ; handler : TypedEventHandler_ICoreWindow4_add_ResizeStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResizeStarted
   (
      This       : access ICoreWindow4_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResizeCompleted
   (
      This       : access ICoreWindow4_Interface
      ; handler : TypedEventHandler_ICoreWindow4_add_ResizeCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResizeCompleted
   (
      This       : access ICoreWindow4_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindow5 : aliased constant Windows.IID := (1263198689, 11885, 20138, (189, 161, 28, 92, 193, 190, 225, 65 ));
   
   type ICoreWindow5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access ICoreWindow5_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivationMode
   (
      This       : access ICoreWindow5_Interface
      ; RetVal : access Windows.UI.Core.CoreWindowActivationMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowStatic : aliased constant Windows.IID := (1294176261, 15402, 16817, (144, 34, 83, 107, 185, 207, 147, 177 ));
   
   type ICoreWindowStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentThread
   (
      This       : access ICoreWindowStatic_Interface
      ; RetVal : access Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAcceleratorKeyEventArgs : aliased constant Windows.IID := (4280044618, 37511, 18187, (131, 110, 144, 134, 227, 18, 106, 222 ));
   
   type IAcceleratorKeyEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EventType
   (
      This       : access IAcceleratorKeyEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CoreAcceleratorKeyEventType
   )
   return Windows.HRESULT is abstract;
   
   function get_VirtualKey
   (
      This       : access IAcceleratorKeyEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access IAcceleratorKeyEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAcceleratorKeyEventArgs2 : aliased constant Windows.IID := (3540036086, 12158, 18547, (165, 85, 22, 110, 89, 110, 225, 197 ));
   
   type IAcceleratorKeyEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IAcceleratorKeyEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreAcceleratorKeys : aliased constant Windows.IID := (2684221429, 47305, 20208, (183, 210, 29, 230, 38, 86, 31, 200 ));
   
   type ICoreAcceleratorKeys_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AcceleratorKeyActivated
   (
      This       : access ICoreAcceleratorKeys_Interface
      ; handler : TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AcceleratorKeyActivated
   (
      This       : access ICoreAcceleratorKeys_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDispatcher : aliased constant Windows.IID := (1624977320, 46853, 20446, (167, 214, 235, 187, 24, 145, 211, 158 ));
   
   type ICoreDispatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasThreadAccess
   (
      This       : access ICoreDispatcher_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ProcessEvents
   (
      This       : access ICoreDispatcher_Interface
      ; options : Windows.UI.Core.CoreProcessEventsOption
   )
   return Windows.HRESULT is abstract;
   
   function RunAsync
   (
      This       : access ICoreDispatcher_Interface
      ; priority : Windows.UI.Core.CoreDispatcherPriority
      ; agileCallback : Windows.UI.Core.DispatchedHandler
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RunIdleAsync
   (
      This       : access ICoreDispatcher_Interface
      ; agileCallback : Windows.UI.Core.IdleDispatchedHandler
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDispatcher2 : aliased constant Windows.IID := (1868456903, 58282, 20142, (176, 224, 220, 243, 33, 202, 75, 47 ));
   
   type ICoreDispatcher2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryRunAsync
   (
      This       : access ICoreDispatcher2_Interface
      ; priority : Windows.UI.Core.CoreDispatcherPriority
      ; agileCallback : Windows.UI.Core.DispatchedHandler
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryRunIdleAsync
   (
      This       : access ICoreDispatcher2_Interface
      ; agileCallback : Windows.UI.Core.IdleDispatchedHandler
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreDispatcherWithTaskPriority : aliased constant Windows.IID := (3137006765, 18509, 16830, (186, 128, 29, 88, 198, 82, 99, 234 ));
   
   type ICoreDispatcherWithTaskPriority_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentPriority
   (
      This       : access ICoreDispatcherWithTaskPriority_Interface
      ; RetVal : access Windows.UI.Core.CoreDispatcherPriority
   )
   return Windows.HRESULT is abstract;
   
   function put_CurrentPriority
   (
      This       : access ICoreDispatcherWithTaskPriority_Interface
      ; value : Windows.UI.Core.CoreDispatcherPriority
   )
   return Windows.HRESULT is abstract;
   
   function ShouldYield
   (
      This       : access ICoreDispatcherWithTaskPriority_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShouldYieldToPriority
   (
      This       : access ICoreDispatcherWithTaskPriority_Interface
      ; priority : Windows.UI.Core.CoreDispatcherPriority
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function StopProcessEvents
   (
      This       : access ICoreDispatcherWithTaskPriority_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIdleDispatchedHandlerArgs : aliased constant Windows.IID := (2562419236, 56348, 17355, (180, 237, 209, 192, 235, 35, 145, 243 ));
   
   type IIdleDispatchedHandlerArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDispatcherIdle
   (
      This       : access IIdleDispatchedHandlerArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreCursor : aliased constant Windows.IID := (2525575887, 4381, 17452, (138, 119, 184, 121, 146, 248, 226, 214 ));
   
   type ICoreCursor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ICoreCursor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ICoreCursor_Interface
      ; RetVal : access Windows.UI.Core.CoreCursorType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreCursorFactory : aliased constant Windows.IID := (4130706977, 42909, 20179, (140, 50, 169, 239, 157, 107, 118, 164 ));
   
   type ICoreCursorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCursor
   (
      This       : access ICoreCursorFactory_Interface
      ; type_x : Windows.UI.Core.CoreCursorType
      ; id : Windows.UInt32
      ; RetVal : access Windows.UI.Core.ICoreCursor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInitializeWithCoreWindow : aliased constant Windows.IID := (412033238, 39027, 17994, (172, 229, 87, 224, 16, 244, 101, 230 ));
   
   type IInitializeWithCoreWindow_Interface is interface and Windows.IInspectable_Interface;
   
   function Initialize
   (
      This       : access IInitializeWithCoreWindow_Interface
      ; window : Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowResizeManager : aliased constant Windows.IID := (3102783781, 45904, 18611, (161, 152, 92, 26, 132, 112, 2, 67 ));
   
   type ICoreWindowResizeManager_Interface is interface and Windows.IInspectable_Interface;
   
   function NotifyLayoutCompleted
   (
      This       : access ICoreWindowResizeManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowResizeManagerLayoutCapability : aliased constant Windows.IID := (3145003643, 42308, 17153, (128, 230, 10, 224, 51, 239, 69, 54 ));
   
   type ICoreWindowResizeManagerLayoutCapability_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ShouldWaitForLayoutCompletion
   (
      This       : access ICoreWindowResizeManagerLayoutCapability_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldWaitForLayoutCompletion
   (
      This       : access ICoreWindowResizeManagerLayoutCapability_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowResizeManagerStatics : aliased constant Windows.IID := (2924122181, 28016, 18907, (142, 104, 70, 255, 189, 23, 211, 141 ));
   
   type ICoreWindowResizeManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ICoreWindowResizeManagerStatics_Interface
      ; RetVal : access Windows.UI.Core.ICoreWindowResizeManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreInputSourceBase : aliased constant Windows.IID := (2672330759, 17792, 19432, (190, 104, 146, 169, 49, 23, 19, 187 ));
   
   type ICoreInputSourceBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Dispatcher
   (
      This       : access ICoreInputSourceBase_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInputEnabled
   (
      This       : access ICoreInputSourceBase_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInputEnabled
   (
      This       : access ICoreInputSourceBase_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_InputEnabled
   (
      This       : access ICoreInputSourceBase_Interface
      ; handler : TypedEventHandler_ICoreInputSourceBase_add_InputEnabled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InputEnabled
   (
      This       : access ICoreInputSourceBase_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICorePointerInputSource : aliased constant Windows.IID := (3153181464, 58490, 18667, (136, 7, 248, 248, 211, 234, 69, 81 ));
   
   type ICorePointerInputSource_Interface is interface and Windows.IInspectable_Interface;
   
   function ReleasePointerCapture
   (
      This       : access ICorePointerInputSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetPointerCapture
   (
      This       : access ICorePointerInputSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCapture
   (
      This       : access ICorePointerInputSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerPosition
   (
      This       : access ICorePointerInputSource_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerCursor
   (
      This       : access ICorePointerInputSource_Interface
      ; RetVal : access Windows.UI.Core.ICoreCursor
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerCursor
   (
      This       : access ICorePointerInputSource_Interface
      ; value : Windows.UI.Core.ICoreCursor
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerCaptureLost
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerCaptureLost
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerEntered
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerEntered
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerExited
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerExited
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerMoved
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerMoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerMoved
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerPressed
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerPressed
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerReleased
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerReleased
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerWheelChanged
   (
      This       : access ICorePointerInputSource_Interface
      ; handler : TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerWheelChanged
   (
      This       : access ICorePointerInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICorePointerInputSource2 : aliased constant Windows.IID := (3607326858, 17686, 18310, (177, 229, 39, 81, 213, 99, 249, 151 ));
   
   type ICorePointerInputSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access ICorePointerInputSource2_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreKeyboardInputSource : aliased constant Windows.IID := (589074568, 58473, 19953, (178, 8, 110, 73, 13, 113, 203, 144 ));
   
   type ICoreKeyboardInputSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentKeyState
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; virtualKey : Windows.System.VirtualKey
      ; RetVal : access Windows.UI.Core.CoreVirtualKeyStates
   )
   return Windows.HRESULT is abstract;
   
   function add_CharacterReceived
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; handler : TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CharacterReceived
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyDown
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; handler : TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyDown
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyUp
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; handler : TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyUp
   (
      This       : access ICoreKeyboardInputSource_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreKeyboardInputSource2 : aliased constant Windows.IID := (4196715412, 63843, 18341, (135, 120, 32, 124, 72, 43, 10, 253 ));
   
   type ICoreKeyboardInputSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentKeyEventDeviceId
   (
      This       : access ICoreKeyboardInputSource2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreComponentFocusable : aliased constant Windows.IID := (1392078755, 34626, 17425, (174, 105, 121, 168, 95, 41, 172, 139 ));
   
   type ICoreComponentFocusable_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasFocus
   (
      This       : access ICoreComponentFocusable_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_GotFocus
   (
      This       : access ICoreComponentFocusable_Interface
      ; handler : TypedEventHandler_ICoreComponentFocusable_add_GotFocus
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GotFocus
   (
      This       : access ICoreComponentFocusable_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LostFocus
   (
      This       : access ICoreComponentFocusable_Interface
      ; handler : TypedEventHandler_ICoreComponentFocusable_add_LostFocus
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LostFocus
   (
      This       : access ICoreComponentFocusable_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreTouchHitTesting : aliased constant Windows.IID := (2983764617, 15055, 16676, (159, 163, 234, 138, 186, 53, 60, 33 ));
   
   type ICoreTouchHitTesting_Interface is interface and Windows.IInspectable_Interface;
   
   function add_TouchHitTesting
   (
      This       : access ICoreTouchHitTesting_Interface
      ; handler : TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TouchHitTesting
   (
      This       : access ICoreTouchHitTesting_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreClosestInteractiveBoundsRequested : aliased constant Windows.IID := (4077061178, 59583, 20110, (174, 105, 201, 218, 221, 87, 161, 20 ));
   
   type ICoreClosestInteractiveBoundsRequested_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ClosestInteractiveBoundsRequested
   (
      This       : access ICoreClosestInteractiveBoundsRequested_Interface
      ; handler : TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ClosestInteractiveBoundsRequested
   (
      This       : access ICoreClosestInteractiveBoundsRequested_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICorePointerRedirector : aliased constant Windows.IID := (2409434260, 22152, 19212, (169, 241, 249, 49, 247, 250, 61, 195 ));
   
   type ICorePointerRedirector_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PointerRoutedAway
   (
      This       : access ICorePointerRedirector_Interface
      ; handler : TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerRoutedAway
   (
      This       : access ICorePointerRedirector_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerRoutedTo
   (
      This       : access ICorePointerRedirector_Interface
      ; handler : TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerRoutedTo
   (
      This       : access ICorePointerRedirector_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PointerRoutedReleased
   (
      This       : access ICorePointerRedirector_Interface
      ; handler : TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PointerRoutedReleased
   (
      This       : access ICorePointerRedirector_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowPopupShowingEventArgs : aliased constant Windows.IID := (638934946, 23461, 20132, (163, 180, 45, 199, 214, 60, 142, 38 ));
   
   type ICoreWindowPopupShowingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function SetDesiredSize
   (
      This       : access ICoreWindowPopupShowingEventArgs_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowDialog : aliased constant Windows.IID := (3879283936, 51085, 17022, (139, 44, 1, 255, 66, 12, 105, 213 ));
   
   type ICoreWindowDialog_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Showing
   (
      This       : access ICoreWindowDialog_Interface
      ; handler : TypedEventHandler_ICoreWindowDialog_add_Showing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Showing
   (
      This       : access ICoreWindowDialog_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSize
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_MinSize
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ICoreWindowDialog_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInteractionDelayed
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInteractionDelayed
   (
      This       : access ICoreWindowDialog_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Commands
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultCommandIndex
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultCommandIndex
   (
      This       : access ICoreWindowDialog_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CancelCommandIndex
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CancelCommandIndex
   (
      This       : access ICoreWindowDialog_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BackButtonCommand
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function put_BackButtonCommand
   (
      This       : access ICoreWindowDialog_Interface
      ; value : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsync
   (
      This       : access ICoreWindowDialog_Interface
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowDialogFactory : aliased constant Windows.IID := (3484592213, 7257, 19219, (177, 229, 22, 226, 152, 5, 247, 196 ));
   
   type ICoreWindowDialogFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithTitle
   (
      This       : access ICoreWindowDialogFactory_Interface
      ; title : Windows.String
      ; RetVal : access Windows.UI.Core.ICoreWindowDialog
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowFlyout : aliased constant Windows.IID := (3902637389, 8272, 16571, (179, 68, 246, 243, 85, 238, 179, 20 ));
   
   type ICoreWindowFlyout_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Showing
   (
      This       : access ICoreWindowFlyout_Interface
      ; handler : TypedEventHandler_ICoreWindowFlyout_add_Showing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Showing
   (
      This       : access ICoreWindowFlyout_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSize
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_MinSize
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ICoreWindowFlyout_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInteractionDelayed
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInteractionDelayed
   (
      This       : access ICoreWindowFlyout_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Commands
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultCommandIndex
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultCommandIndex
   (
      This       : access ICoreWindowFlyout_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BackButtonCommand
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function put_BackButtonCommand
   (
      This       : access ICoreWindowFlyout_Interface
      ; value : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsync
   (
      This       : access ICoreWindowFlyout_Interface
      ; RetVal : access Windows.UI.Popups.IAsyncOperation_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreWindowFlyoutFactory : aliased constant Windows.IID := (3737437892, 37864, 20348, (190, 39, 206, 250, 161, 175, 104, 167 ));
   
   type ICoreWindowFlyoutFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICoreWindowFlyoutFactory_Interface
      ; position : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Core.ICoreWindowFlyout
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTitle
   (
      This       : access ICoreWindowFlyoutFactory_Interface
      ; position : Windows.Foundation.Point
      ; title : Windows.String
      ; RetVal : access Windows.UI.Core.ICoreWindowFlyout
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DispatchedHandler : aliased constant Windows.IID := (3522328260, 39128, 17974, (191, 73, 235, 121, 80, 117, 72, 233 ));
   
   type DispatchedHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_DispatchedHandler'access) with null record;
   function Invoke
   (
      This       : access DispatchedHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_IdleDispatchedHandler : aliased constant Windows.IID := (2754284580, 32545, 19132, (153, 193, 143, 1, 0, 127, 8, 128 ));
   
   type IdleDispatchedHandler_Interface(Callback : access procedure (e : Windows.UI.Core.IIdleDispatchedHandlerArgs)) is new Windows.IMulticastDelegate_Interface(IID_IdleDispatchedHandler'access) with null record;
   function Invoke
   (
      This       : access IdleDispatchedHandler_Interface
      ; e : Windows.UI.Core.IIdleDispatchedHandlerArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IBackRequestedEventArgs : aliased constant Windows.IID := (3397521504, 43, 21101, (129, 34, 152, 38, 48, 215, 205, 190 ));
   
   type EventHandler_IBackRequestedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IBackRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IBackRequestedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IBackRequestedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IBackRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_Activated : aliased constant Windows.IID := (648493877, 43001, 21211, (136, 214, 21, 114, 109, 235, 37, 35 ));
   
   type TypedEventHandler_ICoreWindow_add_Activated_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IWindowActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_Activated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_Activated_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IWindowActivatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_AutomationProviderRequested : aliased constant Windows.IID := (1423662084, 33271, 24390, (159, 184, 228, 155, 238, 199, 10, 36 ));
   
   type TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IAutomationProviderRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_AutomationProviderRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IAutomationProviderRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_CharacterReceived : aliased constant Windows.IID := (1945650856, 2806, 22642, (143, 184, 174, 47, 86, 216, 85, 62 ));
   
   type TypedEventHandler_ICoreWindow_add_CharacterReceived_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.ICharacterReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_CharacterReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_CharacterReceived_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICharacterReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_Closed : aliased constant Windows.IID := (3498987366, 13399, 22514, (186, 12, 203, 52, 113, 51, 189, 21 ));
   
   type TypedEventHandler_ICoreWindow_add_Closed_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.ICoreWindowEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_Closed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_Closed_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_InputEnabled : aliased constant Windows.IID := (3794839114, 20586, 22979, (187, 97, 85, 89, 255, 153, 86, 99 ));
   
   type TypedEventHandler_ICoreWindow_add_InputEnabled_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IInputEnabledEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_InputEnabled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_InputEnabled_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IInputEnabledEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_KeyDown : aliased constant Windows.IID := (2750154612, 21932, 23905, (130, 50, 179, 92, 93, 53, 201, 60 ));
   
   type TypedEventHandler_ICoreWindow_add_KeyDown_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_KeyDown'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_KeyDown_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_KeyUp : aliased constant Windows.IID := (2750154612, 21932, 23905, (130, 50, 179, 92, 93, 53, 201, 60 ));
   
   type TypedEventHandler_ICoreWindow_add_KeyUp_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_KeyUp'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_KeyUp_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerCaptureLost : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerCaptureLost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerEntered : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerEntered_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerEntered_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerExited : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerExited_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerExited_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerMoved : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerMoved_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerMoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerMoved_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerPressed : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerPressed_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerPressed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerPressed_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerReleased : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerReleased_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerReleased'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerReleased_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_TouchHitTesting : aliased constant Windows.IID := (427185353, 3143, 20523, (154, 161, 13, 235, 3, 237, 151, 2 ));
   
   type TypedEventHandler_ICoreWindow_add_TouchHitTesting_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.ITouchHitTestingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_TouchHitTesting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_TouchHitTesting_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ITouchHitTestingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_PointerWheelChanged : aliased constant Windows.IID := (1108220854, 59805, 24164, (142, 37, 7, 70, 126, 60, 174, 158 ));
   
   type TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_PointerWheelChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_SizeChanged : aliased constant Windows.IID := (831372135, 16521, 22160, (144, 64, 29, 69, 79, 178, 246, 134 ));
   
   type TypedEventHandler_ICoreWindow_add_SizeChanged_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IWindowSizeChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_SizeChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_SizeChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IWindowSizeChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow_add_VisibilityChanged : aliased constant Windows.IID := (347600530, 21891, 21153, (170, 66, 252, 24, 67, 192, 247, 72 ));
   
   type TypedEventHandler_ICoreWindow_add_VisibilityChanged_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IVisibilityChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow_add_VisibilityChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_VisibilityChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IVisibilityChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested : aliased constant Windows.IID := (564548306, 49122, 23342, (162, 171, 202, 69, 37, 59, 232, 176 ));
   
   type TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow4_add_ResizeStarted : aliased constant Windows.IID := (1667804733, 21204, 21136, (185, 54, 113, 122, 154, 207, 91, 234 ));
   
   type TypedEventHandler_ICoreWindow4_add_ResizeStarted_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow4_add_ResizeStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow4_add_ResizeStarted_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindow4_add_ResizeCompleted : aliased constant Windows.IID := (1667804733, 21204, 21136, (185, 54, 113, 122, 154, 207, 91, 234 ));
   
   type TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindow4_add_ResizeCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated : aliased constant Windows.IID := (325975821, 63464, 20819, (179, 28, 134, 57, 12, 112, 24, 128 ));
   
   type TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreDispatcher ; args : Windows.UI.Core.IAcceleratorKeyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Interface
      ; sender : Windows.UI.Core.ICoreDispatcher
      ; args : Windows.UI.Core.IAcceleratorKeyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreInputSourceBase_add_InputEnabled : aliased constant Windows.IID := (3382075164, 13889, 20918, (184, 35, 4, 142, 195, 98, 143, 176 ));
   
   type TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IInputEnabledEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreInputSourceBase_add_InputEnabled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IInputEnabledEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerEntered : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerExited : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerExited_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerExited_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerMoved : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerMoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerPressed : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerPressed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerReleased : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerReleased'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged : aliased constant Windows.IID := (648724289, 41213, 24166, (177, 136, 108, 116, 24, 45, 0, 205 ));
   
   type TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived : aliased constant Windows.IID := (1520740424, 34482, 20587, (137, 171, 94, 181, 120, 100, 32, 198 ));
   
   type TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.ICharacterReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICharacterReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown : aliased constant Windows.IID := (3940548087, 55054, 22152, (144, 108, 194, 177, 34, 158, 161, 109 ));
   
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp : aliased constant Windows.IID := (3940548087, 55054, 22152, (144, 108, 194, 177, 34, 158, 161, 109 ));
   
   type TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreComponentFocusable_add_GotFocus : aliased constant Windows.IID := (445301360, 42871, 20727, (136, 161, 227, 78, 86, 192, 148, 73 ));
   
   type TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.ICoreWindowEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreComponentFocusable_add_GotFocus'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreComponentFocusable_add_LostFocus : aliased constant Windows.IID := (445301360, 42871, 20727, (136, 161, 227, 78, 86, 192, 148, 73 ));
   
   type TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.ICoreWindowEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreComponentFocusable_add_LostFocus'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting : aliased constant Windows.IID := (3345915173, 27286, 22781, (135, 79, 174, 82, 189, 96, 58, 248 ));
   
   type TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.ITouchHitTestingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ITouchHitTestingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested : aliased constant Windows.IID := (3804638530, 1399, 20754, (158, 89, 234, 225, 89, 191, 57, 233 ));
   
   type TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreInputSourceBase ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Interface
      ; sender : Windows.UI.Core.ICoreInputSourceBase
      ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway : aliased constant Windows.IID := (695479591, 6013, 21699, (185, 116, 97, 111, 196, 90, 43, 12 ));
   
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Interface(Callback : access procedure (sender : Windows.UI.Core.ICorePointerRedirector ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo : aliased constant Windows.IID := (695479591, 6013, 21699, (185, 116, 97, 111, 196, 90, 43, 12 ));
   
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Interface(Callback : access procedure (sender : Windows.UI.Core.ICorePointerRedirector ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased : aliased constant Windows.IID := (695479591, 6013, 21699, (185, 116, 97, 111, 196, 90, 43, 12 ));
   
   type TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Interface(Callback : access procedure (sender : Windows.UI.Core.ICorePointerRedirector ; args : Windows.UI.Core.IPointerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindowDialog_add_Showing : aliased constant Windows.IID := (3006096418, 30898, 24064, (132, 168, 110, 49, 103, 170, 171, 222 ));
   
   type TypedEventHandler_ICoreWindowDialog_add_Showing_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindowDialog_add_Showing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindowDialog_add_Showing_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreWindowFlyout_add_Showing : aliased constant Windows.IID := (3006096418, 30898, 24064, (132, 168, 110, 49, 103, 170, 171, 222 ));
   
   type TypedEventHandler_ICoreWindowFlyout_add_Showing_Interface(Callback : access procedure (sender : Windows.UI.Core.ICoreWindow ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreWindowFlyout_add_Showing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindowFlyout_add_Showing_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BackRequestedEventArgs is Windows.UI.Core.IBackRequestedEventArgs;
   subtype SystemNavigationManager is Windows.UI.Core.ISystemNavigationManager;
   subtype CoreDispatcher is Windows.UI.Core.ICoreDispatcher;
   subtype CoreCursor is Windows.UI.Core.ICoreCursor;
   function CreateCursor
   (
      type_x : Windows.UI.Core.CoreCursorType
      ; id : Windows.UInt32
   )
   return Windows.UI.Core.ICoreCursor;
   
   subtype CoreWindow is Windows.UI.Core.ICoreWindow;
   subtype WindowActivatedEventArgs is Windows.UI.Core.IWindowActivatedEventArgs;
   subtype AutomationProviderRequestedEventArgs is Windows.UI.Core.IAutomationProviderRequestedEventArgs;
   subtype CharacterReceivedEventArgs is Windows.UI.Core.ICharacterReceivedEventArgs;
   subtype CoreWindowEventArgs is Windows.UI.Core.ICoreWindowEventArgs;
   subtype InputEnabledEventArgs is Windows.UI.Core.IInputEnabledEventArgs;
   subtype KeyEventArgs is Windows.UI.Core.IKeyEventArgs;
   subtype PointerEventArgs is Windows.UI.Core.IPointerEventArgs;
   subtype TouchHitTestingEventArgs is Windows.UI.Core.ITouchHitTestingEventArgs;
   subtype WindowSizeChangedEventArgs is Windows.UI.Core.IWindowSizeChangedEventArgs;
   subtype VisibilityChangedEventArgs is Windows.UI.Core.IVisibilityChangedEventArgs;
   subtype ClosestInteractiveBoundsRequestedEventArgs is Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs;
   subtype IdleDispatchedHandlerArgs is Windows.UI.Core.IIdleDispatchedHandlerArgs;
   subtype AcceleratorKeyEventArgs is Windows.UI.Core.IAcceleratorKeyEventArgs;
   subtype CoreAcceleratorKeys is Windows.UI.Core.ICoreAcceleratorKeys;
   subtype CoreWindowResizeManager is Windows.UI.Core.ICoreWindowResizeManager;
   subtype CoreComponentInputSource is Windows.UI.Core.ICoreInputSourceBase;
   subtype CoreIndependentInputSource is Windows.UI.Core.ICoreInputSourceBase;
   subtype CoreWindowPopupShowingEventArgs is Windows.UI.Core.ICoreWindowPopupShowingEventArgs;
   subtype CoreWindowDialog is Windows.UI.Core.ICoreWindowDialog;
   function CreateWithTitle
   (
      title : Windows.String
   )
   return Windows.UI.Core.ICoreWindowDialog;
   
   subtype CoreWindowFlyout is Windows.UI.Core.ICoreWindowFlyout;
   function Create
   (
      position : Windows.Foundation.Point
   )
   return Windows.UI.Core.ICoreWindowFlyout;
   
   function CreateWithTitle
   (
      position : Windows.Foundation.Point
      ; title : Windows.String
   )
   return Windows.UI.Core.ICoreWindowFlyout;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.UI.Core.ISystemNavigationManager;
   
   function GetForCurrentThread
   return Windows.UI.Core.ICoreWindow;
   
   function GetForCurrentView
   return Windows.UI.Core.ICoreWindowResizeManager;
   
end;
