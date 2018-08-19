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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.UI.Input;
with Windows.UI.Popups;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access DispatchedHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access IdleDispatchedHandler_Interface
      ; e : Windows.UI.Core.IIdleDispatchedHandlerArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.IIdleDispatchedHandlerArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_IBackRequestedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IBackRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_Activated_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IWindowActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IWindowActivatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_AutomationProviderRequested_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IAutomationProviderRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IAutomationProviderRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_CharacterReceived_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICharacterReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.ICharacterReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_Closed_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.ICoreWindowEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_InputEnabled_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IInputEnabledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IInputEnabledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_KeyDown_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_KeyUp_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerCaptureLost_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerEntered_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerExited_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerMoved_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerPressed_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerReleased_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_TouchHitTesting_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ITouchHitTestingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.ITouchHitTestingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_PointerWheelChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_SizeChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IWindowSizeChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IWindowSizeChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow_add_VisibilityChanged_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IVisibilityChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IVisibilityChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow3_add_ClosestInteractiveBoundsRequested_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow4_add_ResizeStarted_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindow4_add_ResizeCompleted_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreAcceleratorKeys_add_AcceleratorKeyActivated_Interface
      ; sender : Windows.UI.Core.ICoreDispatcher
      ; args : Windows.UI.Core.IAcceleratorKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreDispatcher(sender), Windows.UI.Core.IAcceleratorKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInputSourceBase_add_InputEnabled_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IInputEnabledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IInputEnabledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerCaptureLost_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerEntered_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerExited_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerMoved_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerPressed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerReleased_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerInputSource_add_PointerWheelChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_CharacterReceived_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICharacterReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.ICharacterReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_KeyDown_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreKeyboardInputSource_add_KeyUp_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreComponentFocusable_add_GotFocus_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.ICoreWindowEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreComponentFocusable_add_LostFocus_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.ICoreWindowEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTouchHitTesting_add_TouchHitTesting_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.ITouchHitTestingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.ITouchHitTestingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreClosestInteractiveBoundsRequested_add_ClosestInteractiveBoundsRequested_Interface
      ; sender : Windows.UI.Core.ICoreInputSourceBase
      ; args : Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreInputSourceBase(sender), Windows.UI.Core.IClosestInteractiveBoundsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedAway_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedTo_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICorePointerRedirector_add_PointerRoutedReleased_Interface
      ; sender : Windows.UI.Core.ICorePointerRedirector
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindowDialog_add_Showing_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.ICoreWindowPopupShowingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWindowFlyout_add_Showing_Interface
      ; sender : Windows.UI.Core.ICoreWindow
      ; args : Windows.UI.Core.ICoreWindowPopupShowingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Core.ICoreWindow(sender), Windows.UI.Core.ICoreWindowPopupShowingEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateCursor
   (
      type_x : Windows.UI.Core.CoreCursorType
      ; id : Windows.UInt32
   )
   return Windows.UI.Core.ICoreCursor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreCursor");
      m_Factory     : Windows.UI.Core.ICoreCursorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreCursor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreCursorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCursor(type_x, id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.UI.Core.ICoreWindowDialog is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindowDialog");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Core.ICoreWindowDialog) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Core.IID_ICoreWindowDialog'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithTitle
   (
      title : Windows.String
   )
   return Windows.UI.Core.ICoreWindowDialog is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindowDialog");
      m_Factory     : Windows.UI.Core.ICoreWindowDialogFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreWindowDialog := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWindowDialogFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTitle(title, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      position : Windows.Foundation.Point
   )
   return Windows.UI.Core.ICoreWindowFlyout is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindowFlyout");
      m_Factory     : Windows.UI.Core.ICoreWindowFlyoutFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreWindowFlyout := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWindowFlyoutFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(position, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTitle
   (
      position : Windows.Foundation.Point
      ; title : Windows.String
   )
   return Windows.UI.Core.ICoreWindowFlyout is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindowFlyout");
      m_Factory     : Windows.UI.Core.ICoreWindowFlyoutFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreWindowFlyout := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWindowFlyoutFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTitle(position, title, RetVal'Access);
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
   
   function GetForCurrentView
   return Windows.UI.Core.ISystemNavigationManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.SystemNavigationManager");
      m_Factory     : ISystemNavigationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ISystemNavigationManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemNavigationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentThread
   return Windows.UI.Core.ICoreWindow is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindow");
      m_Factory     : ICoreWindowStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreWindow;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWindowStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentThread(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.Core.ICoreWindowResizeManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Core.CoreWindowResizeManager");
      m_Factory     : ICoreWindowResizeManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Core.ICoreWindowResizeManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWindowResizeManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
