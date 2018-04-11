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
package Windows.System.Threading.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type SignalHandler_Interface;
   type SignalHandler is access all SignalHandler_Interface'Class;
   type SignalHandler_Ptr is access all SignalHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISignalNotifierStatics_Interface;
   type ISignalNotifierStatics is access all ISignalNotifierStatics_Interface'Class;
   type ISignalNotifierStatics_Ptr is access all ISignalNotifierStatics;
   type IPreallocatedWorkItemFactory_Interface;
   type IPreallocatedWorkItemFactory is access all IPreallocatedWorkItemFactory_Interface'Class;
   type IPreallocatedWorkItemFactory_Ptr is access all IPreallocatedWorkItemFactory;
   type IPreallocatedWorkItem_Interface;
   type IPreallocatedWorkItem is access all IPreallocatedWorkItem_Interface'Class;
   type IPreallocatedWorkItem_Ptr is access all IPreallocatedWorkItem;
   type ISignalNotifier_Interface;
   type ISignalNotifier is access all ISignalNotifier_Interface'Class;
   type ISignalNotifier_Ptr is access all ISignalNotifier;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISignalNotifierStatics : aliased constant Windows.IID := (474891622, 33792, 18131, (161, 21, 125, 12, 13, 252, 159, 98 ));
   
   type ISignalNotifierStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AttachToEvent
   (
      This       : access ISignalNotifierStatics_Interface
      ; name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; RetVal : access Windows.System.Threading.Core.ISignalNotifier
   )
   return Windows.HRESULT is abstract;
   
   function AttachToEventWithTimeout
   (
      This       : access ISignalNotifierStatics_Interface
      ; name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.System.Threading.Core.ISignalNotifier
   )
   return Windows.HRESULT is abstract;
   
   function AttachToSemaphore
   (
      This       : access ISignalNotifierStatics_Interface
      ; name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; RetVal : access Windows.System.Threading.Core.ISignalNotifier
   )
   return Windows.HRESULT is abstract;
   
   function AttachToSemaphoreWithTimeout
   (
      This       : access ISignalNotifierStatics_Interface
      ; name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.System.Threading.Core.ISignalNotifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPreallocatedWorkItemFactory : aliased constant Windows.IID := (3822267205, 57322, 18075, (130, 197, 246, 227, 206, 253, 234, 251 ));
   
   type IPreallocatedWorkItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWorkItem
   (
      This       : access IPreallocatedWorkItemFactory_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; RetVal : access Windows.System.Threading.Core.IPreallocatedWorkItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateWorkItemWithPriority
   (
      This       : access IPreallocatedWorkItemFactory_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; RetVal : access Windows.System.Threading.Core.IPreallocatedWorkItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateWorkItemWithPriorityAndOptions
   (
      This       : access IPreallocatedWorkItemFactory_Interface
      ; handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
      ; RetVal : access Windows.System.Threading.Core.IPreallocatedWorkItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPreallocatedWorkItem : aliased constant Windows.IID := (3067783676, 48219, 16410, (168, 178, 110, 117, 77, 20, 218, 166 ));
   
   type IPreallocatedWorkItem_Interface is interface and Windows.IInspectable_Interface;
   
   function RunAsync
   (
      This       : access IPreallocatedWorkItem_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISignalNotifier : aliased constant Windows.IID := (338189830, 25511, 18195, (182, 217, 98, 246, 75, 86, 251, 139 ));
   
   type ISignalNotifier_Interface is interface and Windows.IInspectable_Interface;
   
   function Enable
   (
      This       : access ISignalNotifier_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Terminate_x
   (
      This       : access ISignalNotifier_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_SignalHandler : aliased constant Windows.IID := (2453422126, 18209, 17422, (157, 218, 85, 182, 242, 224, 119, 16 ));
   
   type SignalHandler_Interface(Callback : access procedure (signalNotifier : Windows.System.Threading.Core.ISignalNotifier ; timedOut : Windows.Boolean)) is new Windows.IMulticastDelegate_Interface(IID_SignalHandler'access) with null record;
   function Invoke
   (
      This       : access SignalHandler_Interface
      ; signalNotifier : Windows.System.Threading.Core.ISignalNotifier
      ; timedOut : Windows.Boolean
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SignalNotifier is Windows.System.Threading.Core.ISignalNotifier;
   subtype PreallocatedWorkItem is Windows.System.Threading.Core.IPreallocatedWorkItem;
   function CreateWorkItem
   (
      handler : Windows.System.Threading.WorkItemHandler
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem;
   
   function CreateWorkItemWithPriority
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem;
   
   function CreateWorkItemWithPriorityAndOptions
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function AttachToEvent
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
   )
   return Windows.System.Threading.Core.ISignalNotifier;
   
   function AttachToEventWithTimeout
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.Core.ISignalNotifier;
   
   function AttachToSemaphore
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
   )
   return Windows.System.Threading.Core.ISignalNotifier;
   
   function AttachToSemaphoreWithTimeout
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.Core.ISignalNotifier;
   
end;
