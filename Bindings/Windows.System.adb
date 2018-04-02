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
with Windows.Storage.Streams;
with Windows.ApplicationModel;
with Windows.System.Diagnostics;
with Windows.UI.Popups;
with Windows.Storage.Search;
with Windows.UI.ViewManagement;
with Windows.Storage;
with Windows.System.RemoteSystems;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access DispatcherQueueHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_DispatcherQueueHandler or riid.all = IID_IUnknown then
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
      This       : access DispatcherQueueHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDispatcherQueue_add_ShutdownStarting or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface
      ; sender : Windows.System.IDispatcherQueue
      ; args : Windows.System.IDispatcherQueueShutdownStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IDispatcherQueue(sender), Windows.System.IDispatcherQueueShutdownStartingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface
      ; sender : Windows.System.IDispatcherQueue
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IDispatcherQueue(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDispatcherQueueTimer_add_Tick or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface
      ; sender : Windows.System.IDispatcherQueueTimer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IDispatcherQueueTimer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_Added or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_Added_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), Windows.System.IUserChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_Removed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_Removed_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), Windows.System.IUserChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_Updated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_Updated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_Updated_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), Windows.System.IUserChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), Windows.System.IUserChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserAuthenticationStatusChangingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), Windows.System.IUserAuthenticationStatusChangingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IUserWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IUserWatcher_add_Stopped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IUserWatcher_add_Stopped_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IUserWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IUser_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IUser or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IUser_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IUser
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IUserDeviceAssociationChangedEventArgs_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IUserDeviceAssociationChangedEventArgs or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IUserDeviceAssociationChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.System.IUserDeviceAssociationChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IAppMemoryUsageLimitChangingEventArgs or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.System.IAppMemoryUsageLimitChangingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_DiagnosticAccessStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_DiagnosticAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppDiagnosticInfoWatcher(sender), Windows.System.IAppDiagnosticInfoWatcherEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppDiagnosticInfoWatcher(sender), Windows.System.IAppDiagnosticInfoWatcherEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppDiagnosticInfoWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppDiagnosticInfoWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppResourceGroupInfoWatcher(sender), Windows.System.IAppResourceGroupInfoWatcherEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppResourceGroupInfoWatcher(sender), Windows.System.IAppResourceGroupInfoWatcherEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppResourceGroupInfoWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppResourceGroupInfoWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.IAppResourceGroupInfoWatcher(sender), Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ILaunchUriResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ILaunchUriResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ILaunchUriResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_ILaunchUriResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_LaunchQuerySupportStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_LaunchQuerySupportStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_LaunchUriStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_LaunchUriStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_LaunchUriStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_LaunchUriStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_RemoteLaunchUriStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_RemoteLaunchUriStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IProcessLauncherResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IProcessLauncherResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IProcessLauncherResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IProcessLauncherResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateUserPicker return Windows.System.IUserPicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserPicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IUserPicker := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.IID_IUserPicker'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLauncherOptions return Windows.System.ILauncherOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.LauncherOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.ILauncherOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.IID_ILauncherOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRemoteLauncherOptions return Windows.System.IRemoteLauncherOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteLauncherOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IRemoteLauncherOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.IID_IRemoteLauncherOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderLauncherOptions return Windows.System.IFolderLauncherOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.FolderLauncherOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IFolderLauncherOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.IID_IFolderLauncherOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateProcessLauncherOptions return Windows.System.IProcessLauncherOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ProcessLauncherOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IProcessLauncherOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.IID_IProcessLauncherOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function GetForCurrentThread
   return Windows.System.IDispatcherQueue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.DispatcherQueue");
      m_Factory     : IDispatcherQueueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IDispatcherQueue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDispatcherQueueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentThread(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOnDedicatedThread
   return Windows.System.IDispatcherQueueController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.DispatcherQueueController");
      m_Factory     : IDispatcherQueueControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IDispatcherQueueController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDispatcherQueueControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOnDedicatedThread(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.System.IUserWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.User");
      m_Factory     : IUserStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IUserWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.User");
      m_Factory     : IUserStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncByType
   (
      type_x : Windows.System.UserType
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.User");
      m_Factory     : IUserStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncByType(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncByTypeAndStatus
   (
      type_x : Windows.System.UserType
      ; status : Windows.System.UserAuthenticationStatus
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.User");
      m_Factory     : IUserStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncByTypeAndStatus(type_x, status, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFromId
   (
      nonRoamableId : Windows.String
   )
   return Windows.System.IUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.User");
      m_Factory     : IUserStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFromId(nonRoamableId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DisplayName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DisplayName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FirstName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FirstName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LastName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LastName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProviderName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProviderName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AccountName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccountName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GuestHost
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GuestHost(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrincipalName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrincipalName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DomainName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DomainName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SessionInitiationProtocolUri
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.KnownUserProperties");
      m_Factory     : IKnownUserPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUserPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SessionInitiationProtocolUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserPicker");
      m_Factory     : IUserPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindUserFromDeviceId
   (
      deviceId : Windows.String
   )
   return Windows.System.IUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserDeviceAssociation");
      m_Factory     : IUserDeviceAssociationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDeviceAssociationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindUserFromDeviceId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_UserDeviceAssociationChanged
   (
      handler : Windows.System.EventHandler_IUserDeviceAssociationChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserDeviceAssociation");
      m_Factory     : IUserDeviceAssociationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDeviceAssociationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_UserDeviceAssociationChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_UserDeviceAssociationChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserDeviceAssociation");
      m_Factory     : IUserDeviceAssociationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDeviceAssociationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_UserDeviceAssociationChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetAppMemoryReport
   return Windows.System.IAppMemoryReport is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAppMemoryReport;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppMemoryReport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProcessMemoryReport
   return Windows.System.IProcessMemoryReport is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IProcessMemoryReport;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProcessMemoryReport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppMemoryUsage
   return Windows.UInt64 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt64;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppMemoryUsage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppMemoryUsageLimit
   return Windows.UInt64 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt64;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppMemoryUsageLimit(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppMemoryUsageLevel
   return Windows.System.AppMemoryUsageLevel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.AppMemoryUsageLevel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppMemoryUsageLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_AppMemoryUsageIncreased
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_AppMemoryUsageIncreased(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_AppMemoryUsageIncreased
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_AppMemoryUsageIncreased(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_AppMemoryUsageDecreased
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_AppMemoryUsageDecreased(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_AppMemoryUsageDecreased
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_AppMemoryUsageDecreased(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_AppMemoryUsageLimitChanging
   (
      handler : Windows.System.EventHandler_IAppMemoryUsageLimitChangingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_AppMemoryUsageLimitChanging(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_AppMemoryUsageLimitChanging
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_AppMemoryUsageLimitChanging(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TrySetAppMemoryUsageLimit
   (
      value : Windows.UInt64
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetAppMemoryUsageLimit(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExpectedAppMemoryUsageLimit
   return Windows.UInt64 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.MemoryManager");
      m_Factory     : IMemoryManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt64;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExpectedAppMemoryUsageLimit(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestInfoAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestInfoAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.System.IAppDiagnosticInfoWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAppDiagnosticInfoWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.System.IAsyncOperation_DiagnosticAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_DiagnosticAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestInfoForPackageAsync
   (
      packageFamilyName : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestInfoForPackageAsync(packageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestInfoForAppAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestInfoForAppAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestInfoForAppUserModelId
   (
      appUserModelId : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.AppDiagnosticInfo");
      m_Factory     : IAppDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestInfoForAppUserModelId(appUserModelId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriForResultsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_ILaunchUriResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriForResultsAsync(uri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriForResultsWithDataAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_ILaunchUriResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriForResultsWithDataAsync(uri, options, inputData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithDataAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithDataAsync(uri, options, inputData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryUriSupportAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryUriSupportAsync(uri, launchQuerySupportType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryUriSupportWithPackageFamilyNameAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryUriSupportWithPackageFamilyNameAsync(uri, launchQuerySupportType, packageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryFileSupportAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryFileSupportAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryFileSupportWithPackageFamilyNameAsync
   (
      file : Windows.Storage.IStorageFile
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryFileSupportWithPackageFamilyNameAsync(file, packageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindUriSchemeHandlersAsync
   (
      scheme : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindUriSchemeHandlersAsync(scheme, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindUriSchemeHandlersWithLaunchUriTypeAsync
   (
      scheme : Windows.String
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindUriSchemeHandlersWithLaunchUriTypeAsync(scheme, launchQuerySupportType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindFileHandlersAsync
   (
      extension : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindFileHandlersAsync(extension, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryAppUriSupportAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryAppUriSupportAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function QueryAppUriSupportWithPackageFamilyNameAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.QueryAppUriSupportWithPackageFamilyNameAsync(uri, packageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAppUriHandlersAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAppUriHandlersAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriForUserAsync(user, uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithOptionsForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithOptionsForUserAsync(user, uri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithDataForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_LaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithDataForUserAsync(user, uri, options, inputData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriForResultsForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_ILaunchUriResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriForResultsForUserAsync(user, uri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriForResultsWithDataForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_ILaunchUriResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriForResultsWithDataForUserAsync(user, uri, options, inputData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchFolderAsync
   (
      folder : Windows.Storage.IStorageFolder
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchFolderAsync(folder, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchFolderWithOptionsAsync
   (
      folder : Windows.Storage.IStorageFolder
      ; options : Windows.System.IFolderLauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchFolderWithOptionsAsync(folder, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchFileWithOptionsAsync
   (
      file : Windows.Storage.IStorageFile
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchFileWithOptionsAsync(file, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithOptionsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Launcher");
      m_Factory     : ILauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithOptionsAsync(uri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteLauncher");
      m_Factory     : IRemoteLauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteLauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriAsync(remoteSystemConnectionRequest, uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithOptionsAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteLauncher");
      m_Factory     : IRemoteLauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteLauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithOptionsAsync(remoteSystemConnectionRequest, uri, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LaunchUriWithDataAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteLauncher");
      m_Factory     : IRemoteLauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteLauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LaunchUriWithDataAsync(remoteSystemConnectionRequest, uri, options, inputData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetSystemDateTime
   (
      utcDateTime : Windows.Foundation.DateTime
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.DateTimeSettings");
      m_Factory     : IDateTimeSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDateTimeSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetSystemDateTime(utcDateTime);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RunToCompletionAsync
   (
      fileName : Windows.String
      ; args : Windows.String
   )
   return Windows.System.IAsyncOperation_IProcessLauncherResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ProcessLauncher");
      m_Factory     : IProcessLauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_IProcessLauncherResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProcessLauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunToCompletionAsync(fileName, args, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RunToCompletionAsyncWithOptions
   (
      fileName : Windows.String
      ; args : Windows.String
      ; options : Windows.System.IProcessLauncherOptions
   )
   return Windows.System.IAsyncOperation_IProcessLauncherResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ProcessLauncher");
      m_Factory     : IProcessLauncherStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.IAsyncOperation_IProcessLauncherResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProcessLauncherStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunToCompletionAsyncWithOptions(fileName, args, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure BeginShutdown
   (
      shutdownKind : Windows.System.ShutdownKind
      ; timeout : Windows.Foundation.TimeSpan
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ShutdownManager");
      m_Factory     : IShutdownManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShutdownManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BeginShutdown(shutdownKind, timeout);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure CancelShutdown
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ShutdownManager");
      m_Factory     : IShutdownManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShutdownManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CancelShutdown;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsPowerStateSupported
   (
      powerState : Windows.System.PowerState
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ShutdownManager");
      m_Factory     : IShutdownManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShutdownManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsPowerStateSupported(powerState, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure EnterPowerState
   (
      powerState : Windows.System.PowerState
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ShutdownManager");
      m_Factory     : IShutdownManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShutdownManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EnterPowerState(powerState);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure EnterPowerStateWithTimeSpan
   (
      powerState : Windows.System.PowerState
      ; wakeUpAfter : Windows.Foundation.TimeSpan
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.ShutdownManager");
      m_Factory     : IShutdownManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShutdownManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EnterPowerStateWithTimeSpan(powerState, wakeUpAfter);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_CurrentTimeZoneDisplayName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.TimeZoneSettings");
      m_Factory     : ITimeZoneSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimeZoneSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentTimeZoneDisplayName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedTimeZoneDisplayNames
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.TimeZoneSettings");
      m_Factory     : ITimeZoneSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimeZoneSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedTimeZoneDisplayNames(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanChangeTimeZone
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.TimeZoneSettings");
      m_Factory     : ITimeZoneSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimeZoneSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanChangeTimeZone(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ChangeTimeZoneByDisplayName
   (
      timeZoneDisplayName : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.TimeZoneSettings");
      m_Factory     : ITimeZoneSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimeZoneSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ChangeTimeZoneByDisplayName(timeZoneDisplayName);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;

end;
