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
with Windows.Foundation;
with Windows.Foundation.Collections;
with Windows; use Windows;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Bluetooth.Advertisement is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BluetoothLEScanningMode is (
      Passive,
      Active
   );
   for BluetoothLEScanningMode use (
      Passive => 0,
      Active => 1
   );
   for BluetoothLEScanningMode'Size use 32;
   
   type BluetoothLEScanningMode_Ptr is access BluetoothLEScanningMode;
   
   type BluetoothLEAdvertisementFlags is (
      None,
      LimitedDiscoverableMode,
      GeneralDiscoverableMode,
      ClassicNotSupported,
      DualModeControllerCapable,
      DualModeHostCapable
   );
   for BluetoothLEAdvertisementFlags use (
      None => 0,
      LimitedDiscoverableMode => 1,
      GeneralDiscoverableMode => 2,
      ClassicNotSupported => 4,
      DualModeControllerCapable => 8,
      DualModeHostCapable => 16
   );
   for BluetoothLEAdvertisementFlags'Size use 32;
   
   type BluetoothLEAdvertisementFlags_Ptr is access BluetoothLEAdvertisementFlags;
   
   type BluetoothLEAdvertisementType is (
      ConnectableUndirected,
      ConnectableDirected,
      ScannableUndirected,
      NonConnectableUndirected,
      ScanResponse
   );
   for BluetoothLEAdvertisementType use (
      ConnectableUndirected => 0,
      ConnectableDirected => 1,
      ScannableUndirected => 2,
      NonConnectableUndirected => 3,
      ScanResponse => 4
   );
   for BluetoothLEAdvertisementType'Size use 32;
   
   type BluetoothLEAdvertisementType_Ptr is access BluetoothLEAdvertisementType;
   
   type BluetoothLEAdvertisementWatcherStatus is (
      Created,
      Started,
      Stopping,
      Stopped,
      Aborted
   );
   for BluetoothLEAdvertisementWatcherStatus use (
      Created => 0,
      Started => 1,
      Stopping => 2,
      Stopped => 3,
      Aborted => 4
   );
   for BluetoothLEAdvertisementWatcherStatus'Size use 32;
   
   type BluetoothLEAdvertisementWatcherStatus_Ptr is access BluetoothLEAdvertisementWatcherStatus;
   
   type BluetoothLEAdvertisementPublisherStatus is (
      Created,
      Waiting,
      Started,
      Stopping,
      Stopped,
      Aborted
   );
   for BluetoothLEAdvertisementPublisherStatus use (
      Created => 0,
      Waiting => 1,
      Started => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for BluetoothLEAdvertisementPublisherStatus'Size use 32;
   
   type BluetoothLEAdvertisementPublisherStatus_Ptr is access BluetoothLEAdvertisementPublisherStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Interface;
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received is access all TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Interface'Class;
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Ptr is access all TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received;
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Interface;
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped is access all TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Ptr is access all TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped;
   type TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Interface;
   type TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged is access all TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Ptr is access all TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBluetoothLEAdvertisement_Interface;
   type IBluetoothLEAdvertisement is access all IBluetoothLEAdvertisement_Interface'Class;
   type IBluetoothLEAdvertisement_Ptr is access all IBluetoothLEAdvertisement;
   type IBluetoothLEAdvertisementFilter_Interface;
   type IBluetoothLEAdvertisementFilter is access all IBluetoothLEAdvertisementFilter_Interface'Class;
   type IBluetoothLEAdvertisementFilter_Ptr is access all IBluetoothLEAdvertisementFilter;
   type IBluetoothLEAdvertisementWatcherStoppedEventArgs_Interface;
   type IBluetoothLEAdvertisementWatcherStoppedEventArgs is access all IBluetoothLEAdvertisementWatcherStoppedEventArgs_Interface'Class;
   type IBluetoothLEAdvertisementWatcherStoppedEventArgs_Ptr is access all IBluetoothLEAdvertisementWatcherStoppedEventArgs;
   type IBluetoothLEAdvertisementWatcherFactory_Interface;
   type IBluetoothLEAdvertisementWatcherFactory is access all IBluetoothLEAdvertisementWatcherFactory_Interface'Class;
   type IBluetoothLEAdvertisementWatcherFactory_Ptr is access all IBluetoothLEAdvertisementWatcherFactory;
   type IBluetoothLEAdvertisementWatcher_Interface;
   type IBluetoothLEAdvertisementWatcher is access all IBluetoothLEAdvertisementWatcher_Interface'Class;
   type IBluetoothLEAdvertisementWatcher_Ptr is access all IBluetoothLEAdvertisementWatcher;
   type IBluetoothLEAdvertisementReceivedEventArgs_Interface;
   type IBluetoothLEAdvertisementReceivedEventArgs is access all IBluetoothLEAdvertisementReceivedEventArgs_Interface'Class;
   type IBluetoothLEAdvertisementReceivedEventArgs_Ptr is access all IBluetoothLEAdvertisementReceivedEventArgs;
   type IBluetoothLEAdvertisementDataSectionFactory_Interface;
   type IBluetoothLEAdvertisementDataSectionFactory is access all IBluetoothLEAdvertisementDataSectionFactory_Interface'Class;
   type IBluetoothLEAdvertisementDataSectionFactory_Ptr is access all IBluetoothLEAdvertisementDataSectionFactory;
   type IBluetoothLEAdvertisementDataSection_Interface;
   type IBluetoothLEAdvertisementDataSection is access all IBluetoothLEAdvertisementDataSection_Interface'Class;
   type IBluetoothLEAdvertisementDataSection_Ptr is access all IBluetoothLEAdvertisementDataSection;
   type IBluetoothLEManufacturerDataFactory_Interface;
   type IBluetoothLEManufacturerDataFactory is access all IBluetoothLEManufacturerDataFactory_Interface'Class;
   type IBluetoothLEManufacturerDataFactory_Ptr is access all IBluetoothLEManufacturerDataFactory;
   type IBluetoothLEManufacturerData_Interface;
   type IBluetoothLEManufacturerData is access all IBluetoothLEManufacturerData_Interface'Class;
   type IBluetoothLEManufacturerData_Ptr is access all IBluetoothLEManufacturerData;
   type IBluetoothLEAdvertisementBytePatternFactory_Interface;
   type IBluetoothLEAdvertisementBytePatternFactory is access all IBluetoothLEAdvertisementBytePatternFactory_Interface'Class;
   type IBluetoothLEAdvertisementBytePatternFactory_Ptr is access all IBluetoothLEAdvertisementBytePatternFactory;
   type IBluetoothLEAdvertisementBytePattern_Interface;
   type IBluetoothLEAdvertisementBytePattern is access all IBluetoothLEAdvertisementBytePattern_Interface'Class;
   type IBluetoothLEAdvertisementBytePattern_Ptr is access all IBluetoothLEAdvertisementBytePattern;
   type IBluetoothLEAdvertisementDataTypesStatics_Interface;
   type IBluetoothLEAdvertisementDataTypesStatics is access all IBluetoothLEAdvertisementDataTypesStatics_Interface'Class;
   type IBluetoothLEAdvertisementDataTypesStatics_Ptr is access all IBluetoothLEAdvertisementDataTypesStatics;
   type IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Interface;
   type IBluetoothLEAdvertisementPublisherStatusChangedEventArgs is access all IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Interface'Class;
   type IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Ptr is access all IBluetoothLEAdvertisementPublisherStatusChangedEventArgs;
   type IBluetoothLEAdvertisementPublisherFactory_Interface;
   type IBluetoothLEAdvertisementPublisherFactory is access all IBluetoothLEAdvertisementPublisherFactory_Interface'Class;
   type IBluetoothLEAdvertisementPublisherFactory_Ptr is access all IBluetoothLEAdvertisementPublisherFactory;
   type IBluetoothLEAdvertisementPublisher_Interface;
   type IBluetoothLEAdvertisementPublisher is access all IBluetoothLEAdvertisementPublisher_Interface'Class;
   type IBluetoothLEAdvertisementPublisher_Ptr is access all IBluetoothLEAdvertisementPublisher;
   type IReference_BluetoothLEAdvertisementFlags_Interface;
   type IReference_BluetoothLEAdvertisementFlags is access all IReference_BluetoothLEAdvertisementFlags_Interface'Class;
   type IReference_BluetoothLEAdvertisementFlags_Ptr is access all IReference_BluetoothLEAdvertisementFlags;
   type IIterator_IBluetoothLEManufacturerData_Interface;
   type IIterator_IBluetoothLEManufacturerData is access all IIterator_IBluetoothLEManufacturerData_Interface'Class;
   type IIterator_IBluetoothLEManufacturerData_Ptr is access all IIterator_IBluetoothLEManufacturerData;
   type IIterable_IBluetoothLEManufacturerData_Interface;
   type IIterable_IBluetoothLEManufacturerData is access all IIterable_IBluetoothLEManufacturerData_Interface'Class;
   type IIterable_IBluetoothLEManufacturerData_Ptr is access all IIterable_IBluetoothLEManufacturerData;
   type IVectorView_IBluetoothLEManufacturerData_Interface;
   type IVectorView_IBluetoothLEManufacturerData is access all IVectorView_IBluetoothLEManufacturerData_Interface'Class;
   type IVectorView_IBluetoothLEManufacturerData_Ptr is access all IVectorView_IBluetoothLEManufacturerData;
   type IVector_IBluetoothLEManufacturerData_Interface;
   type IVector_IBluetoothLEManufacturerData is access all IVector_IBluetoothLEManufacturerData_Interface'Class;
   type IVector_IBluetoothLEManufacturerData_Ptr is access all IVector_IBluetoothLEManufacturerData;
   type IIterator_IBluetoothLEAdvertisementDataSection_Interface;
   type IIterator_IBluetoothLEAdvertisementDataSection is access all IIterator_IBluetoothLEAdvertisementDataSection_Interface'Class;
   type IIterator_IBluetoothLEAdvertisementDataSection_Ptr is access all IIterator_IBluetoothLEAdvertisementDataSection;
   type IIterable_IBluetoothLEAdvertisementDataSection_Interface;
   type IIterable_IBluetoothLEAdvertisementDataSection is access all IIterable_IBluetoothLEAdvertisementDataSection_Interface'Class;
   type IIterable_IBluetoothLEAdvertisementDataSection_Ptr is access all IIterable_IBluetoothLEAdvertisementDataSection;
   type IVectorView_IBluetoothLEAdvertisementDataSection_Interface;
   type IVectorView_IBluetoothLEAdvertisementDataSection is access all IVectorView_IBluetoothLEAdvertisementDataSection_Interface'Class;
   type IVectorView_IBluetoothLEAdvertisementDataSection_Ptr is access all IVectorView_IBluetoothLEAdvertisementDataSection;
   type IVector_IBluetoothLEAdvertisementDataSection_Interface;
   type IVector_IBluetoothLEAdvertisementDataSection is access all IVector_IBluetoothLEAdvertisementDataSection_Interface'Class;
   type IVector_IBluetoothLEAdvertisementDataSection_Ptr is access all IVector_IBluetoothLEAdvertisementDataSection;
   type IIterator_IBluetoothLEAdvertisementBytePattern_Interface;
   type IIterator_IBluetoothLEAdvertisementBytePattern is access all IIterator_IBluetoothLEAdvertisementBytePattern_Interface'Class;
   type IIterator_IBluetoothLEAdvertisementBytePattern_Ptr is access all IIterator_IBluetoothLEAdvertisementBytePattern;
   type IIterable_IBluetoothLEAdvertisementBytePattern_Interface;
   type IIterable_IBluetoothLEAdvertisementBytePattern is access all IIterable_IBluetoothLEAdvertisementBytePattern_Interface'Class;
   type IIterable_IBluetoothLEAdvertisementBytePattern_Ptr is access all IIterable_IBluetoothLEAdvertisementBytePattern;
   type IVectorView_IBluetoothLEAdvertisementBytePattern_Interface;
   type IVectorView_IBluetoothLEAdvertisementBytePattern is access all IVectorView_IBluetoothLEAdvertisementBytePattern_Interface'Class;
   type IVectorView_IBluetoothLEAdvertisementBytePattern_Ptr is access all IVectorView_IBluetoothLEAdvertisementBytePattern;
   type IVector_IBluetoothLEAdvertisementBytePattern_Interface;
   type IVector_IBluetoothLEAdvertisementBytePattern is access all IVector_IBluetoothLEAdvertisementBytePattern_Interface'Class;
   type IVector_IBluetoothLEAdvertisementBytePattern_Ptr is access all IVector_IBluetoothLEAdvertisementBytePattern;
   type IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface;
   type IIterator_IBluetoothLEAdvertisementReceivedEventArgs is access all IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface'Class;
   type IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Ptr is access all IIterator_IBluetoothLEAdvertisementReceivedEventArgs;
   type IIterable_IBluetoothLEAdvertisementReceivedEventArgs_Interface;
   type IIterable_IBluetoothLEAdvertisementReceivedEventArgs is access all IIterable_IBluetoothLEAdvertisementReceivedEventArgs_Interface'Class;
   type IIterable_IBluetoothLEAdvertisementReceivedEventArgs_Ptr is access all IIterable_IBluetoothLEAdvertisementReceivedEventArgs;
   type IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface;
   type IVectorView_IBluetoothLEAdvertisementReceivedEventArgs is access all IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface'Class;
   type IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Ptr is access all IVectorView_IBluetoothLEAdvertisementReceivedEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisement : aliased constant Windows.IID := (107983543, 13265, 20093, (131, 103, 207, 129, 208, 247, 150, 83 ));
   
   type IBluetoothLEAdvertisement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Flags
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IReference_BluetoothLEAdvertisementFlags -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Flags
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IReference_BluetoothLEAdvertisementFlags
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalName
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalName
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUuids
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerData
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVector_IBluetoothLEManufacturerData -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DataSections
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVector_IBluetoothLEAdvertisementDataSection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetManufacturerDataByCompanyId
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; companyId : Windows.UInt16
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEManufacturerData -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSectionsByType
   (
      This       : access IBluetoothLEAdvertisement_Interface
      ; type_x : Windows.UInt8
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEAdvertisementDataSection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementFilter : aliased constant Windows.IID := (320778451, 53326, 18353, (131, 126, 73, 64, 91, 246, 248, 15 ));
   
   type IBluetoothLEAdvertisementFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Advertisement
   (
      This       : access IBluetoothLEAdvertisementFilter_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   function put_Advertisement
   (
      This       : access IBluetoothLEAdvertisementFilter_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   function get_BytePatterns
   (
      This       : access IBluetoothLEAdvertisementFilter_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVector_IBluetoothLEAdvertisementBytePattern -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementWatcherStoppedEventArgs : aliased constant Windows.IID := (3712022605, 59321, 17379, (156, 4, 6, 133, 208, 133, 253, 140 ));
   
   type IBluetoothLEAdvertisementWatcherStoppedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IBluetoothLEAdvertisementWatcherStoppedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementWatcherFactory : aliased constant Windows.IID := (2595171670, 14764, 17726, (179, 42, 133, 198, 87, 224, 23, 241 ));
   
   type IBluetoothLEAdvertisementWatcherFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBluetoothLEAdvertisementWatcherFactory_Interface
      ; advertisementFilter : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementWatcher : aliased constant Windows.IID := (2796303215, 62419, 17047, (141, 108, 200, 30, 166, 98, 63, 64 ));
   
   type IBluetoothLEAdvertisementWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinSamplingInterval
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSamplingInterval
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MinOutOfRangeTimeout
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOutOfRangeTimeout
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanningMode
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEScanningMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ScanningMode
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.BluetoothLEScanningMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalStrengthFilter
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
   )
   return Windows.HRESULT is abstract;
   
   function put_SignalStrengthFilter
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; value : Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementFilter
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
   )
   return Windows.HRESULT is abstract;
   
   function put_AdvertisementFilter
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Received
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; handler : TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Received
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; handler : TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IBluetoothLEAdvertisementWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementReceivedEventArgs : aliased constant Windows.IID := (664305119, 58774, 16830, (141, 67, 158, 103, 49, 212, 169, 19 ));
   
   type IBluetoothLEAdvertisementReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawSignalStrengthInDBm
   (
      This       : access IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_BluetoothAddress
   (
      This       : access IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementType
   (
      This       : access IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementType
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Advertisement
   (
      This       : access IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementDataSectionFactory : aliased constant Windows.IID := (3886287170, 43077, 16453, (191, 126, 62, 153, 113, 219, 138, 107 ));
   
   type IBluetoothLEAdvertisementDataSectionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBluetoothLEAdvertisementDataSectionFactory_Interface
      ; dataType : Windows.UInt8
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementDataSection : aliased constant Windows.IID := (3609277204, 14915, 16633, (182, 240, 146, 191, 239, 195, 74, 227 ));
   
   type IBluetoothLEAdvertisementDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataType
   (
      This       : access IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_DataType
   (
      This       : access IBluetoothLEAdvertisementDataSection_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IBluetoothLEAdvertisementDataSection_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEManufacturerDataFactory : aliased constant Windows.IID := (3231398392, 12698, 17438, (141, 229, 102, 168, 30, 135, 122, 108 ));
   
   type IBluetoothLEManufacturerDataFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBluetoothLEManufacturerDataFactory_Interface
      ; companyId : Windows.UInt16
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEManufacturerData : aliased constant Windows.IID := (2435693080, 26979, 17715, (176, 97, 70, 148, 218, 251, 52, 229 ));
   
   type IBluetoothLEManufacturerData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompanyId
   (
      This       : access IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_CompanyId
   (
      This       : access IBluetoothLEManufacturerData_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IBluetoothLEManufacturerData_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementBytePatternFactory : aliased constant Windows.IID := (3269610867, 64860, 20163, (190, 42, 156, 166, 250, 17, 183, 189 ));
   
   type IBluetoothLEAdvertisementBytePatternFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBluetoothLEAdvertisementBytePatternFactory_Interface
      ; dataType : Windows.UInt8
      ; offset : Windows.Int16
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementBytePattern : aliased constant Windows.IID := (4227520498, 47557, 18952, (188, 81, 80, 47, 142, 246, 138, 121 ));
   
   type IBluetoothLEAdvertisementBytePattern_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataType
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_DataType
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementDataTypesStatics : aliased constant Windows.IID := (1001801519, 1542, 17227, (167, 110, 116, 21, 159, 6, 132, 211 ));
   
   type IBluetoothLEAdvertisementDataTypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Flags
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_IncompleteService16BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_CompleteService16BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_IncompleteService32BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_CompleteService32BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_IncompleteService128BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_CompleteService128BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ShortenedLocalName
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_CompleteLocalName
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_TxPowerLevel
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SlaveConnectionIntervalRange
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceSolicitation16BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceSolicitation32BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceSolicitation128BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceData16BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceData32BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceData128BitUuids
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicTargetAddress
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_RandomTargetAddress
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Appearance
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisingInterval
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerSpecificData
   (
      This       : access IBluetoothLEAdvertisementDataTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementPublisherStatusChangedEventArgs : aliased constant Windows.IID := (163757471, 11775, 19235, (134, 238, 13, 20, 251, 148, 174, 174 ));
   
   type IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisherStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IBluetoothLEAdvertisementPublisherStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementPublisherFactory : aliased constant Windows.IID := (1549731422, 47203, 18817, (161, 175, 28, 84, 77, 139, 12, 13 ));
   
   type IBluetoothLEAdvertisementPublisherFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBluetoothLEAdvertisementPublisherFactory_Interface
      ; advertisement : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementPublisher : aliased constant Windows.IID := (3454542073, 55802, 17366, (162, 100, 221, 216, 183, 218, 139, 120 ));
   
   type IBluetoothLEAdvertisementPublisher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisherStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Advertisement
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
      ; handler : TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IBluetoothLEAdvertisementPublisher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_BluetoothLEAdvertisementFlags : aliased constant Windows.IID := (2445326998, 40553, 23426, (191, 29, 131, 171, 42, 80, 156, 83 ));
   
   type IReference_BluetoothLEAdvertisementFlags_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_BluetoothLEAdvertisementFlags_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementFlags
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBluetoothLEManufacturerData : aliased constant Windows.IID := (317806813, 28694, 21304, (172, 92, 125, 85, 3, 215, 50, 116 ));
   
   type IIterator_IBluetoothLEManufacturerData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBluetoothLEManufacturerData_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBluetoothLEManufacturerData : aliased constant Windows.IID := (2202684588, 48011, 24335, (159, 40, 77, 188, 152, 193, 121, 7 ));
   
   type IIterable_IBluetoothLEManufacturerData_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IIterator_IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBluetoothLEManufacturerData : aliased constant Windows.IID := (2024474382, 44414, 22802, (164, 241, 123, 227, 62, 69, 96, 175 ));
   
   type IVectorView_IBluetoothLEManufacturerData_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBluetoothLEManufacturerData_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBluetoothLEManufacturerData_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBluetoothLEManufacturerData_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IBluetoothLEManufacturerData : aliased constant Windows.IID := (1389845317, 7460, 24299, (186, 187, 101, 239, 250, 228, 94, 70 ));
   
   type IVector_IBluetoothLEManufacturerData_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBluetoothLEManufacturerData_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBluetoothLEAdvertisementDataSection : aliased constant Windows.IID := (2942045825, 30859, 21204, (130, 162, 30, 210, 140, 102, 160, 94 ));
   
   type IIterator_IBluetoothLEAdvertisementDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBluetoothLEAdvertisementDataSection_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBluetoothLEAdvertisementDataSection : aliased constant Windows.IID := (3684218321, 35198, 22988, (184, 106, 123, 136, 85, 172, 152, 175 ));
   
   type IIterable_IBluetoothLEAdvertisementDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IIterator_IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBluetoothLEAdvertisementDataSection : aliased constant Windows.IID := (3304241386, 4520, 20745, (144, 19, 64, 71, 225, 44, 114, 232 ));
   
   type IVectorView_IBluetoothLEAdvertisementDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBluetoothLEAdvertisementDataSection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBluetoothLEAdvertisementDataSection_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBluetoothLEAdvertisementDataSection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IBluetoothLEAdvertisementDataSection : aliased constant Windows.IID := (3069647570, 58063, 23892, (182, 241, 144, 150, 78, 229, 212, 218 ));
   
   type IVector_IBluetoothLEAdvertisementDataSection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBluetoothLEAdvertisementDataSection_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBluetoothLEAdvertisementBytePattern : aliased constant Windows.IID := (3007189050, 6753, 20743, (136, 19, 192, 233, 5, 192, 84, 134 ));
   
   type IIterator_IBluetoothLEAdvertisementBytePattern_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBluetoothLEAdvertisementBytePattern_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBluetoothLEAdvertisementBytePattern : aliased constant Windows.IID := (507489774, 21676, 21387, (135, 119, 53, 26, 251, 120, 203, 116 ));
   
   type IIterable_IBluetoothLEAdvertisementBytePattern_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IIterator_IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBluetoothLEAdvertisementBytePattern : aliased constant Windows.IID := (2816055354, 41247, 22318, (137, 251, 104, 62, 164, 41, 188, 188 ));
   
   type IVectorView_IBluetoothLEAdvertisementBytePattern_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBluetoothLEAdvertisementBytePattern_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBluetoothLEAdvertisementBytePattern_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IBluetoothLEAdvertisementBytePattern : aliased constant Windows.IID := (2379506103, 38773, 24194, (160, 166, 102, 39, 171, 208, 208, 16 ));
   
   type IVector_IBluetoothLEAdvertisementBytePattern_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBluetoothLEAdvertisementBytePattern_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBluetoothLEAdvertisementReceivedEventArgs : aliased constant Windows.IID := (158260152, 60655, 22308, (190, 98, 36, 13, 207, 246, 172, 169 ));
   
   type IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBluetoothLEAdvertisementReceivedEventArgs : aliased constant Windows.IID := (888553775, 33556, 20997, (150, 124, 219, 53, 124, 154, 66, 167 ));
   
   type IIterable_IBluetoothLEAdvertisementReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IIterator_IBluetoothLEAdvertisementReceivedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBluetoothLEAdvertisementReceivedEventArgs : aliased constant Windows.IID := (2330958794, 65149, 22886, (151, 137, 254, 222, 36, 203, 65, 196 ));
   
   type IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBluetoothLEAdvertisementReceivedEventArgs_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received : aliased constant Windows.IID := (2431340234, 54373, 24224, (166, 28, 3, 60, 140, 94, 206, 242 ));
   
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped : aliased constant Windows.IID := (2570495195, 56473, 21955, (158, 155, 191, 72, 84, 189, 158, 171 ));
   
   type TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherStoppedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherStoppedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged : aliased constant Windows.IID := (3271533809, 22675, 21672, (189, 148, 170, 17, 152, 176, 93, 7 ));
   
   type TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BluetoothLEManufacturerData is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData;
   function CreateBluetoothLEManufacturerData return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData;
   
   subtype BluetoothLEAdvertisementDataSection is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection;
   function CreateBluetoothLEAdvertisementDataSection return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection;
   
   subtype BluetoothLEAdvertisement is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement;
   function CreateBluetoothLEAdvertisement return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement;
   
   subtype BluetoothLEAdvertisementBytePattern is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern;
   function Create
   (
      dataType : Windows.UInt8
      ; offset : Windows.Int16
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern;
   
   subtype BluetoothLEAdvertisementFilter is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter;
   function CreateBluetoothLEAdvertisementFilter return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter;
   
   subtype BluetoothLEAdvertisementWatcherStoppedEventArgs is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherStoppedEventArgs;
   subtype BluetoothLEAdvertisementWatcher is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher;
   function CreateBluetoothLEAdvertisementWatcher return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher;
   
   subtype BluetoothLEAdvertisementReceivedEventArgs is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs;
   subtype BluetoothLEAdvertisementPublisherStatusChangedEventArgs is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherStatusChangedEventArgs;
   subtype BluetoothLEAdvertisementPublisher is Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher;
   function CreateBluetoothLEAdvertisementPublisher return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Flags
   return Windows.UInt8;
   
   function get_IncompleteService16BitUuids
   return Windows.UInt8;
   
   function get_CompleteService16BitUuids
   return Windows.UInt8;
   
   function get_IncompleteService32BitUuids
   return Windows.UInt8;
   
   function get_CompleteService32BitUuids
   return Windows.UInt8;
   
   function get_IncompleteService128BitUuids
   return Windows.UInt8;
   
   function get_CompleteService128BitUuids
   return Windows.UInt8;
   
   function get_ShortenedLocalName
   return Windows.UInt8;
   
   function get_CompleteLocalName
   return Windows.UInt8;
   
   function get_TxPowerLevel
   return Windows.UInt8;
   
   function get_SlaveConnectionIntervalRange
   return Windows.UInt8;
   
   function get_ServiceSolicitation16BitUuids
   return Windows.UInt8;
   
   function get_ServiceSolicitation32BitUuids
   return Windows.UInt8;
   
   function get_ServiceSolicitation128BitUuids
   return Windows.UInt8;
   
   function get_ServiceData16BitUuids
   return Windows.UInt8;
   
   function get_ServiceData32BitUuids
   return Windows.UInt8;
   
   function get_ServiceData128BitUuids
   return Windows.UInt8;
   
   function get_PublicTargetAddress
   return Windows.UInt8;
   
   function get_RandomTargetAddress
   return Windows.UInt8;
   
   function get_Appearance
   return Windows.UInt8;
   
   function get_AdvertisingInterval
   return Windows.UInt8;
   
   function get_ManufacturerSpecificData
   return Windows.UInt8;
   
end;
