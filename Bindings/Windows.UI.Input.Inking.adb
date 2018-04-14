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
with Windows.UI.Core;
with Windows.UI;
with Windows.UI.Input;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Inking is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkPresenter_add_StrokesCollected_Interface
      ; sender : Windows.UI.Input.Inking.IInkPresenter
      ; args : Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkPresenter(sender), Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkPresenter_add_StrokesErased_Interface
      ; sender : Windows.UI.Input.Inking.IInkPresenter
      ; args : Windows.UI.Input.Inking.IInkStrokesErasedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkPresenter(sender), Windows.UI.Input.Inking.IInkStrokesErasedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerEntered_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerHovered_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerExited_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerPressed_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerMoved_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerReleased_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkUnprocessedInput_add_PointerLost_Interface
      ; sender : Windows.UI.Input.Inking.IInkUnprocessedInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkUnprocessedInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeStarted_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkStrokeInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeContinued_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkStrokeInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeEnded_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkStrokeInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInkStrokeInput_add_StrokeCanceled_Interface
      ; sender : Windows.UI.Input.Inking.IInkStrokeInput
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.IInkStrokeInput(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.IInkPresenterRuler is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkPresenterRuler");
      m_Factory     : Windows.UI.Input.Inking.IInkPresenterRulerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.IInkPresenterRuler := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInkPresenterRulerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.IInkPresenterProtractor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkPresenterProtractor");
      m_Factory     : Windows.UI.Input.Inking.IInkPresenterProtractorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.IInkPresenterProtractor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInkPresenterProtractorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInkPointWithTiltAndTimestamp
   (
      position : Windows.Foundation.Point
      ; pressure : Windows.Single
      ; tiltX : Windows.Single
      ; tiltY : Windows.Single
      ; timestamp : Windows.UInt64
   )
   return Windows.UI.Input.Inking.IInkPoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkPoint");
      m_Factory     : Windows.UI.Input.Inking.IInkPointFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.IInkPoint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInkPointFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInkPointWithTiltAndTimestamp(position, pressure, tiltX, tiltY, timestamp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInkDrawingAttributes return Windows.UI.Input.Inking.IInkDrawingAttributes is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkDrawingAttributes");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.IInkDrawingAttributes) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.IID_IInkDrawingAttributes'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInkStrokeBuilder return Windows.UI.Input.Inking.IInkStrokeBuilder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkStrokeBuilder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.IInkStrokeBuilder) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.IID_IInkStrokeBuilder'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInkStrokeContainer return Windows.UI.Input.Inking.IInkStrokeContainer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkStrokeContainer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.IInkStrokeContainer) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.IID_IInkStrokeContainer'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInkRecognizerContainer return Windows.UI.Input.Inking.IInkRecognizerContainer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkRecognizerContainer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.IInkRecognizerContainer) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.IID_IInkRecognizerContainer'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInkManager return Windows.UI.Input.Inking.IInkManager is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkManager");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.IInkManager) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.IID_IInkManager'Access, RetVal'access);
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
   
   function CreateForPencil
   return Windows.UI.Input.Inking.IInkDrawingAttributes is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.InkDrawingAttributes");
      m_Factory     : IInkDrawingAttributesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.IInkDrawingAttributes;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInkDrawingAttributesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForPencil(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
