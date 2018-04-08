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
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.XboxLive is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveDeviceAddress(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
      ; args : Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate(sender), Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface
      ; asyncInfo : Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult
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
      This       : access TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPair
      ; args : Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveEndpointPair(sender), Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateXboxLiveQualityOfServiceMeasurement return Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.XboxLive.IID_IXboxLiveQualityOfServiceMeasurement'Access, RetVal'access);
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
   
   
   function CreateFromSnapshotBase64
   (
      base64 : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBase64(base64, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSnapshotBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBuffer(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSnapshotBytes
   (
      buffer : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBytes(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLocal
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLocal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxSnapshotBytesSize
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSnapshotBytesSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindEndpointPairBySocketAddressBytes
   (
      localSocketAddress : Windows.UInt8_Ptr
      ; remoteSocketAddress : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPair");
      m_Factory     : IXboxLiveEndpointPairStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindEndpointPairBySocketAddressBytes(localSocketAddress, remoteSocketAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindEndpointPairByHostNamesAndPorts
   (
      localHostName : Windows.Networking.IHostName
      ; localPort : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remotePort : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPair");
      m_Factory     : IXboxLiveEndpointPairStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateByName
   (
      name : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate");
      m_Factory     : IXboxLiveEndpointPairTemplateStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairTemplateStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateByName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Templates
   return Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate");
      m_Factory     : IXboxLiveEndpointPairTemplateStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairTemplateStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Templates(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure PublishPrivatePayloadBytes
   (
      payload : Windows.UInt8_Ptr
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PublishPrivatePayloadBytes(payload);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ClearPrivatePayload
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearPrivatePayload;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_MaxSimultaneousProbeConnections
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSimultaneousProbeConnections(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_MaxSimultaneousProbeConnections
   (
      value : Windows.UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_MaxSimultaneousProbeConnections(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsSystemOutboundBandwidthConstrained
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSystemOutboundBandwidthConstrained(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsSystemOutboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsSystemOutboundBandwidthConstrained(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsSystemInboundBandwidthConstrained
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSystemInboundBandwidthConstrained(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsSystemInboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsSystemInboundBandwidthConstrained(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_PublishedPrivatePayload
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PublishedPrivatePayload(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PublishedPrivatePayload
   (
      value : Windows.Storage.Streams.IBuffer
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PublishedPrivatePayload(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_MaxPrivatePayloadSize
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxPrivatePayloadSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
