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
with Windows.Devices.Input;
with Windows.Devices.Haptics;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Starting_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IEdgeGesture(sender), Windows.UI.Input.IEdgeGestureEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Completed_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IEdgeGesture(sender), Windows.UI.Input.IEdgeGestureEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Canceled_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IEdgeGesture(sender), Windows.UI.Input.IEdgeGestureEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface
      ; sender : Windows.UI.Input.IKeyboardDeliveryInterceptor
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IKeyboardDeliveryInterceptor(sender), Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface
      ; sender : Windows.UI.Input.IKeyboardDeliveryInterceptor
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IKeyboardDeliveryInterceptor(sender), Windows.UI.Core.IKeyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Tapped_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.ITappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.ITappedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IRightTappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IRightTappedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Holding_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IHoldingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IHoldingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Dragging_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IDraggingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IDraggingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IManipulationStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IManipulationUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationInertiaStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IManipulationInertiaStartingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.IManipulationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.ICrossSlidingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IGestureRecognizer(sender), Windows.UI.Input.ICrossSlidingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ControlLost_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_RotationChanged_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerRotationChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerRotationChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ButtonClicked_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonClickedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerButtonClickedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ControlAcquired_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerControlAcquiredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerControlAcquiredEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonPressed_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonPressedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerButtonPressedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonHolding_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonHoldingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerButtonHoldingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonReleased_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonReleasedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialController(sender), Windows.UI.Input.IRadialControllerButtonReleasedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface
      ; sender : Windows.UI.Input.IRadialControllerMenuItem
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.IRadialControllerMenuItem(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateGestureRecognizer return Windows.UI.Input.IGestureRecognizer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.GestureRecognizer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.IGestureRecognizer) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.IID_IGestureRecognizer'Access, RetVal'access);
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
   
   function GetForCurrentView
   return Windows.UI.Input.IEdgeGesture is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.EdgeGesture");
      m_Factory     : IEdgeGestureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IEdgeGesture;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEdgeGestureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.Input.IKeyboardDeliveryInterceptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.KeyboardDeliveryInterceptor");
      m_Factory     : IKeyboardDeliveryInterceptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IKeyboardDeliveryInterceptor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardDeliveryInterceptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentPoint
   (
      pointerId : Windows.UInt32
   )
   return Windows.UI.Input.IPointerPoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.PointerPoint");
      m_Factory     : IPointerPointStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IPointerPoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerPointStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentPoint(pointerId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIntermediatePoints
   (
      pointerId : Windows.UInt32
   )
   return Windows.UI.Input.IVector_IPointerPoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.PointerPoint");
      m_Factory     : IPointerPointStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IVector_IPointerPoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerPointStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIntermediatePoints(pointerId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentPointTransformed
   (
      pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
   )
   return Windows.UI.Input.IPointerPoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.PointerPoint");
      m_Factory     : IPointerPointStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IPointerPoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerPointStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentPointTransformed(pointerId, transform, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIntermediatePointsTransformed
   (
      pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
   )
   return Windows.UI.Input.IVector_IPointerPoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.PointerPoint");
      m_Factory     : IPointerPointStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IVector_IPointerPoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerPointStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIntermediatePointsTransformed(pointerId, transform, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.Input.IPointerVisualizationSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.PointerVisualizationSettings");
      m_Factory     : IPointerVisualizationSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IPointerVisualizationSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerVisualizationSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialController");
      m_Factory     : IRadialControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateForCurrentView
   return Windows.UI.Input.IRadialController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialController");
      m_Factory     : IRadialControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIcon
   (
      displayText : Windows.String
      ; icon : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.UI.Input.IRadialControllerMenuItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerMenuItem");
      m_Factory     : IRadialControllerMenuItemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialControllerMenuItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerMenuItemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIcon(displayText, icon, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromKnownIcon
   (
      displayText : Windows.String
      ; value : Windows.UI.Input.RadialControllerMenuKnownIcon
   )
   return Windows.UI.Input.IRadialControllerMenuItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerMenuItem");
      m_Factory     : IRadialControllerMenuItemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialControllerMenuItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerMenuItemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromKnownIcon(displayText, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFontGlyph
   (
      displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
   )
   return Windows.UI.Input.IRadialControllerMenuItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerMenuItem");
      m_Factory     : IRadialControllerMenuItemStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialControllerMenuItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerMenuItemStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFontGlyph(displayText, glyph, fontFamily, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFontGlyphWithUri
   (
      displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
      ; fontUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Input.IRadialControllerMenuItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerMenuItem");
      m_Factory     : IRadialControllerMenuItemStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialControllerMenuItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerMenuItemStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFontGlyphWithUri(displayText, glyph, fontFamily, fontUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.Input.IRadialControllerConfiguration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerConfiguration");
      m_Factory     : IRadialControllerConfigurationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialControllerConfiguration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerConfigurationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AppController
   (
      value : Windows.UI.Input.IRadialController
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerConfiguration");
      m_Factory     : IRadialControllerConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AppController(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AppController
   return Windows.UI.Input.IRadialController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerConfiguration");
      m_Factory     : IRadialControllerConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.IRadialController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppController(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsAppControllerEnabled
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerConfiguration");
      m_Factory     : IRadialControllerConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsAppControllerEnabled(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsAppControllerEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.RadialControllerConfiguration");
      m_Factory     : IRadialControllerConfigurationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerConfigurationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsAppControllerEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
