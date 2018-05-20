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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.Devices.PointOfService.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BarcodeScannerTriggerState is (
      Released,
      Pressed
   );
   for BarcodeScannerTriggerState use (
      Released => 0,
      Pressed => 1
   );
   for BarcodeScannerTriggerState'Size use 32;
   
   type BarcodeScannerTriggerState_Ptr is access BarcodeScannerTriggerState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Interface;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Interface'Class;
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Ptr is access all TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBarcodeScannerEnableScannerRequest_Interface;
   type IBarcodeScannerEnableScannerRequest is access all IBarcodeScannerEnableScannerRequest_Interface'Class;
   type IBarcodeScannerEnableScannerRequest_Ptr is access all IBarcodeScannerEnableScannerRequest;
   type IBarcodeScannerEnableScannerRequestEventArgs_Interface;
   type IBarcodeScannerEnableScannerRequestEventArgs is access all IBarcodeScannerEnableScannerRequestEventArgs_Interface'Class;
   type IBarcodeScannerEnableScannerRequestEventArgs_Ptr is access all IBarcodeScannerEnableScannerRequestEventArgs;
   type IBarcodeScannerDisableScannerRequest_Interface;
   type IBarcodeScannerDisableScannerRequest is access all IBarcodeScannerDisableScannerRequest_Interface'Class;
   type IBarcodeScannerDisableScannerRequest_Ptr is access all IBarcodeScannerDisableScannerRequest;
   type IBarcodeScannerDisableScannerRequestEventArgs_Interface;
   type IBarcodeScannerDisableScannerRequestEventArgs is access all IBarcodeScannerDisableScannerRequestEventArgs_Interface'Class;
   type IBarcodeScannerDisableScannerRequestEventArgs_Ptr is access all IBarcodeScannerDisableScannerRequestEventArgs;
   type IBarcodeScannerSetActiveSymbologiesRequest_Interface;
   type IBarcodeScannerSetActiveSymbologiesRequest is access all IBarcodeScannerSetActiveSymbologiesRequest_Interface'Class;
   type IBarcodeScannerSetActiveSymbologiesRequest_Ptr is access all IBarcodeScannerSetActiveSymbologiesRequest;
   type IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Interface;
   type IBarcodeScannerSetActiveSymbologiesRequestEventArgs is access all IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Interface'Class;
   type IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Ptr is access all IBarcodeScannerSetActiveSymbologiesRequestEventArgs;
   type IBarcodeScannerStartSoftwareTriggerRequest_Interface;
   type IBarcodeScannerStartSoftwareTriggerRequest is access all IBarcodeScannerStartSoftwareTriggerRequest_Interface'Class;
   type IBarcodeScannerStartSoftwareTriggerRequest_Ptr is access all IBarcodeScannerStartSoftwareTriggerRequest;
   type IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Interface;
   type IBarcodeScannerStartSoftwareTriggerRequestEventArgs is access all IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Interface'Class;
   type IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Ptr is access all IBarcodeScannerStartSoftwareTriggerRequestEventArgs;
   type IBarcodeScannerStopSoftwareTriggerRequest_Interface;
   type IBarcodeScannerStopSoftwareTriggerRequest is access all IBarcodeScannerStopSoftwareTriggerRequest_Interface'Class;
   type IBarcodeScannerStopSoftwareTriggerRequest_Ptr is access all IBarcodeScannerStopSoftwareTriggerRequest;
   type IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Interface;
   type IBarcodeScannerStopSoftwareTriggerRequestEventArgs is access all IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Interface'Class;
   type IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Ptr is access all IBarcodeScannerStopSoftwareTriggerRequestEventArgs;
   type IBarcodeSymbologyAttributesBuilder_Interface;
   type IBarcodeSymbologyAttributesBuilder is access all IBarcodeSymbologyAttributesBuilder_Interface'Class;
   type IBarcodeSymbologyAttributesBuilder_Ptr is access all IBarcodeSymbologyAttributesBuilder;
   type IBarcodeScannerGetSymbologyAttributesRequest_Interface;
   type IBarcodeScannerGetSymbologyAttributesRequest is access all IBarcodeScannerGetSymbologyAttributesRequest_Interface'Class;
   type IBarcodeScannerGetSymbologyAttributesRequest_Ptr is access all IBarcodeScannerGetSymbologyAttributesRequest;
   type IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Interface;
   type IBarcodeScannerGetSymbologyAttributesRequestEventArgs is access all IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Interface'Class;
   type IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Ptr is access all IBarcodeScannerGetSymbologyAttributesRequestEventArgs;
   type IBarcodeScannerSetSymbologyAttributesRequest_Interface;
   type IBarcodeScannerSetSymbologyAttributesRequest is access all IBarcodeScannerSetSymbologyAttributesRequest_Interface'Class;
   type IBarcodeScannerSetSymbologyAttributesRequest_Ptr is access all IBarcodeScannerSetSymbologyAttributesRequest;
   type IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Interface;
   type IBarcodeScannerSetSymbologyAttributesRequestEventArgs is access all IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Interface'Class;
   type IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Ptr is access all IBarcodeScannerSetSymbologyAttributesRequestEventArgs;
   type IBarcodeScannerHideVideoPreviewRequest_Interface;
   type IBarcodeScannerHideVideoPreviewRequest is access all IBarcodeScannerHideVideoPreviewRequest_Interface'Class;
   type IBarcodeScannerHideVideoPreviewRequest_Ptr is access all IBarcodeScannerHideVideoPreviewRequest;
   type IBarcodeScannerHideVideoPreviewRequestEventArgs_Interface;
   type IBarcodeScannerHideVideoPreviewRequestEventArgs is access all IBarcodeScannerHideVideoPreviewRequestEventArgs_Interface'Class;
   type IBarcodeScannerHideVideoPreviewRequestEventArgs_Ptr is access all IBarcodeScannerHideVideoPreviewRequestEventArgs;
   type IBarcodeScannerProviderConnection_Interface;
   type IBarcodeScannerProviderConnection is access all IBarcodeScannerProviderConnection_Interface'Class;
   type IBarcodeScannerProviderConnection_Ptr is access all IBarcodeScannerProviderConnection;
   type IBarcodeScannerProviderTriggerDetails_Interface;
   type IBarcodeScannerProviderTriggerDetails is access all IBarcodeScannerProviderTriggerDetails_Interface'Class;
   type IBarcodeScannerProviderTriggerDetails_Ptr is access all IBarcodeScannerProviderTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerEnableScannerRequest : aliased constant Windows.IID := (3233016250, 33130, 17707, (189, 119, 183, 228, 83, 236, 68, 109 ));
   
   type IBarcodeScannerEnableScannerRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerEnableScannerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerEnableScannerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerEnableScannerRequestEventArgs : aliased constant Windows.IID := (2506920985, 31566, 17489, (140, 65, 142, 16, 207, 188, 91, 65 ));
   
   type IBarcodeScannerEnableScannerRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerEnableScannerRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerEnableScannerRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerDisableScannerRequest : aliased constant Windows.IID := (2297231296, 14265, 17013, (142, 119, 200, 229, 42, 229, 169, 200 ));
   
   type IBarcodeScannerDisableScannerRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerDisableScannerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerDisableScannerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerDisableScannerRequestEventArgs : aliased constant Windows.IID := (1879499074, 59394, 18165, (182, 4, 53, 42, 21, 206, 146, 50 ));
   
   type IBarcodeScannerDisableScannerRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerDisableScannerRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerDisableScannerRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerSetActiveSymbologiesRequest : aliased constant Windows.IID := (3678352057, 63450, 16801, (159, 121, 7, 188, 217, 95, 11, 223 ));
   
   type IBarcodeScannerSetActiveSymbologiesRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Symbologies
   (
      This       : access IBarcodeScannerSetActiveSymbologiesRequest_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerSetActiveSymbologiesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerSetActiveSymbologiesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerSetActiveSymbologiesRequestEventArgs : aliased constant Windows.IID := (103832314, 31734, 19794, (128, 26, 51, 2, 114, 246, 10, 225 ));
   
   type IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerSetActiveSymbologiesRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStartSoftwareTriggerRequest : aliased constant Windows.IID := (3824843559, 65378, 17492, (175, 74, 203, 97, 68, 163, 227, 247 ));
   
   type IBarcodeScannerStartSoftwareTriggerRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerStartSoftwareTriggerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerStartSoftwareTriggerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStartSoftwareTriggerRequestEventArgs : aliased constant Windows.IID := (587585603, 51343, 20283, (140, 59, 211, 223, 7, 16, 81, 236 ));
   
   type IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerStartSoftwareTriggerRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStopSoftwareTriggerRequest : aliased constant Windows.IID := (1872736053, 57991, 19624, (183, 13, 90, 145, 214, 148, 246, 104 ));
   
   type IBarcodeScannerStopSoftwareTriggerRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerStopSoftwareTriggerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerStopSoftwareTriggerRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStopSoftwareTriggerRequestEventArgs : aliased constant Windows.IID := (3938665552, 20151, 18458, (146, 115, 20, 122, 39, 59, 153, 184 ));
   
   type IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerStopSoftwareTriggerRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeSymbologyAttributesBuilder : aliased constant Windows.IID := (3313175743, 58613, 16569, (132, 207, 230, 63, 186, 234, 66, 180 ));
   
   type IBarcodeSymbologyAttributesBuilder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCheckDigitValidationSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCheckDigitValidationSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCheckDigitTransmissionSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCheckDigitTransmissionSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDecodeLengthSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDecodeLengthSupported
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CreateAttributes
   (
      This       : access IBarcodeSymbologyAttributesBuilder_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeSymbologyAttributes
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerGetSymbologyAttributesRequest : aliased constant Windows.IID := (2541012074, 22756, 19551, (184, 233, 228, 20, 103, 99, 39, 0 ));
   
   type IBarcodeScannerGetSymbologyAttributesRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Symbology
   (
      This       : access IBarcodeScannerGetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerGetSymbologyAttributesRequest_Interface
      ; attributes : Windows.Devices.PointOfService.IBarcodeSymbologyAttributes
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerGetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerGetSymbologyAttributesRequestEventArgs : aliased constant Windows.IID := (2139741758, 64349, 18748, (180, 2, 53, 107, 36, 213, 116, 166 ));
   
   type IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerGetSymbologyAttributesRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerSetSymbologyAttributesRequest : aliased constant Windows.IID := (855343439, 41855, 18608, (172, 234, 220, 225, 72, 15, 18, 174 ));
   
   type IBarcodeScannerSetSymbologyAttributesRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Symbology
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Attributes
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeSymbologyAttributes
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerSetSymbologyAttributesRequestEventArgs : aliased constant Windows.IID := (2998441993, 38948, 18388, (133, 189, 208, 7, 123, 170, 123, 210 ));
   
   type IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerSetSymbologyAttributesRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerHideVideoPreviewRequest : aliased constant Windows.IID := (4199464575, 26224, 16609, (185, 11, 187, 16, 216, 212, 37, 250 ));
   
   type IBarcodeScannerHideVideoPreviewRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompletedAsync
   (
      This       : access IBarcodeScannerHideVideoPreviewRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IBarcodeScannerHideVideoPreviewRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerHideVideoPreviewRequestEventArgs : aliased constant Windows.IID := (379748860, 54974, 19399, (157, 241, 51, 116, 31, 62, 173, 234 ));
   
   type IBarcodeScannerHideVideoPreviewRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IBarcodeScannerHideVideoPreviewRequestEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBarcodeScannerHideVideoPreviewRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerProviderConnection : aliased constant Windows.IID := (3024800749, 2874, 20387, (134, 197, 73, 30, 163, 7, 128, 235 ));
   
   type IBarcodeScannerProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceId
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedSymbologies
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CompanyName
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CompanyName
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Version
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IBarcodeScannerProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportScannedDataAsync
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; report : Windows.Devices.PointOfService.IBarcodeScannerReport
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportTriggerStateAsync
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; state : Windows.Devices.PointOfService.Provider.BarcodeScannerTriggerState
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportErrorAsync
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; errorData : Windows.Devices.PointOfService.IUnifiedPosErrorData
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportErrorAsyncWithScanReport
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; errorData : Windows.Devices.PointOfService.IUnifiedPosErrorData
      ; isRetriable : Windows.Boolean
      ; scanReport : Windows.Devices.PointOfService.IBarcodeScannerReport
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_EnableScannerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnableScannerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisableScannerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisableScannerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SetActiveSymbologiesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SetActiveSymbologiesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StartSoftwareTriggerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StartSoftwareTriggerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StopSoftwareTriggerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StopSoftwareTriggerRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GetBarcodeSymbologyAttributesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GetBarcodeSymbologyAttributesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SetBarcodeSymbologyAttributesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SetBarcodeSymbologyAttributesRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HideVideoPreviewRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; handler : TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HideVideoPreviewRequested
   (
      This       : access IBarcodeScannerProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerProviderTriggerDetails : aliased constant Windows.IID := (1350921602, 9443, 18638, (153, 199, 112, 170, 193, 203, 201, 247 ));
   
   type IBarcodeScannerProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IBarcodeScannerProviderTriggerDetails_Interface
      ; RetVal : access Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested : aliased constant Windows.IID := (1156686556, 16170, 21304, (181, 142, 252, 194, 112, 157, 7, 167 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested : aliased constant Windows.IID := (3624008863, 34079, 23178, (149, 88, 163, 223, 120, 3, 57, 176 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested : aliased constant Windows.IID := (2646859344, 55030, 22706, (144, 147, 214, 9, 11, 131, 35, 254 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested : aliased constant Windows.IID := (371330681, 35587, 21656, (153, 131, 185, 53, 104, 146, 22, 118 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested : aliased constant Windows.IID := (3600137843, 49041, 20534, (149, 210, 21, 144, 50, 201, 76, 179 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested : aliased constant Windows.IID := (3851483572, 5249, 22853, (181, 189, 10, 180, 177, 10, 75, 95 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested : aliased constant Windows.IID := (211489776, 23967, 22218, (137, 137, 7, 70, 189, 129, 26, 33 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested : aliased constant Windows.IID := (4083653892, 55001, 24213, (182, 116, 17, 53, 191, 212, 244, 47 ));
   
   type TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BarcodeScannerEnableScannerRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequest;
   subtype BarcodeScannerEnableScannerRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequestEventArgs;
   subtype BarcodeScannerDisableScannerRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequest;
   subtype BarcodeScannerDisableScannerRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequestEventArgs;
   subtype BarcodeScannerSetActiveSymbologiesRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequest;
   subtype BarcodeScannerSetActiveSymbologiesRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequestEventArgs;
   subtype BarcodeScannerStartSoftwareTriggerRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequest;
   subtype BarcodeScannerStartSoftwareTriggerRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequestEventArgs;
   subtype BarcodeScannerStopSoftwareTriggerRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequest;
   subtype BarcodeScannerStopSoftwareTriggerRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequestEventArgs;
   subtype BarcodeSymbologyAttributesBuilder is Windows.Devices.PointOfService.Provider.IBarcodeSymbologyAttributesBuilder;
   function Create return Windows.Devices.PointOfService.Provider.IBarcodeSymbologyAttributesBuilder;
   
   subtype BarcodeScannerGetSymbologyAttributesRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequest;
   subtype BarcodeScannerGetSymbologyAttributesRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequestEventArgs;
   subtype BarcodeScannerSetSymbologyAttributesRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequest;
   subtype BarcodeScannerSetSymbologyAttributesRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequestEventArgs;
   subtype BarcodeScannerHideVideoPreviewRequest is Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequest;
   subtype BarcodeScannerHideVideoPreviewRequestEventArgs is Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequestEventArgs;
   subtype BarcodeScannerProviderConnection is Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection;
   subtype BarcodeScannerProviderTriggerDetails is Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;