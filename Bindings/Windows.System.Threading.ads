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
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.System.Threading is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WorkItemPriority is (
      Low,
      Normal,
      High
   );
   for WorkItemPriority use (
      Low => -1,
      Normal => 0,
      High => 1
   );
   for WorkItemPriority'Size use 32;
   
   type WorkItemPriority_Ptr is access WorkItemPriority;
   
   type WorkItemOptions is (
      None,
      TimeSliced
   );
   for WorkItemOptions use (
      None => 0,
      TimeSliced => 1
   );
   for WorkItemOptions'Size use 32;
   
   type WorkItemOptions_Ptr is access WorkItemOptions;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TimerElapsedHandler_Interface;
   type TimerElapsedHandler is access all TimerElapsedHandler_Interface'Class;
   type TimerElapsedHandler_Ptr is access all TimerElapsedHandler;
   type TimerDestroyedHandler_Interface;
   type TimerDestroyedHandler is access all TimerDestroyedHandler_Interface'Class;
   type TimerDestroyedHandler_Ptr is access all TimerDestroyedHandler;
   type WorkItemHandler_Interface;
   type WorkItemHandler is access all WorkItemHandler_Interface'Class;
   type WorkItemHandler_Ptr is access all WorkItemHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IThreadPoolStatics_Interface;
   type IThreadPoolStatics is access all IThreadPoolStatics_Interface'Class;
   type IThreadPoolStatics_Ptr is access all IThreadPoolStatics;
   type IThreadPoolTimer_Interface;
   type IThreadPoolTimer is access all IThreadPoolTimer_Interface'Class;
   type IThreadPoolTimer_Ptr is access all IThreadPoolTimer;
   type IThreadPoolTimerStatics_Interface;
   type IThreadPoolTimerStatics is access all IThreadPoolTimerStatics_Interface'Class;
   type IThreadPoolTimerStatics_Ptr is access all IThreadPoolTimerStatics;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IThreadPoolStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RunAsync
   (
      This       : access IThreadPoolStatics_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RunWithPriorityAsync
   (
      This       : access IThreadPoolStatics_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RunWithPriorityAndOptionsAsync
   (
      This       : access IThreadPoolStatics_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IThreadPoolStatics : aliased constant Windows.IID := (3065997277, 33981, 17656, (172, 28, 147, 235, 203, 157, 186, 145 ));
   
   ------------------------------------------------------------------------
   type IThreadPoolTimer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Period
   (
      This       : access IThreadPoolTimer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Delay
   (
      This       : access IThreadPoolTimer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function Cancel
   (
      This       : access IThreadPoolTimer_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IThreadPoolTimer : aliased constant Windows.IID := (1498332792, 21994, 19080, (165, 13, 52, 2, 174, 31, 156, 242 ));
   
   ------------------------------------------------------------------------
   type IThreadPoolTimerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePeriodicTimer
   (
      This       : access IThreadPoolTimerStatics_Interface
      ; handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is abstract;
   
   function CreateTimer
   (
      This       : access IThreadPoolTimerStatics_Interface
      ; handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is abstract;
   
   function CreatePeriodicTimerWithCompletion
   (
      This       : access IThreadPoolTimerStatics_Interface
      ; handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
      ; RetVal : access Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is abstract;
   
   function CreateTimerWithCompletion
   (
      This       : access IThreadPoolTimerStatics_Interface
      ; handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
      ; RetVal : access Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT is abstract;
   
   IID_IThreadPoolTimerStatics : aliased constant Windows.IID := (445291778, 58498, 17947, (184, 199, 142, 250, 209, 204, 229, 144 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TimerElapsedHandler_Interface(Callback : access procedure (timer : Windows.System.Threading.IThreadPoolTimer)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TimerElapsedHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TimerElapsedHandler_Interface
      ; timer : Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT;
   
   IID_TimerElapsedHandler : aliased constant Windows.IID := (4205749863, 64491, 18891, (173, 178, 113, 24, 76, 85, 110, 67 ));
   
   ------------------------------------------------------------------------
   type TimerDestroyedHandler_Interface(Callback : access procedure (timer : Windows.System.Threading.IThreadPoolTimer)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TimerDestroyedHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TimerDestroyedHandler_Interface
      ; timer : Windows.System.Threading.IThreadPoolTimer
   )
   return Windows.HRESULT;
   
   IID_TimerDestroyedHandler : aliased constant Windows.IID := (887953914, 33668, 20153, (130, 9, 251, 80, 148, 238, 236, 53 ));
   
   ------------------------------------------------------------------------
   type WorkItemHandler_Interface(Callback : access procedure (operation : Windows.Foundation.IAsyncAction)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access WorkItemHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access WorkItemHandler_Interface
      ; operation : Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT;
   
   IID_WorkItemHandler : aliased constant Windows.IID := (488278923, 64102, 16719, (156, 189, 182, 95, 201, 157, 23, 250 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ThreadPoolTimer is Windows.System.Threading.IThreadPoolTimer;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreatePeriodicTimer
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.IThreadPoolTimer;
   
   function CreateTimer
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.IThreadPoolTimer;
   
   function CreatePeriodicTimerWithCompletion
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; period : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
   )
   return Windows.System.Threading.IThreadPoolTimer;
   
   function CreateTimerWithCompletion
   (
      handler : Windows.System.Threading.TimerElapsedHandler
      ; delay_x : Windows.Foundation.TimeSpan
      ; destroyed : Windows.System.Threading.TimerDestroyedHandler
   )
   return Windows.System.Threading.IThreadPoolTimer;
   
   function RunAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
   )
   return Windows.Foundation.IAsyncAction;
   
   function RunWithPriorityAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
   )
   return Windows.Foundation.IAsyncAction;
   
   function RunWithPriorityAndOptionsAsync
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
   )
   return Windows.Foundation.IAsyncAction;

end;
