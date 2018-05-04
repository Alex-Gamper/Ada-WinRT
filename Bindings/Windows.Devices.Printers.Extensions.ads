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
package Windows.Devices.Printers.Extensions is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type Print3DWorkflowStatus is (
      Abandoned,
      Canceled,
      Failed,
      Slicing,
      Submitted
   );
   for Print3DWorkflowStatus use (
      Abandoned => 0,
      Canceled => 1,
      Failed => 2,
      Slicing => 3,
      Submitted => 4
   );
   for Print3DWorkflowStatus'Size use 32;
   
   type Print3DWorkflowStatus_Ptr is access Print3DWorkflowStatus;
   
   type Print3DWorkflowDetail is (
      Unknown,
      ModelExceedsPrintBed,
      UploadFailed,
      InvalidMaterialSelection,
      InvalidModel,
      ModelNotManifold,
      InvalidPrintTicket
   );
   for Print3DWorkflowDetail use (
      Unknown => 0,
      ModelExceedsPrintBed => 1,
      UploadFailed => 2,
      InvalidMaterialSelection => 3,
      InvalidModel => 4,
      ModelNotManifold => 5,
      InvalidPrintTicket => 6
   );
   for Print3DWorkflowDetail'Size use 32;
   
   type Print3DWorkflowDetail_Ptr is access Print3DWorkflowDetail;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ExtensionsContract is null record;
   pragma Convention (C_Pass_By_Copy , ExtensionsContract);
   
   type ExtensionsContract_Ptr is access ExtensionsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Interface;
   type TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested is access all TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Interface'Class;
   type TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Ptr is access all TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested;
   type TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Interface;
   type TypedEventHandler_IPrint3DWorkflow_add_PrintRequested is access all TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Interface'Class;
   type TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Ptr is access all TypedEventHandler_IPrint3DWorkflow_add_PrintRequested;
   type TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Interface;
   type TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged is access all TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Interface'Class;
   type TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Ptr is access all TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrintTaskConfigurationSaveRequestedDeferral_Interface;
   type IPrintTaskConfigurationSaveRequestedDeferral is access all IPrintTaskConfigurationSaveRequestedDeferral_Interface'Class;
   type IPrintTaskConfigurationSaveRequestedDeferral_Ptr is access all IPrintTaskConfigurationSaveRequestedDeferral;
   type IPrintTaskConfigurationSaveRequest_Interface;
   type IPrintTaskConfigurationSaveRequest is access all IPrintTaskConfigurationSaveRequest_Interface'Class;
   type IPrintTaskConfigurationSaveRequest_Ptr is access all IPrintTaskConfigurationSaveRequest;
   type IPrintTaskConfigurationSaveRequestedEventArgs_Interface;
   type IPrintTaskConfigurationSaveRequestedEventArgs is access all IPrintTaskConfigurationSaveRequestedEventArgs_Interface'Class;
   type IPrintTaskConfigurationSaveRequestedEventArgs_Ptr is access all IPrintTaskConfigurationSaveRequestedEventArgs;
   type IPrintTaskConfiguration_Interface;
   type IPrintTaskConfiguration is access all IPrintTaskConfiguration_Interface'Class;
   type IPrintTaskConfiguration_Ptr is access all IPrintTaskConfiguration;
   type IPrintNotificationEventDetails_Interface;
   type IPrintNotificationEventDetails is access all IPrintNotificationEventDetails_Interface'Class;
   type IPrintNotificationEventDetails_Ptr is access all IPrintNotificationEventDetails;
   type IPrintExtensionContextStatic_Interface;
   type IPrintExtensionContextStatic is access all IPrintExtensionContextStatic_Interface'Class;
   type IPrintExtensionContextStatic_Ptr is access all IPrintExtensionContextStatic;
   type IPrint3DWorkflowPrintRequestedEventArgs_Interface;
   type IPrint3DWorkflowPrintRequestedEventArgs is access all IPrint3DWorkflowPrintRequestedEventArgs_Interface'Class;
   type IPrint3DWorkflowPrintRequestedEventArgs_Ptr is access all IPrint3DWorkflowPrintRequestedEventArgs;
   type IPrint3DWorkflowPrinterChangedEventArgs_Interface;
   type IPrint3DWorkflowPrinterChangedEventArgs is access all IPrint3DWorkflowPrinterChangedEventArgs_Interface'Class;
   type IPrint3DWorkflowPrinterChangedEventArgs_Ptr is access all IPrint3DWorkflowPrinterChangedEventArgs;
   type IPrint3DWorkflow_Interface;
   type IPrint3DWorkflow is access all IPrint3DWorkflow_Interface'Class;
   type IPrint3DWorkflow_Ptr is access all IPrint3DWorkflow;
   type IPrint3DWorkflow2_Interface;
   type IPrint3DWorkflow2 is access all IPrint3DWorkflow2_Interface'Class;
   type IPrint3DWorkflow2_Ptr is access all IPrint3DWorkflow2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskConfigurationSaveRequestedDeferral : aliased constant Windows.IID := (3914978664, 63273, 17572, (135, 29, 189, 6, 40, 105, 106, 51 ));
   
   type IPrintTaskConfigurationSaveRequestedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPrintTaskConfigurationSaveRequestedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskConfigurationSaveRequest : aliased constant Windows.IID := (4004458443, 25118, 19298, (172, 119, 178, 129, 204, 224, 141, 96 ));
   
   type IPrintTaskConfigurationSaveRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function Cancel
   (
      This       : access IPrintTaskConfigurationSaveRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Save
   (
      This       : access IPrintTaskConfigurationSaveRequest_Interface
      ; printerExtensionContext : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintTaskConfigurationSaveRequest_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IPrintTaskConfigurationSaveRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskConfigurationSaveRequestedEventArgs : aliased constant Windows.IID := (3765184633, 3425, 18744, (145, 208, 150, 164, 91, 238, 132, 121 ));
   
   type IPrintTaskConfigurationSaveRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IPrintTaskConfigurationSaveRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskConfiguration : aliased constant Windows.IID := (3821151313, 15012, 18565, (146, 64, 49, 31, 95, 143, 190, 157 ));
   
   type IPrintTaskConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrinterExtensionContext
   (
      This       : access IPrintTaskConfiguration_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_SaveRequested
   (
      This       : access IPrintTaskConfiguration_Interface
      ; eventHandler : TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SaveRequested
   (
      This       : access IPrintTaskConfiguration_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintNotificationEventDetails : aliased constant Windows.IID := (3759033482, 18472, 19873, (139, 184, 134, 114, 223, 133, 21, 231 ));
   
   type IPrintNotificationEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrinterName
   (
      This       : access IPrintNotificationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EventData
   (
      This       : access IPrintNotificationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EventData
   (
      This       : access IPrintNotificationEventDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintExtensionContextStatic : aliased constant Windows.IID := (3876429761, 65401, 19108, (140, 155, 12, 147, 174, 223, 222, 138 ));
   
   type IPrintExtensionContextStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function FromDeviceId
   (
      This       : access IPrintExtensionContextStatic_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DWorkflowPrintRequestedEventArgs : aliased constant Windows.IID := (435734616, 23240, 19285, (138, 95, 230, 21, 103, 218, 251, 77 ));
   
   type IPrint3DWorkflowPrintRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPrint3DWorkflowPrintRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.Print3DWorkflowStatus
   )
   return Windows.HRESULT is abstract;
   
   function SetExtendedStatus
   (
      This       : access IPrint3DWorkflowPrintRequestedEventArgs_Interface
      ; value : Windows.Devices.Printers.Extensions.Print3DWorkflowDetail
   )
   return Windows.HRESULT is abstract;
   
   function SetSource
   (
      This       : access IPrint3DWorkflowPrintRequestedEventArgs_Interface
      ; source : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetSourceChanged
   (
      This       : access IPrint3DWorkflowPrintRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DWorkflowPrinterChangedEventArgs : aliased constant Windows.IID := (1159881730, 38396, 18503, (147, 179, 19, 77, 191, 92, 96, 247 ));
   
   type IPrint3DWorkflowPrinterChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewDeviceId
   (
      This       : access IPrint3DWorkflowPrinterChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DWorkflow : aliased constant Windows.IID := (3312415933, 13929, 19046, (171, 66, 200, 21, 25, 48, 205, 52 ));
   
   type IPrint3DWorkflow_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceID
   (
      This       : access IPrint3DWorkflow_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetPrintModelPackage
   (
      This       : access IPrint3DWorkflow_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPrintReady
   (
      This       : access IPrint3DWorkflow_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPrintReady
   (
      This       : access IPrint3DWorkflow_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_PrintRequested
   (
      This       : access IPrint3DWorkflow_Interface
      ; eventHandler : TypedEventHandler_IPrint3DWorkflow_add_PrintRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PrintRequested
   (
      This       : access IPrint3DWorkflow_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DWorkflow2 : aliased constant Windows.IID := (2728838479, 35521, 18712, (151, 65, 227, 79, 48, 4, 35, 158 ));
   
   type IPrint3DWorkflow2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PrinterChanged
   (
      This       : access IPrint3DWorkflow2_Interface
      ; eventHandler : TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PrinterChanged
   (
      This       : access IPrint3DWorkflow2_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested : aliased constant Windows.IID := (56882554, 47010, 24096, (161, 86, 37, 52, 35, 231, 238, 64 ));
   
   type TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Interface(Callback : access procedure (sender : Windows.Devices.Printers.Extensions.IPrintTaskConfiguration ; args : Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrintTaskConfiguration
      ; args : Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DWorkflow_add_PrintRequested : aliased constant Windows.IID := (1598842371, 21778, 22954, (141, 150, 177, 56, 157, 139, 87, 150 ));
   
   type TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Interface(Callback : access procedure (sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrintRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DWorkflow_add_PrintRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow
      ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrintRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged : aliased constant Windows.IID := (3031817666, 6772, 22789, (159, 197, 221, 170, 233, 163, 171, 147 ));
   
   type TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Interface(Callback : access procedure (sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrinterChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow
      ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrinterChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintTaskConfigurationSaveRequestedDeferral is Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedDeferral;
   subtype PrintTaskConfigurationSaveRequest is Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequest;
   subtype PrintTaskConfigurationSaveRequestedEventArgs is Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedEventArgs;
   subtype PrintTaskConfiguration is Windows.Devices.Printers.Extensions.IPrintTaskConfiguration;
   subtype PrintNotificationEventDetails is Windows.Devices.Printers.Extensions.IPrintNotificationEventDetails;
   subtype Print3DWorkflowPrintRequestedEventArgs is Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrintRequestedEventArgs;
   subtype Print3DWorkflowPrinterChangedEventArgs is Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrinterChangedEventArgs;
   subtype Print3DWorkflow is Windows.Devices.Printers.Extensions.IPrint3DWorkflow;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromDeviceId
   (
      deviceId : Windows.String
   )
   return Windows.Object;
   
end;
