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
with Windows.UI;
with Windows.UI.Popups;
with Windows.Storage.Streams;
with Windows.ApplicationModel.Background;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Enumeration is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DeviceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceSelectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), Windows.Devices.Enumeration.IDeviceSelectedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Added_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformation(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Updated_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformationUpdate(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Removed_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformationUpdate(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDevicePairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceInformationCustomPairing
      ; args : Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceInformationCustomPairing(sender), Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceUnpairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceAccessInformation
      ; args : Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceAccessInformation(sender), Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateDevicePicker return Windows.Devices.Enumeration.IDevicePicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DevicePicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Enumeration.IDevicePicker) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Enumeration.IID_IDevicePicker'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateFromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdAsyncAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsyncAdditionalProperties(deviceId, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncAqsFilter(aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherAqsFilter(aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAqsFilterFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAqsFilterFromDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdAsyncWithKindAndAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsyncWithKindAndAdditionalProperties(deviceId, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryRegisterForAllInboundPairingRequests
   (
      pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformationPairing");
      m_Factory     : IDeviceInformationPairingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationPairingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryRegisterForAllInboundPairingRequests(pairingKindsSupported, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDeviceClassId
   (
      deviceClassId : Windows.Guid
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDeviceClassId(deviceClassId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
