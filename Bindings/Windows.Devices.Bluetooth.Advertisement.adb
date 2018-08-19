--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Devices.Bluetooth;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Bluetooth.Advertisement is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Received_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher(sender), Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherStoppedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher(sender), Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherStoppedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBluetoothLEAdvertisementPublisher_add_StatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher
      ; args : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher(sender), Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherStatusChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEManufacturerData");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEManufacturerData'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      companyId : Windows.UInt16
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEManufacturerData");
      m_Factory     : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Advertisement.IBluetoothLEManufacturerData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEManufacturerDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(companyId, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataSection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisementDataSection'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      dataType : Windows.UInt8
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataSection");
      m_Factory     : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSectionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementDataSection := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataSectionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(dataType, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisement");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisement'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementBytePattern");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisementBytePattern'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      dataType : Windows.UInt8
      ; offset : Windows.Int16
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementBytePattern");
      m_Factory     : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePatternFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementBytePattern := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementBytePatternFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(dataType, offset, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementFilter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisementFilter'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcher");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisementWatcher'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      advertisementFilter : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcher");
      m_Factory     : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcherFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementWatcher := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementWatcherFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(advertisementFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisher");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.Advertisement.IID_IBluetoothLEAdvertisementPublisher'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      advertisement : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisher");
      m_Factory     : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisherFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementPublisher := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementPublisherFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(advertisement, RetVal'Access);
         RefCount := m_Factory.Release;
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
   
   function get_Flags
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Flags(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IncompleteService16BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IncompleteService16BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteService16BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteService16BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IncompleteService32BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IncompleteService32BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteService32BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteService32BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IncompleteService128BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IncompleteService128BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteService128BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteService128BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShortenedLocalName
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShortenedLocalName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteLocalName
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteLocalName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TxPowerLevel
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TxPowerLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SlaveConnectionIntervalRange
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SlaveConnectionIntervalRange(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceSolicitation16BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceSolicitation16BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceSolicitation32BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceSolicitation32BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceSolicitation128BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceSolicitation128BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceData16BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceData16BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceData32BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceData32BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServiceData128BitUuids
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceData128BitUuids(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PublicTargetAddress
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PublicTargetAddress(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RandomTargetAddress
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RandomTargetAddress(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Appearance
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Appearance(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AdvertisingInterval
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AdvertisingInterval(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManufacturerSpecificData
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes");
      m_Factory     : IBluetoothLEAdvertisementDataTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAdvertisementDataTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManufacturerSpecificData(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
