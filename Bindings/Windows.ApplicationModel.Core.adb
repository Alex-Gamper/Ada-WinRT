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
with Windows.ApplicationModel;
with Windows.UI.Core;
with Windows.ApplicationModel.Activation;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_AppRestartFailureReason_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_AppRestartFailureReason or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_AppRestartFailureReason_Interface
      ; asyncInfo : Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IUnhandledErrorDetectedEventArgs_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_EventHandler_IUnhandledErrorDetectedEventArgs or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IUnhandledErrorDetectedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.Core.IUnhandledErrorDetectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreApplicationView_add_Activated_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_ICoreApplicationView_add_Activated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreApplicationView_add_Activated_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationView
      ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Core.ICoreApplicationView(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationView
      ; args : Windows.ApplicationModel.Core.IHostedViewClosingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Core.ICoreApplicationView(sender), Windows.ApplicationModel.Core.IHostedViewClosingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateNewViewFromMainView
   return Windows.ApplicationModel.Core.ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreImmersiveApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreImmersiveApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNewViewFromMainView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure IncrementApplicationUseCount
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationUseCount := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationUseCount'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IncrementApplicationUseCount;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure DecrementApplicationUseCount
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationUseCount := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationUseCount'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecrementApplicationUseCount;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Exit_x
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationExit := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationExit'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Exit_x;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Exiting
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationExit := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationExit'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Exiting(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Exiting
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationExit := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationExit'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Exiting(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Views
   return Windows.ApplicationModel.Core.IVectorView_ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreImmersiveApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.IVectorView_ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreImmersiveApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Views(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNewView
   (
      runtimeType : Windows.String
      ; entryPoint : Windows.String
   )
   return Windows.ApplicationModel.Core.ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreImmersiveApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreImmersiveApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNewView(runtimeType, entryPoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MainView
   return Windows.ApplicationModel.Core.ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreImmersiveApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreImmersiveApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MainView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_UnhandledErrorDetected
   (
      handler : Windows.ApplicationModel.Core.EventHandler_IUnhandledErrorDetectedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationUnhandledError := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationUnhandledError'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_UnhandledErrorDetected(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_UnhandledErrorDetected
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplicationUnhandledError := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplicationUnhandledError'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_UnhandledErrorDetected(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RequestRestartAsync
   (
      launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestRestartAsync(launchArguments, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestRestartForUserAsync
   (
      user : Windows.System.IUser
      ; launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestRestartForUserAsync(user, launchArguments, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_BackgroundActivated
   (
      handler : Windows.ApplicationModel.Activation.EventHandler_IBackgroundActivatedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_BackgroundActivated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_BackgroundActivated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_BackgroundActivated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_LeavingBackground
   (
      handler : Windows.ApplicationModel.EventHandler_ILeavingBackgroundEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_LeavingBackground(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_LeavingBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_LeavingBackground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_EnteredBackground
   (
      handler : Windows.ApplicationModel.EventHandler_IEnteredBackgroundEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_EnteredBackground(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_EnteredBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_EnteredBackground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure EnablePrelaunch
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EnablePrelaunch(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateNewViewWithViewSource
   (
      viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
   )
   return Windows.ApplicationModel.Core.ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreImmersiveApplication3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreImmersiveApplication3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNewViewWithViewSource(viewSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Id
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Id(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_Suspending
   (
      handler : Windows.ApplicationModel.EventHandler_ISuspendingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Suspending(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Suspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Suspending(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Resuming
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Resuming(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Resuming
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Resuming(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Properties
   return Windows.Foundation.Collections.IPropertySet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IPropertySet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Properties(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentView
   return Windows.ApplicationModel.Core.ICoreApplicationView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.ICoreApplicationView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Run
   (
      viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Run(viewSource);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RunWithActivationFactories
   (
      activationFactoryCallback : Windows.Foundation.IGetActivationFactory
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Core.CoreApplication");
      m_Factory     : ICoreApplication := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunWithActivationFactories(activationFactoryCallback);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;

end;
