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
with Windows.Devices.Input;
with Windows.System;
with Windows.UI.Xaml;
with Windows.UI.Core;
with Windows.UI.Input;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Input is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access DoubleTappedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_DoubleTappedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DoubleTappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access HoldingEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_HoldingEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access HoldingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IHoldingRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IHoldingRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access KeyEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_KeyEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access KeyEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IKeyRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IKeyRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access ManipulationCompletedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_ManipulationCompletedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ManipulationCompletedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access ManipulationDeltaEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_ManipulationDeltaEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ManipulationDeltaEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access ManipulationInertiaStartingEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_ManipulationInertiaStartingEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ManipulationInertiaStartingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access ManipulationStartedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_ManipulationStartedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ManipulationStartedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access ManipulationStartingEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_ManipulationStartingEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ManipulationStartingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access PointerEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_PointerEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access PointerEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IPointerRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IPointerRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access RightTappedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_RightTappedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access RightTappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access TappedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TappedEventHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TappedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Input.ITappedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Input.ITappedRoutedEventArgs(e));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IKeyboardAccelerator_add_Invoked or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardAccelerator_add_Invoked_Interface
      ; sender : Windows.UI.Xaml.Input.IKeyboardAccelerator
      ; args : Windows.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Input.IKeyboardAccelerator(sender), Windows.UI.Xaml.Input.IKeyboardAcceleratorInvokedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateAccessKeyDisplayRequestedEventArgs return Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyDisplayRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IAccessKeyDisplayRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAccessKeyDisplayDismissedEventArgs return Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyDisplayDismissedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IAccessKeyDisplayDismissedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAccessKeyInvokedEventArgs return Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyInvokedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IAccessKeyInvokedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateManipulationPivot return Windows.UI.Xaml.Input.IManipulationPivot is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationPivot");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationPivot := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IManipulationPivot'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateContextRequestedEventArgs return Windows.UI.Xaml.Input.IContextRequestedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ContextRequestedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IContextRequestedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IContextRequestedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDoubleTappedRoutedEventArgs return Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.DoubleTappedRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IDoubleTappedRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IDoubleTappedRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHoldingRoutedEventArgs return Windows.UI.Xaml.Input.IHoldingRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.HoldingRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IHoldingRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IHoldingRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInputScope return Windows.UI.Xaml.Input.IInputScope is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.InputScope");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IInputScope := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IInputScope'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      nameValue : Windows.UI.Xaml.Input.InputScopeNameValue
   )
   return Windows.UI.Xaml.Input.IInputScopeName is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.InputScopeName");
      m_Factory     : Windows.UI.Xaml.Input.IInputScopeNameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IInputScopeName := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInputScopeNameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(nameValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateManipulationCompletedRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationCompletedRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationCompletedRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IManipulationCompletedRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateManipulationDeltaRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationDeltaRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationDeltaRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IManipulationDeltaRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateManipulationInertiaStartingRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationInertiaStartingRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationInertiaStartingRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IManipulationInertiaStartingRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateManipulationStartingRoutedEventArgs return Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationStartingRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationStartingRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IManipulationStartingRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRightTappedRoutedEventArgs return Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.RightTappedRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IRightTappedRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IRightTappedRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTappedRoutedEventArgs return Windows.UI.Xaml.Input.ITappedRoutedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.TappedRoutedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.ITappedRoutedEventArgs := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_ITappedRoutedEventArgs'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFindNextElementOptions return Windows.UI.Xaml.Input.IFindNextElementOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FindNextElementOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IFindNextElementOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Input.IID_IFindNextElementOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
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
      This       : access IKeyboardAccelerator_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IKeyboardAccelerator , Windows.Address); 
   
   begin
      if riid.all = IID_IKeyboardAccelerator or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IKeyboardAccelerator_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IKeyboardAccelerator_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
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
      This       : access IKeyboardAccelerator_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Input.IKeyboardAccelerator");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IKeyboardAccelerator_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Key
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Key
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Modifiers
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_IsEnabled
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_ScopeOwner
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Invoked
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; value : TypedEventHandler_IKeyboardAccelerator_add_Invoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Invoked
   (
      This       : access IKeyboardAccelerator_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IManipulationStartedRoutedEventArgs , Windows.Address); 
   
   begin
      if riid.all = IID_IManipulationStartedRoutedEventArgs or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
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
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Container
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Position
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Handled
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Cumulative
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function Complete
   (
      This       : access IManipulationStartedRoutedEventArgs_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_IsDisplayModeEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDisplayModeEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_IsDisplayModeEnabledChanged
   (
      value : TypedEventHandler_IAccessKeyManagerStatics_add_IsDisplayModeEnabledChanged
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_IsDisplayModeEnabledChanged(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_IsDisplayModeEnabledChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_IsDisplayModeEnabledChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ExitDisplayMode
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ExitDisplayMode;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AreKeyTipsEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AreKeyTipsEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AreKeyTipsEnabled
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.AccessKeyManager");
      m_Factory     : IAccessKeyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccessKeyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AreKeyTipsEnabled(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Input.IKeyboardAccelerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.KeyboardAccelerator");
      m_Factory     : IKeyboardAcceleratorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IKeyboardAccelerator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardAcceleratorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.KeyboardAccelerator");
      m_Factory     : IKeyboardAcceleratorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardAcceleratorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ModifiersProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.KeyboardAccelerator");
      m_Factory     : IKeyboardAcceleratorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardAcceleratorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ModifiersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.KeyboardAccelerator");
      m_Factory     : IKeyboardAcceleratorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardAcceleratorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScopeOwnerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.KeyboardAccelerator");
      m_Factory     : IKeyboardAcceleratorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyboardAcceleratorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScopeOwnerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.ManipulationStartedRoutedEventArgs");
      m_Factory     : IManipulationStartedRoutedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Input.IManipulationStartedRoutedEventArgs;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IManipulationStartedRoutedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryMoveFocus
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryMoveFocus(focusNavigationDirection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNextFocusableElement
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.UI.Xaml.IUIElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IUIElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNextFocusableElement(focusNavigationDirection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNextFocusableElementWithHint
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; hintRect : Windows.Foundation.Rect
   )
   return Windows.UI.Xaml.IUIElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IUIElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNextFocusableElementWithHint(focusNavigationDirection, hintRect, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryMoveFocusWithOptions
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryMoveFocusWithOptions(focusNavigationDirection, focusNavigationOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNextElement
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
   )
   return Windows.UI.Xaml.IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNextElement(focusNavigationDirection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindFirstFocusableElement
   (
      searchScope : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindFirstFocusableElement(searchScope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindLastFocusableElement
   (
      searchScope : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLastFocusableElement(searchScope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindNextElementWithOptions
   (
      focusNavigationDirection : Windows.UI.Xaml.Input.FocusNavigationDirection
      ; focusNavigationOptions : Windows.UI.Xaml.Input.IFindNextElementOptions
   )
   return Windows.UI.Xaml.IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindNextElementWithOptions(focusNavigationDirection, focusNavigationOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFocusedElement
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Input.FocusManager");
      m_Factory     : IFocusManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFocusManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFocusedElement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
