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
with Windows.Foundation.Collections;
limited with Windows.Networking.Sockets;
limited with Windows.Networking.Connectivity;
--------------------------------------------------------------------------------
package Windows.Networking.ServiceDiscovery.Dnssd is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DnssdRegistrationStatus is (
      Success,
      InvalidServiceName,
      ServerError,
      SecurityError
   );
   for DnssdRegistrationStatus use (
      Success => 0,
      InvalidServiceName => 1,
      ServerError => 2,
      SecurityError => 3
   );
   for DnssdRegistrationStatus'Size use 32;
   
   type DnssdRegistrationStatus_Ptr is access DnssdRegistrationStatus;
   
   type DnssdServiceWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for DnssdServiceWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for DnssdServiceWatcherStatus'Size use 32;
   
   type DnssdServiceWatcherStatus_Ptr is access DnssdServiceWatcherStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface;
   type TypedEventHandler_IDnssdServiceWatcher_add_Added is access all TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IDnssdServiceWatcher_add_Added_Ptr is access all TypedEventHandler_IDnssdServiceWatcher_add_Added;
   type TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted is access all TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface;
   type TypedEventHandler_IDnssdServiceWatcher_add_Stopped is access all TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Ptr is access all TypedEventHandler_IDnssdServiceWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface;
   type AsyncOperationCompletedHandler_IDnssdRegistrationResult is access all AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IDnssdRegistrationResult_Ptr is access all AsyncOperationCompletedHandler_IDnssdRegistrationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDnssdServiceWatcher_Interface;
   type IDnssdServiceWatcher is access all IDnssdServiceWatcher_Interface'Class;
   type IDnssdServiceWatcher_Ptr is access all IDnssdServiceWatcher;
   type IDnssdRegistrationResult_Interface;
   type IDnssdRegistrationResult is access all IDnssdRegistrationResult_Interface'Class;
   type IDnssdRegistrationResult_Ptr is access all IDnssdRegistrationResult;
   type IDnssdServiceInstanceFactory_Interface;
   type IDnssdServiceInstanceFactory is access all IDnssdServiceInstanceFactory_Interface'Class;
   type IDnssdServiceInstanceFactory_Ptr is access all IDnssdServiceInstanceFactory;
   type IDnssdServiceInstance_Interface;
   type IDnssdServiceInstance is access all IDnssdServiceInstance_Interface'Class;
   type IDnssdServiceInstance_Ptr is access all IDnssdServiceInstance;
   type IVectorView_DnssdServiceInstance_Interface;
   type IVectorView_DnssdServiceInstance is access all IVectorView_DnssdServiceInstance_Interface'Class;
   type IVectorView_DnssdServiceInstance_Ptr is access all IVectorView_DnssdServiceInstance;
   type IIterable_DnssdServiceInstance_Interface;
   type IIterable_DnssdServiceInstance is access all IIterable_DnssdServiceInstance_Interface'Class;
   type IIterable_DnssdServiceInstance_Ptr is access all IIterable_DnssdServiceInstance;
   type IAsyncOperation_IDnssdRegistrationResult_Interface;
   type IAsyncOperation_IDnssdRegistrationResult is access all IAsyncOperation_IDnssdRegistrationResult_Interface'Class;
   type IAsyncOperation_IDnssdRegistrationResult_Ptr is access all IAsyncOperation_IDnssdRegistrationResult;
   
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
   type IDnssdServiceWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IDnssdServiceWatcher_Interface
      ; handler : TypedEventHandler_IDnssdServiceWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IDnssdServiceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IDnssdServiceWatcher_Interface
      ; handler : TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IDnssdServiceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IDnssdServiceWatcher_Interface
      ; handler : TypedEventHandler_IDnssdServiceWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IDnssdServiceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IDnssdServiceWatcher_Interface
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.DnssdServiceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IDnssdServiceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IDnssdServiceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IDnssdServiceWatcher : aliased constant Windows.IID := (3426015681, 56189, 19305, (152, 61, 198, 248, 63, 32, 86, 130 ));
   
   ------------------------------------------------------------------------
   type IDnssdRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IDnssdRegistrationResult_Interface
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.DnssdRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_IPAddress
   (
      This       : access IDnssdRegistrationResult_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_HasInstanceNameChanged
   (
      This       : access IDnssdRegistrationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IDnssdRegistrationResult : aliased constant Windows.IID := (1031301842, 58886, 21328, (115, 234, 126, 151, 240, 102, 22, 47 ));
   
   ------------------------------------------------------------------------
   type IDnssdServiceInstanceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IDnssdServiceInstanceFactory_Interface
      ; dnssdServiceInstanceName : Windows.String
      ; hostName : Windows.Networking.IHostName
      ; port : Windows.UInt16
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
   )
   return Windows.HRESULT is abstract;
   
   IID_IDnssdServiceInstanceFactory : aliased constant Windows.IID := (1823498657, 50296, 17201, (150, 132, 74, 242, 24, 108, 10, 43 ));
   
   ------------------------------------------------------------------------
   type IDnssdServiceInstance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DnssdServiceInstanceName
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DnssdServiceInstanceName
   (
      This       : access IDnssdServiceInstance_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HostName
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_HostName
   (
      This       : access IDnssdServiceInstance_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_Port
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_Port
   (
      This       : access IDnssdServiceInstance_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Priority
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_Priority
   (
      This       : access IDnssdServiceInstance_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Weight
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_Weight
   (
      This       : access IDnssdServiceInstance_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_TextAttributes
   (
      This       : access IDnssdServiceInstance_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterStreamSocketListenerAsync1
   (
      This       : access IDnssdServiceInstance_Interface
      ; socket : Windows.Networking.Sockets.IStreamSocketListener
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterStreamSocketListenerAsync2
   (
      This       : access IDnssdServiceInstance_Interface
      ; socket : Windows.Networking.Sockets.IStreamSocketListener
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterDatagramSocketAsync1
   (
      This       : access IDnssdServiceInstance_Interface
      ; socket : Windows.Networking.Sockets.IDatagramSocket
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterDatagramSocketAsync2
   (
      This       : access IDnssdServiceInstance_Interface
      ; socket : Windows.Networking.Sockets.IDatagramSocket
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDnssdServiceInstance : aliased constant Windows.IID := (3796294526, 39077, 19617, (185, 228, 194, 83, 211, 60, 53, 255 ));
   
   ------------------------------------------------------------------------
   type IVectorView_DnssdServiceInstance_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_DnssdServiceInstance_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_DnssdServiceInstance_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_DnssdServiceInstance_Interface
      ; value : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_DnssdServiceInstance_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_DnssdServiceInstance : aliased constant Windows.IID := (4150261802, 32272, 23798, (128, 100, 106, 229, 133, 224, 189, 141 ));
   
   ------------------------------------------------------------------------
   type IIterable_DnssdServiceInstance_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DnssdServiceInstance_Interface
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_DnssdServiceInstance : aliased constant Windows.IID := (501457893, 14462, 21288, (184, 100, 63, 14, 52, 117, 211, 67 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IDnssdRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDnssdRegistrationResult_Interface
      ; handler : Windows.Networking.ServiceDiscovery.Dnssd.AsyncOperationCompletedHandler_IDnssdRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDnssdRegistrationResult_Interface
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.AsyncOperationCompletedHandler_IDnssdRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDnssdRegistrationResult_Interface
      ; RetVal : access Windows.Networking.ServiceDiscovery.Dnssd.IDnssdRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IDnssdRegistrationResult : aliased constant Windows.IID := (203759219, 21193, 20518, (168, 117, 246, 133, 165, 12, 191, 253 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher ; args : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDnssdServiceWatcher_add_Added : aliased constant Windows.IID := (3860295966, 52693, 22901, (143, 179, 142, 170, 174, 210, 78, 123 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (1785513429, 40771, 21594, (145, 215, 58, 64, 5, 84, 117, 218 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDnssdServiceWatcher_add_Stopped : aliased constant Windows.IID := (1785513429, 40771, 21594, (145, 215, 58, 64, 5, 84, 117, 218 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface
      ; asyncInfo : Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IDnssdRegistrationResult : aliased constant Windows.IID := (4083363666, 35146, 21317, (155, 230, 131, 137, 117, 28, 81, 137 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DnssdServiceWatcher is Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher;
   subtype DnssdServiceInstance is Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance;
   
   function Create
   (
      dnssdServiceInstanceName : Windows.String
      ; hostName : Windows.Networking.IHostName
      ; port : Windows.UInt16
   )
   return Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance;
   
   subtype DnssdRegistrationResult is Windows.Networking.ServiceDiscovery.Dnssd.IDnssdRegistrationResult;
   
   function CreateDnssdRegistrationResult return Windows.Networking.ServiceDiscovery.Dnssd.IDnssdRegistrationResult;
   
   subtype DnssdServiceInstanceCollection is Windows.Networking.ServiceDiscovery.Dnssd.IVectorView_DnssdServiceInstance;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
