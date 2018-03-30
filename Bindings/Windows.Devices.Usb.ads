--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows; use Windows;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.Usb is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UsbTransferDirection is (
      Out_x,
      In_x
   );
   for UsbTransferDirection use (
      Out_x => 0,
      In_x => 1
   );
   for UsbTransferDirection'Size use 32;
   
   type UsbTransferDirection_Ptr is access UsbTransferDirection;
   
   type UsbEndpointType is (
      Control,
      Isochronous,
      Bulk,
      Interrupt
   );
   for UsbEndpointType use (
      Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3
   );
   for UsbEndpointType'Size use 32;
   
   type UsbEndpointType_Ptr is access UsbEndpointType;
   
   type UsbControlRecipient is (
      Device,
      SpecifiedInterface,
      Endpoint,
      Other,
      DefaultInterface
   );
   for UsbControlRecipient use (
      Device => 0,
      SpecifiedInterface => 1,
      Endpoint => 2,
      Other => 3,
      DefaultInterface => 4
   );
   for UsbControlRecipient'Size use 32;
   
   type UsbControlRecipient_Ptr is access UsbControlRecipient;
   
   type UsbControlTransferType is (
      Standard_x,
      Class,
      Vendor
   );
   for UsbControlTransferType use (
      Standard_x => 0,
      Class => 1,
      Vendor => 2
   );
   for UsbControlTransferType'Size use 32;
   
   type UsbControlTransferType_Ptr is access UsbControlTransferType;
   
   type UsbReadOptions is (
      None,
      AutoClearStall,
      OverrideAutomaticBufferManagement,
      IgnoreShortPacket,
      AllowPartialReads
   );
   for UsbReadOptions use (
      None => 0,
      AutoClearStall => 1,
      OverrideAutomaticBufferManagement => 2,
      IgnoreShortPacket => 4,
      AllowPartialReads => 8
   );
   for UsbReadOptions'Size use 32;
   
   type UsbReadOptions_Ptr is access UsbReadOptions;
   
   type UsbWriteOptions is (
      None,
      AutoClearStall,
      ShortPacketTerminate
   );
   for UsbWriteOptions use (
      None => 0,
      AutoClearStall => 1,
      ShortPacketTerminate => 2
   );
   for UsbWriteOptions'Size use 32;
   
   type UsbWriteOptions_Ptr is access UsbWriteOptions;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUsbDevice_Interface;
   type AsyncOperationCompletedHandler_IUsbDevice is access all AsyncOperationCompletedHandler_IUsbDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IUsbDevice_Ptr is access all AsyncOperationCompletedHandler_IUsbDevice;
   type TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface;
   type TypedEventHandler_IUsbInterruptInPipe_add_DataReceived is access all TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface'Class;
   type TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Ptr is access all TypedEventHandler_IUsbInterruptInPipe_add_DataReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUsbControlRequestType_Interface;
   type IUsbControlRequestType is access all IUsbControlRequestType_Interface'Class;
   type IUsbControlRequestType_Ptr is access all IUsbControlRequestType;
   type IUsbSetupPacketFactory_Interface;
   type IUsbSetupPacketFactory is access all IUsbSetupPacketFactory_Interface'Class;
   type IUsbSetupPacketFactory_Ptr is access all IUsbSetupPacketFactory;
   type IUsbSetupPacket_Interface;
   type IUsbSetupPacket is access all IUsbSetupPacket_Interface'Class;
   type IUsbSetupPacket_Ptr is access all IUsbSetupPacket;
   type IUsbDeviceClass_Interface;
   type IUsbDeviceClass is access all IUsbDeviceClass_Interface'Class;
   type IUsbDeviceClass_Ptr is access all IUsbDeviceClass;
   type IUsbDeviceClassesStatics_Interface;
   type IUsbDeviceClassesStatics is access all IUsbDeviceClassesStatics_Interface'Class;
   type IUsbDeviceClassesStatics_Ptr is access all IUsbDeviceClassesStatics;
   type IUsbDeviceClasses_Interface;
   type IUsbDeviceClasses is access all IUsbDeviceClasses_Interface'Class;
   type IUsbDeviceClasses_Ptr is access all IUsbDeviceClasses;
   type IUsbDeviceStatics_Interface;
   type IUsbDeviceStatics is access all IUsbDeviceStatics_Interface'Class;
   type IUsbDeviceStatics_Ptr is access all IUsbDeviceStatics;
   type IUsbDevice_Interface;
   type IUsbDevice is access all IUsbDevice_Interface'Class;
   type IUsbDevice_Ptr is access all IUsbDevice;
   type IUsbDeviceDescriptor_Interface;
   type IUsbDeviceDescriptor is access all IUsbDeviceDescriptor_Interface'Class;
   type IUsbDeviceDescriptor_Ptr is access all IUsbDeviceDescriptor;
   type IUsbConfigurationDescriptor_Interface;
   type IUsbConfigurationDescriptor is access all IUsbConfigurationDescriptor_Interface'Class;
   type IUsbConfigurationDescriptor_Ptr is access all IUsbConfigurationDescriptor;
   type IUsbConfigurationDescriptorStatics_Interface;
   type IUsbConfigurationDescriptorStatics is access all IUsbConfigurationDescriptorStatics_Interface'Class;
   type IUsbConfigurationDescriptorStatics_Ptr is access all IUsbConfigurationDescriptorStatics;
   type IUsbInterfaceDescriptor_Interface;
   type IUsbInterfaceDescriptor is access all IUsbInterfaceDescriptor_Interface'Class;
   type IUsbInterfaceDescriptor_Ptr is access all IUsbInterfaceDescriptor;
   type IUsbInterfaceDescriptorStatics_Interface;
   type IUsbInterfaceDescriptorStatics is access all IUsbInterfaceDescriptorStatics_Interface'Class;
   type IUsbInterfaceDescriptorStatics_Ptr is access all IUsbInterfaceDescriptorStatics;
   type IUsbEndpointDescriptor_Interface;
   type IUsbEndpointDescriptor is access all IUsbEndpointDescriptor_Interface'Class;
   type IUsbEndpointDescriptor_Ptr is access all IUsbEndpointDescriptor;
   type IUsbEndpointDescriptorStatics_Interface;
   type IUsbEndpointDescriptorStatics is access all IUsbEndpointDescriptorStatics_Interface'Class;
   type IUsbEndpointDescriptorStatics_Ptr is access all IUsbEndpointDescriptorStatics;
   type IUsbDescriptor_Interface;
   type IUsbDescriptor is access all IUsbDescriptor_Interface'Class;
   type IUsbDescriptor_Ptr is access all IUsbDescriptor;
   type IUsbInterruptInEventArgs_Interface;
   type IUsbInterruptInEventArgs is access all IUsbInterruptInEventArgs_Interface'Class;
   type IUsbInterruptInEventArgs_Ptr is access all IUsbInterruptInEventArgs;
   type IUsbBulkInPipe_Interface;
   type IUsbBulkInPipe is access all IUsbBulkInPipe_Interface'Class;
   type IUsbBulkInPipe_Ptr is access all IUsbBulkInPipe;
   type IUsbInterruptInPipe_Interface;
   type IUsbInterruptInPipe is access all IUsbInterruptInPipe_Interface'Class;
   type IUsbInterruptInPipe_Ptr is access all IUsbInterruptInPipe;
   type IUsbBulkOutPipe_Interface;
   type IUsbBulkOutPipe is access all IUsbBulkOutPipe_Interface'Class;
   type IUsbBulkOutPipe_Ptr is access all IUsbBulkOutPipe;
   type IUsbInterruptOutPipe_Interface;
   type IUsbInterruptOutPipe is access all IUsbInterruptOutPipe_Interface'Class;
   type IUsbInterruptOutPipe_Ptr is access all IUsbInterruptOutPipe;
   type IUsbConfiguration_Interface;
   type IUsbConfiguration is access all IUsbConfiguration_Interface'Class;
   type IUsbConfiguration_Ptr is access all IUsbConfiguration;
   type IUsbInterface_Interface;
   type IUsbInterface is access all IUsbInterface_Interface'Class;
   type IUsbInterface_Ptr is access all IUsbInterface;
   type IUsbInterfaceSetting_Interface;
   type IUsbInterfaceSetting is access all IUsbInterfaceSetting_Interface'Class;
   type IUsbInterfaceSetting_Ptr is access all IUsbInterfaceSetting;
   type IUsbBulkInEndpointDescriptor_Interface;
   type IUsbBulkInEndpointDescriptor is access all IUsbBulkInEndpointDescriptor_Interface'Class;
   type IUsbBulkInEndpointDescriptor_Ptr is access all IUsbBulkInEndpointDescriptor;
   type IUsbInterruptInEndpointDescriptor_Interface;
   type IUsbInterruptInEndpointDescriptor is access all IUsbInterruptInEndpointDescriptor_Interface'Class;
   type IUsbInterruptInEndpointDescriptor_Ptr is access all IUsbInterruptInEndpointDescriptor;
   type IUsbBulkOutEndpointDescriptor_Interface;
   type IUsbBulkOutEndpointDescriptor is access all IUsbBulkOutEndpointDescriptor_Interface'Class;
   type IUsbBulkOutEndpointDescriptor_Ptr is access all IUsbBulkOutEndpointDescriptor;
   type IUsbInterruptOutEndpointDescriptor_Interface;
   type IUsbInterruptOutEndpointDescriptor is access all IUsbInterruptOutEndpointDescriptor_Interface'Class;
   type IUsbInterruptOutEndpointDescriptor_Ptr is access all IUsbInterruptOutEndpointDescriptor;
   type IAsyncOperation_IUsbDevice_Interface;
   type IAsyncOperation_IUsbDevice is access all IAsyncOperation_IUsbDevice_Interface'Class;
   type IAsyncOperation_IUsbDevice_Ptr is access all IAsyncOperation_IUsbDevice;
   type IIterator_IUsbInterface_Interface;
   type IIterator_IUsbInterface is access all IIterator_IUsbInterface_Interface'Class;
   type IIterator_IUsbInterface_Ptr is access all IIterator_IUsbInterface;
   type IIterable_IUsbInterface_Interface;
   type IIterable_IUsbInterface is access all IIterable_IUsbInterface_Interface'Class;
   type IIterable_IUsbInterface_Ptr is access all IIterable_IUsbInterface;
   type IVectorView_IUsbInterface_Interface;
   type IVectorView_IUsbInterface is access all IVectorView_IUsbInterface_Interface'Class;
   type IVectorView_IUsbInterface_Ptr is access all IVectorView_IUsbInterface;
   type IIterator_IUsbDescriptor_Interface;
   type IIterator_IUsbDescriptor is access all IIterator_IUsbDescriptor_Interface'Class;
   type IIterator_IUsbDescriptor_Ptr is access all IIterator_IUsbDescriptor;
   type IIterable_IUsbDescriptor_Interface;
   type IIterable_IUsbDescriptor is access all IIterable_IUsbDescriptor_Interface'Class;
   type IIterable_IUsbDescriptor_Ptr is access all IIterable_IUsbDescriptor;
   type IVectorView_IUsbDescriptor_Interface;
   type IVectorView_IUsbDescriptor is access all IVectorView_IUsbDescriptor_Interface'Class;
   type IVectorView_IUsbDescriptor_Ptr is access all IVectorView_IUsbDescriptor;
   type IIterator_IUsbBulkInPipe_Interface;
   type IIterator_IUsbBulkInPipe is access all IIterator_IUsbBulkInPipe_Interface'Class;
   type IIterator_IUsbBulkInPipe_Ptr is access all IIterator_IUsbBulkInPipe;
   type IIterable_IUsbBulkInPipe_Interface;
   type IIterable_IUsbBulkInPipe is access all IIterable_IUsbBulkInPipe_Interface'Class;
   type IIterable_IUsbBulkInPipe_Ptr is access all IIterable_IUsbBulkInPipe;
   type IVectorView_IUsbBulkInPipe_Interface;
   type IVectorView_IUsbBulkInPipe is access all IVectorView_IUsbBulkInPipe_Interface'Class;
   type IVectorView_IUsbBulkInPipe_Ptr is access all IVectorView_IUsbBulkInPipe;
   type IIterator_IUsbInterruptInPipe_Interface;
   type IIterator_IUsbInterruptInPipe is access all IIterator_IUsbInterruptInPipe_Interface'Class;
   type IIterator_IUsbInterruptInPipe_Ptr is access all IIterator_IUsbInterruptInPipe;
   type IIterable_IUsbInterruptInPipe_Interface;
   type IIterable_IUsbInterruptInPipe is access all IIterable_IUsbInterruptInPipe_Interface'Class;
   type IIterable_IUsbInterruptInPipe_Ptr is access all IIterable_IUsbInterruptInPipe;
   type IVectorView_IUsbInterruptInPipe_Interface;
   type IVectorView_IUsbInterruptInPipe is access all IVectorView_IUsbInterruptInPipe_Interface'Class;
   type IVectorView_IUsbInterruptInPipe_Ptr is access all IVectorView_IUsbInterruptInPipe;
   type IIterator_IUsbBulkOutPipe_Interface;
   type IIterator_IUsbBulkOutPipe is access all IIterator_IUsbBulkOutPipe_Interface'Class;
   type IIterator_IUsbBulkOutPipe_Ptr is access all IIterator_IUsbBulkOutPipe;
   type IIterable_IUsbBulkOutPipe_Interface;
   type IIterable_IUsbBulkOutPipe is access all IIterable_IUsbBulkOutPipe_Interface'Class;
   type IIterable_IUsbBulkOutPipe_Ptr is access all IIterable_IUsbBulkOutPipe;
   type IVectorView_IUsbBulkOutPipe_Interface;
   type IVectorView_IUsbBulkOutPipe is access all IVectorView_IUsbBulkOutPipe_Interface'Class;
   type IVectorView_IUsbBulkOutPipe_Ptr is access all IVectorView_IUsbBulkOutPipe;
   type IIterator_IUsbInterruptOutPipe_Interface;
   type IIterator_IUsbInterruptOutPipe is access all IIterator_IUsbInterruptOutPipe_Interface'Class;
   type IIterator_IUsbInterruptOutPipe_Ptr is access all IIterator_IUsbInterruptOutPipe;
   type IIterable_IUsbInterruptOutPipe_Interface;
   type IIterable_IUsbInterruptOutPipe is access all IIterable_IUsbInterruptOutPipe_Interface'Class;
   type IIterable_IUsbInterruptOutPipe_Ptr is access all IIterable_IUsbInterruptOutPipe;
   type IVectorView_IUsbInterruptOutPipe_Interface;
   type IVectorView_IUsbInterruptOutPipe is access all IVectorView_IUsbInterruptOutPipe_Interface'Class;
   type IVectorView_IUsbInterruptOutPipe_Ptr is access all IVectorView_IUsbInterruptOutPipe;
   type IIterator_IUsbInterfaceSetting_Interface;
   type IIterator_IUsbInterfaceSetting is access all IIterator_IUsbInterfaceSetting_Interface'Class;
   type IIterator_IUsbInterfaceSetting_Ptr is access all IIterator_IUsbInterfaceSetting;
   type IIterable_IUsbInterfaceSetting_Interface;
   type IIterable_IUsbInterfaceSetting is access all IIterable_IUsbInterfaceSetting_Interface'Class;
   type IIterable_IUsbInterfaceSetting_Ptr is access all IIterable_IUsbInterfaceSetting;
   type IVectorView_IUsbInterfaceSetting_Interface;
   type IVectorView_IUsbInterfaceSetting is access all IVectorView_IUsbInterfaceSetting_Interface'Class;
   type IVectorView_IUsbInterfaceSetting_Ptr is access all IVectorView_IUsbInterfaceSetting;
   type IIterator_IUsbBulkInEndpointDescriptor_Interface;
   type IIterator_IUsbBulkInEndpointDescriptor is access all IIterator_IUsbBulkInEndpointDescriptor_Interface'Class;
   type IIterator_IUsbBulkInEndpointDescriptor_Ptr is access all IIterator_IUsbBulkInEndpointDescriptor;
   type IIterable_IUsbBulkInEndpointDescriptor_Interface;
   type IIterable_IUsbBulkInEndpointDescriptor is access all IIterable_IUsbBulkInEndpointDescriptor_Interface'Class;
   type IIterable_IUsbBulkInEndpointDescriptor_Ptr is access all IIterable_IUsbBulkInEndpointDescriptor;
   type IVectorView_IUsbBulkInEndpointDescriptor_Interface;
   type IVectorView_IUsbBulkInEndpointDescriptor is access all IVectorView_IUsbBulkInEndpointDescriptor_Interface'Class;
   type IVectorView_IUsbBulkInEndpointDescriptor_Ptr is access all IVectorView_IUsbBulkInEndpointDescriptor;
   type IIterator_IUsbInterruptInEndpointDescriptor_Interface;
   type IIterator_IUsbInterruptInEndpointDescriptor is access all IIterator_IUsbInterruptInEndpointDescriptor_Interface'Class;
   type IIterator_IUsbInterruptInEndpointDescriptor_Ptr is access all IIterator_IUsbInterruptInEndpointDescriptor;
   type IIterable_IUsbInterruptInEndpointDescriptor_Interface;
   type IIterable_IUsbInterruptInEndpointDescriptor is access all IIterable_IUsbInterruptInEndpointDescriptor_Interface'Class;
   type IIterable_IUsbInterruptInEndpointDescriptor_Ptr is access all IIterable_IUsbInterruptInEndpointDescriptor;
   type IVectorView_IUsbInterruptInEndpointDescriptor_Interface;
   type IVectorView_IUsbInterruptInEndpointDescriptor is access all IVectorView_IUsbInterruptInEndpointDescriptor_Interface'Class;
   type IVectorView_IUsbInterruptInEndpointDescriptor_Ptr is access all IVectorView_IUsbInterruptInEndpointDescriptor;
   type IIterator_IUsbBulkOutEndpointDescriptor_Interface;
   type IIterator_IUsbBulkOutEndpointDescriptor is access all IIterator_IUsbBulkOutEndpointDescriptor_Interface'Class;
   type IIterator_IUsbBulkOutEndpointDescriptor_Ptr is access all IIterator_IUsbBulkOutEndpointDescriptor;
   type IIterable_IUsbBulkOutEndpointDescriptor_Interface;
   type IIterable_IUsbBulkOutEndpointDescriptor is access all IIterable_IUsbBulkOutEndpointDescriptor_Interface'Class;
   type IIterable_IUsbBulkOutEndpointDescriptor_Ptr is access all IIterable_IUsbBulkOutEndpointDescriptor;
   type IVectorView_IUsbBulkOutEndpointDescriptor_Interface;
   type IVectorView_IUsbBulkOutEndpointDescriptor is access all IVectorView_IUsbBulkOutEndpointDescriptor_Interface'Class;
   type IVectorView_IUsbBulkOutEndpointDescriptor_Ptr is access all IVectorView_IUsbBulkOutEndpointDescriptor;
   type IIterator_IUsbInterruptOutEndpointDescriptor_Interface;
   type IIterator_IUsbInterruptOutEndpointDescriptor is access all IIterator_IUsbInterruptOutEndpointDescriptor_Interface'Class;
   type IIterator_IUsbInterruptOutEndpointDescriptor_Ptr is access all IIterator_IUsbInterruptOutEndpointDescriptor;
   type IIterable_IUsbInterruptOutEndpointDescriptor_Interface;
   type IIterable_IUsbInterruptOutEndpointDescriptor is access all IIterable_IUsbInterruptOutEndpointDescriptor_Interface'Class;
   type IIterable_IUsbInterruptOutEndpointDescriptor_Ptr is access all IIterable_IUsbInterruptOutEndpointDescriptor;
   type IVectorView_IUsbInterruptOutEndpointDescriptor_Interface;
   type IVectorView_IUsbInterruptOutEndpointDescriptor is access all IVectorView_IUsbInterruptOutEndpointDescriptor_Interface'Class;
   type IVectorView_IUsbInterruptOutEndpointDescriptor_Ptr is access all IVectorView_IUsbInterruptOutEndpointDescriptor;
   
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
   type IUsbControlRequestType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Direction
   (
      This       : access IUsbControlRequestType_Interface
      ; RetVal : access Windows.Devices.Usb.UsbTransferDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access IUsbControlRequestType_Interface
      ; value : Windows.Devices.Usb.UsbTransferDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlTransferType
   (
      This       : access IUsbControlRequestType_Interface
      ; RetVal : access Windows.Devices.Usb.UsbControlTransferType
   )
   return Windows.HRESULT is abstract;
   
   function put_ControlTransferType
   (
      This       : access IUsbControlRequestType_Interface
      ; value : Windows.Devices.Usb.UsbControlTransferType
   )
   return Windows.HRESULT is abstract;
   
   function get_Recipient
   (
      This       : access IUsbControlRequestType_Interface
      ; RetVal : access Windows.Devices.Usb.UsbControlRecipient
   )
   return Windows.HRESULT is abstract;
   
   function put_Recipient
   (
      This       : access IUsbControlRequestType_Interface
      ; value : Windows.Devices.Usb.UsbControlRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_AsByte
   (
      This       : access IUsbControlRequestType_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_AsByte
   (
      This       : access IUsbControlRequestType_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbControlRequestType : aliased constant Windows.IID := (2392090022, 55101, 18142, (148, 190, 170, 231, 240, 124, 15, 92 ));
   
   ------------------------------------------------------------------------
   type IUsbSetupPacketFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithEightByteBuffer
   (
      This       : access IUsbSetupPacketFactory_Interface
      ; eightByteBuffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Usb.IUsbSetupPacket
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbSetupPacketFactory : aliased constant Windows.IID := (3374677328, 6958, 19009, (162, 167, 51, 143, 12, 239, 60, 20 ));
   
   ------------------------------------------------------------------------
   type IUsbSetupPacket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestType
   (
      This       : access IUsbSetupPacket_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbControlRequestType
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestType
   (
      This       : access IUsbSetupPacket_Interface
      ; value : Windows.Devices.Usb.IUsbControlRequestType
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access IUsbSetupPacket_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_Request
   (
      This       : access IUsbSetupPacket_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IUsbSetupPacket_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IUsbSetupPacket_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Index
   (
      This       : access IUsbSetupPacket_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Index
   (
      This       : access IUsbSetupPacket_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IUsbSetupPacket_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access IUsbSetupPacket_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbSetupPacket : aliased constant Windows.IID := (273391922, 51087, 19537, (182, 84, 228, 157, 2, 242, 203, 3 ));
   
   ------------------------------------------------------------------------
   type IUsbDeviceClass_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClassCode
   (
      This       : access IUsbDeviceClass_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_ClassCode
   (
      This       : access IUsbDeviceClass_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SubclassCode
   (
      This       : access IUsbDeviceClass_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SubclassCode
   (
      This       : access IUsbDeviceClass_Interface
      ; value : Windows.Foundation.IReference_UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolCode
   (
      This       : access IUsbDeviceClass_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtocolCode
   (
      This       : access IUsbDeviceClass_Interface
      ; value : Windows.Foundation.IReference_UInt8
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDeviceClass : aliased constant Windows.IID := (85541625, 33886, 18411, (177, 42, 56, 242, 246, 23, 175, 231 ));
   
   ------------------------------------------------------------------------
   type IUsbDeviceClassesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CdcControl
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Physical
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PersonalHealthcare
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ActiveSync
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PalmSync
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceFirmwareUpdate
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Irda
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Measurement
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_VendorSpecific
   (
      This       : access IUsbDeviceClassesStatics_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDeviceClassesStatics : aliased constant Windows.IID := (2987066663, 50560, 17817, (161, 101, 152, 27, 79, 208, 50, 48 ));
   
   ------------------------------------------------------------------------
   type IUsbDeviceClasses_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IUsbDeviceClasses : aliased constant Windows.IID := (1752143197, 39826, 19248, (151, 129, 194, 44, 85, 172, 53, 203 ));
   
   ------------------------------------------------------------------------
   type IUsbDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IUsbDeviceStatics_Interface
      ; vendorId : Windows.UInt32
      ; productId : Windows.UInt32
      ; winUsbInterfaceClass : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorGuidOnly
   (
      This       : access IUsbDeviceStatics_Interface
      ; winUsbInterfaceClass : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorVidPidOnly
   (
      This       : access IUsbDeviceStatics_Interface
      ; vendorId : Windows.UInt32
      ; productId : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceClassSelector
   (
      This       : access IUsbDeviceStatics_Interface
      ; usbClass : Windows.Devices.Usb.IUsbDeviceClass
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IUsbDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Usb.IAsyncOperation_IUsbDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDeviceStatics : aliased constant Windows.IID := (107709858, 2487, 17478, (133, 2, 111, 230, 220, 170, 115, 9 ));
   
   ------------------------------------------------------------------------
   type IUsbDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function SendControlOutTransferAsync
   (
      This       : access IUsbDevice_Interface
      ; setupPacket : Windows.Devices.Usb.IUsbSetupPacket
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendControlOutTransferAsyncNoBuffer
   (
      This       : access IUsbDevice_Interface
      ; setupPacket : Windows.Devices.Usb.IUsbSetupPacket
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendControlInTransferAsync
   (
      This       : access IUsbDevice_Interface
      ; setupPacket : Windows.Devices.Usb.IUsbSetupPacket
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendControlInTransferAsyncNoBuffer
   (
      This       : access IUsbDevice_Interface
      ; setupPacket : Windows.Devices.Usb.IUsbSetupPacket
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultInterface
   (
      This       : access IUsbDevice_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterface
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceDescriptor
   (
      This       : access IUsbDevice_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDeviceDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IUsbDevice_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbConfiguration
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDevice : aliased constant Windows.IID := (1380563346, 50262, 17621, (173, 94, 36, 245, 160, 137, 246, 59 ));
   
   ------------------------------------------------------------------------
   type IUsbDeviceDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BcdUsb
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPacketSize0
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_VendorId
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductId
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BcdDeviceRevision
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfConfigurations
   (
      This       : access IUsbDeviceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDeviceDescriptor : aliased constant Windows.IID := (524866038, 47767, 17186, (185, 44, 181, 177, 137, 33, 101, 136 ));
   
   ------------------------------------------------------------------------
   type IUsbConfigurationDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConfigurationValue
   (
      This       : access IUsbConfigurationDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPowerMilliamps
   (
      This       : access IUsbConfigurationDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelfPowered
   (
      This       : access IUsbConfigurationDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteWakeup
   (
      This       : access IUsbConfigurationDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbConfigurationDescriptor : aliased constant Windows.IID := (4061621650, 46146, 16506, (130, 7, 125, 100, 108, 3, 133, 243 ));
   
   ------------------------------------------------------------------------
   type IUsbConfigurationDescriptorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryParse
   (
      This       : access IUsbConfigurationDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbConfigurationDescriptor
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Parse
   (
      This       : access IUsbConfigurationDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; RetVal : access Windows.Devices.Usb.IUsbConfigurationDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbConfigurationDescriptorStatics : aliased constant Windows.IID := (1112337811, 59200, 16545, (146, 189, 218, 18, 14, 160, 73, 20 ));
   
   ------------------------------------------------------------------------
   type IUsbInterfaceDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClassCode
   (
      This       : access IUsbInterfaceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SubclassCode
   (
      This       : access IUsbInterfaceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolCode
   (
      This       : access IUsbInterfaceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateSettingNumber
   (
      This       : access IUsbInterfaceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InterfaceNumber
   (
      This       : access IUsbInterfaceDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterfaceDescriptor : aliased constant Windows.IID := (429289671, 47086, 20368, (140, 213, 148, 162, 226, 87, 89, 138 ));
   
   ------------------------------------------------------------------------
   type IUsbInterfaceDescriptorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryParse
   (
      This       : access IUsbInterfaceDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbInterfaceDescriptor
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Parse
   (
      This       : access IUsbInterfaceDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; RetVal : access Windows.Devices.Usb.IUsbInterfaceDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterfaceDescriptorStatics : aliased constant Windows.IID := (3813318645, 30678, 18614, (176, 190, 22, 198, 66, 35, 22, 254 ));
   
   ------------------------------------------------------------------------
   type IUsbEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointNumber
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.UsbTransferDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointType
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.UsbEndpointType
   )
   return Windows.HRESULT is abstract;
   
   function get_AsBulkInEndpointDescriptor
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_AsInterruptInEndpointDescriptor
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_AsBulkOutEndpointDescriptor
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_AsInterruptOutEndpointDescriptor
   (
      This       : access IUsbEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbEndpointDescriptor : aliased constant Windows.IID := (1799906009, 36343, 19264, (172, 131, 87, 143, 19, 159, 5, 117 ));
   
   ------------------------------------------------------------------------
   type IUsbEndpointDescriptorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryParse
   (
      This       : access IUsbEndpointDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbEndpointDescriptor
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Parse
   (
      This       : access IUsbEndpointDescriptorStatics_Interface
      ; descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; RetVal : access Windows.Devices.Usb.IUsbEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbEndpointDescriptorStatics : aliased constant Windows.IID := (3364925953, 39530, 18782, (168, 44, 41, 91, 158, 112, 129, 6 ));
   
   ------------------------------------------------------------------------
   type IUsbDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Length
   (
      This       : access IUsbDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_DescriptorType
   (
      This       : access IUsbDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function ReadDescriptorBuffer
   (
      This       : access IUsbDescriptor_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbDescriptor : aliased constant Windows.IID := (176812566, 24477, 18548, (137, 4, 218, 154, 211, 245, 82, 143 ));
   
   ------------------------------------------------------------------------
   type IUsbInterruptInEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InterruptData
   (
      This       : access IUsbInterruptInEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterruptInEventArgs : aliased constant Windows.IID := (3081781394, 5144, 18742, (130, 9, 41, 156, 245, 96, 85, 131 ));
   
   ------------------------------------------------------------------------
   type IUsbBulkInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxTransferSizeBytes
   (
      This       : access IUsbBulkInPipe_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointDescriptor
   (
      This       : access IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function ClearStallAsync
   (
      This       : access IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadOptions
   (
      This       : access IUsbBulkInPipe_Interface
      ; value : Windows.Devices.Usb.UsbReadOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadOptions
   (
      This       : access IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.UsbReadOptions
   )
   return Windows.HRESULT is abstract;
   
   function FlushBuffer
   (
      This       : access IUsbBulkInPipe_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStream
   (
      This       : access IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbBulkInPipe : aliased constant Windows.IID := (4028443963, 17736, 19792, (179, 38, 216, 44, 218, 190, 18, 32 ));
   
   ------------------------------------------------------------------------
   type IUsbInterruptInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointDescriptor
   (
      This       : access IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function ClearStallAsync
   (
      This       : access IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_DataReceived
   (
      This       : access IUsbInterruptInPipe_Interface
      ; handler : TypedEventHandler_IUsbInterruptInPipe_add_DataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataReceived
   (
      This       : access IUsbInterruptInPipe_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterruptInPipe : aliased constant Windows.IID := (4194332950, 34007, 18631, (138, 63, 76, 11, 35, 95, 46, 166 ));
   
   ------------------------------------------------------------------------
   type IUsbBulkOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointDescriptor
   (
      This       : access IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function ClearStallAsync
   (
      This       : access IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteOptions
   (
      This       : access IUsbBulkOutPipe_Interface
      ; value : Windows.Devices.Usb.UsbWriteOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteOptions
   (
      This       : access IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.UsbWriteOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbBulkOutPipe : aliased constant Windows.IID := (2833903214, 277, 17834, (139, 33, 55, 178, 37, 188, 206, 231 ));
   
   ------------------------------------------------------------------------
   type IUsbInterruptOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointDescriptor
   (
      This       : access IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function ClearStallAsync
   (
      This       : access IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteOptions
   (
      This       : access IUsbInterruptOutPipe_Interface
      ; value : Windows.Devices.Usb.UsbWriteOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteOptions
   (
      This       : access IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.UsbWriteOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterruptOutPipe : aliased constant Windows.IID := (3917793449, 43769, 18896, (185, 108, 246, 97, 171, 74, 127, 149 ));
   
   ------------------------------------------------------------------------
   type IUsbConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UsbInterfaces
   (
      This       : access IUsbConfiguration_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterface -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConfigurationDescriptor
   (
      This       : access IUsbConfiguration_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbConfigurationDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptors
   (
      This       : access IUsbConfiguration_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbConfiguration : aliased constant Windows.IID := (1746367529, 13993, 18135, (184, 115, 252, 104, 146, 81, 236, 48 ));
   
   ------------------------------------------------------------------------
   type IUsbInterface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BulkInPipes
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbBulkInPipe -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterruptInPipes
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterruptInPipe -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BulkOutPipes
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbBulkOutPipe -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterruptOutPipes
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterruptOutPipe -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterfaceSettings
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterfaceSetting -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterfaceNumber
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptors
   (
      This       : access IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterface : aliased constant Windows.IID := (2687642517, 32583, 18603, (167, 39, 103, 140, 37, 190, 33, 18 ));
   
   ------------------------------------------------------------------------
   type IUsbInterfaceSetting_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BulkInEndpoints
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbBulkInEndpointDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterruptInEndpoints
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterruptInEndpointDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BulkOutEndpoints
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbBulkOutEndpointDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InterruptOutEndpoints
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbInterruptOutEndpointDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Selected
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SelectSettingAsync
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_InterfaceDescriptor
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterfaceDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptors
   (
      This       : access IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IVectorView_IUsbDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterfaceSetting : aliased constant Windows.IID := (405257127, 36263, 19191, (143, 76, 127, 48, 50, 231, 129, 245 ));
   
   ------------------------------------------------------------------------
   type IUsbBulkInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPacketSize
   (
      This       : access IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointNumber
   (
      This       : access IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Pipe
   (
      This       : access IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbBulkInEndpointDescriptor : aliased constant Windows.IID := (1013860422, 1743, 17065, (157, 194, 151, 28, 27, 20, 182, 227 ));
   
   ------------------------------------------------------------------------
   type IUsbInterruptInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPacketSize
   (
      This       : access IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointNumber
   (
      This       : access IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Pipe
   (
      This       : access IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterruptInEndpointDescriptor : aliased constant Windows.IID := (3226634599, 51473, 19514, (134, 178, 65, 156, 45, 168, 144, 57 ));
   
   ------------------------------------------------------------------------
   type IUsbBulkOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPacketSize
   (
      This       : access IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointNumber
   (
      This       : access IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Pipe
   (
      This       : access IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbBulkOutEndpointDescriptor : aliased constant Windows.IID := (673219706, 65518, 20320, (155, 225, 149, 108, 172, 62, 203, 101 ));
   
   ------------------------------------------------------------------------
   type IUsbInterruptOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPacketSize
   (
      This       : access IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndpointNumber
   (
      This       : access IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Pipe
   (
      This       : access IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IUsbInterruptOutEndpointDescriptor : aliased constant Windows.IID := (3433033089, 4298, 17715, (149, 45, 158, 39, 131, 65, 232, 15 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IUsbDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUsbDevice_Interface
      ; handler : Windows.Devices.Usb.AsyncOperationCompletedHandler_IUsbDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUsbDevice_Interface
      ; RetVal : access Windows.Devices.Usb.AsyncOperationCompletedHandler_IUsbDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUsbDevice_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IUsbDevice : aliased constant Windows.IID := (557368813, 46874, 20838, (153, 72, 213, 87, 146, 116, 143, 92 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterface
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterface_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterface_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterface_Interface
      ; items : Windows.Devices.Usb.IUsbInterface_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterface : aliased constant Windows.IID := (560683615, 25571, 23195, (156, 153, 176, 156, 188, 15, 243, 177 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterface_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterface_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterface
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterface : aliased constant Windows.IID := (4114626541, 37609, 22797, (185, 4, 58, 215, 191, 169, 166, 33 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterface_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterface_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterface
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterface_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterface_Interface
      ; value : Windows.Devices.Usb.IUsbInterface
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterface_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterface_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterface : aliased constant Windows.IID := (2624187519, 11842, 22733, (167, 74, 244, 151, 72, 17, 19, 77 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbDescriptor_Interface
      ; items : Windows.Devices.Usb.IUsbDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbDescriptor : aliased constant Windows.IID := (1377147117, 359, 21134, (153, 13, 82, 171, 183, 18, 240, 114 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbDescriptor : aliased constant Windows.IID := (2560166309, 23043, 20987, (189, 148, 132, 218, 123, 218, 136, 25 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbDescriptor_Interface
      ; value : Windows.Devices.Usb.IUsbDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbDescriptor : aliased constant Windows.IID := (1409858210, 10526, 21370, (182, 31, 19, 112, 98, 247, 255, 125 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbBulkInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbBulkInPipe_Interface
      ; items : Windows.Devices.Usb.IUsbBulkInPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbBulkInPipe : aliased constant Windows.IID := (3618581595, 21133, 23739, (169, 151, 216, 48, 173, 231, 4, 199 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbBulkInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbBulkInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbBulkInPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbBulkInPipe : aliased constant Windows.IID := (570533489, 17106, 20621, (168, 72, 100, 181, 68, 112, 131, 200 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbBulkInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbBulkInPipe_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbBulkInPipe_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbBulkInPipe_Interface
      ; value : Windows.Devices.Usb.IUsbBulkInPipe
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbBulkInPipe_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbBulkInPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbBulkInPipe : aliased constant Windows.IID := (2839315644, 25732, 22873, (182, 26, 112, 60, 199, 17, 95, 111 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterruptInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterruptInPipe_Interface
      ; items : Windows.Devices.Usb.IUsbInterruptInPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterruptInPipe : aliased constant Windows.IID := (3819418048, 29942, 21138, (162, 42, 103, 42, 162, 180, 153, 133 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterruptInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterruptInPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterruptInPipe : aliased constant Windows.IID := (967766838, 6314, 23524, (134, 217, 227, 50, 254, 38, 50, 243 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterruptInPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterruptInPipe_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterruptInPipe_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterruptInPipe_Interface
      ; value : Windows.Devices.Usb.IUsbInterruptInPipe
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterruptInPipe_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterruptInPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterruptInPipe : aliased constant Windows.IID := (927372660, 46277, 23456, (150, 22, 137, 77, 216, 34, 255, 91 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbBulkOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbBulkOutPipe_Interface
      ; items : Windows.Devices.Usb.IUsbBulkOutPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbBulkOutPipe : aliased constant Windows.IID := (1188900714, 22331, 23621, (177, 104, 146, 35, 3, 132, 145, 221 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbBulkOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbBulkOutPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbBulkOutPipe : aliased constant Windows.IID := (2552548026, 23718, 23597, (128, 207, 25, 73, 2, 109, 120, 87 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbBulkOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbBulkOutPipe_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbBulkOutPipe_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbBulkOutPipe_Interface
      ; value : Windows.Devices.Usb.IUsbBulkOutPipe
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbBulkOutPipe_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbBulkOutPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbBulkOutPipe : aliased constant Windows.IID := (176633106, 5617, 24206, (167, 42, 4, 92, 253, 122, 94, 131 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterruptOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterruptOutPipe_Interface
      ; items : Windows.Devices.Usb.IUsbInterruptOutPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterruptOutPipe : aliased constant Windows.IID := (3419986088, 8838, 23741, (166, 228, 150, 39, 66, 255, 217, 26 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterruptOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterruptOutPipe
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterruptOutPipe : aliased constant Windows.IID := (3860463902, 19134, 21490, (131, 179, 237, 74, 148, 157, 46, 63 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterruptOutPipe_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterruptOutPipe_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutPipe
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterruptOutPipe_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterruptOutPipe_Interface
      ; value : Windows.Devices.Usb.IUsbInterruptOutPipe
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterruptOutPipe_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterruptOutPipe_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterruptOutPipe : aliased constant Windows.IID := (1954649800, 33727, 24259, (141, 40, 163, 17, 43, 62, 227, 204 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterfaceSetting_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterfaceSetting
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterfaceSetting_Interface
      ; items : Windows.Devices.Usb.IUsbInterfaceSetting_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterfaceSetting : aliased constant Windows.IID := (1898348231, 22167, 24042, (178, 248, 20, 207, 105, 142, 192, 173 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterfaceSetting_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterfaceSetting
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterfaceSetting : aliased constant Windows.IID := (447698745, 39980, 21310, (160, 233, 213, 63, 219, 69, 209, 93 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterfaceSetting_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterfaceSetting_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterfaceSetting
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterfaceSetting_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterfaceSetting_Interface
      ; value : Windows.Devices.Usb.IUsbInterfaceSetting
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterfaceSetting_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterfaceSetting_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterfaceSetting : aliased constant Windows.IID := (1897482999, 30658, 21717, (161, 22, 40, 127, 11, 127, 213, 63 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbBulkInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbBulkInEndpointDescriptor_Interface
      ; items : Windows.Devices.Usb.IUsbBulkInEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbBulkInEndpointDescriptor : aliased constant Windows.IID := (3931181104, 35268, 20541, (140, 175, 102, 127, 66, 48, 210, 169 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbBulkInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbBulkInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbBulkInEndpointDescriptor : aliased constant Windows.IID := (270213081, 61897, 24026, (154, 212, 113, 23, 111, 168, 57, 178 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbBulkInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbBulkInEndpointDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbBulkInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbBulkInEndpointDescriptor_Interface
      ; value : Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbBulkInEndpointDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbBulkInEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbBulkInEndpointDescriptor : aliased constant Windows.IID := (2624171128, 12446, 22371, (175, 38, 151, 6, 255, 164, 126, 192 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterruptInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterruptInEndpointDescriptor_Interface
      ; items : Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterruptInEndpointDescriptor : aliased constant Windows.IID := (1729581071, 60444, 23314, (191, 51, 14, 62, 61, 36, 69, 135 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterruptInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterruptInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterruptInEndpointDescriptor : aliased constant Windows.IID := (2323360873, 7952, 22983, (152, 55, 114, 207, 237, 113, 84, 164 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterruptInEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterruptInEndpointDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterruptInEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterruptInEndpointDescriptor_Interface
      ; value : Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterruptInEndpointDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterruptInEndpointDescriptor : aliased constant Windows.IID := (1070069904, 8590, 20567, (144, 77, 99, 135, 197, 145, 204, 147 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbBulkOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbBulkOutEndpointDescriptor_Interface
      ; items : Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbBulkOutEndpointDescriptor : aliased constant Windows.IID := (2830670515, 34877, 21345, (153, 3, 244, 137, 204, 98, 190, 165 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbBulkOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbBulkOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbBulkOutEndpointDescriptor : aliased constant Windows.IID := (3087788857, 25267, 24409, (179, 231, 136, 44, 201, 197, 176, 192 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbBulkOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbBulkOutEndpointDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbBulkOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbBulkOutEndpointDescriptor_Interface
      ; value : Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbBulkOutEndpointDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbBulkOutEndpointDescriptor : aliased constant Windows.IID := (581252726, 41962, 24013, (187, 57, 178, 138, 83, 39, 196, 163 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUsbInterruptOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUsbInterruptOutEndpointDescriptor_Interface
      ; items : Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUsbInterruptOutEndpointDescriptor : aliased constant Windows.IID := (1264854747, 56114, 23377, (173, 173, 4, 83, 46, 169, 74, 205 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUsbInterruptOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.Devices.Usb.IIterator_IUsbInterruptOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUsbInterruptOutEndpointDescriptor : aliased constant Windows.IID := (154746210, 8982, 21355, (138, 16, 112, 56, 136, 74, 178, 167 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUsbInterruptOutEndpointDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUsbInterruptOutEndpointDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUsbInterruptOutEndpointDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUsbInterruptOutEndpointDescriptor_Interface
      ; value : Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUsbInterruptOutEndpointDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUsbInterruptOutEndpointDescriptor : aliased constant Windows.IID := (2555280917, 50604, 20800, (163, 192, 181, 131, 25, 0, 133, 215 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUsbDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Usb.IAsyncOperation_IUsbDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUsbDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUsbDevice_Interface
      ; asyncInfo : Windows.Devices.Usb.IAsyncOperation_IUsbDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUsbDevice : aliased constant Windows.IID := (1932600655, 27823, 22653, (156, 42, 1, 140, 102, 211, 18, 219 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface(Callback : access procedure (sender : Windows.Devices.Usb.IUsbInterruptInPipe ; args : Windows.Devices.Usb.IUsbInterruptInEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface
      ; sender : Windows.Devices.Usb.IUsbInterruptInPipe
      ; args : Windows.Devices.Usb.IUsbInterruptInEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IUsbInterruptInPipe_add_DataReceived : aliased constant Windows.IID := (3873150025, 62314, 20722, (146, 108, 42, 253, 133, 196, 159, 1 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UsbControlRequestType is Windows.Devices.Usb.IUsbControlRequestType;
   
   function CreateUsbControlRequestType return Windows.Devices.Usb.IUsbControlRequestType;
   
   subtype UsbSetupPacket is Windows.Devices.Usb.IUsbSetupPacket;
   
   function CreateWithEightByteBuffer
   (
      eightByteBuffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Usb.IUsbSetupPacket;
   
   subtype UsbDeviceClass is Windows.Devices.Usb.IUsbDeviceClass;
   
   function CreateUsbDeviceClass return Windows.Devices.Usb.IUsbDeviceClass;
   
   subtype UsbDeviceClasses is Windows.Devices.Usb.IUsbDeviceClasses;
   subtype UsbDevice is Windows.Devices.Usb.IUsbDevice;
   subtype UsbInterface is Windows.Devices.Usb.IUsbInterface;
   subtype UsbDeviceDescriptor is Windows.Devices.Usb.IUsbDeviceDescriptor;
   subtype UsbConfiguration is Windows.Devices.Usb.IUsbConfiguration;
   subtype UsbDescriptor is Windows.Devices.Usb.IUsbDescriptor;
   subtype UsbConfigurationDescriptor is Windows.Devices.Usb.IUsbConfigurationDescriptor;
   subtype UsbInterfaceDescriptor is Windows.Devices.Usb.IUsbInterfaceDescriptor;
   subtype UsbBulkInEndpointDescriptor is Windows.Devices.Usb.IUsbBulkInEndpointDescriptor;
   subtype UsbInterruptInEndpointDescriptor is Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor;
   subtype UsbBulkOutEndpointDescriptor is Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor;
   subtype UsbInterruptOutEndpointDescriptor is Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor;
   subtype UsbEndpointDescriptor is Windows.Devices.Usb.IUsbEndpointDescriptor;
   subtype UsbInterruptInEventArgs is Windows.Devices.Usb.IUsbInterruptInEventArgs;
   subtype UsbInterruptInPipe is Windows.Devices.Usb.IUsbInterruptInPipe;
   subtype UsbBulkInPipe is Windows.Devices.Usb.IUsbBulkInPipe;
   subtype UsbBulkOutPipe is Windows.Devices.Usb.IUsbBulkOutPipe;
   subtype UsbInterruptOutPipe is Windows.Devices.Usb.IUsbInterruptOutPipe;
   subtype UsbInterfaceSetting is Windows.Devices.Usb.IUsbInterfaceSetting;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_CdcControl
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_Physical
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_PersonalHealthcare
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_ActiveSync
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_PalmSync
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_DeviceFirmwareUpdate
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_Irda
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_Measurement
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function get_VendorSpecific
   return Windows.Devices.Usb.IUsbDeviceClass;
   
   function GetDeviceSelector
   (
      vendorId : Windows.UInt32
      ; productId : Windows.UInt32
      ; winUsbInterfaceClass : Windows.Guid
   )
   return Windows.String;
   
   function GetDeviceSelectorGuidOnly
   (
      winUsbInterfaceClass : Windows.Guid
   )
   return Windows.String;
   
   function GetDeviceSelectorVidPidOnly
   (
      vendorId : Windows.UInt32
      ; productId : Windows.UInt32
   )
   return Windows.String;
   
   function GetDeviceClassSelector
   (
      usbClass : Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Usb.IAsyncOperation_IUsbDevice;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbConfigurationDescriptor
   )
   return Windows.Boolean;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbConfigurationDescriptor;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbInterfaceDescriptor
   )
   return Windows.Boolean;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbInterfaceDescriptor;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbEndpointDescriptor
   )
   return Windows.Boolean;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbEndpointDescriptor;

end;
