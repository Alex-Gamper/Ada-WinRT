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
limited with Windows.Networking;
limited with Windows.Networking.Sockets;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Devices.Enumeration;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.Devices.Bluetooth.Rfcomm is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface;
   type AsyncOperationCompletedHandler_IRfcommDeviceServicesResult is access all AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface'Class;
   type AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Ptr is access all AsyncOperationCompletedHandler_IRfcommDeviceServicesResult;
   type AsyncOperationCompletedHandler_IRfcommDeviceService_Interface;
   type AsyncOperationCompletedHandler_IRfcommDeviceService is access all AsyncOperationCompletedHandler_IRfcommDeviceService_Interface'Class;
   type AsyncOperationCompletedHandler_IRfcommDeviceService_Ptr is access all AsyncOperationCompletedHandler_IRfcommDeviceService;
   type AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface;
   type AsyncOperationCompletedHandler_IRfcommServiceProvider is access all AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface'Class;
   type AsyncOperationCompletedHandler_IRfcommServiceProvider_Ptr is access all AsyncOperationCompletedHandler_IRfcommServiceProvider;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRfcommServiceIdStatics_Interface;
   type IRfcommServiceIdStatics is access all IRfcommServiceIdStatics_Interface'Class;
   type IRfcommServiceIdStatics_Ptr is access all IRfcommServiceIdStatics;
   type IRfcommServiceId_Interface;
   type IRfcommServiceId is access all IRfcommServiceId_Interface'Class;
   type IRfcommServiceId_Ptr is access all IRfcommServiceId;
   type IRfcommDeviceServicesResult_Interface;
   type IRfcommDeviceServicesResult is access all IRfcommDeviceServicesResult_Interface'Class;
   type IRfcommDeviceServicesResult_Ptr is access all IRfcommDeviceServicesResult;
   type IRfcommDeviceServiceStatics_Interface;
   type IRfcommDeviceServiceStatics is access all IRfcommDeviceServiceStatics_Interface'Class;
   type IRfcommDeviceServiceStatics_Ptr is access all IRfcommDeviceServiceStatics;
   type IRfcommDeviceServiceStatics2_Interface;
   type IRfcommDeviceServiceStatics2 is access all IRfcommDeviceServiceStatics2_Interface'Class;
   type IRfcommDeviceServiceStatics2_Ptr is access all IRfcommDeviceServiceStatics2;
   type IRfcommDeviceService_Interface;
   type IRfcommDeviceService is access all IRfcommDeviceService_Interface'Class;
   type IRfcommDeviceService_Ptr is access all IRfcommDeviceService;
   type IRfcommDeviceService2_Interface;
   type IRfcommDeviceService2 is access all IRfcommDeviceService2_Interface'Class;
   type IRfcommDeviceService2_Ptr is access all IRfcommDeviceService2;
   type IRfcommDeviceService3_Interface;
   type IRfcommDeviceService3 is access all IRfcommDeviceService3_Interface'Class;
   type IRfcommDeviceService3_Ptr is access all IRfcommDeviceService3;
   type IRfcommServiceProviderStatics_Interface;
   type IRfcommServiceProviderStatics is access all IRfcommServiceProviderStatics_Interface'Class;
   type IRfcommServiceProviderStatics_Ptr is access all IRfcommServiceProviderStatics;
   type IRfcommServiceProvider_Interface;
   type IRfcommServiceProvider is access all IRfcommServiceProvider_Interface'Class;
   type IRfcommServiceProvider_Ptr is access all IRfcommServiceProvider;
   type IRfcommServiceProvider2_Interface;
   type IRfcommServiceProvider2 is access all IRfcommServiceProvider2_Interface'Class;
   type IRfcommServiceProvider2_Ptr is access all IRfcommServiceProvider2;
   type IIterator_IRfcommDeviceService_Interface;
   type IIterator_IRfcommDeviceService is access all IIterator_IRfcommDeviceService_Interface'Class;
   type IIterator_IRfcommDeviceService_Ptr is access all IIterator_IRfcommDeviceService;
   type IIterable_IRfcommDeviceService_Interface;
   type IIterable_IRfcommDeviceService is access all IIterable_IRfcommDeviceService_Interface'Class;
   type IIterable_IRfcommDeviceService_Ptr is access all IIterable_IRfcommDeviceService;
   type IVectorView_IRfcommDeviceService_Interface;
   type IVectorView_IRfcommDeviceService is access all IVectorView_IRfcommDeviceService_Interface'Class;
   type IVectorView_IRfcommDeviceService_Ptr is access all IVectorView_IRfcommDeviceService;
   type IAsyncOperation_IRfcommDeviceServicesResult_Interface;
   type IAsyncOperation_IRfcommDeviceServicesResult is access all IAsyncOperation_IRfcommDeviceServicesResult_Interface'Class;
   type IAsyncOperation_IRfcommDeviceServicesResult_Ptr is access all IAsyncOperation_IRfcommDeviceServicesResult;
   type IAsyncOperation_IRfcommDeviceService_Interface;
   type IAsyncOperation_IRfcommDeviceService is access all IAsyncOperation_IRfcommDeviceService_Interface'Class;
   type IAsyncOperation_IRfcommDeviceService_Ptr is access all IAsyncOperation_IRfcommDeviceService;
   type IAsyncOperation_IRfcommServiceProvider_Interface;
   type IAsyncOperation_IRfcommServiceProvider is access all IAsyncOperation_IRfcommServiceProvider_Interface'Class;
   type IAsyncOperation_IRfcommServiceProvider_Ptr is access all IAsyncOperation_IRfcommServiceProvider;
   
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
   type IRfcommServiceIdStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromUuid
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; uuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function FromShortId
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; shortId : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialPort
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_ObexObjectPush
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_ObexFileTransfer
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneBookAccessPce
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneBookAccessPse
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_GenericFileTransfer
   (
      This       : access IRfcommServiceIdStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommServiceIdStatics : aliased constant Windows.IID := (706191034, 43381, 18147, (181, 107, 8, 255, 215, 131, 165, 254 ));
   
   ------------------------------------------------------------------------
   type IRfcommServiceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uuid
   (
      This       : access IRfcommServiceId_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function AsShortId
   (
      This       : access IRfcommServiceId_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function AsString
   (
      This       : access IRfcommServiceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommServiceId : aliased constant Windows.IID := (576885252, 32258, 16407, (129, 54, 218, 27, 106, 27, 155, 191 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceServicesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IRfcommDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_Services
   (
      This       : access IRfcommDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IVectorView_IRfcommDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceServicesResult : aliased constant Windows.IID := (994588812, 31951, 18574, (150, 37, 210, 89, 165, 115, 45, 85 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IRfcommDeviceServiceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IRfcommDeviceServiceStatics_Interface
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceServiceStatics : aliased constant Windows.IID := (2762033647, 25197, 16812, (178, 83, 135, 172, 92, 39, 226, 138 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceServiceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorForBluetoothDevice
   (
      This       : access IRfcommDeviceServiceStatics2_Interface
      ; bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceWithCacheMode
   (
      This       : access IRfcommDeviceServiceStatics2_Interface
      ; bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceId
   (
      This       : access IRfcommDeviceServiceStatics2_Interface
      ; bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode
   (
      This       : access IRfcommDeviceServiceStatics2_Interface
      ; bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceServiceStatics2 : aliased constant Windows.IID := (2861347273, 59277, 19428, (128, 118, 10, 61, 135, 160, 160, 95 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionHostName
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionServiceName
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceId
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionLevel
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxProtectionLevel
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function GetSdpRawAttributesAsync
   (
      This       : access IRfcommDeviceService_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSdpRawAttributesWithCacheModeAsync
   (
      This       : access IRfcommDeviceService_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceService : aliased constant Windows.IID := (2927755039, 50593, 19520, (140, 40, 243, 239, 214, 144, 98, 243 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceService2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IRfcommDeviceService2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceService2 : aliased constant Windows.IID := (1399647508, 60365, 18942, (191, 159, 64, 239, 198, 137, 178, 13 ));
   
   ------------------------------------------------------------------------
   type IRfcommDeviceService3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceAccessInformation
   (
      This       : access IRfcommDeviceService3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IRfcommDeviceService3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommDeviceService3 : aliased constant Windows.IID := (472034534, 56644, 19747, (134, 109, 143, 52, 134, 238, 100, 144 ));
   
   ------------------------------------------------------------------------
   type IRfcommServiceProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IRfcommServiceProviderStatics_Interface
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommServiceProviderStatics : aliased constant Windows.IID := (2559083267, 27082, 16698, (132, 247, 67, 68, 199, 41, 41, 151 ));
   
   ------------------------------------------------------------------------
   type IRfcommServiceProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IRfcommServiceProvider_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_SdpRawAttributes
   (
      This       : access IRfcommServiceProvider_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartAdvertising
   (
      This       : access IRfcommServiceProvider_Interface
      ; listener : Windows.Networking.Sockets.IStreamSocketListener
   )
   return Windows.HRESULT is abstract;
   
   function StopAdvertising
   (
      This       : access IRfcommServiceProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommServiceProvider : aliased constant Windows.IID := (3940285892, 45558, 17663, (159, 124, 231, 168, 42, 184, 104, 33 ));
   
   ------------------------------------------------------------------------
   type IRfcommServiceProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function StartAdvertisingWithRadioDiscoverability
   (
      This       : access IRfcommServiceProvider2_Interface
      ; listener : Windows.Networking.Sockets.IStreamSocketListener
      ; radioDiscoverable : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommServiceProvider2 : aliased constant Windows.IID := (1936449478, 15489, 19742, (186, 242, 221, 187, 129, 40, 69, 18 ));
   
   ------------------------------------------------------------------------
   type IIterator_IRfcommDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRfcommDeviceService_Interface
      ; items : Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IRfcommDeviceService : aliased constant Windows.IID := (1688928562, 50764, 23175, (129, 19, 97, 62, 243, 86, 146, 76 ));
   
   ------------------------------------------------------------------------
   type IIterable_IRfcommDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IIterator_IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IRfcommDeviceService : aliased constant Windows.IID := (863562150, 63202, 20714, (191, 238, 184, 16, 150, 49, 254, 202 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IRfcommDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRfcommDeviceService_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRfcommDeviceService_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRfcommDeviceService_Interface
      ; value : Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRfcommDeviceService_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IRfcommDeviceService : aliased constant Windows.IID := (2548001666, 53596, 22910, (186, 105, 73, 34, 7, 161, 193, 8 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IRfcommDeviceServicesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRfcommDeviceServicesResult_Interface
      ; handler : Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRfcommDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRfcommDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IRfcommDeviceServicesResult : aliased constant Windows.IID := (3086153549, 49052, 22305, (191, 110, 3, 241, 180, 64, 149, 136 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IRfcommDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRfcommDeviceService_Interface
      ; handler : Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRfcommDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IRfcommDeviceService : aliased constant Windows.IID := (234187735, 51446, 23602, (150, 68, 170, 11, 207, 40, 215, 140 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IRfcommServiceProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRfcommServiceProvider_Interface
      ; handler : Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommServiceProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRfcommServiceProvider_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.AsyncOperationCompletedHandler_IRfcommServiceProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRfcommServiceProvider_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IRfcommServiceProvider : aliased constant Windows.IID := (4275324968, 57906, 21837, (133, 209, 47, 4, 209, 50, 46, 105 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IRfcommDeviceServicesResult : aliased constant Windows.IID := (1378624977, 34411, 24036, (189, 142, 31, 235, 90, 230, 13, 71 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IRfcommDeviceService_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IRfcommDeviceService_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommDeviceService_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IRfcommDeviceService : aliased constant Windows.IID := (1551312152, 17455, 22765, (128, 203, 83, 141, 52, 184, 130, 149 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IRfcommServiceProvider : aliased constant Windows.IID := (1147830096, 36654, 20976, (174, 187, 27, 195, 209, 146, 144, 95 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RfcommDeviceService is Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService;
   subtype RfcommDeviceServicesResult is Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult;
   subtype RfcommServiceId is Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   subtype RfcommServiceProvider is Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService;
   
   function GetDeviceSelector
   (
      serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDevice
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceWithCacheMode
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceId
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String;
   
   function FromUuid
   (
      uuid : Windows.Guid
   )
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function FromShortId
   (
      shortId : Windows.UInt32
   )
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_SerialPort
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_ObexObjectPush
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_ObexFileTransfer
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_PhoneBookAccessPce
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_PhoneBookAccessPse
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function get_GenericFileTransfer
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   
   function CreateAsync
   (
      serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider;

end;
