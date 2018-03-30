--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Devices.Radios;
with Windows; use Windows;
limited with Windows.Networking;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Devices.Bluetooth.Rfcomm;
limited with Windows.Devices.Enumeration;
limited with Windows.Devices.Bluetooth.GenericAttributeProfile;
--------------------------------------------------------------------------------
package Windows.Devices.Bluetooth is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BluetoothCacheMode is (
      Cached,
      Uncached
   );
   for BluetoothCacheMode use (
      Cached => 0,
      Uncached => 1
   );
   for BluetoothCacheMode'Size use 32;
   
   type BluetoothCacheMode_Ptr is access BluetoothCacheMode;
   
   type BluetoothMajorClass is (
      Miscellaneous,
      Computer,
      Phone,
      NetworkAccessPoint,
      AudioVideo,
      Peripheral,
      Imaging,
      Wearable,
      Toy,
      Health
   );
   for BluetoothMajorClass use (
      Miscellaneous => 0,
      Computer => 1,
      Phone => 2,
      NetworkAccessPoint => 3,
      AudioVideo => 4,
      Peripheral => 5,
      Imaging => 6,
      Wearable => 7,
      Toy => 8,
      Health => 9
   );
   for BluetoothMajorClass'Size use 32;
   
   type BluetoothMajorClass_Ptr is access BluetoothMajorClass;
   
   
   type BluetoothMinorClass is new Windows.Int32;
   
   type BluetoothMinorClass_Ptr is access BluetoothMinorClass;
   
   type BluetoothServiceCapabilities is (
      None,
      LimitedDiscoverableMode,
      PositioningService,
      NetworkingService,
      RenderingService,
      CapturingService,
      ObjectTransferService,
      AudioService,
      TelephoneService,
      InformationService
   );
   for BluetoothServiceCapabilities use (
      None => 0,
      LimitedDiscoverableMode => 1,
      PositioningService => 8,
      NetworkingService => 16,
      RenderingService => 32,
      CapturingService => 64,
      ObjectTransferService => 128,
      AudioService => 256,
      TelephoneService => 512,
      InformationService => 1024
   );
   for BluetoothServiceCapabilities'Size use 32;
   
   type BluetoothServiceCapabilities_Ptr is access BluetoothServiceCapabilities;
   
   type BluetoothConnectionStatus is (
      Disconnected,
      Connected
   );
   for BluetoothConnectionStatus use (
      Disconnected => 0,
      Connected => 1
   );
   for BluetoothConnectionStatus'Size use 32;
   
   type BluetoothConnectionStatus_Ptr is access BluetoothConnectionStatus;
   
   type BluetoothError is (
      Success,
      RadioNotAvailable,
      ResourceInUse,
      DeviceNotConnected,
      OtherError,
      DisabledByPolicy,
      NotSupported,
      DisabledByUser,
      ConsentRequired,
      TransportNotSupported
   );
   for BluetoothError use (
      Success => 0,
      RadioNotAvailable => 1,
      ResourceInUse => 2,
      DeviceNotConnected => 3,
      OtherError => 4,
      DisabledByPolicy => 5,
      NotSupported => 6,
      DisabledByUser => 7,
      ConsentRequired => 8,
      TransportNotSupported => 9
   );
   for BluetoothError'Size use 32;
   
   type BluetoothError_Ptr is access BluetoothError;
   
   type BluetoothAddressType is (
      Public,
      Random,
      Unspecified
   );
   for BluetoothAddressType use (
      Public => 0,
      Random => 1,
      Unspecified => 2
   );
   for BluetoothAddressType'Size use 32;
   
   type BluetoothAddressType_Ptr is access BluetoothAddressType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IBluetoothAdapter_Interface;
   type AsyncOperationCompletedHandler_IBluetoothAdapter is access all AsyncOperationCompletedHandler_IBluetoothAdapter_Interface'Class;
   type AsyncOperationCompletedHandler_IBluetoothAdapter_Ptr is access all AsyncOperationCompletedHandler_IBluetoothAdapter;
   type AsyncOperationCompletedHandler_IBluetoothDevice_Interface;
   type AsyncOperationCompletedHandler_IBluetoothDevice is access all AsyncOperationCompletedHandler_IBluetoothDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IBluetoothDevice_Ptr is access all AsyncOperationCompletedHandler_IBluetoothDevice;
   type TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface;
   type TypedEventHandler_IBluetoothDevice_add_NameChanged is access all TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface'Class;
   type TypedEventHandler_IBluetoothDevice_add_NameChanged_Ptr is access all TypedEventHandler_IBluetoothDevice_add_NameChanged;
   type TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface;
   type TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged is access all TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface'Class;
   type TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Ptr is access all TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged;
   type TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface;
   type TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged is access all TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface'Class;
   type TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Ptr is access all TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged;
   type AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface;
   type AsyncOperationCompletedHandler_IBluetoothLEDevice is access all AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IBluetoothLEDevice_Ptr is access all AsyncOperationCompletedHandler_IBluetoothLEDevice;
   type TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface;
   type TypedEventHandler_IBluetoothLEDevice_add_NameChanged is access all TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface'Class;
   type TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Ptr is access all TypedEventHandler_IBluetoothLEDevice_add_NameChanged;
   type TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface;
   type TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged is access all TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface'Class;
   type TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Ptr is access all TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged;
   type TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface;
   type TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged is access all TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface'Class;
   type TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Ptr is access all TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBluetoothAdapterStatics_Interface;
   type IBluetoothAdapterStatics is access all IBluetoothAdapterStatics_Interface'Class;
   type IBluetoothAdapterStatics_Ptr is access all IBluetoothAdapterStatics;
   type IBluetoothAdapter_Interface;
   type IBluetoothAdapter is access all IBluetoothAdapter_Interface'Class;
   type IBluetoothAdapter_Ptr is access all IBluetoothAdapter;
   type IBluetoothDeviceIdStatics_Interface;
   type IBluetoothDeviceIdStatics is access all IBluetoothDeviceIdStatics_Interface'Class;
   type IBluetoothDeviceIdStatics_Ptr is access all IBluetoothDeviceIdStatics;
   type IBluetoothDeviceId_Interface;
   type IBluetoothDeviceId is access all IBluetoothDeviceId_Interface'Class;
   type IBluetoothDeviceId_Ptr is access all IBluetoothDeviceId;
   type IBluetoothUuidHelperStatics_Interface;
   type IBluetoothUuidHelperStatics is access all IBluetoothUuidHelperStatics_Interface'Class;
   type IBluetoothUuidHelperStatics_Ptr is access all IBluetoothUuidHelperStatics;
   type IBluetoothDeviceStatics_Interface;
   type IBluetoothDeviceStatics is access all IBluetoothDeviceStatics_Interface'Class;
   type IBluetoothDeviceStatics_Ptr is access all IBluetoothDeviceStatics;
   type IBluetoothDeviceStatics2_Interface;
   type IBluetoothDeviceStatics2 is access all IBluetoothDeviceStatics2_Interface'Class;
   type IBluetoothDeviceStatics2_Ptr is access all IBluetoothDeviceStatics2;
   type IBluetoothDevice_Interface;
   type IBluetoothDevice is access all IBluetoothDevice_Interface'Class;
   type IBluetoothDevice_Ptr is access all IBluetoothDevice;
   type IBluetoothDevice2_Interface;
   type IBluetoothDevice2 is access all IBluetoothDevice2_Interface'Class;
   type IBluetoothDevice2_Ptr is access all IBluetoothDevice2;
   type IBluetoothDevice3_Interface;
   type IBluetoothDevice3 is access all IBluetoothDevice3_Interface'Class;
   type IBluetoothDevice3_Ptr is access all IBluetoothDevice3;
   type IBluetoothDevice4_Interface;
   type IBluetoothDevice4 is access all IBluetoothDevice4_Interface'Class;
   type IBluetoothDevice4_Ptr is access all IBluetoothDevice4;
   type IBluetoothLEAppearanceCategoriesStatics_Interface;
   type IBluetoothLEAppearanceCategoriesStatics is access all IBluetoothLEAppearanceCategoriesStatics_Interface'Class;
   type IBluetoothLEAppearanceCategoriesStatics_Ptr is access all IBluetoothLEAppearanceCategoriesStatics;
   type IBluetoothLEAppearanceSubcategoriesStatics_Interface;
   type IBluetoothLEAppearanceSubcategoriesStatics is access all IBluetoothLEAppearanceSubcategoriesStatics_Interface'Class;
   type IBluetoothLEAppearanceSubcategoriesStatics_Ptr is access all IBluetoothLEAppearanceSubcategoriesStatics;
   type IBluetoothLEAppearance_Interface;
   type IBluetoothLEAppearance is access all IBluetoothLEAppearance_Interface'Class;
   type IBluetoothLEAppearance_Ptr is access all IBluetoothLEAppearance;
   type IBluetoothLEAppearanceStatics_Interface;
   type IBluetoothLEAppearanceStatics is access all IBluetoothLEAppearanceStatics_Interface'Class;
   type IBluetoothLEAppearanceStatics_Ptr is access all IBluetoothLEAppearanceStatics;
   type IBluetoothLEDeviceStatics_Interface;
   type IBluetoothLEDeviceStatics is access all IBluetoothLEDeviceStatics_Interface'Class;
   type IBluetoothLEDeviceStatics_Ptr is access all IBluetoothLEDeviceStatics;
   type IBluetoothLEDeviceStatics2_Interface;
   type IBluetoothLEDeviceStatics2 is access all IBluetoothLEDeviceStatics2_Interface'Class;
   type IBluetoothLEDeviceStatics2_Ptr is access all IBluetoothLEDeviceStatics2;
   type IBluetoothLEDevice_Interface;
   type IBluetoothLEDevice is access all IBluetoothLEDevice_Interface'Class;
   type IBluetoothLEDevice_Ptr is access all IBluetoothLEDevice;
   type IBluetoothLEDevice2_Interface;
   type IBluetoothLEDevice2 is access all IBluetoothLEDevice2_Interface'Class;
   type IBluetoothLEDevice2_Ptr is access all IBluetoothLEDevice2;
   type IBluetoothLEDevice3_Interface;
   type IBluetoothLEDevice3 is access all IBluetoothLEDevice3_Interface'Class;
   type IBluetoothLEDevice3_Ptr is access all IBluetoothLEDevice3;
   type IBluetoothLEDevice4_Interface;
   type IBluetoothLEDevice4 is access all IBluetoothLEDevice4_Interface'Class;
   type IBluetoothLEDevice4_Ptr is access all IBluetoothLEDevice4;
   type IBluetoothClassOfDevice_Interface;
   type IBluetoothClassOfDevice is access all IBluetoothClassOfDevice_Interface'Class;
   type IBluetoothClassOfDevice_Ptr is access all IBluetoothClassOfDevice;
   type IBluetoothClassOfDeviceStatics_Interface;
   type IBluetoothClassOfDeviceStatics is access all IBluetoothClassOfDeviceStatics_Interface'Class;
   type IBluetoothClassOfDeviceStatics_Ptr is access all IBluetoothClassOfDeviceStatics;
   type IBluetoothSignalStrengthFilter_Interface;
   type IBluetoothSignalStrengthFilter is access all IBluetoothSignalStrengthFilter_Interface'Class;
   type IBluetoothSignalStrengthFilter_Ptr is access all IBluetoothSignalStrengthFilter;
   type IAsyncOperation_IBluetoothAdapter_Interface;
   type IAsyncOperation_IBluetoothAdapter is access all IAsyncOperation_IBluetoothAdapter_Interface'Class;
   type IAsyncOperation_IBluetoothAdapter_Ptr is access all IAsyncOperation_IBluetoothAdapter;
   type IAsyncOperation_IBluetoothDevice_Interface;
   type IAsyncOperation_IBluetoothDevice is access all IAsyncOperation_IBluetoothDevice_Interface'Class;
   type IAsyncOperation_IBluetoothDevice_Ptr is access all IAsyncOperation_IBluetoothDevice;
   type IAsyncOperation_IBluetoothLEDevice_Interface;
   type IAsyncOperation_IBluetoothLEDevice is access all IAsyncOperation_IBluetoothLEDevice_Interface'Class;
   type IAsyncOperation_IBluetoothLEDevice_Ptr is access all IAsyncOperation_IBluetoothLEDevice;
   
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
   type IBluetoothAdapterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IBluetoothAdapterStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IBluetoothAdapterStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access IBluetoothAdapterStatics_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothAdapterStatics : aliased constant Windows.IID := (2332228458, 44108, 18241, (134, 97, 142, 171, 125, 23, 234, 159 ));
   
   ------------------------------------------------------------------------
   type IBluetoothAdapter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BluetoothAddress
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_IsClassicSupported
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLowEnergySupported
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPeripheralRoleSupported
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCentralRoleSupported
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAdvertisementOffloadSupported
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetRadioAsync
   (
      This       : access IBluetoothAdapter_Interface
      ; RetVal : access Windows.Devices.Radios.IAsyncOperation_IRadio -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothAdapter : aliased constant Windows.IID := (2037706828, 24442, 18996, (146, 37, 168, 85, 248, 75, 26, 139 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDeviceIdStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromId
   (
      This       : access IBluetoothDeviceIdStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDeviceIdStatics : aliased constant Windows.IID := (2810728039, 16123, 20273, (187, 194, 129, 14, 9, 151, 116, 4 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IBluetoothDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsClassicDevice
   (
      This       : access IBluetoothDeviceId_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLowEnergyDevice
   (
      This       : access IBluetoothDeviceId_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDeviceId : aliased constant Windows.IID := (3245951407, 22465, 17986, (188, 206, 230, 192, 107, 32, 174, 118 ));
   
   ------------------------------------------------------------------------
   type IBluetoothUuidHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromShortId
   (
      This       : access IBluetoothUuidHelperStatics_Interface
      ; shortId : Windows.UInt32
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function TryGetShortId
   (
      This       : access IBluetoothUuidHelperStatics_Interface
      ; uuid : Windows.Guid
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothUuidHelperStatics : aliased constant Windows.IID := (400493784, 53108, 19233, (175, 230, 245, 122, 17, 188, 222, 160 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IBluetoothDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromHostNameAsync
   (
      This       : access IBluetoothDeviceStatics_Interface
      ; hostName : Windows.Networking.IHostName
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromBluetoothAddressAsync
   (
      This       : access IBluetoothDeviceStatics_Interface
      ; address : Windows.UInt64
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IBluetoothDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDeviceStatics : aliased constant Windows.IID := (160554833, 22491, 18213, (187, 215, 132, 246, 67, 39, 236, 44 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDeviceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorFromPairingState
   (
      This       : access IBluetoothDeviceStatics2_Interface
      ; pairingState : Windows.Boolean
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromConnectionStatus
   (
      This       : access IBluetoothDeviceStatics2_Interface
      ; connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromDeviceName
   (
      This       : access IBluetoothDeviceStatics2_Interface
      ; deviceName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromBluetoothAddress
   (
      This       : access IBluetoothDeviceStatics2_Interface
      ; bluetoothAddress : Windows.UInt64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromClassOfDevice
   (
      This       : access IBluetoothDeviceStatics2_Interface
      ; classOfDevice : Windows.Devices.Bluetooth.IBluetoothClassOfDevice
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDeviceStatics2 : aliased constant Windows.IID := (3265170991, 19988, 17527, (170, 27, 184, 180, 126, 91, 126, 206 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HostName
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ClassOfDevice
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothClassOfDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_SdpRecords
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IVectorView_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RfcommServices
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IVectorView_IRfcommDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionStatus
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_BluetoothAddress
   (
      This       : access IBluetoothDevice_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function add_NameChanged
   (
      This       : access IBluetoothDevice_Interface
      ; handler : TypedEventHandler_IBluetoothDevice_add_NameChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NameChanged
   (
      This       : access IBluetoothDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SdpRecordsChanged
   (
      This       : access IBluetoothDevice_Interface
      ; handler : TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SdpRecordsChanged
   (
      This       : access IBluetoothDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionStatusChanged
   (
      This       : access IBluetoothDevice_Interface
      ; handler : TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionStatusChanged
   (
      This       : access IBluetoothDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDevice : aliased constant Windows.IID := (590721366, 37074, 18948, (174, 245, 14, 32, 185, 230, 183, 7 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IBluetoothDevice2_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDevice2 : aliased constant Windows.IID := (20183380, 45398, 19920, (177, 245, 193, 27, 195, 26, 81, 99 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDevice3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceAccessInformation
   (
      This       : access IBluetoothDevice3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IBluetoothDevice3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRfcommServicesAsync
   (
      This       : access IBluetoothDevice3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRfcommServicesWithCacheModeAsync
   (
      This       : access IBluetoothDevice3_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRfcommServicesForIdAsync
   (
      This       : access IBluetoothDevice3_Interface
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRfcommServicesForIdWithCacheModeAsync
   (
      This       : access IBluetoothDevice3_Interface
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDevice3 : aliased constant Windows.IID := (1476392843, 25882, 17492, (185, 15, 235, 33, 239, 11, 13, 113 ));
   
   ------------------------------------------------------------------------
   type IBluetoothDevice4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BluetoothDeviceId
   (
      This       : access IBluetoothDevice4_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothDevice4 : aliased constant Windows.IID := (2172400813, 3740, 17074, (168, 220, 62, 128, 148, 148, 13, 18 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAppearanceCategoriesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uncategorized
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Phone
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Computer
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Watch
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Clock
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Display
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteControl
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_EyeGlasses
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Keyring
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaPlayer
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BarcodeScanner
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Thermometer
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HeartRate
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressure
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HumanInterfaceDevice
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_GlucoseMeter
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RunningWalking
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Cycling
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_PulseOximeter
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_WeightScale
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_OutdoorSportActivity
   (
      This       : access IBluetoothLEAppearanceCategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAppearanceCategoriesStatics : aliased constant Windows.IID := (1833784574, 1130, 16773, (170, 182, 130, 76, 240, 97, 8, 97 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAppearanceSubcategoriesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Generic
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_SportsWatch
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ThermometerEar
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HeartRateBelt
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressureArm
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressureWrist
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Keyboard
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Mouse
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Joystick
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Gamepad
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_DigitizerTablet
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CardReader
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_DigitalPen
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BarcodeScanner
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RunningWalkingInShoe
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RunningWalkingOnShoe
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RunningWalkingOnHip
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingComputer
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingSpeedSensor
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingCadenceSensor
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPowerSensor
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingSpeedCadenceSensor
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_OximeterFingertip
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_OximeterWristWorn
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationDisplay
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationNavigationDisplay
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationPod
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationNavigationPod
   (
      This       : access IBluetoothLEAppearanceSubcategoriesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAppearanceSubcategoriesStatics : aliased constant Windows.IID := (3850085894, 8516, 16730, (131, 18, 113, 204, 242, 145, 248, 209 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAppearance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawValue
   (
      This       : access IBluetoothLEAppearance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Category
   (
      This       : access IBluetoothLEAppearance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_SubCategory
   (
      This       : access IBluetoothLEAppearance_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAppearance : aliased constant Windows.IID := (1562409458, 26280, 16984, (152, 94, 2, 180, 217, 80, 159, 24 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAppearanceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromRawValue
   (
      This       : access IBluetoothLEAppearanceStatics_Interface
      ; rawValue : Windows.UInt16
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothLEAppearance
   )
   return Windows.HRESULT is abstract;
   
   function FromParts
   (
      This       : access IBluetoothLEAppearanceStatics_Interface
      ; appearanceCategory : Windows.UInt16
      ; appearanceSubCategory : Windows.UInt16
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothLEAppearance
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAppearanceStatics : aliased constant Windows.IID := (2710814919, 17668, 20298, (155, 165, 205, 16, 84, 229, 224, 101 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IBluetoothLEDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromBluetoothAddressAsync
   (
      This       : access IBluetoothLEDeviceStatics_Interface
      ; bluetoothAddress : Windows.UInt64
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IBluetoothLEDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDeviceStatics : aliased constant Windows.IID := (3369015833, 61622, 19440, (134, 137, 65, 48, 61, 226, 217, 244 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDeviceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorFromPairingState
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; pairingState : Windows.Boolean
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromConnectionStatus
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromDeviceName
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; deviceName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromBluetoothAddress
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; bluetoothAddress : Windows.UInt64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromAppearance
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; appearance : Windows.Devices.Bluetooth.IBluetoothLEAppearance
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromBluetoothAddressWithBluetoothAddressTypeAsync
   (
      This       : access IBluetoothLEDeviceStatics2_Interface
      ; bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
      ; RetVal : access Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDeviceStatics2 : aliased constant Windows.IID := (1595064427, 15276, 17384, (173, 22, 86, 50, 113, 189, 65, 194 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IBluetoothLEDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBluetoothLEDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GattServices
   (
      This       : access IBluetoothLEDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionStatus
   (
      This       : access IBluetoothLEDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_BluetoothAddress
   (
      This       : access IBluetoothLEDevice_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetGattService
   (
      This       : access IBluetoothLEDevice_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function add_NameChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; handler : TypedEventHandler_IBluetoothLEDevice_add_NameChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NameChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GattServicesChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; handler : TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GattServicesChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionStatusChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; handler : TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionStatusChanged
   (
      This       : access IBluetoothLEDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDevice : aliased constant Windows.IID := (3052285819, 19160, 17986, (172, 72, 128, 160, 181, 0, 232, 135 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IBluetoothLEDevice2_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Appearance
   (
      This       : access IBluetoothLEDevice2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothLEAppearance
   )
   return Windows.HRESULT is abstract;
   
   function get_BluetoothAddressType
   (
      This       : access IBluetoothLEDevice2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothAddressType
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDevice2 : aliased constant Windows.IID := (653288115, 31470, 19761, (186, 186, 177, 185, 119, 95, 89, 22 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDevice3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceAccessInformation
   (
      This       : access IBluetoothLEDevice3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IBluetoothLEDevice3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGattServicesAsync
   (
      This       : access IBluetoothLEDevice3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGattServicesWithCacheModeAsync
   (
      This       : access IBluetoothLEDevice3_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGattServicesForUuidAsync
   (
      This       : access IBluetoothLEDevice3_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGattServicesForUuidWithCacheModeAsync
   (
      This       : access IBluetoothLEDevice3_Interface
      ; serviceUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDevice3 : aliased constant Windows.IID := (2934563987, 17580, 16604, (175, 51, 178, 193, 60, 1, 202, 70 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEDevice4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BluetoothDeviceId
   (
      This       : access IBluetoothLEDevice4_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEDevice4 : aliased constant Windows.IID := (727732273, 8776, 19247, (172, 240, 124, 238, 54, 252, 88, 112 ));
   
   ------------------------------------------------------------------------
   type IBluetoothClassOfDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawValue
   (
      This       : access IBluetoothClassOfDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MajorClass
   (
      This       : access IBluetoothClassOfDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothMajorClass
   )
   return Windows.HRESULT is abstract;
   
   function get_MinorClass
   (
      This       : access IBluetoothClassOfDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothMinorClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceCapabilities
   (
      This       : access IBluetoothClassOfDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothServiceCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothClassOfDevice : aliased constant Windows.IID := (3594527358, 55255, 18017, (148, 84, 101, 3, 156, 161, 122, 43 ));
   
   ------------------------------------------------------------------------
   type IBluetoothClassOfDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromRawValue
   (
      This       : access IBluetoothClassOfDeviceStatics_Interface
      ; rawValue : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothClassOfDevice
   )
   return Windows.HRESULT is abstract;
   
   function FromParts
   (
      This       : access IBluetoothClassOfDeviceStatics_Interface
      ; majorClass : Windows.Devices.Bluetooth.BluetoothMajorClass
      ; minorClass : Windows.Devices.Bluetooth.BluetoothMinorClass
      ; serviceCapabilities : Windows.Devices.Bluetooth.BluetoothServiceCapabilities
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothClassOfDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothClassOfDeviceStatics : aliased constant Windows.IID := (3831575997, 4002, 16748, (145, 180, 193, 228, 140, 160, 97, 193 ));
   
   ------------------------------------------------------------------------
   type IBluetoothSignalStrengthFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InRangeThresholdInDBm
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; RetVal : access Windows.Foundation.IReference_Int16 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InRangeThresholdInDBm
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; value : Windows.Foundation.IReference_Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_OutOfRangeThresholdInDBm
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; RetVal : access Windows.Foundation.IReference_Int16 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_OutOfRangeThresholdInDBm
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; value : Windows.Foundation.IReference_Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_OutOfRangeTimeout
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_OutOfRangeTimeout
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_SamplingInterval
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SamplingInterval
   (
      This       : access IBluetoothSignalStrengthFilter_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothSignalStrengthFilter : aliased constant Windows.IID := (3749409681, 27573, 19710, (144, 177, 93, 115, 36, 237, 207, 127 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBluetoothAdapter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBluetoothAdapter_Interface
      ; handler : Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothAdapter
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBluetoothAdapter_Interface
      ; RetVal : access Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothAdapter
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBluetoothAdapter_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothAdapter
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBluetoothAdapter : aliased constant Windows.IID := (1190979340, 27655, 23098, (183, 117, 38, 249, 148, 2, 85, 63 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBluetoothDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBluetoothDevice_Interface
      ; handler : Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBluetoothDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBluetoothDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBluetoothDevice : aliased constant Windows.IID := (3045952793, 17597, 23232, (160, 214, 27, 80, 128, 15, 49, 129 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBluetoothLEDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBluetoothLEDevice_Interface
      ; handler : Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothLEDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBluetoothLEDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.AsyncOperationCompletedHandler_IBluetoothLEDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBluetoothLEDevice_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothLEDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBluetoothLEDevice : aliased constant Windows.IID := (929013095, 29858, 24465, (161, 29, 22, 144, 147, 113, 141, 65 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBluetoothAdapter_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBluetoothAdapter_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBluetoothAdapter_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBluetoothAdapter : aliased constant Windows.IID := (278989448, 37088, 20762, (154, 8, 215, 95, 235, 82, 161, 159 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBluetoothDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBluetoothDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBluetoothDevice_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBluetoothDevice : aliased constant Windows.IID := (3001601489, 26282, 22674, (133, 163, 143, 11, 22, 94, 67, 252 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothDevice_add_NameChanged : aliased constant Windows.IID := (3679899164, 24223, 20792, (146, 39, 177, 166, 109, 96, 188, 27 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged : aliased constant Windows.IID := (3679899164, 24223, 20792, (146, 39, 177, 166, 109, 96, 188, 27 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged : aliased constant Windows.IID := (3679899164, 24223, 20792, (146, 39, 177, 166, 109, 96, 188, 27 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBluetoothLEDevice : aliased constant Windows.IID := (2438379423, 50506, 21111, (143, 139, 210, 204, 67, 199, 224, 4 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothLEDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothLEDevice_add_NameChanged : aliased constant Windows.IID := (2835767778, 14126, 23838, (187, 187, 184, 162, 206, 14, 124, 77 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothLEDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged : aliased constant Windows.IID := (2835767778, 14126, 23838, (187, 187, 184, 162, 206, 14, 124, 77 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.IBluetoothLEDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged : aliased constant Windows.IID := (2835767778, 14126, 23838, (187, 187, 184, 162, 206, 14, 124, 77 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BluetoothAdapter is Windows.Devices.Bluetooth.IBluetoothAdapter;
   subtype BluetoothDeviceId is Windows.Devices.Bluetooth.IBluetoothDeviceId;
   subtype BluetoothDevice is Windows.Devices.Bluetooth.IBluetoothDevice;
   subtype BluetoothClassOfDevice is Windows.Devices.Bluetooth.IBluetoothClassOfDevice;
   subtype BluetoothLEAppearance is Windows.Devices.Bluetooth.IBluetoothLEAppearance;
   subtype BluetoothLEDevice is Windows.Devices.Bluetooth.IBluetoothLEDevice;
   subtype BluetoothSignalStrengthFilter is Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter;
   
   function CreateBluetoothSignalStrengthFilter return Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter;
   
   function GetDefaultAsync
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IBluetoothDeviceId;
   
   function FromShortId
   (
      shortId : Windows.UInt32
   )
   return Windows.Guid;
   
   function TryGetShortId
   (
      uuid : Windows.Guid
   )
   return Windows.Foundation.IReference_UInt32;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   
   function FromHostNameAsync
   (
      hostName : Windows.Networking.IHostName
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   
   function FromBluetoothAddressAsync
   (
      address : Windows.UInt64
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   
   function GetDeviceSelector_IBluetoothDevice
   return Windows.String;
   
   function GetDeviceSelectorFromPairingState
   (
      pairingState : Windows.Boolean
   )
   return Windows.String;
   
   function GetDeviceSelectorFromConnectionStatus
   (
      connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.String;
   
   function GetDeviceSelectorFromDeviceName
   (
      deviceName : Windows.String
   )
   return Windows.String;
   
   function GetDeviceSelectorFromBluetoothAddress
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.String;
   
   function GetDeviceSelectorFromClassOfDevice
   (
      classOfDevice : Windows.Devices.Bluetooth.IBluetoothClassOfDevice
   )
   return Windows.String;
   
   function FromRawValue
   (
      rawValue : Windows.UInt32
   )
   return Windows.Devices.Bluetooth.IBluetoothClassOfDevice;
   
   function FromParts
   (
      majorClass : Windows.Devices.Bluetooth.BluetoothMajorClass
      ; minorClass : Windows.Devices.Bluetooth.BluetoothMinorClass
      ; serviceCapabilities : Windows.Devices.Bluetooth.BluetoothServiceCapabilities
   )
   return Windows.Devices.Bluetooth.IBluetoothClassOfDevice;
   
   function get_Uncategorized
   return Windows.UInt16;
   
   function get_Phone
   return Windows.UInt16;
   
   function get_Computer
   return Windows.UInt16;
   
   function get_Watch
   return Windows.UInt16;
   
   function get_Clock
   return Windows.UInt16;
   
   function get_Display
   return Windows.UInt16;
   
   function get_RemoteControl
   return Windows.UInt16;
   
   function get_EyeGlasses
   return Windows.UInt16;
   
   function get_Tag
   return Windows.UInt16;
   
   function get_Keyring
   return Windows.UInt16;
   
   function get_MediaPlayer
   return Windows.UInt16;
   
   function get_BarcodeScanner
   return Windows.UInt16;
   
   function get_Thermometer
   return Windows.UInt16;
   
   function get_HeartRate
   return Windows.UInt16;
   
   function get_BloodPressure
   return Windows.UInt16;
   
   function get_HumanInterfaceDevice
   return Windows.UInt16;
   
   function get_GlucoseMeter
   return Windows.UInt16;
   
   function get_RunningWalking
   return Windows.UInt16;
   
   function get_Cycling
   return Windows.UInt16;
   
   function get_PulseOximeter
   return Windows.UInt16;
   
   function get_WeightScale
   return Windows.UInt16;
   
   function get_OutdoorSportActivity
   return Windows.UInt16;
   
   function get_Generic
   return Windows.UInt16;
   
   function get_SportsWatch
   return Windows.UInt16;
   
   function get_ThermometerEar
   return Windows.UInt16;
   
   function get_HeartRateBelt
   return Windows.UInt16;
   
   function get_BloodPressureArm
   return Windows.UInt16;
   
   function get_BloodPressureWrist
   return Windows.UInt16;
   
   function get_Keyboard
   return Windows.UInt16;
   
   function get_Mouse
   return Windows.UInt16;
   
   function get_Joystick
   return Windows.UInt16;
   
   function get_Gamepad
   return Windows.UInt16;
   
   function get_DigitizerTablet
   return Windows.UInt16;
   
   function get_CardReader
   return Windows.UInt16;
   
   function get_DigitalPen
   return Windows.UInt16;
   
   function get_BarcodeScanner_BluetoothLEAppearanceSubcategories
   return Windows.UInt16;
   
   function get_RunningWalkingInShoe
   return Windows.UInt16;
   
   function get_RunningWalkingOnShoe
   return Windows.UInt16;
   
   function get_RunningWalkingOnHip
   return Windows.UInt16;
   
   function get_CyclingComputer
   return Windows.UInt16;
   
   function get_CyclingSpeedSensor
   return Windows.UInt16;
   
   function get_CyclingCadenceSensor
   return Windows.UInt16;
   
   function get_CyclingPowerSensor
   return Windows.UInt16;
   
   function get_CyclingSpeedCadenceSensor
   return Windows.UInt16;
   
   function get_OximeterFingertip
   return Windows.UInt16;
   
   function get_OximeterWristWorn
   return Windows.UInt16;
   
   function get_LocationDisplay
   return Windows.UInt16;
   
   function get_LocationNavigationDisplay
   return Windows.UInt16;
   
   function get_LocationPod
   return Windows.UInt16;
   
   function get_LocationNavigationPod
   return Windows.UInt16;
   
   function FromRawValue
   (
      rawValue : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.IBluetoothLEAppearance;
   
   function FromParts
   (
      appearanceCategory : Windows.UInt16
      ; appearanceSubCategory : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.IBluetoothLEAppearance;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;
   
   function FromBluetoothAddressAsync
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;
   
   function GetDeviceSelector_IBluetoothLEDevice
   return Windows.String;
   
   function GetDeviceSelectorFromPairingState_IBluetoothLEDevice
   (
      pairingState : Windows.Boolean
   )
   return Windows.String;
   
   function GetDeviceSelectorFromConnectionStatus_IBluetoothLEDevice
   (
      connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.String;
   
   function GetDeviceSelectorFromDeviceName_IBluetoothLEDevice
   (
      deviceName : Windows.String
   )
   return Windows.String;
   
   function GetDeviceSelectorFromBluetoothAddress_IBluetoothLEDevice
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.String;
   
   function GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType
   (
      bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
   )
   return Windows.String;
   
   function GetDeviceSelectorFromAppearance
   (
      appearance : Windows.Devices.Bluetooth.IBluetoothLEAppearance
   )
   return Windows.String;
   
   function FromBluetoothAddressWithBluetoothAddressTypeAsync
   (
      bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;

end;
