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
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Graphics.Imaging;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Devices.PointOfService is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UnifiedPosErrorSeverity is (
      UnknownErrorSeverity,
      Warning,
      Recoverable,
      Unrecoverable,
      AssistanceRequired,
      Fatal
   );
   for UnifiedPosErrorSeverity use (
      UnknownErrorSeverity => 0,
      Warning => 1,
      Recoverable => 2,
      Unrecoverable => 3,
      AssistanceRequired => 4,
      Fatal => 5
   );
   for UnifiedPosErrorSeverity'Size use 32;
   
   type UnifiedPosErrorSeverity_Ptr is access UnifiedPosErrorSeverity;
   
   type UnifiedPosPowerReportingType is (
      UnknownPowerReportingType,
      Standard_x,
      Advanced
   );
   for UnifiedPosPowerReportingType use (
      UnknownPowerReportingType => 0,
      Standard_x => 1,
      Advanced => 2
   );
   for UnifiedPosPowerReportingType'Size use 32;
   
   type UnifiedPosPowerReportingType_Ptr is access UnifiedPosPowerReportingType;
   
   type UnifiedPosHealthCheckLevel is (
      UnknownHealthCheckLevel,
      POSInternal,
      External,
      Interactive
   );
   for UnifiedPosHealthCheckLevel use (
      UnknownHealthCheckLevel => 0,
      POSInternal => 1,
      External => 2,
      Interactive => 3
   );
   for UnifiedPosHealthCheckLevel'Size use 32;
   
   type UnifiedPosHealthCheckLevel_Ptr is access UnifiedPosHealthCheckLevel;
   
   type UnifiedPosErrorReason is (
      UnknownErrorReason,
      NoService,
      Disabled,
      Illegal,
      NoHardware,
      Closed,
      Offline,
      Failure,
      Timeout,
      Busy,
      Extended
   );
   for UnifiedPosErrorReason use (
      UnknownErrorReason => 0,
      NoService => 1,
      Disabled => 2,
      Illegal => 3,
      NoHardware => 4,
      Closed => 5,
      Offline => 6,
      Failure => 7,
      Timeout => 8,
      Busy => 9,
      Extended => 10
   );
   for UnifiedPosErrorReason'Size use 32;
   
   type UnifiedPosErrorReason_Ptr is access UnifiedPosErrorReason;
   
   type MagneticStripeReaderAuthenticationLevel is (
      NotSupported,
      Optional,
      Required
   );
   for MagneticStripeReaderAuthenticationLevel use (
      NotSupported => 0,
      Optional => 1,
      Required => 2
   );
   for MagneticStripeReaderAuthenticationLevel'Size use 32;
   
   type MagneticStripeReaderAuthenticationLevel_Ptr is access MagneticStripeReaderAuthenticationLevel;
   
   type PosPrinterMapMode is (
      Dots,
      Twips,
      English,
      Metric
   );
   for PosPrinterMapMode use (
      Dots => 0,
      Twips => 1,
      English => 2,
      Metric => 3
   );
   for PosPrinterMapMode'Size use 32;
   
   type PosPrinterMapMode_Ptr is access PosPrinterMapMode;
   
   type PosPrinterCartridgeSensors is (
      None,
      Removed,
      Empty,
      HeadCleaning,
      NearEnd
   );
   for PosPrinterCartridgeSensors use (
      None => 0,
      Removed => 1,
      Empty => 2,
      HeadCleaning => 4,
      NearEnd => 8
   );
   for PosPrinterCartridgeSensors'Size use 32;
   
   type PosPrinterCartridgeSensors_Ptr is access PosPrinterCartridgeSensors;
   
   type PosPrinterColorCapabilities is (
      None,
      Primary,
      Custom1,
      Custom2,
      Custom3,
      Custom4,
      Custom5,
      Custom6,
      Cyan,
      Magenta,
      Yellow,
      Full
   );
   for PosPrinterColorCapabilities use (
      None => 0,
      Primary => 1,
      Custom1 => 2,
      Custom2 => 4,
      Custom3 => 8,
      Custom4 => 16,
      Custom5 => 32,
      Custom6 => 64,
      Cyan => 128,
      Magenta => 256,
      Yellow => 512,
      Full => 1024
   );
   for PosPrinterColorCapabilities'Size use 32;
   
   type PosPrinterColorCapabilities_Ptr is access PosPrinterColorCapabilities;
   
   type PosPrinterColorCartridge is (
      Unknown,
      Primary,
      Custom1,
      Custom2,
      Custom3,
      Custom4,
      Custom5,
      Custom6,
      Cyan,
      Magenta,
      Yellow
   );
   for PosPrinterColorCartridge use (
      Unknown => 0,
      Primary => 1,
      Custom1 => 2,
      Custom2 => 3,
      Custom3 => 4,
      Custom4 => 5,
      Custom5 => 6,
      Custom6 => 7,
      Cyan => 8,
      Magenta => 9,
      Yellow => 10
   );
   for PosPrinterColorCartridge'Size use 32;
   
   type PosPrinterColorCartridge_Ptr is access PosPrinterColorCartridge;
   
   type PosPrinterMarkFeedCapabilities is (
      None,
      ToTakeUp,
      ToCutter,
      ToCurrentTopOfForm,
      ToNextTopOfForm
   );
   for PosPrinterMarkFeedCapabilities use (
      None => 0,
      ToTakeUp => 1,
      ToCutter => 2,
      ToCurrentTopOfForm => 4,
      ToNextTopOfForm => 8
   );
   for PosPrinterMarkFeedCapabilities'Size use 32;
   
   type PosPrinterMarkFeedCapabilities_Ptr is access PosPrinterMarkFeedCapabilities;
   
   type PosPrinterRuledLineCapabilities is (
      None,
      Horizontal,
      Vertical
   );
   for PosPrinterRuledLineCapabilities use (
      None => 0,
      Horizontal => 1,
      Vertical => 2
   );
   for PosPrinterRuledLineCapabilities'Size use 32;
   
   type PosPrinterRuledLineCapabilities_Ptr is access PosPrinterRuledLineCapabilities;
   
   type PosPrinterPrintSide is (
      Unknown,
      Side1,
      Side2
   );
   for PosPrinterPrintSide use (
      Unknown => 0,
      Side1 => 1,
      Side2 => 2
   );
   for PosPrinterPrintSide'Size use 32;
   
   type PosPrinterPrintSide_Ptr is access PosPrinterPrintSide;
   
   type PosPrinterLineDirection is (
      Horizontal,
      Vertical
   );
   for PosPrinterLineDirection use (
      Horizontal => 0,
      Vertical => 1
   );
   for PosPrinterLineDirection'Size use 32;
   
   type PosPrinterLineDirection_Ptr is access PosPrinterLineDirection;
   
   type PosPrinterLineStyle is (
      SingleSolid,
      DoubleSolid,
      Broken,
      Chain
   );
   for PosPrinterLineStyle use (
      SingleSolid => 0,
      DoubleSolid => 1,
      Broken => 2,
      Chain => 3
   );
   for PosPrinterLineStyle'Size use 32;
   
   type PosPrinterLineStyle_Ptr is access PosPrinterLineStyle;
   
   type PosPrinterMarkFeedKind is (
      ToTakeUp,
      ToCutter,
      ToCurrentTopOfForm,
      ToNextTopOfForm
   );
   for PosPrinterMarkFeedKind use (
      ToTakeUp => 0,
      ToCutter => 1,
      ToCurrentTopOfForm => 2,
      ToNextTopOfForm => 3
   );
   for PosPrinterMarkFeedKind'Size use 32;
   
   type PosPrinterMarkFeedKind_Ptr is access PosPrinterMarkFeedKind;
   
   type PosPrinterAlignment is (
      Left,
      Center,
      Right
   );
   for PosPrinterAlignment use (
      Left => 0,
      Center => 1,
      Right => 2
   );
   for PosPrinterAlignment'Size use 32;
   
   type PosPrinterAlignment_Ptr is access PosPrinterAlignment;
   
   type PosPrinterBarcodeTextPosition is (
      None,
      Above,
      Below
   );
   for PosPrinterBarcodeTextPosition use (
      None => 0,
      Above => 1,
      Below => 2
   );
   for PosPrinterBarcodeTextPosition'Size use 32;
   
   type PosPrinterBarcodeTextPosition_Ptr is access PosPrinterBarcodeTextPosition;
   
   type PosPrinterRotation is (
      Normal,
      Right90,
      Left90,
      Rotate180
   );
   for PosPrinterRotation use (
      Normal => 0,
      Right90 => 1,
      Left90 => 2,
      Rotate180 => 3
   );
   for PosPrinterRotation'Size use 32;
   
   type PosPrinterRotation_Ptr is access PosPrinterRotation;
   
   type PosPrinterStatusKind is (
      Online,
      Off,
      Offline,
      OffOrOffline,
      Extended
   );
   for PosPrinterStatusKind use (
      Online => 0,
      Off => 1,
      Offline => 2,
      OffOrOffline => 3,
      Extended => 4
   );
   for PosPrinterStatusKind'Size use 32;
   
   type PosPrinterStatusKind_Ptr is access PosPrinterStatusKind;
   
   type CashDrawerStatusKind is (
      Online,
      Off,
      Offline,
      OffOrOffline,
      Extended
   );
   for CashDrawerStatusKind use (
      Online => 0,
      Off => 1,
      Offline => 2,
      OffOrOffline => 3,
      Extended => 4
   );
   for CashDrawerStatusKind'Size use 32;
   
   type CashDrawerStatusKind_Ptr is access CashDrawerStatusKind;
   
   type BarcodeScannerStatus is (
      Online,
      Off,
      Offline,
      OffOrOffline,
      Extended
   );
   for BarcodeScannerStatus use (
      Online => 0,
      Off => 1,
      Offline => 2,
      OffOrOffline => 3,
      Extended => 4
   );
   for BarcodeScannerStatus'Size use 32;
   
   type BarcodeScannerStatus_Ptr is access BarcodeScannerStatus;
   
   type LineDisplayPowerStatus is (
      Unknown,
      Online,
      Off,
      Offline,
      OffOrOffline
   );
   for LineDisplayPowerStatus use (
      Unknown => 0,
      Online => 1,
      Off => 2,
      Offline => 3,
      OffOrOffline => 4
   );
   for LineDisplayPowerStatus'Size use 32;
   
   type LineDisplayPowerStatus_Ptr is access LineDisplayPowerStatus;
   
   type LineDisplayHorizontalAlignment is (
      Left,
      Center,
      Right
   );
   for LineDisplayHorizontalAlignment use (
      Left => 0,
      Center => 1,
      Right => 2
   );
   for LineDisplayHorizontalAlignment'Size use 32;
   
   type LineDisplayHorizontalAlignment_Ptr is access LineDisplayHorizontalAlignment;
   
   type LineDisplayVerticalAlignment is (
      Top,
      Center,
      Bottom
   );
   for LineDisplayVerticalAlignment use (
      Top => 0,
      Center => 1,
      Bottom => 2
   );
   for LineDisplayVerticalAlignment'Size use 32;
   
   type LineDisplayVerticalAlignment_Ptr is access LineDisplayVerticalAlignment;
   
   type LineDisplayScrollDirection is (
      Up,
      Down,
      Left,
      Right
   );
   for LineDisplayScrollDirection use (
      Up => 0,
      Down => 1,
      Left => 2,
      Right => 3
   );
   for LineDisplayScrollDirection'Size use 32;
   
   type LineDisplayScrollDirection_Ptr is access LineDisplayScrollDirection;
   
   type LineDisplayTextAttribute is (
      Normal,
      Blink,
      Reverse_x,
      ReverseBlink
   );
   for LineDisplayTextAttribute use (
      Normal => 0,
      Blink => 1,
      Reverse_x => 2,
      ReverseBlink => 3
   );
   for LineDisplayTextAttribute'Size use 32;
   
   type LineDisplayTextAttribute_Ptr is access LineDisplayTextAttribute;
   
   type LineDisplayCursorType is (
      None,
      Block,
      HalfBlock,
      Underline,
      Reverse_x,
      Other
   );
   for LineDisplayCursorType use (
      None => 0,
      Block => 1,
      HalfBlock => 2,
      Underline => 3,
      Reverse_x => 4,
      Other => 5
   );
   for LineDisplayCursorType'Size use 32;
   
   type LineDisplayCursorType_Ptr is access LineDisplayCursorType;
   
   type LineDisplayMarqueeFormat is (
      None,
      Walk,
      Place
   );
   for LineDisplayMarqueeFormat use (
      None => 0,
      Walk => 1,
      Place => 2
   );
   for LineDisplayMarqueeFormat'Size use 32;
   
   type LineDisplayMarqueeFormat_Ptr is access LineDisplayMarqueeFormat;
   
   type LineDisplayDescriptorState is (
      Off,
      On,
      Blink
   );
   for LineDisplayDescriptorState use (
      Off => 0,
      On => 1,
      Blink => 2
   );
   for LineDisplayDescriptorState'Size use 32;
   
   type LineDisplayDescriptorState_Ptr is access LineDisplayDescriptorState;
   
   type LineDisplayTextAttributeGranularity is (
      NotSupported,
      EntireDisplay,
      PerCharacter
   );
   for LineDisplayTextAttributeGranularity use (
      NotSupported => 0,
      EntireDisplay => 1,
      PerCharacter => 2
   );
   for LineDisplayTextAttributeGranularity'Size use 32;
   
   type LineDisplayTextAttributeGranularity_Ptr is access LineDisplayTextAttributeGranularity;
   
   type PosConnectionTypes is (
      Local,
      IP,
      Bluetooth,
      All_x
   );
   for PosConnectionTypes use (
      Local => 1,
      IP => 2,
      Bluetooth => 4,
      All_x => 4294967295
   );
   for PosConnectionTypes'Size use 32;
   
   type PosConnectionTypes_Ptr is access PosConnectionTypes;
   
   type BarcodeSymbologyDecodeLengthKind is (
      AnyLength,
      Discrete,
      Range_x
   );
   for BarcodeSymbologyDecodeLengthKind use (
      AnyLength => 0,
      Discrete => 1,
      Range_x => 2
   );
   for BarcodeSymbologyDecodeLengthKind'Size use 32;
   
   type BarcodeSymbologyDecodeLengthKind_Ptr is access BarcodeSymbologyDecodeLengthKind;
   
   type MagneticStripeReaderStatus is (
      Unauthenticated,
      Authenticated,
      Extended
   );
   for MagneticStripeReaderStatus use (
      Unauthenticated => 0,
      Authenticated => 1,
      Extended => 2
   );
   for MagneticStripeReaderStatus'Size use 32;
   
   type MagneticStripeReaderStatus_Ptr is access MagneticStripeReaderStatus;
   
   type MagneticStripeReaderAuthenticationProtocol is (
      None,
      ChallengeResponse
   );
   for MagneticStripeReaderAuthenticationProtocol use (
      None => 0,
      ChallengeResponse => 1
   );
   for MagneticStripeReaderAuthenticationProtocol'Size use 32;
   
   type MagneticStripeReaderAuthenticationProtocol_Ptr is access MagneticStripeReaderAuthenticationProtocol;
   
   type MagneticStripeReaderTrackIds is (
      None,
      Track1,
      Track2,
      Track3,
      Track4
   );
   for MagneticStripeReaderTrackIds use (
      None => 0,
      Track1 => 1,
      Track2 => 2,
      Track3 => 4,
      Track4 => 8
   );
   for MagneticStripeReaderTrackIds'Size use 32;
   
   type MagneticStripeReaderTrackIds_Ptr is access MagneticStripeReaderTrackIds;
   
   type MagneticStripeReaderErrorReportingType is (
      CardLevel,
      TrackLevel
   );
   for MagneticStripeReaderErrorReportingType use (
      CardLevel => 0,
      TrackLevel => 1
   );
   for MagneticStripeReaderErrorReportingType'Size use 32;
   
   type MagneticStripeReaderErrorReportingType_Ptr is access MagneticStripeReaderErrorReportingType;
   
   type MagneticStripeReaderTrackErrorType is (
      Unknown,
      None,
      StartSentinelError,
      EndSentinelError,
      ParityError,
      LrcError
   );
   for MagneticStripeReaderTrackErrorType use (
      Unknown => -1,
      None => 0,
      StartSentinelError => 1,
      EndSentinelError => 2,
      ParityError => 3,
      LrcError => 4
   );
   for MagneticStripeReaderTrackErrorType'Size use 32;
   
   type MagneticStripeReaderTrackErrorType_Ptr is access MagneticStripeReaderTrackErrorType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IBarcodeScanner_Interface;
   type AsyncOperationCompletedHandler_IBarcodeScanner is access all AsyncOperationCompletedHandler_IBarcodeScanner_Interface'Class;
   type AsyncOperationCompletedHandler_IBarcodeScanner_Ptr is access all AsyncOperationCompletedHandler_IBarcodeScanner;
   type AsyncOperationCompletedHandler_IClaimedBarcodeScanner_Interface;
   type AsyncOperationCompletedHandler_IClaimedBarcodeScanner is access all AsyncOperationCompletedHandler_IClaimedBarcodeScanner_Interface'Class;
   type AsyncOperationCompletedHandler_IClaimedBarcodeScanner_Ptr is access all AsyncOperationCompletedHandler_IClaimedBarcodeScanner;
   type TypedEventHandler_IBarcodeScanner_add_StatusUpdated_Interface;
   type TypedEventHandler_IBarcodeScanner_add_StatusUpdated is access all TypedEventHandler_IBarcodeScanner_add_StatusUpdated_Interface'Class;
   type TypedEventHandler_IBarcodeScanner_add_StatusUpdated_Ptr is access all TypedEventHandler_IBarcodeScanner_add_StatusUpdated;
   type TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived_Interface;
   type TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived is access all TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived_Interface'Class;
   type TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived_Ptr is access all TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived;
   type EventHandler_IClaimedBarcodeScanner_Interface;
   type EventHandler_IClaimedBarcodeScanner is access all EventHandler_IClaimedBarcodeScanner_Interface'Class;
   type EventHandler_IClaimedBarcodeScanner_Ptr is access all EventHandler_IClaimedBarcodeScanner;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived_Interface;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived is access all TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived_Interface'Class;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived_Ptr is access all TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred_Interface;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred is access all TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred_Interface'Class;
   type TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred_Ptr is access all TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred;
   type AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes_Interface;
   type AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes is access all AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes_Interface'Class;
   type AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes_Ptr is access all AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived_Interface;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived is access all TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived_Interface'Class;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived_Ptr is access all TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived_Interface;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived is access all TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived_Interface'Class;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived_Ptr is access all TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived_Interface;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived is access all TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived_Interface'Class;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived_Ptr is access all TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived;
   type EventHandler_IClaimedMagneticStripeReader_Interface;
   type EventHandler_IClaimedMagneticStripeReader is access all EventHandler_IClaimedMagneticStripeReader_Interface'Class;
   type EventHandler_IClaimedMagneticStripeReader_Ptr is access all EventHandler_IClaimedMagneticStripeReader;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred_Interface;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred is access all TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred_Interface'Class;
   type TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred_Ptr is access all TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred;
   type AsyncOperationCompletedHandler_IMagneticStripeReader_Interface;
   type AsyncOperationCompletedHandler_IMagneticStripeReader is access all AsyncOperationCompletedHandler_IMagneticStripeReader_Interface'Class;
   type AsyncOperationCompletedHandler_IMagneticStripeReader_Ptr is access all AsyncOperationCompletedHandler_IMagneticStripeReader;
   type AsyncOperationCompletedHandler_IClaimedMagneticStripeReader_Interface;
   type AsyncOperationCompletedHandler_IClaimedMagneticStripeReader is access all AsyncOperationCompletedHandler_IClaimedMagneticStripeReader_Interface'Class;
   type AsyncOperationCompletedHandler_IClaimedMagneticStripeReader_Ptr is access all AsyncOperationCompletedHandler_IClaimedMagneticStripeReader;
   type TypedEventHandler_IMagneticStripeReader_add_StatusUpdated_Interface;
   type TypedEventHandler_IMagneticStripeReader_add_StatusUpdated is access all TypedEventHandler_IMagneticStripeReader_add_StatusUpdated_Interface'Class;
   type TypedEventHandler_IMagneticStripeReader_add_StatusUpdated_Ptr is access all TypedEventHandler_IMagneticStripeReader_add_StatusUpdated;
   type AsyncOperationCompletedHandler_IPosPrinter_Interface;
   type AsyncOperationCompletedHandler_IPosPrinter is access all AsyncOperationCompletedHandler_IPosPrinter_Interface'Class;
   type AsyncOperationCompletedHandler_IPosPrinter_Ptr is access all AsyncOperationCompletedHandler_IPosPrinter;
   type AsyncOperationCompletedHandler_IClaimedPosPrinter_Interface;
   type AsyncOperationCompletedHandler_IClaimedPosPrinter is access all AsyncOperationCompletedHandler_IClaimedPosPrinter_Interface'Class;
   type AsyncOperationCompletedHandler_IClaimedPosPrinter_Ptr is access all AsyncOperationCompletedHandler_IClaimedPosPrinter;
   type TypedEventHandler_IPosPrinter_add_StatusUpdated_Interface;
   type TypedEventHandler_IPosPrinter_add_StatusUpdated is access all TypedEventHandler_IPosPrinter_add_StatusUpdated_Interface'Class;
   type TypedEventHandler_IPosPrinter_add_StatusUpdated_Ptr is access all TypedEventHandler_IPosPrinter_add_StatusUpdated;
   type TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested_Interface;
   type TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested is access all TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested_Interface'Class;
   type TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested_Ptr is access all TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed_Interface;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed is access all TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed_Interface'Class;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed_Ptr is access all TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened_Interface;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened is access all TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened_Interface'Class;
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened_Ptr is access all TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened;
   type AsyncOperationCompletedHandler_ICashDrawer_Interface;
   type AsyncOperationCompletedHandler_ICashDrawer is access all AsyncOperationCompletedHandler_ICashDrawer_Interface'Class;
   type AsyncOperationCompletedHandler_ICashDrawer_Ptr is access all AsyncOperationCompletedHandler_ICashDrawer;
   type AsyncOperationCompletedHandler_IClaimedCashDrawer_Interface;
   type AsyncOperationCompletedHandler_IClaimedCashDrawer is access all AsyncOperationCompletedHandler_IClaimedCashDrawer_Interface'Class;
   type AsyncOperationCompletedHandler_IClaimedCashDrawer_Ptr is access all AsyncOperationCompletedHandler_IClaimedCashDrawer;
   type TypedEventHandler_ICashDrawer_add_StatusUpdated_Interface;
   type TypedEventHandler_ICashDrawer_add_StatusUpdated is access all TypedEventHandler_ICashDrawer_add_StatusUpdated_Interface'Class;
   type TypedEventHandler_ICashDrawer_add_StatusUpdated_Ptr is access all TypedEventHandler_ICashDrawer_add_StatusUpdated;
   type TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired_Interface;
   type TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired is access all TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired_Interface'Class;
   type TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired_Ptr is access all TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired;
   type TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested_Interface;
   type TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested is access all TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested_Interface'Class;
   type TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested_Ptr is access all TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested;
   type AsyncOperationCompletedHandler_ILineDisplay_Interface;
   type AsyncOperationCompletedHandler_ILineDisplay is access all AsyncOperationCompletedHandler_ILineDisplay_Interface'Class;
   type AsyncOperationCompletedHandler_ILineDisplay_Ptr is access all AsyncOperationCompletedHandler_ILineDisplay;
   type AsyncOperationCompletedHandler_IClaimedLineDisplay_Interface;
   type AsyncOperationCompletedHandler_IClaimedLineDisplay is access all AsyncOperationCompletedHandler_IClaimedLineDisplay_Interface'Class;
   type AsyncOperationCompletedHandler_IClaimedLineDisplay_Ptr is access all AsyncOperationCompletedHandler_IClaimedLineDisplay;
   type AsyncOperationCompletedHandler_LineDisplayPowerStatus_Interface;
   type AsyncOperationCompletedHandler_LineDisplayPowerStatus is access all AsyncOperationCompletedHandler_LineDisplayPowerStatus_Interface'Class;
   type AsyncOperationCompletedHandler_LineDisplayPowerStatus_Ptr is access all AsyncOperationCompletedHandler_LineDisplayPowerStatus;
   type TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested_Interface;
   type TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested is access all TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested_Interface'Class;
   type TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested_Ptr is access all TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested;
   type TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated_Interface;
   type TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated is access all TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated_Interface'Class;
   type TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated_Ptr is access all TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated;
   type AsyncOperationCompletedHandler_ILineDisplayWindow_Interface;
   type AsyncOperationCompletedHandler_ILineDisplayWindow is access all AsyncOperationCompletedHandler_ILineDisplayWindow_Interface'Class;
   type AsyncOperationCompletedHandler_ILineDisplayWindow_Ptr is access all AsyncOperationCompletedHandler_ILineDisplayWindow;
   type AsyncOperationCompletedHandler_ILineDisplayStoredBitmap_Interface;
   type AsyncOperationCompletedHandler_ILineDisplayStoredBitmap is access all AsyncOperationCompletedHandler_ILineDisplayStoredBitmap_Interface'Class;
   type AsyncOperationCompletedHandler_ILineDisplayStoredBitmap_Ptr is access all AsyncOperationCompletedHandler_ILineDisplayStoredBitmap;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUnifiedPosErrorData_Interface;
   type IUnifiedPosErrorData is access all IUnifiedPosErrorData_Interface'Class;
   type IUnifiedPosErrorData_Ptr is access all IUnifiedPosErrorData;
   type IBarcodeScannerStatusUpdatedEventArgs_Interface;
   type IBarcodeScannerStatusUpdatedEventArgs is access all IBarcodeScannerStatusUpdatedEventArgs_Interface'Class;
   type IBarcodeScannerStatusUpdatedEventArgs_Ptr is access all IBarcodeScannerStatusUpdatedEventArgs;
   type IBarcodeSymbologiesStatics_Interface;
   type IBarcodeSymbologiesStatics is access all IBarcodeSymbologiesStatics_Interface'Class;
   type IBarcodeSymbologiesStatics_Ptr is access all IBarcodeSymbologiesStatics;
   type IBarcodeSymbologiesStatics2_Interface;
   type IBarcodeSymbologiesStatics2 is access all IBarcodeSymbologiesStatics2_Interface'Class;
   type IBarcodeSymbologiesStatics2_Ptr is access all IBarcodeSymbologiesStatics2;
   type IBarcodeSymbologyAttributes_Interface;
   type IBarcodeSymbologyAttributes is access all IBarcodeSymbologyAttributes_Interface'Class;
   type IBarcodeSymbologyAttributes_Ptr is access all IBarcodeSymbologyAttributes;
   type IBarcodeScannerDataReceivedEventArgs_Interface;
   type IBarcodeScannerDataReceivedEventArgs is access all IBarcodeScannerDataReceivedEventArgs_Interface'Class;
   type IBarcodeScannerDataReceivedEventArgs_Ptr is access all IBarcodeScannerDataReceivedEventArgs;
   type IBarcodeScannerReport_Interface;
   type IBarcodeScannerReport is access all IBarcodeScannerReport_Interface'Class;
   type IBarcodeScannerReport_Ptr is access all IBarcodeScannerReport;
   type IBarcodeScannerErrorOccurredEventArgs_Interface;
   type IBarcodeScannerErrorOccurredEventArgs is access all IBarcodeScannerErrorOccurredEventArgs_Interface'Class;
   type IBarcodeScannerErrorOccurredEventArgs_Ptr is access all IBarcodeScannerErrorOccurredEventArgs;
   type IBarcodeScannerImagePreviewReceivedEventArgs_Interface;
   type IBarcodeScannerImagePreviewReceivedEventArgs is access all IBarcodeScannerImagePreviewReceivedEventArgs_Interface'Class;
   type IBarcodeScannerImagePreviewReceivedEventArgs_Ptr is access all IBarcodeScannerImagePreviewReceivedEventArgs;
   type IBarcodeScannerCapabilities_Interface;
   type IBarcodeScannerCapabilities is access all IBarcodeScannerCapabilities_Interface'Class;
   type IBarcodeScannerCapabilities_Ptr is access all IBarcodeScannerCapabilities;
   type IBarcodeScannerCapabilities1_Interface;
   type IBarcodeScannerCapabilities1 is access all IBarcodeScannerCapabilities1_Interface'Class;
   type IBarcodeScannerCapabilities1_Ptr is access all IBarcodeScannerCapabilities1;
   type IBarcodeScannerStatics_Interface;
   type IBarcodeScannerStatics is access all IBarcodeScannerStatics_Interface'Class;
   type IBarcodeScannerStatics_Ptr is access all IBarcodeScannerStatics;
   type IBarcodeScannerStatics2_Interface;
   type IBarcodeScannerStatics2 is access all IBarcodeScannerStatics2_Interface'Class;
   type IBarcodeScannerStatics2_Ptr is access all IBarcodeScannerStatics2;
   type IBarcodeScanner_Interface;
   type IBarcodeScanner is access all IBarcodeScanner_Interface'Class;
   type IBarcodeScanner_Ptr is access all IBarcodeScanner;
   type IBarcodeScanner2_Interface;
   type IBarcodeScanner2 is access all IBarcodeScanner2_Interface'Class;
   type IBarcodeScanner2_Ptr is access all IBarcodeScanner2;
   type IClaimedBarcodeScanner_Interface;
   type IClaimedBarcodeScanner is access all IClaimedBarcodeScanner_Interface'Class;
   type IClaimedBarcodeScanner_Ptr is access all IClaimedBarcodeScanner;
   type IClaimedBarcodeScanner1_Interface;
   type IClaimedBarcodeScanner1 is access all IClaimedBarcodeScanner1_Interface'Class;
   type IClaimedBarcodeScanner1_Ptr is access all IClaimedBarcodeScanner1;
   type IClaimedBarcodeScanner2_Interface;
   type IClaimedBarcodeScanner2 is access all IClaimedBarcodeScanner2_Interface'Class;
   type IClaimedBarcodeScanner2_Ptr is access all IClaimedBarcodeScanner2;
   type IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface;
   type IMagneticStripeReaderEncryptionAlgorithmsStatics is access all IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface'Class;
   type IMagneticStripeReaderEncryptionAlgorithmsStatics_Ptr is access all IMagneticStripeReaderEncryptionAlgorithmsStatics;
   type IMagneticStripeReaderCardTypesStatics_Interface;
   type IMagneticStripeReaderCardTypesStatics is access all IMagneticStripeReaderCardTypesStatics_Interface'Class;
   type IMagneticStripeReaderCardTypesStatics_Ptr is access all IMagneticStripeReaderCardTypesStatics;
   type IMagneticStripeReaderTrackData_Interface;
   type IMagneticStripeReaderTrackData is access all IMagneticStripeReaderTrackData_Interface'Class;
   type IMagneticStripeReaderTrackData_Ptr is access all IMagneticStripeReaderTrackData;
   type IMagneticStripeReaderReport_Interface;
   type IMagneticStripeReaderReport is access all IMagneticStripeReaderReport_Interface'Class;
   type IMagneticStripeReaderReport_Ptr is access all IMagneticStripeReaderReport;
   type IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface;
   type IMagneticStripeReaderBankCardDataReceivedEventArgs is access all IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface'Class;
   type IMagneticStripeReaderBankCardDataReceivedEventArgs_Ptr is access all IMagneticStripeReaderBankCardDataReceivedEventArgs;
   type IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface;
   type IMagneticStripeReaderAamvaCardDataReceivedEventArgs is access all IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface'Class;
   type IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Ptr is access all IMagneticStripeReaderAamvaCardDataReceivedEventArgs;
   type IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs_Interface;
   type IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs is access all IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs_Interface'Class;
   type IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs_Ptr is access all IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs;
   type IMagneticStripeReaderErrorOccurredEventArgs_Interface;
   type IMagneticStripeReaderErrorOccurredEventArgs is access all IMagneticStripeReaderErrorOccurredEventArgs_Interface'Class;
   type IMagneticStripeReaderErrorOccurredEventArgs_Ptr is access all IMagneticStripeReaderErrorOccurredEventArgs;
   type IMagneticStripeReaderStatusUpdatedEventArgs_Interface;
   type IMagneticStripeReaderStatusUpdatedEventArgs is access all IMagneticStripeReaderStatusUpdatedEventArgs_Interface'Class;
   type IMagneticStripeReaderStatusUpdatedEventArgs_Ptr is access all IMagneticStripeReaderStatusUpdatedEventArgs;
   type IMagneticStripeReaderCapabilities_Interface;
   type IMagneticStripeReaderCapabilities is access all IMagneticStripeReaderCapabilities_Interface'Class;
   type IMagneticStripeReaderCapabilities_Ptr is access all IMagneticStripeReaderCapabilities;
   type IClaimedMagneticStripeReader_Interface;
   type IClaimedMagneticStripeReader is access all IClaimedMagneticStripeReader_Interface'Class;
   type IClaimedMagneticStripeReader_Ptr is access all IClaimedMagneticStripeReader;
   type IMagneticStripeReaderStatics_Interface;
   type IMagneticStripeReaderStatics is access all IMagneticStripeReaderStatics_Interface'Class;
   type IMagneticStripeReaderStatics_Ptr is access all IMagneticStripeReaderStatics;
   type IMagneticStripeReaderStatics2_Interface;
   type IMagneticStripeReaderStatics2 is access all IMagneticStripeReaderStatics2_Interface'Class;
   type IMagneticStripeReaderStatics2_Ptr is access all IMagneticStripeReaderStatics2;
   type IMagneticStripeReader_Interface;
   type IMagneticStripeReader is access all IMagneticStripeReader_Interface'Class;
   type IMagneticStripeReader_Ptr is access all IMagneticStripeReader;
   type IPosPrinterCharacterSetIdsStatics_Interface;
   type IPosPrinterCharacterSetIdsStatics is access all IPosPrinterCharacterSetIdsStatics_Interface'Class;
   type IPosPrinterCharacterSetIdsStatics_Ptr is access all IPosPrinterCharacterSetIdsStatics;
   type ICommonPosPrintStationCapabilities_Interface;
   type ICommonPosPrintStationCapabilities is access all ICommonPosPrintStationCapabilities_Interface'Class;
   type ICommonPosPrintStationCapabilities_Ptr is access all ICommonPosPrintStationCapabilities;
   type ICommonReceiptSlipCapabilities_Interface;
   type ICommonReceiptSlipCapabilities is access all ICommonReceiptSlipCapabilities_Interface'Class;
   type ICommonReceiptSlipCapabilities_Ptr is access all ICommonReceiptSlipCapabilities;
   type IReceiptPrinterCapabilities_Interface;
   type IReceiptPrinterCapabilities is access all IReceiptPrinterCapabilities_Interface'Class;
   type IReceiptPrinterCapabilities_Ptr is access all IReceiptPrinterCapabilities;
   type ISlipPrinterCapabilities_Interface;
   type ISlipPrinterCapabilities is access all ISlipPrinterCapabilities_Interface'Class;
   type ISlipPrinterCapabilities_Ptr is access all ISlipPrinterCapabilities;
   type IJournalPrinterCapabilities_Interface;
   type IJournalPrinterCapabilities is access all IJournalPrinterCapabilities_Interface'Class;
   type IJournalPrinterCapabilities_Ptr is access all IJournalPrinterCapabilities;
   type IPosPrinterCapabilities_Interface;
   type IPosPrinterCapabilities is access all IPosPrinterCapabilities_Interface'Class;
   type IPosPrinterCapabilities_Ptr is access all IPosPrinterCapabilities;
   type IPosPrinterStatus_Interface;
   type IPosPrinterStatus is access all IPosPrinterStatus_Interface'Class;
   type IPosPrinterStatus_Ptr is access all IPosPrinterStatus;
   type IPosPrinterStatusUpdatedEventArgs_Interface;
   type IPosPrinterStatusUpdatedEventArgs is access all IPosPrinterStatusUpdatedEventArgs_Interface'Class;
   type IPosPrinterStatusUpdatedEventArgs_Ptr is access all IPosPrinterStatusUpdatedEventArgs;
   type IPosPrinterReleaseDeviceRequestedEventArgs_Interface;
   type IPosPrinterReleaseDeviceRequestedEventArgs is access all IPosPrinterReleaseDeviceRequestedEventArgs_Interface'Class;
   type IPosPrinterReleaseDeviceRequestedEventArgs_Ptr is access all IPosPrinterReleaseDeviceRequestedEventArgs;
   type IPosPrinterStatics_Interface;
   type IPosPrinterStatics is access all IPosPrinterStatics_Interface'Class;
   type IPosPrinterStatics_Ptr is access all IPosPrinterStatics;
   type IPosPrinterStatics2_Interface;
   type IPosPrinterStatics2 is access all IPosPrinterStatics2_Interface'Class;
   type IPosPrinterStatics2_Ptr is access all IPosPrinterStatics2;
   type IPosPrinter_Interface;
   type IPosPrinter is access all IPosPrinter_Interface'Class;
   type IPosPrinter_Ptr is access all IPosPrinter;
   type IPosPrinterJob_Interface;
   type IPosPrinterJob is access all IPosPrinterJob_Interface'Class;
   type IPosPrinterJob_Ptr is access all IPosPrinterJob;
   type IReceiptOrSlipJob_Interface;
   type IReceiptOrSlipJob is access all IReceiptOrSlipJob_Interface'Class;
   type IReceiptOrSlipJob_Ptr is access all IReceiptOrSlipJob;
   type IReceiptPrintJob_Interface;
   type IReceiptPrintJob is access all IReceiptPrintJob_Interface'Class;
   type IReceiptPrintJob_Ptr is access all IReceiptPrintJob;
   type ICommonClaimedPosPrinterStation_Interface;
   type ICommonClaimedPosPrinterStation is access all ICommonClaimedPosPrinterStation_Interface'Class;
   type ICommonClaimedPosPrinterStation_Ptr is access all ICommonClaimedPosPrinterStation;
   type IClaimedReceiptPrinter_Interface;
   type IClaimedReceiptPrinter is access all IClaimedReceiptPrinter_Interface'Class;
   type IClaimedReceiptPrinter_Ptr is access all IClaimedReceiptPrinter;
   type IClaimedSlipPrinter_Interface;
   type IClaimedSlipPrinter is access all IClaimedSlipPrinter_Interface'Class;
   type IClaimedSlipPrinter_Ptr is access all IClaimedSlipPrinter;
   type IClaimedJournalPrinter_Interface;
   type IClaimedJournalPrinter is access all IClaimedJournalPrinter_Interface'Class;
   type IClaimedJournalPrinter_Ptr is access all IClaimedJournalPrinter;
   type IClaimedPosPrinter_Interface;
   type IClaimedPosPrinter is access all IClaimedPosPrinter_Interface'Class;
   type IClaimedPosPrinter_Ptr is access all IClaimedPosPrinter;
   type ICashDrawerStatusUpdatedEventArgs_Interface;
   type ICashDrawerStatusUpdatedEventArgs is access all ICashDrawerStatusUpdatedEventArgs_Interface'Class;
   type ICashDrawerStatusUpdatedEventArgs_Ptr is access all ICashDrawerStatusUpdatedEventArgs;
   type ICashDrawerStatus_Interface;
   type ICashDrawerStatus is access all ICashDrawerStatus_Interface'Class;
   type ICashDrawerStatus_Ptr is access all ICashDrawerStatus;
   type ICashDrawerCapabilities_Interface;
   type ICashDrawerCapabilities is access all ICashDrawerCapabilities_Interface'Class;
   type ICashDrawerCapabilities_Ptr is access all ICashDrawerCapabilities;
   type ICashDrawerEventSourceEventArgs_Interface;
   type ICashDrawerEventSourceEventArgs is access all ICashDrawerEventSourceEventArgs_Interface'Class;
   type ICashDrawerEventSourceEventArgs_Ptr is access all ICashDrawerEventSourceEventArgs;
   type ICashDrawerEventSource_Interface;
   type ICashDrawerEventSource is access all ICashDrawerEventSource_Interface'Class;
   type ICashDrawerEventSource_Ptr is access all ICashDrawerEventSource;
   type ICashDrawerStatics_Interface;
   type ICashDrawerStatics is access all ICashDrawerStatics_Interface'Class;
   type ICashDrawerStatics_Ptr is access all ICashDrawerStatics;
   type ICashDrawerStatics2_Interface;
   type ICashDrawerStatics2 is access all ICashDrawerStatics2_Interface'Class;
   type ICashDrawerStatics2_Ptr is access all ICashDrawerStatics2;
   type ICashDrawer_Interface;
   type ICashDrawer is access all ICashDrawer_Interface'Class;
   type ICashDrawer_Ptr is access all ICashDrawer;
   type ICashDrawerCloseAlarm_Interface;
   type ICashDrawerCloseAlarm is access all ICashDrawerCloseAlarm_Interface'Class;
   type ICashDrawerCloseAlarm_Ptr is access all ICashDrawerCloseAlarm;
   type IClaimedCashDrawer_Interface;
   type IClaimedCashDrawer is access all IClaimedCashDrawer_Interface'Class;
   type IClaimedCashDrawer_Ptr is access all IClaimedCashDrawer;
   type ILineDisplayStatics_Interface;
   type ILineDisplayStatics is access all ILineDisplayStatics_Interface'Class;
   type ILineDisplayStatics_Ptr is access all ILineDisplayStatics;
   type ILineDisplayStatics2_Interface;
   type ILineDisplayStatics2 is access all ILineDisplayStatics2_Interface'Class;
   type ILineDisplayStatics2_Ptr is access all ILineDisplayStatics2;
   type IClaimedLineDisplayStatics_Interface;
   type IClaimedLineDisplayStatics is access all IClaimedLineDisplayStatics_Interface'Class;
   type IClaimedLineDisplayStatics_Ptr is access all IClaimedLineDisplayStatics;
   type ILineDisplayStatisticsCategorySelector_Interface;
   type ILineDisplayStatisticsCategorySelector is access all ILineDisplayStatisticsCategorySelector_Interface'Class;
   type ILineDisplayStatisticsCategorySelector_Ptr is access all ILineDisplayStatisticsCategorySelector;
   type ILineDisplayCursorAttributes_Interface;
   type ILineDisplayCursorAttributes is access all ILineDisplayCursorAttributes_Interface'Class;
   type ILineDisplayCursorAttributes_Ptr is access all ILineDisplayCursorAttributes;
   type ILineDisplayCursor_Interface;
   type ILineDisplayCursor is access all ILineDisplayCursor_Interface'Class;
   type ILineDisplayCursor_Ptr is access all ILineDisplayCursor;
   type ILineDisplayMarquee_Interface;
   type ILineDisplayMarquee is access all ILineDisplayMarquee_Interface'Class;
   type ILineDisplayMarquee_Ptr is access all ILineDisplayMarquee;
   type ILineDisplayStoredBitmap_Interface;
   type ILineDisplayStoredBitmap is access all ILineDisplayStoredBitmap_Interface'Class;
   type ILineDisplayStoredBitmap_Ptr is access all ILineDisplayStoredBitmap;
   type ILineDisplayWindow_Interface;
   type ILineDisplayWindow is access all ILineDisplayWindow_Interface'Class;
   type ILineDisplayWindow_Ptr is access all ILineDisplayWindow;
   type ILineDisplayWindow2_Interface;
   type ILineDisplayWindow2 is access all ILineDisplayWindow2_Interface'Class;
   type ILineDisplayWindow2_Ptr is access all ILineDisplayWindow2;
   type ILineDisplayCustomGlyphs_Interface;
   type ILineDisplayCustomGlyphs is access all ILineDisplayCustomGlyphs_Interface'Class;
   type ILineDisplayCustomGlyphs_Ptr is access all ILineDisplayCustomGlyphs;
   type ILineDisplayStatusUpdatedEventArgs_Interface;
   type ILineDisplayStatusUpdatedEventArgs is access all ILineDisplayStatusUpdatedEventArgs_Interface'Class;
   type ILineDisplayStatusUpdatedEventArgs_Ptr is access all ILineDisplayStatusUpdatedEventArgs;
   type ILineDisplayCapabilities_Interface;
   type ILineDisplayCapabilities is access all ILineDisplayCapabilities_Interface'Class;
   type ILineDisplayCapabilities_Ptr is access all ILineDisplayCapabilities;
   type ILineDisplay_Interface;
   type ILineDisplay is access all ILineDisplay_Interface'Class;
   type ILineDisplay_Ptr is access all ILineDisplay;
   type ILineDisplay2_Interface;
   type ILineDisplay2 is access all ILineDisplay2_Interface'Class;
   type ILineDisplay2_Ptr is access all ILineDisplay2;
   type IClaimedLineDisplay_Interface;
   type IClaimedLineDisplay is access all IClaimedLineDisplay_Interface'Class;
   type IClaimedLineDisplay_Ptr is access all IClaimedLineDisplay;
   type ILineDisplayAttributes_Interface;
   type ILineDisplayAttributes is access all ILineDisplayAttributes_Interface'Class;
   type ILineDisplayAttributes_Ptr is access all ILineDisplayAttributes;
   type IClaimedLineDisplay2_Interface;
   type IClaimedLineDisplay2 is access all IClaimedLineDisplay2_Interface'Class;
   type IClaimedLineDisplay2_Ptr is access all IClaimedLineDisplay2;
   type IAsyncOperation_IBarcodeScanner_Interface;
   type IAsyncOperation_IBarcodeScanner is access all IAsyncOperation_IBarcodeScanner_Interface'Class;
   type IAsyncOperation_IBarcodeScanner_Ptr is access all IAsyncOperation_IBarcodeScanner;
   type IAsyncOperation_IClaimedBarcodeScanner_Interface;
   type IAsyncOperation_IClaimedBarcodeScanner is access all IAsyncOperation_IClaimedBarcodeScanner_Interface'Class;
   type IAsyncOperation_IClaimedBarcodeScanner_Ptr is access all IAsyncOperation_IClaimedBarcodeScanner;
   type IAsyncOperation_IBarcodeSymbologyAttributes_Interface;
   type IAsyncOperation_IBarcodeSymbologyAttributes is access all IAsyncOperation_IBarcodeSymbologyAttributes_Interface'Class;
   type IAsyncOperation_IBarcodeSymbologyAttributes_Ptr is access all IAsyncOperation_IBarcodeSymbologyAttributes;
   type IAsyncOperation_IMagneticStripeReader_Interface;
   type IAsyncOperation_IMagneticStripeReader is access all IAsyncOperation_IMagneticStripeReader_Interface'Class;
   type IAsyncOperation_IMagneticStripeReader_Ptr is access all IAsyncOperation_IMagneticStripeReader;
   type IAsyncOperation_IClaimedMagneticStripeReader_Interface;
   type IAsyncOperation_IClaimedMagneticStripeReader is access all IAsyncOperation_IClaimedMagneticStripeReader_Interface'Class;
   type IAsyncOperation_IClaimedMagneticStripeReader_Ptr is access all IAsyncOperation_IClaimedMagneticStripeReader;
   type IIterator_PosPrinterRotation_Interface;
   type IIterator_PosPrinterRotation is access all IIterator_PosPrinterRotation_Interface'Class;
   type IIterator_PosPrinterRotation_Ptr is access all IIterator_PosPrinterRotation;
   type IIterable_PosPrinterRotation_Interface;
   type IIterable_PosPrinterRotation is access all IIterable_PosPrinterRotation_Interface'Class;
   type IIterable_PosPrinterRotation_Ptr is access all IIterable_PosPrinterRotation;
   type IVectorView_PosPrinterRotation_Interface;
   type IVectorView_PosPrinterRotation is access all IVectorView_PosPrinterRotation_Interface'Class;
   type IVectorView_PosPrinterRotation_Ptr is access all IVectorView_PosPrinterRotation;
   type IAsyncOperation_IPosPrinter_Interface;
   type IAsyncOperation_IPosPrinter is access all IAsyncOperation_IPosPrinter_Interface'Class;
   type IAsyncOperation_IPosPrinter_Ptr is access all IAsyncOperation_IPosPrinter;
   type IAsyncOperation_IClaimedPosPrinter_Interface;
   type IAsyncOperation_IClaimedPosPrinter is access all IAsyncOperation_IClaimedPosPrinter_Interface'Class;
   type IAsyncOperation_IClaimedPosPrinter_Ptr is access all IAsyncOperation_IClaimedPosPrinter;
   type IAsyncOperation_ICashDrawer_Interface;
   type IAsyncOperation_ICashDrawer is access all IAsyncOperation_ICashDrawer_Interface'Class;
   type IAsyncOperation_ICashDrawer_Ptr is access all IAsyncOperation_ICashDrawer;
   type IAsyncOperation_IClaimedCashDrawer_Interface;
   type IAsyncOperation_IClaimedCashDrawer is access all IAsyncOperation_IClaimedCashDrawer_Interface'Class;
   type IAsyncOperation_IClaimedCashDrawer_Ptr is access all IAsyncOperation_IClaimedCashDrawer;
   type IAsyncOperation_ILineDisplay_Interface;
   type IAsyncOperation_ILineDisplay is access all IAsyncOperation_ILineDisplay_Interface'Class;
   type IAsyncOperation_ILineDisplay_Ptr is access all IAsyncOperation_ILineDisplay;
   type IAsyncOperation_IClaimedLineDisplay_Interface;
   type IAsyncOperation_IClaimedLineDisplay is access all IAsyncOperation_IClaimedLineDisplay_Interface'Class;
   type IAsyncOperation_IClaimedLineDisplay_Ptr is access all IAsyncOperation_IClaimedLineDisplay;
   type IAsyncOperation_LineDisplayPowerStatus_Interface;
   type IAsyncOperation_LineDisplayPowerStatus is access all IAsyncOperation_LineDisplayPowerStatus_Interface'Class;
   type IAsyncOperation_LineDisplayPowerStatus_Ptr is access all IAsyncOperation_LineDisplayPowerStatus;
   type IAsyncOperation_ILineDisplayWindow_Interface;
   type IAsyncOperation_ILineDisplayWindow is access all IAsyncOperation_ILineDisplayWindow_Interface'Class;
   type IAsyncOperation_ILineDisplayWindow_Ptr is access all IAsyncOperation_ILineDisplayWindow;
   type IAsyncOperation_ILineDisplayStoredBitmap_Interface;
   type IAsyncOperation_ILineDisplayStoredBitmap is access all IAsyncOperation_ILineDisplayStoredBitmap_Interface'Class;
   type IAsyncOperation_ILineDisplayStoredBitmap_Ptr is access all IAsyncOperation_ILineDisplayStoredBitmap;
   
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
   
   IID_IUnifiedPosErrorData : aliased constant Windows.IID := (731483194, 21852, 18569, (142, 216, 197, 153, 187, 58, 113, 42 ));
   
   type IUnifiedPosErrorData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IUnifiedPosErrorData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Severity
   (
      This       : access IUnifiedPosErrorData_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_Reason
   (
      This       : access IUnifiedPosErrorData_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosErrorReason
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedReason
   (
      This       : access IUnifiedPosErrorData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStatusUpdatedEventArgs : aliased constant Windows.IID := (895321478, 40003, 17963, (169, 26, 129, 109, 201, 127, 69, 44 ));
   
   type IBarcodeScannerStatusUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IBarcodeScannerStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.BarcodeScannerStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access IBarcodeScannerStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeSymbologiesStatics : aliased constant Windows.IID := (3397732795, 1746, 17396, (164, 75, 198, 32, 103, 159, 216, 208 ));
   
   type IBarcodeSymbologiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unknown
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean8
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean8Add2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean8Add5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Eanv
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EanvAdd2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EanvAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean13
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean13Add2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean13Add5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Isbn
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsbnAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ismn
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsmnAdd2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsmnAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Issn
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IssnAdd2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IssnAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean99
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean99Add2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ean99Add5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Upca
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpcaAdd2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpcaAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Upce
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpceAdd2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpceAdd5
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpcCoupon
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfStd
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfDis
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfInt
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfInd
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfMat
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TfIata
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gs1DatabarType1
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gs1DatabarType2
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gs1DatabarType3
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code39
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code39Ex
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Trioptic39
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code32
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Pzn
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code93
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code93Ex
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code128
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gs1128
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gs1128Coupon
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UccEan128
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Sisac
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Isbt
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Codabar
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code11
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Msi
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Plessey
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Telepen
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code16k
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CodablockA
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CodablockF
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Codablock128
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Code49
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Aztec
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DataCode
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DataMatrix
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HanXin
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Maxicode
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MicroPdf417
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MicroQr
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Pdf417
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Qr
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MsTag
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ccab
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ccc
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Tlc39
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AusPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CanPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ChinaPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DutchKix
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_InfoMail
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ItalianPost25
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ItalianPost39
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_JapanPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_KoreanPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SwedenPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UkPost
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsIntelligent
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsIntelligentPkg
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsPlanet
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsPostNet
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Us4StateFics
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OcrA
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OcrB
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Micr
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedBase
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetName
   (
      This       : access IBarcodeSymbologiesStatics_Interface
      ; scanDataType : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeSymbologiesStatics2 : aliased constant Windows.IID := (2339707124, 39376, 16575, (148, 36, 185, 29, 109, 212, 198, 224 ));
   
   type IBarcodeSymbologiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Gs1DWCode
   (
      This       : access IBarcodeSymbologiesStatics2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeSymbologyAttributes : aliased constant Windows.IID := (1715550840, 43898, 19162, (142, 206, 147, 96, 20, 178, 234, 215 ));
   
   type IBarcodeSymbologyAttributes_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCheckDigitValidationEnabled
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCheckDigitValidationEnabled
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCheckDigitValidationSupported
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCheckDigitTransmissionEnabled
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCheckDigitTransmissionEnabled
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCheckDigitTransmissionSupported
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodeLength1
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodeLength1
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodeLength2
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodeLength2
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodeLengthKind
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Devices.PointOfService.BarcodeSymbologyDecodeLengthKind
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodeLengthKind
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; value : Windows.Devices.PointOfService.BarcodeSymbologyDecodeLengthKind
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDecodeLengthSupported
   (
      This       : access IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerDataReceivedEventArgs : aliased constant Windows.IID := (1110747106, 60823, 18045, (173, 43, 1, 228, 67, 19, 169, 41 ));
   
   type IBarcodeScannerDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Report
   (
      This       : access IBarcodeScannerDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeScannerReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerReport : aliased constant Windows.IID := (1558501552, 42121, 19350, (134, 196, 240, 191, 138, 55, 117, 61 ));
   
   type IBarcodeScannerReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScanDataType
   (
      This       : access IBarcodeScannerReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanData
   (
      This       : access IBarcodeScannerReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanDataLabel
   (
      This       : access IBarcodeScannerReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerErrorOccurredEventArgs : aliased constant Windows.IID := (751984687, 53050, 16386, (167, 90, 197, 236, 70, 143, 10, 32 ));
   
   type IBarcodeScannerErrorOccurredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PartialInputData
   (
      This       : access IBarcodeScannerErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeScannerReport
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRetriable
   (
      This       : access IBarcodeScannerErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorData
   (
      This       : access IBarcodeScannerErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IUnifiedPosErrorData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerImagePreviewReceivedEventArgs : aliased constant Windows.IID := (4088913541, 28299, 17230, (159, 88, 6, 239, 38, 188, 75, 175 ));
   
   type IBarcodeScannerImagePreviewReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Preview
   (
      This       : access IBarcodeScannerImagePreviewReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerCapabilities : aliased constant Windows.IID := (3322319332, 62152, 17440, (163, 7, 177, 46, 246, 98, 40, 87 ));
   
   type IBarcodeScannerCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PowerReportingType
   (
      This       : access IBarcodeScannerCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosPowerReportingType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsReportingSupported
   (
      This       : access IBarcodeScannerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsUpdatingSupported
   (
      This       : access IBarcodeScannerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsImagePreviewSupported
   (
      This       : access IBarcodeScannerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerCapabilities1 : aliased constant Windows.IID := (2388308969, 3628, 18223, (161, 204, 238, 128, 84, 182, 166, 132 ));
   
   type IBarcodeScannerCapabilities1_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSoftwareTriggerSupported
   (
      This       : access IBarcodeScannerCapabilities1_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStatics : aliased constant Windows.IID := (1561419631, 55881, 16872, (140, 140, 240, 203, 98, 169, 196, 252 ));
   
   type IBarcodeScannerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IBarcodeScannerStatics_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IBarcodeScannerStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IBarcodeScannerStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScannerStatics2 : aliased constant Windows.IID := (3093636211, 41839, 16391, (177, 208, 39, 158, 190, 146, 166, 86 ));
   
   type IBarcodeScannerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access IBarcodeScannerStatics2_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScanner : aliased constant Windows.IID := (3198369286, 45668, 20227, (169, 193, 69, 178, 15, 1, 19, 79 ));
   
   type IBarcodeScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IBarcodeScanner_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access IBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeScannerCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function ClaimScannerAsync
   (
      This       : access IBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedBarcodeScanner -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckHealthAsync
   (
      This       : access IBarcodeScanner_Interface
      ; level : Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedSymbologiesAsync
   (
      This       : access IBarcodeScanner_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsSymbologySupportedAsync
   (
      This       : access IBarcodeScanner_Interface
      ; barcodeSymbology : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveStatisticsAsync
   (
      This       : access IBarcodeScanner_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedProfiles
   (
      This       : access IBarcodeScanner_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsProfileSupported
   (
      This       : access IBarcodeScanner_Interface
      ; profile : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusUpdated
   (
      This       : access IBarcodeScanner_Interface
      ; handler : TypedEventHandler_IBarcodeScanner_add_StatusUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusUpdated
   (
      This       : access IBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarcodeScanner2 : aliased constant Windows.IID := (2300662119, 36078, 17261, (137, 171, 141, 251, 67, 187, 66, 134 ));
   
   type IBarcodeScanner2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoDeviceId
   (
      This       : access IBarcodeScanner2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedBarcodeScanner : aliased constant Windows.IID := (1248048284, 36772, 17202, (187, 38, 148, 93, 17, 216, 30, 15 ));
   
   type IClaimedBarcodeScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDisabledOnDataReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledOnDataReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDecodeDataEnabled
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDecodeDataEnabled
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnableAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DisableAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RetainDevice
   (
      This       : access IClaimedBarcodeScanner_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetActiveSymbologiesAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; symbologies : Windows.Foundation.Collections.IIterable_UInt32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ResetStatisticsAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateStatisticsAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; statistics : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetActiveProfileAsync
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; profile : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_DataReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TriggerPressed
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : Windows.Devices.PointOfService.EventHandler_IClaimedBarcodeScanner
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TriggerPressed
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TriggerReleased
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : Windows.Devices.PointOfService.EventHandler_IClaimedBarcodeScanner
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TriggerReleased
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ReleaseDeviceRequested
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : Windows.Devices.PointOfService.EventHandler_IClaimedBarcodeScanner
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReleaseDeviceRequested
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ImagePreviewReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ImagePreviewReceived
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ErrorOccurred
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; handler : TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ErrorOccurred
   (
      This       : access IClaimedBarcodeScanner_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedBarcodeScanner1 : aliased constant Windows.IID := (4128943372, 34129, 17076, (153, 140, 151, 12, 32, 33, 10, 34 ));
   
   type IClaimedBarcodeScanner1_Interface is interface and Windows.IInspectable_Interface;
   
   function StartSoftwareTriggerAsync
   (
      This       : access IClaimedBarcodeScanner1_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopSoftwareTriggerAsync
   (
      This       : access IClaimedBarcodeScanner1_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedBarcodeScanner2 : aliased constant Windows.IID := (3820330636, 11659, 20336, (138, 243, 52, 72, 190, 221, 95, 226 ));
   
   type IClaimedBarcodeScanner2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSymbologyAttributesAsync
   (
      This       : access IClaimedBarcodeScanner2_Interface
      ; barcodeSymbology : Windows.UInt32
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IBarcodeSymbologyAttributes -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetSymbologyAttributesAsync
   (
      This       : access IClaimedBarcodeScanner2_Interface
      ; barcodeSymbology : Windows.UInt32
      ; attributes : Windows.Devices.PointOfService.IBarcodeSymbologyAttributes
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderEncryptionAlgorithmsStatics : aliased constant Windows.IID := (1404400464, 50139, 18260, (156, 0, 65, 57, 35, 116, 161, 9 ));
   
   type IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_None
   (
      This       : access IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TripleDesDukpt
   (
      This       : access IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedBase
   (
      This       : access IMagneticStripeReaderEncryptionAlgorithmsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderCardTypesStatics : aliased constant Windows.IID := (1385114717, 10630, 18255, (132, 84, 124, 205, 5, 146, 141, 95 ));
   
   type IMagneticStripeReaderCardTypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unknown
   (
      This       : access IMagneticStripeReaderCardTypesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Bank
   (
      This       : access IMagneticStripeReaderCardTypesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Aamva
   (
      This       : access IMagneticStripeReaderCardTypesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedBase
   (
      This       : access IMagneticStripeReaderCardTypesStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderTrackData : aliased constant Windows.IID := (273479281, 19101, 17518, (171, 197, 32, 64, 35, 7, 186, 54 ));
   
   type IMagneticStripeReaderTrackData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IMagneticStripeReaderTrackData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_DiscretionaryData
   (
      This       : access IMagneticStripeReaderTrackData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_EncryptedData
   (
      This       : access IMagneticStripeReaderTrackData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderReport : aliased constant Windows.IID := (1784373319, 39344, 16776, (190, 241, 237, 223, 121, 247, 143, 230 ));
   
   type IMagneticStripeReaderReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CardType
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Track1
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderTrackData
   )
   return Windows.HRESULT is abstract;
   
   function get_Track2
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderTrackData
   )
   return Windows.HRESULT is abstract;
   
   function get_Track3
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderTrackData
   )
   return Windows.HRESULT is abstract;
   
   function get_Track4
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderTrackData
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CardAuthenticationData
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_CardAuthenticationDataLength
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalSecurityInformation
   (
      This       : access IMagneticStripeReaderReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderBankCardDataReceivedEventArgs : aliased constant Windows.IID := (781551651, 41754, 18275, (136, 44, 35, 114, 94, 57, 176, 142 ));
   
   type IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Report
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderReport
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountNumber
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceCode
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstName
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MiddleInitial
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Surname
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Suffix
   (
      This       : access IMagneticStripeReaderBankCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderAamvaCardDataReceivedEventArgs : aliased constant Windows.IID := (172735825, 49942, 18704, (135, 243, 122, 98, 186, 134, 45, 49 ));
   
   type IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Report
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderReport
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseNumber
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Restrictions
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Class
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Endorsements
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BirthDate
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstName
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Surname
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Suffix
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Gender
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HairColor
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EyeColor
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Weight
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_City
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostalCode
   (
      This       : access IMagneticStripeReaderAamvaCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs : aliased constant Windows.IID := (2936689940, 22988, 19040, (153, 232, 153, 165, 61, 172, 229, 170 ));
   
   type IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Report
   (
      This       : access IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderErrorOccurredEventArgs : aliased constant Windows.IID := (535689565, 11396, 16813, (183, 120, 242, 53, 106, 120, 154, 177 ));
   
   type IMagneticStripeReaderErrorOccurredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Track1Status
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderTrackErrorType
   )
   return Windows.HRESULT is abstract;
   
   function get_Track2Status
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderTrackErrorType
   )
   return Windows.HRESULT is abstract;
   
   function get_Track3Status
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderTrackErrorType
   )
   return Windows.HRESULT is abstract;
   
   function get_Track4Status
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderTrackErrorType
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorData
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IUnifiedPosErrorData
   )
   return Windows.HRESULT is abstract;
   
   function get_PartialInputData
   (
      This       : access IMagneticStripeReaderErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderStatusUpdatedEventArgs : aliased constant Windows.IID := (164391856, 12898, 16413, (158, 138, 232, 13, 99, 88, 144, 107 ));
   
   type IMagneticStripeReaderStatusUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IMagneticStripeReaderStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access IMagneticStripeReaderStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderCapabilities : aliased constant Windows.IID := (1898479772, 50240, 17570, (164, 103, 70, 145, 117, 208, 40, 150 ));
   
   type IMagneticStripeReaderCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CardAuthentication
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedEncryptionAlgorithms
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationLevel
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderAuthenticationLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIsoSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsJisOneSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsJisTwoSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerReportingType
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosPowerReportingType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsReportingSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsUpdatingSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrackDataMaskingSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTransmitSentinelsSupported
   (
      This       : access IMagneticStripeReaderCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedMagneticStripeReader : aliased constant Windows.IID := (1197254899, 37911, 18620, (185, 215, 65, 99, 167, 132, 76, 2 ));
   
   type IClaimedMagneticStripeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDisabledOnDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledOnDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDecodeDataEnabled
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDecodeDataEnabled
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDeviceAuthenticated
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DataEncryptionAlgorithm
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DataEncryptionAlgorithm
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TracksToRead
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.Devices.PointOfService.MagneticStripeReaderTrackIds
   )
   return Windows.HRESULT is abstract;
   
   function get_TracksToRead
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderTrackIds
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTransmitSentinelsEnabled
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTransmitSentinelsEnabled
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnableAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DisableAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RetainDevice
   (
      This       : access IClaimedMagneticStripeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetErrorReportingType
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; value : Windows.Devices.PointOfService.MagneticStripeReaderErrorReportingType
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveDeviceAuthenticationDataAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AuthenticateDeviceAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; responseToken : Windows.UInt8_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeAuthenticateDeviceAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; responseToken : Windows.UInt8_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateKeyAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; key : Windows.String
      ; keyName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ResetStatisticsAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateStatisticsAsync
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; statistics : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_BankCardDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; handler : TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BankCardDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AamvaCardDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; handler : TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AamvaCardDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VendorSpecificDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; handler : TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VendorSpecificDataReceived
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ReleaseDeviceRequested
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; handler : Windows.Devices.PointOfService.EventHandler_IClaimedMagneticStripeReader
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReleaseDeviceRequested
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ErrorOccurred
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; handler : TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ErrorOccurred
   (
      This       : access IClaimedMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderStatics : aliased constant Windows.IID := (3294604106, 61399, 18272, (165, 206, 21, 176, 228, 126, 148, 235 ));
   
   type IMagneticStripeReaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IMagneticStripeReaderStatics_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IMagneticStripeReaderStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IMagneticStripeReaderStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReaderStatics2 : aliased constant Windows.IID := (2360197986, 54887, 18682, (134, 188, 245, 174, 17, 137, 38, 43 ));
   
   type IMagneticStripeReaderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access IMagneticStripeReaderStatics2_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagneticStripeReader : aliased constant Windows.IID := (445820949, 18371, 18058, (147, 51, 12, 101, 23, 87, 72, 131 ));
   
   type IMagneticStripeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReaderCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCardTypes
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access UInt32_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAuthenticationProtocol
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderAuthenticationProtocol
   )
   return Windows.HRESULT is abstract;
   
   function CheckHealthAsync
   (
      This       : access IMagneticStripeReader_Interface
      ; level : Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ClaimReaderAsync
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedMagneticStripeReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveStatisticsAsync
   (
      This       : access IMagneticStripeReader_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetErrorReportingType
   (
      This       : access IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.MagneticStripeReaderErrorReportingType
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusUpdated
   (
      This       : access IMagneticStripeReader_Interface
      ; handler : TypedEventHandler_IMagneticStripeReader_add_StatusUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusUpdated
   (
      This       : access IMagneticStripeReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterCharacterSetIdsStatics : aliased constant Windows.IID := (1550884607, 28826, 20455, (178, 21, 6, 167, 72, 163, 139, 57 ));
   
   type IPosPrinterCharacterSetIdsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Utf16LE
   (
      This       : access IPosPrinterCharacterSetIdsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ascii
   (
      This       : access IPosPrinterCharacterSetIdsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Ansi
   (
      This       : access IPosPrinterCharacterSetIdsStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommonPosPrintStationCapabilities : aliased constant Windows.IID := (3730526922, 57390, 16617, (158, 94, 27, 72, 142, 106, 172, 252 ));
   
   type ICommonPosPrintStationCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPrinterPresent
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDualColorSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorCartridgeCapabilities
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterColorCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_CartridgeSensors
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterCartridgeSensors
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBoldSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsItalicSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUnderlineSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDoubleHighPrintSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDoubleWidePrintSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDoubleHighDoubleWidePrintSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaperEmptySensorSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaperNearEndSensorSupported
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCharactersPerLine
   (
      This       : access ICommonPosPrintStationCapabilities_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommonReceiptSlipCapabilities : aliased constant Windows.IID := (153643915, 39027, 19717, (191, 190, 71, 39, 166, 3, 143, 105 ));
   
   type ICommonReceiptSlipCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBarcodeSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBitmapSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLeft90RotationSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRight90RotationSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Is180RotationSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPrintAreaSupported
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RuledLineCapabilities
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterRuledLineCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedBarcodeRotations
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.IVectorView_PosPrinterRotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedBitmapRotations
   (
      This       : access ICommonReceiptSlipCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.IVectorView_PosPrinterRotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReceiptPrinterCapabilities : aliased constant Windows.IID := (3102782863, 20904, 17404, (155, 213, 141, 226, 114, 166, 65, 91 ));
   
   type IReceiptPrinterCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanCutPaper
   (
      This       : access IReceiptPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStampSupported
   (
      This       : access IReceiptPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MarkFeedCapabilities
   (
      This       : access IReceiptPrinterCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterMarkFeedCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISlipPrinterCapabilities : aliased constant Windows.IID := (2578539417, 18572, 16727, (138, 194, 159, 87, 247, 8, 211, 219 ));
   
   type ISlipPrinterCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsFullLengthSupported
   (
      This       : access ISlipPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBothSidesPrintingSupported
   (
      This       : access ISlipPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJournalPrinterCapabilities : aliased constant Windows.IID := (995937347, 57415, 17507, (187, 88, 23, 181, 186, 29, 128, 86 ));
   
   type IJournalPrinterCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterCapabilities : aliased constant Windows.IID := (3454621473, 17280, 18821, (173, 197, 57, 219, 48, 205, 147, 188 ));
   
   type IPosPrinterCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PowerReportingType
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosPowerReportingType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsReportingSupported
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsUpdatingSupported
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultCharacterSet
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCoverSensor
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMapCharacterSet
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTransactionSupported
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Receipt
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.IReceiptPrinterCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Slip
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.ISlipPrinterCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Journal
   (
      This       : access IPosPrinterCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.IJournalPrinterCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterStatus : aliased constant Windows.IID := (3522217776, 55872, 17192, (191, 118, 81, 86, 250, 51, 183, 71 ));
   
   type IPosPrinterStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StatusKind
   (
      This       : access IPosPrinterStatus_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterStatusKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access IPosPrinterStatus_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterStatusUpdatedEventArgs : aliased constant Windows.IID := (786139103, 5030, 17037, (186, 129, 176, 231, 195, 229, 163, 205 ));
   
   type IPosPrinterStatusUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPosPrinterStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.IPosPrinterStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterReleaseDeviceRequestedEventArgs : aliased constant Windows.IID := (734765913, 7407, 16562, (158, 203, 249, 39, 248, 86, 174, 60 ));
   
   type IPosPrinterReleaseDeviceRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterStatics : aliased constant Windows.IID := (2363544810, 4911, 19679, (166, 74, 45, 13, 124, 150, 168, 91 ));
   
   type IPosPrinterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IPosPrinterStatics_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IPosPrinterStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IPosPrinterStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterStatics2 : aliased constant Windows.IID := (4006423580, 45264, 17127, (177, 55, 184, 155, 22, 36, 77, 65 ));
   
   type IPosPrinterStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access IPosPrinterStatics2_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinter : aliased constant Windows.IID := (704889102, 39449, 18945, (153, 79, 18, 223, 173, 106, 220, 191 ));
   
   type IPosPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IPosPrinterCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCharacterSets
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedTypeFaces
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IPosPrinterStatus
   )
   return Windows.HRESULT is abstract;
   
   function ClaimPrinterAsync
   (
      This       : access IPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedPosPrinter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckHealthAsync
   (
      This       : access IPosPrinter_Interface
      ; level : Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStatisticsAsync
   (
      This       : access IPosPrinter_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusUpdated
   (
      This       : access IPosPrinter_Interface
      ; handler : TypedEventHandler_IPosPrinter_add_StatusUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusUpdated
   (
      This       : access IPosPrinter_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPosPrinterJob : aliased constant Windows.IID := (2593390684, 1557, 17809, (165, 143, 48, 248, 126, 223, 226, 228 ));
   
   type IPosPrinterJob_Interface is interface and Windows.IInspectable_Interface;
   
   function Print
   (
      This       : access IPosPrinterJob_Interface
      ; data : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PrintLine
   (
      This       : access IPosPrinterJob_Interface
      ; data : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PrintNewline
   (
      This       : access IPosPrinterJob_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ExecuteAsync
   (
      This       : access IPosPrinterJob_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReceiptOrSlipJob : aliased constant Windows.IID := (1394710974, 51395, 19906, (137, 233, 92, 74, 55, 179, 77, 220 ));
   
   type IReceiptOrSlipJob_Interface is interface and Windows.IInspectable_Interface;
   
   function SetBarcodeRotation
   (
      This       : access IReceiptOrSlipJob_Interface
      ; value : Windows.Devices.PointOfService.PosPrinterRotation
   )
   return Windows.HRESULT is abstract;
   
   function SetPrintRotation
   (
      This       : access IReceiptOrSlipJob_Interface
      ; value : Windows.Devices.PointOfService.PosPrinterRotation
      ; includeBitmaps : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetPrintArea
   (
      This       : access IReceiptOrSlipJob_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function SetBitmap
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmapNumber : Windows.UInt32
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignment : Windows.Devices.PointOfService.PosPrinterAlignment
   )
   return Windows.HRESULT is abstract;
   
   function SetBitmapCustomWidthStandardAlign
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmapNumber : Windows.UInt32
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignment : Windows.Devices.PointOfService.PosPrinterAlignment
      ; width : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetCustomAlignedBitmap
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmapNumber : Windows.UInt32
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignmentDistance : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetBitmapCustomWidthCustomAlign
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmapNumber : Windows.UInt32
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignmentDistance : Windows.UInt32
      ; width : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function PrintSavedBitmap
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmapNumber : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function DrawRuledLine
   (
      This       : access IReceiptOrSlipJob_Interface
      ; positionList : Windows.String
      ; lineDirection : Windows.Devices.PointOfService.PosPrinterLineDirection
      ; lineWidth : Windows.UInt32
      ; lineStyle : Windows.Devices.PointOfService.PosPrinterLineStyle
      ; lineColor : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function PrintBarcode
   (
      This       : access IReceiptOrSlipJob_Interface
      ; data : Windows.String
      ; symbology : Windows.UInt32
      ; height : Windows.UInt32
      ; width : Windows.UInt32
      ; textPosition : Windows.Devices.PointOfService.PosPrinterBarcodeTextPosition
      ; alignment : Windows.Devices.PointOfService.PosPrinterAlignment
   )
   return Windows.HRESULT is abstract;
   
   function PrintBarcodeCustomAlign
   (
      This       : access IReceiptOrSlipJob_Interface
      ; data : Windows.String
      ; symbology : Windows.UInt32
      ; height : Windows.UInt32
      ; width : Windows.UInt32
      ; textPosition : Windows.Devices.PointOfService.PosPrinterBarcodeTextPosition
      ; alignmentDistance : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function PrintBitmap
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignment : Windows.Devices.PointOfService.PosPrinterAlignment
   )
   return Windows.HRESULT is abstract;
   
   function PrintBitmapCustomWidthStandardAlign
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignment : Windows.Devices.PointOfService.PosPrinterAlignment
      ; width : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function PrintCustomAlignedBitmap
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignmentDistance : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function PrintBitmapCustomWidthCustomAlign
   (
      This       : access IReceiptOrSlipJob_Interface
      ; bitmap : Windows.Graphics.Imaging.IBitmapFrame
      ; alignmentDistance : Windows.UInt32
      ; width : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReceiptPrintJob : aliased constant Windows.IID := (2861958766, 44205, 19321, (157, 15, 192, 207, 192, 141, 199, 123 ));
   
   type IReceiptPrintJob_Interface is interface and Windows.IInspectable_Interface;
   
   function MarkFeed
   (
      This       : access IReceiptPrintJob_Interface
      ; kind : Windows.Devices.PointOfService.PosPrinterMarkFeedKind
   )
   return Windows.HRESULT is abstract;
   
   function CutPaper
   (
      This       : access IReceiptPrintJob_Interface
      ; percentage : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function CutPaperDefault
   (
      This       : access IReceiptPrintJob_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommonClaimedPosPrinterStation : aliased constant Windows.IID := (3085657768, 65162, 19707, (139, 66, 227, 91, 40, 12, 178, 124 ));
   
   type ICommonClaimedPosPrinterStation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_CharactersPerLine
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CharactersPerLine
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_LineHeight
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LineHeight
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_LineSpacing
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LineSpacing
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LineWidth
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLetterQuality
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLetterQuality
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaperNearEnd
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorCartridge
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; value : Windows.Devices.PointOfService.PosPrinterColorCartridge
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorCartridge
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterColorCartridge
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCoverOpen
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCartridgeRemoved
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCartridgeEmpty
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHeadCleaning
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaperEmpty
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadyToPrint
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ValidateData
   (
      This       : access ICommonClaimedPosPrinterStation_Interface
      ; data : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedReceiptPrinter : aliased constant Windows.IID := (2597485172, 56673, 20194, (152, 55, 91, 93, 114, 213, 56, 185 ));
   
   type IClaimedReceiptPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SidewaysMaxLines
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SidewaysMaxChars
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LinesToPaperCut
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PageSize
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintArea
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CreateJob
   (
      This       : access IClaimedReceiptPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IReceiptPrintJob
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedSlipPrinter : aliased constant Windows.IID := (3177050098, 44944, 20106, (183, 123, 227, 174, 156, 166, 58, 127 ));
   
   type IClaimedSlipPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SidewaysMaxLines
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SidewaysMaxChars
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLines
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LinesNearEndToEnd
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintSide
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterPrintSide
   )
   return Windows.HRESULT is abstract;
   
   function get_PageSize
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintArea
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function OpenJaws
   (
      This       : access IClaimedSlipPrinter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function CloseJaws
   (
      This       : access IClaimedSlipPrinter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function InsertSlipAsync
   (
      This       : access IClaimedSlipPrinter_Interface
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemoveSlipAsync
   (
      This       : access IClaimedSlipPrinter_Interface
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ChangePrintSide
   (
      This       : access IClaimedSlipPrinter_Interface
      ; printSide : Windows.Devices.PointOfService.PosPrinterPrintSide
   )
   return Windows.HRESULT is abstract;
   
   function CreateJob
   (
      This       : access IClaimedSlipPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IReceiptOrSlipJob
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedJournalPrinter : aliased constant Windows.IID := (1743390256, 20861, 18559, (159, 223, 210, 224, 160, 162, 100, 165 ));
   
   type IClaimedJournalPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateJob
   (
      This       : access IClaimedJournalPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IPosPrinterJob
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedPosPrinter : aliased constant Windows.IID := (1835322892, 57406, 19220, (163, 142, 194, 140, 52, 184, 99, 83 ));
   
   type IClaimedPosPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CharacterSet
   (
      This       : access IClaimedPosPrinter_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterSet
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCoverOpen
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCharacterSetMappingEnabled
   (
      This       : access IClaimedPosPrinter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCharacterSetMappingEnabled
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MapMode
   (
      This       : access IClaimedPosPrinter_Interface
      ; value : Windows.Devices.PointOfService.PosPrinterMapMode
   )
   return Windows.HRESULT is abstract;
   
   function get_MapMode
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterMapMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Receipt
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedReceiptPrinter
   )
   return Windows.HRESULT is abstract;
   
   function get_Slip
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedSlipPrinter
   )
   return Windows.HRESULT is abstract;
   
   function get_Journal
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedJournalPrinter
   )
   return Windows.HRESULT is abstract;
   
   function EnableAsync
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisableAsync
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetainDeviceAsync
   (
      This       : access IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ResetStatisticsAsync
   (
      This       : access IClaimedPosPrinter_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateStatisticsAsync
   (
      This       : access IClaimedPosPrinter_Interface
      ; statistics : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ReleaseDeviceRequested
   (
      This       : access IClaimedPosPrinter_Interface
      ; handler : TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReleaseDeviceRequested
   (
      This       : access IClaimedPosPrinter_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerStatusUpdatedEventArgs : aliased constant Windows.IID := (816507274, 3440, 17820, (149, 83, 135, 225, 36, 197, 36, 136 ));
   
   type ICashDrawerStatusUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICashDrawerStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawerStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerStatus : aliased constant Windows.IID := (1807579327, 56481, 19974, (153, 235, 90, 246, 165, 174, 193, 8 ));
   
   type ICashDrawerStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StatusKind
   (
      This       : access ICashDrawerStatus_Interface
      ; RetVal : access Windows.Devices.PointOfService.CashDrawerStatusKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access ICashDrawerStatus_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerCapabilities : aliased constant Windows.IID := (197582347, 59623, 19231, (177, 209, 62, 80, 26, 208, 130, 71 ));
   
   type ICashDrawerCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PowerReportingType
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosPowerReportingType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsReportingSupported
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsUpdatingSupported
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatusReportingSupported
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatusMultiDrawerDetectSupported
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDrawerOpenSensorAvailable
   (
      This       : access ICashDrawerCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerEventSourceEventArgs : aliased constant Windows.IID := (1774926785, 5247, 16924, (156, 35, 9, 1, 35, 187, 120, 108 ));
   
   type ICashDrawerEventSourceEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CashDrawer
   (
      This       : access ICashDrawerEventSourceEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerEventSource : aliased constant Windows.IID := (3758548076, 62201, 17455, (141, 214, 6, 193, 10, 66, 39, 186 ));
   
   type ICashDrawerEventSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_DrawerClosed
   (
      This       : access ICashDrawerEventSource_Interface
      ; handler : TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DrawerClosed
   (
      This       : access ICashDrawerEventSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DrawerOpened
   (
      This       : access ICashDrawerEventSource_Interface
      ; handler : TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DrawerOpened
   (
      This       : access ICashDrawerEventSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerStatics : aliased constant Windows.IID := (3751843162, 54327, 20479, (181, 71, 221, 169, 105, 164, 248, 131 ));
   
   type ICashDrawerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access ICashDrawerStatics_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ICashDrawerStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access ICashDrawerStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerStatics2 : aliased constant Windows.IID := (1048674593, 35906, 16616, (156, 14, 64, 41, 112, 72, 16, 76 ));
   
   type ICashDrawerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access ICashDrawerStatics2_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawer : aliased constant Windows.IID := (2676553160, 56916, 19182, (168, 144, 146, 11, 203, 254, 48, 252 ));
   
   type ICashDrawer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawerCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawerStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDrawerOpen
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DrawerEventSource
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawerEventSource
   )
   return Windows.HRESULT is abstract;
   
   function ClaimDrawerAsync
   (
      This       : access ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedCashDrawer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckHealthAsync
   (
      This       : access ICashDrawer_Interface
      ; level : Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStatisticsAsync
   (
      This       : access ICashDrawer_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusUpdated
   (
      This       : access ICashDrawer_Interface
      ; handler : TypedEventHandler_ICashDrawer_add_StatusUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusUpdated
   (
      This       : access ICashDrawer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICashDrawerCloseAlarm : aliased constant Windows.IID := (1811451079, 28515, 17166, (171, 59, 149, 215, 95, 251, 232, 127 ));
   
   type ICashDrawerCloseAlarm_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AlarmTimeout
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_AlarmTimeout
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_BeepFrequency
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BeepFrequency
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_BeepDuration
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_BeepDuration
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_BeepDelay
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_BeepDelay
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_AlarmTimeoutExpired
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; handler : TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AlarmTimeoutExpired
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access ICashDrawerCloseAlarm_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedCashDrawer : aliased constant Windows.IID := (3393165743, 43960, 17089, (138, 132, 92, 102, 81, 47, 90, 117 ));
   
   type IClaimedCashDrawer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDrawerOpen
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CloseAlarm
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawerCloseAlarm
   )
   return Windows.HRESULT is abstract;
   
   function OpenDrawerAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function EnableAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisableAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetainDeviceAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ResetStatisticsAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateStatisticsAsync
   (
      This       : access IClaimedCashDrawer_Interface
      ; statistics : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ReleaseDeviceRequested
   (
      This       : access IClaimedCashDrawer_Interface
      ; handler : TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReleaseDeviceRequested
   (
      This       : access IClaimedCashDrawer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayStatics : aliased constant Windows.IID := (36552886, 4528, 18064, (149, 71, 11, 57, 197, 175, 33, 20 ));
   
   type ILineDisplayStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access ILineDisplayStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access ILineDisplayStatics_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access ILineDisplayStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access ILineDisplayStatics_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayStatics2 : aliased constant Windows.IID := (1611415324, 30635, 18792, (167, 222, 192, 47, 241, 105, 242, 204 ));
   
   type ILineDisplayStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StatisticsCategorySelector
   (
      This       : access ILineDisplayStatics2_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayStatisticsCategorySelector
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedLineDisplayStatics : aliased constant Windows.IID := (2026543355, 35691, 18803, (134, 240, 62, 87, 12, 53, 24, 37 ));
   
   type IClaimedLineDisplayStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IClaimedLineDisplayStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedLineDisplay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IClaimedLineDisplayStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      This       : access IClaimedLineDisplayStatics_Interface
      ; connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayStatisticsCategorySelector : aliased constant Windows.IID := (3038889067, 37492, 19748, (148, 243, 182, 1, 123, 131, 36, 68 ));
   
   type ILineDisplayStatisticsCategorySelector_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllStatistics
   (
      This       : access ILineDisplayStatisticsCategorySelector_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UnifiedPosStatistics
   (
      This       : access ILineDisplayStatisticsCategorySelector_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerStatistics
   (
      This       : access ILineDisplayStatisticsCategorySelector_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayCursorAttributes : aliased constant Windows.IID := (1311593726, 20477, 16784, (170, 225, 206, 40, 95, 32, 200, 150 ));
   
   type ILineDisplayCursorAttributes_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBlinkEnabled
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsBlinkEnabled
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CursorType
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayCursorType
   )
   return Windows.HRESULT is abstract;
   
   function put_CursorType
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; value : Windows.Devices.PointOfService.LineDisplayCursorType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAutoAdvanceEnabled
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAutoAdvanceEnabled
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access ILineDisplayCursorAttributes_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayCursor : aliased constant Windows.IID := (3974102085, 30026, 20027, (171, 43, 21, 17, 129, 8, 86, 5 ));
   
   type ILineDisplayCursor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanCustomize
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBlinkSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBlockSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHalfBlockSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUnderlineSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReverseSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOtherSupported
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributes
   (
      This       : access ILineDisplayCursor_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayCursorAttributes
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateAttributesAsync
   (
      This       : access ILineDisplayCursor_Interface
      ; attributes : Windows.Devices.PointOfService.ILineDisplayCursorAttributes
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayMarquee : aliased constant Windows.IID := (2748530238, 62570, 19322, (188, 33, 83, 235, 59, 87, 248, 180 ));
   
   type ILineDisplayMarquee_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Format
   (
      This       : access ILineDisplayMarquee_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayMarqueeFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access ILineDisplayMarquee_Interface
      ; value : Windows.Devices.PointOfService.LineDisplayMarqueeFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_RepeatWaitInterval
   (
      This       : access ILineDisplayMarquee_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_RepeatWaitInterval
   (
      This       : access ILineDisplayMarquee_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollWaitInterval
   (
      This       : access ILineDisplayMarquee_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_ScrollWaitInterval
   (
      This       : access ILineDisplayMarquee_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function TryStartScrollingAsync
   (
      This       : access ILineDisplayMarquee_Interface
      ; direction : Windows.Devices.PointOfService.LineDisplayScrollDirection
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryStopScrollingAsync
   (
      This       : access ILineDisplayMarquee_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayStoredBitmap : aliased constant Windows.IID := (4129378651, 55326, 17338, (191, 27, 188, 250, 60, 120, 91, 160 ));
   
   type ILineDisplayStoredBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EscapeSequence
   (
      This       : access ILineDisplayStoredBitmap_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryDeleteAsync
   (
      This       : access ILineDisplayStoredBitmap_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayWindow : aliased constant Windows.IID := (3525308148, 9060, 19429, (190, 225, 133, 22, 128, 175, 73, 100 ));
   
   type ILineDisplayWindow_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SizeInCharacters
   (
      This       : access ILineDisplayWindow_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_InterCharacterWaitInterval
   (
      This       : access ILineDisplayWindow_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_InterCharacterWaitInterval
   (
      This       : access ILineDisplayWindow_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function TryRefreshAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayTextAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; text : Windows.String
      ; displayAttribute : Windows.Devices.PointOfService.LineDisplayTextAttribute
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayTextAtPositionAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; text : Windows.String
      ; displayAttribute : Windows.Devices.PointOfService.LineDisplayTextAttribute
      ; startPosition : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayTextNormalAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryScrollTextAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; direction : Windows.Devices.PointOfService.LineDisplayScrollDirection
      ; numberOfColumnsOrRows : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryClearTextAsync
   (
      This       : access ILineDisplayWindow_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayWindow2 : aliased constant Windows.IID := (2841436902, 48600, 17253, (142, 17, 222, 148, 222, 141, 255, 2 ));
   
   type ILineDisplayWindow2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cursor
   (
      This       : access ILineDisplayWindow2_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayCursor
   )
   return Windows.HRESULT is abstract;
   
   function get_Marquee
   (
      This       : access ILineDisplayWindow2_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayMarquee
   )
   return Windows.HRESULT is abstract;
   
   function ReadCharacterAtCursorAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStoredBitmapAtCursorAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Devices.PointOfService.ILineDisplayStoredBitmap
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStorageFileBitmapAtCursorAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStorageFileBitmapAtCursorWithAlignmentAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; horizontalAlignment : Windows.Devices.PointOfService.LineDisplayHorizontalAlignment
      ; verticalAlignment : Windows.Devices.PointOfService.LineDisplayVerticalAlignment
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStorageFileBitmapAtCursorWithAlignmentAndWidthAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; horizontalAlignment : Windows.Devices.PointOfService.LineDisplayHorizontalAlignment
      ; verticalAlignment : Windows.Devices.PointOfService.LineDisplayVerticalAlignment
      ; widthInPixels : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStorageFileBitmapAtPointAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; offsetInPixels : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDisplayStorageFileBitmapAtPointWithWidthAsync
   (
      This       : access ILineDisplayWindow2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; offsetInPixels : Windows.Foundation.Point
      ; widthInPixels : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayCustomGlyphs : aliased constant Windows.IID := (576190012, 62051, 17649, (161, 160, 231, 80, 166, 160, 236, 84 ));
   
   type ILineDisplayCustomGlyphs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SizeInPixels
   (
      This       : access ILineDisplayCustomGlyphs_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedGlyphCodes
   (
      This       : access ILineDisplayCustomGlyphs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryRedefineAsync
   (
      This       : access ILineDisplayCustomGlyphs_Interface
      ; glyphCode : Windows.UInt32
      ; glyphData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayStatusUpdatedEventArgs : aliased constant Windows.IID := (3721755674, 34555, 20154, (147, 209, 111, 94, 218, 82, 183, 82 ));
   
   type ILineDisplayStatusUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ILineDisplayStatusUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayPowerStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayCapabilities : aliased constant Windows.IID := (1511372241, 36293, 19356, (145, 114, 48, 62, 71, 183, 12, 85 ));
   
   type ILineDisplayCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStatisticsReportingSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStatisticsUpdatingSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerReportingType
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.UnifiedPosPowerReportingType
   )
   return Windows.HRESULT is abstract;
   
   function get_CanChangeScreenSize
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDisplayBitmaps
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanReadCharacterAtCursor
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMapCharacterSets
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDisplayCustomGlyphs
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanReverse
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayTextAttributeGranularity
   )
   return Windows.HRESULT is abstract;
   
   function get_CanBlink
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayTextAttributeGranularity
   )
   return Windows.HRESULT is abstract;
   
   function get_CanChangeBlinkRate
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBrightnessSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCursorSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHorizontalMarqueeSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVerticalMarqueeSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInterCharacterWaitSupported
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedDescriptors
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedWindows
   (
      This       : access ILineDisplayCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplay : aliased constant Windows.IID := (620093262, 15513, 17634, (183, 63, 229, 27, 227, 99, 122, 140 ));
   
   type ILineDisplay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceName
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceDescription
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceControlDescription
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceControlVersion
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceServiceVersion
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ClaimAsync
   (
      This       : access ILineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_IClaimedLineDisplay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplay2 : aliased constant Windows.IID := (3264652840, 61252, 16627, (189, 28, 176, 76, 106, 92, 220, 125 ));
   
   type ILineDisplay2_Interface is interface and Windows.IInspectable_Interface;
   
   function CheckPowerStatusAsync
   (
      This       : access ILineDisplay2_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_LineDisplayPowerStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedLineDisplay : aliased constant Windows.IID := (302696816, 39541, 19151, (170, 231, 9, 151, 43, 207, 135, 148 ));
   
   type IClaimedLineDisplay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceName
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceDescription
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceControlDescription
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceControlVersion
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceServiceVersion
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultWindow
   (
      This       : access IClaimedLineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   function RetainDevice
   (
      This       : access IClaimedLineDisplay_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_ReleaseDeviceRequested
   (
      This       : access IClaimedLineDisplay_Interface
      ; handler : TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReleaseDeviceRequested
   (
      This       : access IClaimedLineDisplay_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineDisplayAttributes : aliased constant Windows.IID := (3246254492, 8858, 19476, (166, 241, 180, 228, 177, 254, 173, 146 ));
   
   type ILineDisplayAttributes_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPowerNotifyEnabled
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPowerNotifyEnabled
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Brightness
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Brightness
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BlinkRate
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_BlinkRate
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenSizeInCharacters
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_ScreenSizeInCharacters
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterSet
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_CharacterSet
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCharacterSetMappingEnabled
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCharacterSetMappingEnabled
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentWindow
   (
      This       : access ILineDisplayAttributes_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   function put_CurrentWindow
   (
      This       : access ILineDisplayAttributes_Interface
      ; value : Windows.Devices.PointOfService.ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClaimedLineDisplay2 : aliased constant Windows.IID := (2736551405, 16885, 20086, (160, 116, 121, 94, 71, 164, 110, 151 ));
   
   type IClaimedLineDisplay2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatisticsAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; statisticsCategories : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckHealthAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; level : Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckPowerStatusAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_LineDisplayPowerStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusUpdated
   (
      This       : access IClaimedLineDisplay2_Interface
      ; handler : TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusUpdated
   (
      This       : access IClaimedLineDisplay2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedScreenSizesInCharacters
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Foundation.IVectorView_Size -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBitmapSizeInPixels
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCharacterSets
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomGlyphs
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayCustomGlyphs
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributes
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayAttributes
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateAttributesAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; attributes : Windows.Devices.PointOfService.ILineDisplayAttributes
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetDescriptorAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; descriptor : Windows.UInt32
      ; descriptorState : Windows.Devices.PointOfService.LineDisplayDescriptorState
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryClearDescriptorsAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateWindowAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; viewport : Windows.Foundation.Rect
      ; windowSize : Windows.Foundation.Size
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayWindow -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryStoreStorageFileBitmapAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayStoredBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryStoreStorageFileBitmapWithAlignmentAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; horizontalAlignment : Windows.Devices.PointOfService.LineDisplayHorizontalAlignment
      ; verticalAlignment : Windows.Devices.PointOfService.LineDisplayVerticalAlignment
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayStoredBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryStoreStorageFileBitmapWithAlignmentAndWidthAsync
   (
      This       : access IClaimedLineDisplay2_Interface
      ; bitmap : Windows.Storage.IStorageFile
      ; horizontalAlignment : Windows.Devices.PointOfService.LineDisplayHorizontalAlignment
      ; verticalAlignment : Windows.Devices.PointOfService.LineDisplayVerticalAlignment
      ; widthInPixels : Windows.Int32
      ; RetVal : access Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayStoredBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBarcodeScanner : aliased constant Windows.IID := (1633981661, 12450, 21055, (177, 162, 154, 17, 116, 222, 59, 23 ));
   
   type IAsyncOperation_IBarcodeScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBarcodeScanner_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IClaimedBarcodeScanner : aliased constant Windows.IID := (3379578889, 41186, 24093, (135, 207, 117, 161, 212, 157, 123, 219 ));
   
   type IAsyncOperation_IClaimedBarcodeScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IClaimedBarcodeScanner_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IClaimedBarcodeScanner_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedBarcodeScanner
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBarcodeSymbologyAttributes : aliased constant Windows.IID := (1175802058, 31667, 23262, (166, 66, 97, 184, 254, 242, 227, 92 ));
   
   type IAsyncOperation_IBarcodeSymbologyAttributes_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBarcodeSymbologyAttributes_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBarcodeSymbologyAttributes_Interface
      ; RetVal : access Windows.Devices.PointOfService.IBarcodeSymbologyAttributes
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMagneticStripeReader : aliased constant Windows.IID := (2473750025, 33148, 24371, (190, 228, 9, 13, 231, 7, 79, 25 ));
   
   type IAsyncOperation_IMagneticStripeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMagneticStripeReader_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.IMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IClaimedMagneticStripeReader : aliased constant Windows.IID := (1097010132, 62554, 22797, (138, 78, 247, 12, 158, 73, 173, 1 ));
   
   type IAsyncOperation_IClaimedMagneticStripeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IClaimedMagneticStripeReader_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IClaimedMagneticStripeReader_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedMagneticStripeReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_PosPrinterRotation : aliased constant Windows.IID := (4136103804, 45342, 22211, (145, 88, 230, 186, 21, 189, 82, 27 ));
   
   type IIterator_PosPrinterRotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_PosPrinterRotation_Interface
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterRotation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_PosPrinterRotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_PosPrinterRotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_PosPrinterRotation_Interface
      ; items : Windows.Devices.PointOfService.PosPrinterRotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_PosPrinterRotation : aliased constant Windows.IID := (454970765, 5621, 22530, (155, 35, 139, 117, 206, 42, 88, 197 ));
   
   type IIterable_PosPrinterRotation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PosPrinterRotation_Interface
      ; RetVal : access Windows.Devices.PointOfService.IIterator_PosPrinterRotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_PosPrinterRotation : aliased constant Windows.IID := (1869169417, 4226, 23940, (165, 234, 47, 174, 214, 182, 89, 14 ));
   
   type IVectorView_PosPrinterRotation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_PosPrinterRotation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.PointOfService.PosPrinterRotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_PosPrinterRotation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_PosPrinterRotation_Interface
      ; value : Windows.Devices.PointOfService.PosPrinterRotation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_PosPrinterRotation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.PointOfService.PosPrinterRotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPosPrinter : aliased constant Windows.IID := (38762446, 20931, 23292, (159, 48, 36, 179, 192, 243, 178, 90 ));
   
   type IAsyncOperation_IPosPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPosPrinter_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IClaimedPosPrinter : aliased constant Windows.IID := (3024580501, 13658, 20541, (184, 68, 23, 86, 200, 207, 218, 152 ));
   
   type IAsyncOperation_IClaimedPosPrinter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IClaimedPosPrinter_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IClaimedPosPrinter_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedPosPrinter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICashDrawer : aliased constant Windows.IID := (1157657703, 37618, 23551, (177, 145, 170, 80, 0, 254, 221, 158 ));
   
   type IAsyncOperation_ICashDrawer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICashDrawer_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ICashDrawer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ICashDrawer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.ICashDrawer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IClaimedCashDrawer : aliased constant Windows.IID := (2452678570, 8352, 22354, (156, 32, 75, 244, 73, 52, 168, 126 ));
   
   type IAsyncOperation_IClaimedCashDrawer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IClaimedCashDrawer_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedCashDrawer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedCashDrawer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IClaimedCashDrawer_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedCashDrawer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILineDisplay : aliased constant Windows.IID := (1090509545, 59329, 23620, (145, 180, 189, 132, 235, 248, 83, 155 ));
   
   type IAsyncOperation_ILineDisplay_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILineDisplay_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplay
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplay
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IClaimedLineDisplay : aliased constant Windows.IID := (1271965956, 6826, 21594, (140, 188, 29, 69, 195, 232, 14, 94 ));
   
   type IAsyncOperation_IClaimedLineDisplay_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IClaimedLineDisplay_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedLineDisplay
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IClaimedLineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_IClaimedLineDisplay
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IClaimedLineDisplay_Interface
      ; RetVal : access Windows.Devices.PointOfService.IClaimedLineDisplay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_LineDisplayPowerStatus : aliased constant Windows.IID := (910093773, 31010, 21763, (144, 9, 28, 99, 28, 158, 54, 83 ));
   
   type IAsyncOperation_LineDisplayPowerStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_LineDisplayPowerStatus_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_LineDisplayPowerStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_LineDisplayPowerStatus_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_LineDisplayPowerStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_LineDisplayPowerStatus_Interface
      ; RetVal : access Windows.Devices.PointOfService.LineDisplayPowerStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILineDisplayWindow : aliased constant Windows.IID := (2538991707, 25804, 20561, (131, 80, 74, 207, 31, 252, 190, 88 ));
   
   type IAsyncOperation_ILineDisplayWindow_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILineDisplayWindow_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILineDisplayWindow_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILineDisplayWindow_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayWindow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILineDisplayStoredBitmap : aliased constant Windows.IID := (3718633341, 47009, 21533, (164, 128, 61, 70, 190, 217, 142, 157 ));
   
   type IAsyncOperation_ILineDisplayStoredBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILineDisplayStoredBitmap_Interface
      ; handler : Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplayStoredBitmap
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILineDisplayStoredBitmap_Interface
      ; RetVal : access Windows.Devices.PointOfService.AsyncOperationCompletedHandler_ILineDisplayStoredBitmap
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILineDisplayStoredBitmap_Interface
      ; RetVal : access Windows.Devices.PointOfService.ILineDisplayStoredBitmap
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBarcodeScanner : aliased constant Windows.IID := (2374680377, 39389, 20644, (170, 124, 47, 115, 1, 181, 202, 156 ));
   
   type AsyncOperationCompletedHandler_IBarcodeScanner_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBarcodeScanner'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBarcodeScanner_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IClaimedBarcodeScanner : aliased constant Windows.IID := (4285708845, 62404, 23230, (187, 206, 83, 21, 4, 73, 182, 55 ));
   
   type AsyncOperationCompletedHandler_IClaimedBarcodeScanner_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedBarcodeScanner ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IClaimedBarcodeScanner'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IClaimedBarcodeScanner_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedBarcodeScanner
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarcodeScanner_add_StatusUpdated : aliased constant Windows.IID := (3486031955, 62993, 21018, (138, 176, 164, 96, 225, 247, 22, 77 ));
   
   type TypedEventHandler_IBarcodeScanner_add_StatusUpdated_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IBarcodeScanner ; args : Windows.Devices.PointOfService.IBarcodeScannerStatusUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarcodeScanner_add_StatusUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScanner_add_StatusUpdated_Interface
      ; sender : Windows.Devices.PointOfService.IBarcodeScanner
      ; args : Windows.Devices.PointOfService.IBarcodeScannerStatusUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived : aliased constant Windows.IID := (1332012186, 48524, 21661, (151, 12, 165, 162, 80, 189, 39, 202 ));
   
   type TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner ; args : Windows.Devices.PointOfService.IBarcodeScannerDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedBarcodeScanner_add_DataReceived_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner
      ; args : Windows.Devices.PointOfService.IBarcodeScannerDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IClaimedBarcodeScanner : aliased constant Windows.IID := (3232551598, 23381, 22669, (129, 27, 190, 51, 164, 253, 218, 87 ));
   
   type EventHandler_IClaimedBarcodeScanner_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Devices.PointOfService.IClaimedBarcodeScanner)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IClaimedBarcodeScanner'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IClaimedBarcodeScanner_Interface
      ; sender : Windows.Object
      ; args : Windows.Devices.PointOfService.IClaimedBarcodeScanner
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived : aliased constant Windows.IID := (4221638319, 10809, 20847, (165, 121, 204, 62, 175, 54, 163, 75 ));
   
   type TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner ; args : Windows.Devices.PointOfService.IBarcodeScannerImagePreviewReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedBarcodeScanner_add_ImagePreviewReceived_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner
      ; args : Windows.Devices.PointOfService.IBarcodeScannerImagePreviewReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred : aliased constant Windows.IID := (3124952905, 56850, 21510, (151, 158, 6, 196, 92, 162, 213, 164 ));
   
   type TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner ; args : Windows.Devices.PointOfService.IBarcodeScannerErrorOccurredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedBarcodeScanner_add_ErrorOccurred_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedBarcodeScanner
      ; args : Windows.Devices.PointOfService.IBarcodeScannerErrorOccurredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes : aliased constant Windows.IID := (4177287762, 12101, 24134, (168, 46, 61, 160, 9, 87, 59, 92 ));
   
   type AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IBarcodeSymbologyAttributes ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBarcodeSymbologyAttributes_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IBarcodeSymbologyAttributes
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived : aliased constant Windows.IID := (1782698005, 9310, 20922, (189, 108, 68, 119, 93, 112, 191, 162 ));
   
   type TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader ; args : Windows.Devices.PointOfService.IMagneticStripeReaderBankCardDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedMagneticStripeReader_add_BankCardDataReceived_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader
      ; args : Windows.Devices.PointOfService.IMagneticStripeReaderBankCardDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived : aliased constant Windows.IID := (702582674, 50091, 22506, (170, 186, 120, 159, 121, 45, 122, 70 ));
   
   type TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader ; args : Windows.Devices.PointOfService.IMagneticStripeReaderAamvaCardDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedMagneticStripeReader_add_AamvaCardDataReceived_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader
      ; args : Windows.Devices.PointOfService.IMagneticStripeReaderAamvaCardDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived : aliased constant Windows.IID := (2509317306, 60996, 22028, (129, 131, 97, 198, 162, 48, 141, 143 ));
   
   type TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader ; args : Windows.Devices.PointOfService.IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedMagneticStripeReader_add_VendorSpecificDataReceived_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader
      ; args : Windows.Devices.PointOfService.IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IClaimedMagneticStripeReader : aliased constant Windows.IID := (2147925853, 2197, 23436, (128, 138, 107, 184, 242, 103, 148, 250 ));
   
   type EventHandler_IClaimedMagneticStripeReader_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Devices.PointOfService.IClaimedMagneticStripeReader)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IClaimedMagneticStripeReader'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IClaimedMagneticStripeReader_Interface
      ; sender : Windows.Object
      ; args : Windows.Devices.PointOfService.IClaimedMagneticStripeReader
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred : aliased constant Windows.IID := (342139366, 40338, 21630, (180, 172, 242, 85, 172, 133, 249, 80 ));
   
   type TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader ; args : Windows.Devices.PointOfService.IMagneticStripeReaderErrorOccurredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedMagneticStripeReader_add_ErrorOccurred_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedMagneticStripeReader
      ; args : Windows.Devices.PointOfService.IMagneticStripeReaderErrorOccurredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMagneticStripeReader : aliased constant Windows.IID := (851795835, 36579, 21853, (153, 139, 120, 201, 138, 169, 98, 123 ));
   
   type AsyncOperationCompletedHandler_IMagneticStripeReader_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMagneticStripeReader'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMagneticStripeReader_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IClaimedMagneticStripeReader : aliased constant Windows.IID := (2490117476, 8916, 21805, (171, 251, 158, 179, 65, 189, 103, 243 ));
   
   type AsyncOperationCompletedHandler_IClaimedMagneticStripeReader_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedMagneticStripeReader ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IClaimedMagneticStripeReader'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IClaimedMagneticStripeReader_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedMagneticStripeReader
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMagneticStripeReader_add_StatusUpdated : aliased constant Windows.IID := (1915587578, 57614, 21645, (175, 41, 40, 221, 144, 111, 111, 201 ));
   
   type TypedEventHandler_IMagneticStripeReader_add_StatusUpdated_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IMagneticStripeReader ; args : Windows.Devices.PointOfService.IMagneticStripeReaderStatusUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMagneticStripeReader_add_StatusUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMagneticStripeReader_add_StatusUpdated_Interface
      ; sender : Windows.Devices.PointOfService.IMagneticStripeReader
      ; args : Windows.Devices.PointOfService.IMagneticStripeReaderStatusUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPosPrinter : aliased constant Windows.IID := (1586346952, 35680, 22657, (139, 110, 246, 153, 180, 148, 157, 186 ));
   
   type AsyncOperationCompletedHandler_IPosPrinter_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPosPrinter'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPosPrinter_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IClaimedPosPrinter : aliased constant Windows.IID := (32181699, 15408, 24298, (159, 206, 239, 179, 152, 224, 190, 52 ));
   
   type AsyncOperationCompletedHandler_IClaimedPosPrinter_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedPosPrinter ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IClaimedPosPrinter'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IClaimedPosPrinter_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedPosPrinter
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPosPrinter_add_StatusUpdated : aliased constant Windows.IID := (548456042, 24385, 23090, (180, 90, 52, 79, 18, 231, 10, 52 ));
   
   type TypedEventHandler_IPosPrinter_add_StatusUpdated_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IPosPrinter ; args : Windows.Devices.PointOfService.IPosPrinterStatusUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPosPrinter_add_StatusUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPosPrinter_add_StatusUpdated_Interface
      ; sender : Windows.Devices.PointOfService.IPosPrinter
      ; args : Windows.Devices.PointOfService.IPosPrinterStatusUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested : aliased constant Windows.IID := (826429295, 53227, 20529, (138, 149, 190, 165, 155, 9, 229, 132 ));
   
   type TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedPosPrinter ; args : Windows.Devices.PointOfService.IPosPrinterReleaseDeviceRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedPosPrinter_add_ReleaseDeviceRequested_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedPosPrinter
      ; args : Windows.Devices.PointOfService.IPosPrinterReleaseDeviceRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed : aliased constant Windows.IID := (2169068196, 17526, 22399, (191, 136, 127, 232, 161, 40, 100, 68 ));
   
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.ICashDrawerEventSource ; args : Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICashDrawerEventSource_add_DrawerClosed_Interface
      ; sender : Windows.Devices.PointOfService.ICashDrawerEventSource
      ; args : Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened : aliased constant Windows.IID := (660899737, 59349, 23779, (151, 206, 47, 65, 16, 221, 50, 152 ));
   
   type TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.ICashDrawerEventSource ; args : Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICashDrawerEventSource_add_DrawerOpened_Interface
      ; sender : Windows.Devices.PointOfService.ICashDrawerEventSource
      ; args : Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICashDrawer : aliased constant Windows.IID := (1468229392, 61830, 22070, (137, 29, 248, 197, 57, 142, 166, 223 ));
   
   type AsyncOperationCompletedHandler_ICashDrawer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICashDrawer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICashDrawer_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IClaimedCashDrawer : aliased constant Windows.IID := (3867948854, 64999, 23803, (178, 47, 146, 17, 151, 35, 231, 41 ));
   
   type AsyncOperationCompletedHandler_IClaimedCashDrawer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedCashDrawer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IClaimedCashDrawer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IClaimedCashDrawer_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedCashDrawer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICashDrawer_add_StatusUpdated : aliased constant Windows.IID := (1684418292, 51982, 23663, (168, 32, 125, 10, 118, 149, 84, 201 ));
   
   type TypedEventHandler_ICashDrawer_add_StatusUpdated_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.ICashDrawer ; args : Windows.Devices.PointOfService.ICashDrawerStatusUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICashDrawer_add_StatusUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICashDrawer_add_StatusUpdated_Interface
      ; sender : Windows.Devices.PointOfService.ICashDrawer
      ; args : Windows.Devices.PointOfService.ICashDrawerStatusUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired : aliased constant Windows.IID := (3310337444, 24075, 21699, (148, 242, 131, 53, 30, 65, 196, 111 ));
   
   type TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.ICashDrawerCloseAlarm ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICashDrawerCloseAlarm_add_AlarmTimeoutExpired_Interface
      ; sender : Windows.Devices.PointOfService.ICashDrawerCloseAlarm
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested : aliased constant Windows.IID := (3683149185, 9314, 23681, (136, 12, 6, 17, 44, 167, 0, 18 ));
   
   type TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedCashDrawer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedCashDrawer_add_ReleaseDeviceRequested_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedCashDrawer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILineDisplay : aliased constant Windows.IID := (3049575542, 20294, 21444, (138, 69, 137, 219, 230, 214, 242, 134 ));
   
   type AsyncOperationCompletedHandler_ILineDisplay_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILineDisplay'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILineDisplay_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IClaimedLineDisplay : aliased constant Windows.IID := (1310358001, 57330, 23320, (190, 190, 42, 202, 1, 11, 191, 204 ));
   
   type AsyncOperationCompletedHandler_IClaimedLineDisplay_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedLineDisplay ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IClaimedLineDisplay'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IClaimedLineDisplay_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_IClaimedLineDisplay
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_LineDisplayPowerStatus : aliased constant Windows.IID := (2881121561, 55327, 23941, (169, 0, 102, 185, 107, 109, 43, 50 ));
   
   type AsyncOperationCompletedHandler_LineDisplayPowerStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_LineDisplayPowerStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_LineDisplayPowerStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_LineDisplayPowerStatus_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_LineDisplayPowerStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested : aliased constant Windows.IID := (3382147115, 18153, 23954, (172, 132, 238, 157, 125, 7, 58, 181 ));
   
   type TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedLineDisplay ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedLineDisplay_add_ReleaseDeviceRequested_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedLineDisplay
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated : aliased constant Windows.IID := (634484991, 12393, 21356, (160, 194, 136, 224, 37, 14, 138, 41 ));
   
   type TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated_Interface(Callback : access procedure (sender : Windows.Devices.PointOfService.IClaimedLineDisplay ; args : Windows.Devices.PointOfService.ILineDisplayStatusUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IClaimedLineDisplay2_add_StatusUpdated_Interface
      ; sender : Windows.Devices.PointOfService.IClaimedLineDisplay
      ; args : Windows.Devices.PointOfService.ILineDisplayStatusUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILineDisplayWindow : aliased constant Windows.IID := (3839064834, 46682, 23276, (162, 25, 209, 224, 183, 243, 249, 18 ));
   
   type AsyncOperationCompletedHandler_ILineDisplayWindow_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayWindow ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILineDisplayWindow'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILineDisplayWindow_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayWindow
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILineDisplayStoredBitmap : aliased constant Windows.IID := (2776037993, 39304, 23075, (132, 76, 248, 166, 159, 72, 164, 41 ));
   
   type AsyncOperationCompletedHandler_ILineDisplayStoredBitmap_Interface(Callback : access procedure (asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayStoredBitmap ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILineDisplayStoredBitmap'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILineDisplayStoredBitmap_Interface
      ; asyncInfo : Windows.Devices.PointOfService.IAsyncOperation_ILineDisplayStoredBitmap
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UnifiedPosErrorData is Windows.Devices.PointOfService.IUnifiedPosErrorData;
   subtype BarcodeScannerStatusUpdatedEventArgs is Windows.Devices.PointOfService.IBarcodeScannerStatusUpdatedEventArgs;
   subtype BarcodeSymbologyAttributes is Windows.Devices.PointOfService.IBarcodeSymbologyAttributes;
   subtype BarcodeScannerReport is Windows.Devices.PointOfService.IBarcodeScannerReport;
   subtype BarcodeScannerDataReceivedEventArgs is Windows.Devices.PointOfService.IBarcodeScannerDataReceivedEventArgs;
   subtype BarcodeScannerErrorOccurredEventArgs is Windows.Devices.PointOfService.IBarcodeScannerErrorOccurredEventArgs;
   subtype BarcodeScannerImagePreviewReceivedEventArgs is Windows.Devices.PointOfService.IBarcodeScannerImagePreviewReceivedEventArgs;
   subtype BarcodeScannerCapabilities is Windows.Devices.PointOfService.IBarcodeScannerCapabilities;
   subtype BarcodeScanner is Windows.Devices.PointOfService.IBarcodeScanner;
   subtype ClaimedBarcodeScanner is Windows.Devices.PointOfService.IClaimedBarcodeScanner;
   subtype MagneticStripeReaderTrackData is Windows.Devices.PointOfService.IMagneticStripeReaderTrackData;
   subtype MagneticStripeReaderReport is Windows.Devices.PointOfService.IMagneticStripeReaderReport;
   subtype MagneticStripeReaderBankCardDataReceivedEventArgs is Windows.Devices.PointOfService.IMagneticStripeReaderBankCardDataReceivedEventArgs;
   subtype MagneticStripeReaderAamvaCardDataReceivedEventArgs is Windows.Devices.PointOfService.IMagneticStripeReaderAamvaCardDataReceivedEventArgs;
   subtype MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs is Windows.Devices.PointOfService.IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs;
   subtype MagneticStripeReaderErrorOccurredEventArgs is Windows.Devices.PointOfService.IMagneticStripeReaderErrorOccurredEventArgs;
   subtype MagneticStripeReaderStatusUpdatedEventArgs is Windows.Devices.PointOfService.IMagneticStripeReaderStatusUpdatedEventArgs;
   subtype MagneticStripeReaderCapabilities is Windows.Devices.PointOfService.IMagneticStripeReaderCapabilities;
   subtype ClaimedMagneticStripeReader is Windows.Devices.PointOfService.IClaimedMagneticStripeReader;
   subtype MagneticStripeReader is Windows.Devices.PointOfService.IMagneticStripeReader;
   subtype ReceiptPrinterCapabilities is Windows.Devices.PointOfService.IReceiptPrinterCapabilities;
   subtype SlipPrinterCapabilities is Windows.Devices.PointOfService.ISlipPrinterCapabilities;
   subtype JournalPrinterCapabilities is Windows.Devices.PointOfService.IJournalPrinterCapabilities;
   subtype PosPrinterCapabilities is Windows.Devices.PointOfService.IPosPrinterCapabilities;
   subtype PosPrinterStatus is Windows.Devices.PointOfService.IPosPrinterStatus;
   subtype PosPrinterStatusUpdatedEventArgs is Windows.Devices.PointOfService.IPosPrinterStatusUpdatedEventArgs;
   subtype PosPrinterReleaseDeviceRequestedEventArgs is Windows.Devices.PointOfService.IPosPrinterReleaseDeviceRequestedEventArgs;
   subtype PosPrinter is Windows.Devices.PointOfService.IPosPrinter;
   subtype ClaimedPosPrinter is Windows.Devices.PointOfService.IClaimedPosPrinter;
   subtype ReceiptPrintJob is Windows.Devices.PointOfService.IReceiptPrintJob;
   subtype SlipPrintJob is Windows.Devices.PointOfService.IReceiptOrSlipJob;
   subtype JournalPrintJob is Windows.Devices.PointOfService.IPosPrinterJob;
   subtype ClaimedReceiptPrinter is Windows.Devices.PointOfService.IClaimedReceiptPrinter;
   subtype ClaimedSlipPrinter is Windows.Devices.PointOfService.IClaimedSlipPrinter;
   subtype ClaimedJournalPrinter is Windows.Devices.PointOfService.IClaimedJournalPrinter;
   subtype CashDrawerStatus is Windows.Devices.PointOfService.ICashDrawerStatus;
   subtype CashDrawerStatusUpdatedEventArgs is Windows.Devices.PointOfService.ICashDrawerStatusUpdatedEventArgs;
   subtype CashDrawerCapabilities is Windows.Devices.PointOfService.ICashDrawerCapabilities;
   subtype CashDrawer is Windows.Devices.PointOfService.ICashDrawer;
   subtype CashDrawerClosedEventArgs is Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs;
   subtype CashDrawerOpenedEventArgs is Windows.Devices.PointOfService.ICashDrawerEventSourceEventArgs;
   subtype CashDrawerEventSource is Windows.Devices.PointOfService.ICashDrawerEventSource;
   subtype ClaimedCashDrawer is Windows.Devices.PointOfService.IClaimedCashDrawer;
   subtype CashDrawerCloseAlarm is Windows.Devices.PointOfService.ICashDrawerCloseAlarm;
   subtype LineDisplay is Windows.Devices.PointOfService.ILineDisplay;
   subtype LineDisplayStatisticsCategorySelector is Windows.Devices.PointOfService.ILineDisplayStatisticsCategorySelector;
   subtype ClaimedLineDisplay is Windows.Devices.PointOfService.IClaimedLineDisplay;
   subtype LineDisplayCursorAttributes is Windows.Devices.PointOfService.ILineDisplayCursorAttributes;
   subtype LineDisplayCursor is Windows.Devices.PointOfService.ILineDisplayCursor;
   subtype LineDisplayMarquee is Windows.Devices.PointOfService.ILineDisplayMarquee;
   subtype LineDisplayStoredBitmap is Windows.Devices.PointOfService.ILineDisplayStoredBitmap;
   subtype LineDisplayWindow is Windows.Devices.PointOfService.ILineDisplayWindow;
   subtype LineDisplayCustomGlyphs is Windows.Devices.PointOfService.ILineDisplayCustomGlyphs;
   subtype LineDisplayStatusUpdatedEventArgs is Windows.Devices.PointOfService.ILineDisplayStatusUpdatedEventArgs;
   subtype LineDisplayCapabilities is Windows.Devices.PointOfService.ILineDisplayCapabilities;
   subtype LineDisplayAttributes is Windows.Devices.PointOfService.ILineDisplayAttributes;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Gs1DWCode
   return Windows.UInt32;
   
   function get_Unknown
   return Windows.UInt32;
   
   function get_Ean8
   return Windows.UInt32;
   
   function get_Ean8Add2
   return Windows.UInt32;
   
   function get_Ean8Add5
   return Windows.UInt32;
   
   function get_Eanv
   return Windows.UInt32;
   
   function get_EanvAdd2
   return Windows.UInt32;
   
   function get_EanvAdd5
   return Windows.UInt32;
   
   function get_Ean13
   return Windows.UInt32;
   
   function get_Ean13Add2
   return Windows.UInt32;
   
   function get_Ean13Add5
   return Windows.UInt32;
   
   function get_Isbn
   return Windows.UInt32;
   
   function get_IsbnAdd5
   return Windows.UInt32;
   
   function get_Ismn
   return Windows.UInt32;
   
   function get_IsmnAdd2
   return Windows.UInt32;
   
   function get_IsmnAdd5
   return Windows.UInt32;
   
   function get_Issn
   return Windows.UInt32;
   
   function get_IssnAdd2
   return Windows.UInt32;
   
   function get_IssnAdd5
   return Windows.UInt32;
   
   function get_Ean99
   return Windows.UInt32;
   
   function get_Ean99Add2
   return Windows.UInt32;
   
   function get_Ean99Add5
   return Windows.UInt32;
   
   function get_Upca
   return Windows.UInt32;
   
   function get_UpcaAdd2
   return Windows.UInt32;
   
   function get_UpcaAdd5
   return Windows.UInt32;
   
   function get_Upce
   return Windows.UInt32;
   
   function get_UpceAdd2
   return Windows.UInt32;
   
   function get_UpceAdd5
   return Windows.UInt32;
   
   function get_UpcCoupon
   return Windows.UInt32;
   
   function get_TfStd
   return Windows.UInt32;
   
   function get_TfDis
   return Windows.UInt32;
   
   function get_TfInt
   return Windows.UInt32;
   
   function get_TfInd
   return Windows.UInt32;
   
   function get_TfMat
   return Windows.UInt32;
   
   function get_TfIata
   return Windows.UInt32;
   
   function get_Gs1DatabarType1
   return Windows.UInt32;
   
   function get_Gs1DatabarType2
   return Windows.UInt32;
   
   function get_Gs1DatabarType3
   return Windows.UInt32;
   
   function get_Code39
   return Windows.UInt32;
   
   function get_Code39Ex
   return Windows.UInt32;
   
   function get_Trioptic39
   return Windows.UInt32;
   
   function get_Code32
   return Windows.UInt32;
   
   function get_Pzn
   return Windows.UInt32;
   
   function get_Code93
   return Windows.UInt32;
   
   function get_Code93Ex
   return Windows.UInt32;
   
   function get_Code128
   return Windows.UInt32;
   
   function get_Gs1128
   return Windows.UInt32;
   
   function get_Gs1128Coupon
   return Windows.UInt32;
   
   function get_UccEan128
   return Windows.UInt32;
   
   function get_Sisac
   return Windows.UInt32;
   
   function get_Isbt
   return Windows.UInt32;
   
   function get_Codabar
   return Windows.UInt32;
   
   function get_Code11
   return Windows.UInt32;
   
   function get_Msi
   return Windows.UInt32;
   
   function get_Plessey
   return Windows.UInt32;
   
   function get_Telepen
   return Windows.UInt32;
   
   function get_Code16k
   return Windows.UInt32;
   
   function get_CodablockA
   return Windows.UInt32;
   
   function get_CodablockF
   return Windows.UInt32;
   
   function get_Codablock128
   return Windows.UInt32;
   
   function get_Code49
   return Windows.UInt32;
   
   function get_Aztec
   return Windows.UInt32;
   
   function get_DataCode
   return Windows.UInt32;
   
   function get_DataMatrix
   return Windows.UInt32;
   
   function get_HanXin
   return Windows.UInt32;
   
   function get_Maxicode
   return Windows.UInt32;
   
   function get_MicroPdf417
   return Windows.UInt32;
   
   function get_MicroQr
   return Windows.UInt32;
   
   function get_Pdf417
   return Windows.UInt32;
   
   function get_Qr
   return Windows.UInt32;
   
   function get_MsTag
   return Windows.UInt32;
   
   function get_Ccab
   return Windows.UInt32;
   
   function get_Ccc
   return Windows.UInt32;
   
   function get_Tlc39
   return Windows.UInt32;
   
   function get_AusPost
   return Windows.UInt32;
   
   function get_CanPost
   return Windows.UInt32;
   
   function get_ChinaPost
   return Windows.UInt32;
   
   function get_DutchKix
   return Windows.UInt32;
   
   function get_InfoMail
   return Windows.UInt32;
   
   function get_ItalianPost25
   return Windows.UInt32;
   
   function get_ItalianPost39
   return Windows.UInt32;
   
   function get_JapanPost
   return Windows.UInt32;
   
   function get_KoreanPost
   return Windows.UInt32;
   
   function get_SwedenPost
   return Windows.UInt32;
   
   function get_UkPost
   return Windows.UInt32;
   
   function get_UsIntelligent
   return Windows.UInt32;
   
   function get_UsIntelligentPkg
   return Windows.UInt32;
   
   function get_UsPlanet
   return Windows.UInt32;
   
   function get_UsPostNet
   return Windows.UInt32;
   
   function get_Us4StateFics
   return Windows.UInt32;
   
   function get_OcrA
   return Windows.UInt32;
   
   function get_OcrB
   return Windows.UInt32;
   
   function get_Micr
   return Windows.UInt32;
   
   function get_ExtendedBase
   return Windows.UInt32;
   
   function GetName
   (
      scanDataType : Windows.UInt32
   )
   return Windows.String;
   
   function GetDefaultAsync
   return Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_IBarcodeScanner;
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   
   function get_None
   return Windows.UInt32;
   
   function get_TripleDesDukpt
   return Windows.UInt32;
   
   function get_ExtendedBase_MagneticStripeReaderEncryptionAlgorithms
   return Windows.UInt32;
   
   function get_Unknown_MagneticStripeReaderCardTypes
   return Windows.UInt32;
   
   function get_Bank
   return Windows.UInt32;
   
   function get_Aamva
   return Windows.UInt32;
   
   function get_ExtendedBase_MagneticStripeReaderCardTypes
   return Windows.UInt32;
   
   function GetDefaultAsync
   return Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_IMagneticStripeReader;
   
   function GetDeviceSelector_IMagneticStripeReader
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes_IMagneticStripeReader
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   
   function get_Utf16LE
   return Windows.UInt32;
   
   function get_Ascii
   return Windows.UInt32;
   
   function get_Ansi
   return Windows.UInt32;
   
   function GetDefaultAsync
   return Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_IPosPrinter;
   
   function GetDeviceSelector_IPosPrinter
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes_IPosPrinter
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes_ICashDrawer
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   
   function GetDefaultAsync
   return Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_ICashDrawer;
   
   function GetDeviceSelector_ICashDrawer
   return Windows.String;
   
   function get_StatisticsCategorySelector
   return Windows.Devices.PointOfService.ILineDisplayStatisticsCategorySelector;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay;
   
   function GetDefaultAsync
   return Windows.Devices.PointOfService.IAsyncOperation_ILineDisplay;
   
   function GetDeviceSelector_ILineDisplay
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes_ILineDisplay
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.PointOfService.IAsyncOperation_IClaimedLineDisplay;
   
   function GetDeviceSelector_IClaimedLineDisplay
   return Windows.String;
   
   function GetDeviceSelectorWithConnectionTypes_IClaimedLineDisplay
   (
      connectionTypes : Windows.Devices.PointOfService.PosConnectionTypes
   )
   return Windows.String;
   

end;
