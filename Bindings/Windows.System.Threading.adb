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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Threading is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TimerElapsedHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TimerElapsedHandler or riid.all = IID_IUnknown then
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
      This       : access TimerElapsedHandler_Interface
      ; timer : Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Threading.IThreadPoolTimer(timer));
      return Hr;
   end;
   
   function QueryInterface(This : access TimerDestroyedHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TimerDestroyedHandler or riid.all = IID_IUnknown then
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
      This       : access TimerDestroyedHandler_Interface
      ; timer : Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Threading.IThreadPoolTimer(timer));
      return Hr;
   end;
   
   function QueryInterface(This : access WorkItemHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_WorkItemHandler or riid.all = IID_IUnknown then
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
      This       : access WorkItemHandler_Interface
      ; operation : Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(operation);
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
   
   
   function CreatePeriodicTimer
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.IThreadPoolTimer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPoolTimer");
      m_Factory     : IThreadPoolTimerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.IThreadPoolTimer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolTimerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePeriodicTimer(handler, period, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimer
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.IThreadPoolTimer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPoolTimer");
      m_Factory     : IThreadPoolTimerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.IThreadPoolTimer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolTimerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTimer(handler, delay_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePeriodicTimerWithCompletion
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
   )
   return Windows.System.Threading.IThreadPoolTimer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPoolTimer");
      m_Factory     : IThreadPoolTimerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.IThreadPoolTimer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolTimerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePeriodicTimerWithCompletion(handler, period, destroyed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimerWithCompletion
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
   )
   return Windows.System.Threading.IThreadPoolTimer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPoolTimer");
      m_Factory     : IThreadPoolTimerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.IThreadPoolTimer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolTimerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTimerWithCompletion(handler, delay_x, destroyed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RunAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPool");
      m_Factory     : IThreadPoolStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunAsync(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RunWithPriorityAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPool");
      m_Factory     : IThreadPoolStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunWithPriorityAsync(handler, priority, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RunWithPriorityAndOptionsAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.ThreadPool");
      m_Factory     : IThreadPoolStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThreadPoolStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RunWithPriorityAndOptionsAsync(handler, priority, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
