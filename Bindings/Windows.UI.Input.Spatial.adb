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
with Windows.Perception.Spatial;
with Windows.Perception;
with Windows.Devices.Haptics;
with Windows.Storage.Streams;
with Windows.Perception.People;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Spatial is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialRecognitionStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialRecognitionStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialRecognitionEndedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialRecognitionEndedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialTappedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialTappedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialHoldStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialHoldCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldCanceledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialHoldCanceledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialManipulationStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialManipulationUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialManipulationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationCanceledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialManipulationCanceledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialNavigationStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialNavigationUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialNavigationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationCanceledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialGestureRecognizer(sender), Windows.UI.Input.Spatial.ISpatialNavigationCanceledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionDetectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Spatial.ISpatialInteractionManager(sender), Windows.UI.Input.Spatial.ISpatialInteractionDetectedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      settings : Windows.UI.Input.Spatial.SpatialGestureSettings
   )
   return Windows.UI.Input.Spatial.ISpatialGestureRecognizer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Spatial.SpatialGestureRecognizer");
      m_Factory     : Windows.UI.Input.Spatial.ISpatialGestureRecognizerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Spatial.ISpatialGestureRecognizer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialGestureRecognizerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(settings, RetVal'Access);
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
   
   
   function TryGetAtTimestamp
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; timestamp : Windows.Perception.IPerceptionTimestamp
   )
   return Windows.UI.Input.Spatial.ISpatialPointerPose is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Spatial.SpatialPointerPose");
      m_Factory     : ISpatialPointerPoseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Spatial.ISpatialPointerPose;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialPointerPoseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetAtTimestamp(coordinateSystem, timestamp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.Input.Spatial.ISpatialInteractionManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Spatial.SpatialInteractionManager");
      m_Factory     : ISpatialInteractionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Spatial.ISpatialInteractionManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialInteractionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
