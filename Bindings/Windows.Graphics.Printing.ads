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
with Windows.Foundation;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
limited with Windows.ApplicationModel.DataTransfer;
--------------------------------------------------------------------------------
package Windows.Graphics.Printing is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PrintMediaSize is (
      Default,
      NotAvailable,
      PrinterCustom,
      BusinessCard,
      CreditCard,
      IsoA0,
      IsoA1,
      IsoA10,
      IsoA2,
      IsoA3,
      IsoA3Extra,
      IsoA3Rotated,
      IsoA4,
      IsoA4Extra,
      IsoA4Rotated,
      IsoA5,
      IsoA5Extra,
      IsoA5Rotated,
      IsoA6,
      IsoA6Rotated,
      IsoA7,
      IsoA8,
      IsoA9,
      IsoB0,
      IsoB1,
      IsoB10,
      IsoB2,
      IsoB3,
      IsoB4,
      IsoB4Envelope,
      IsoB5Envelope,
      IsoB5Extra,
      IsoB7,
      IsoB8,
      IsoB9,
      IsoC0,
      IsoC1,
      IsoC10,
      IsoC2,
      IsoC3,
      IsoC3Envelope,
      IsoC4,
      IsoC4Envelope,
      IsoC5,
      IsoC5Envelope,
      IsoC6,
      IsoC6C5Envelope,
      IsoC6Envelope,
      IsoC7,
      IsoC8,
      IsoC9,
      IsoDLEnvelope,
      IsoDLEnvelopeRotated,
      IsoSRA3,
      Japan2LPhoto,
      JapanChou3Envelope,
      JapanChou3EnvelopeRotated,
      JapanChou4Envelope,
      JapanChou4EnvelopeRotated,
      JapanDoubleHagakiPostcard,
      JapanDoubleHagakiPostcardRotated,
      JapanHagakiPostcard,
      JapanHagakiPostcardRotated,
      JapanKaku2Envelope,
      JapanKaku2EnvelopeRotated,
      JapanKaku3Envelope,
      JapanKaku3EnvelopeRotated,
      JapanLPhoto,
      JapanQuadrupleHagakiPostcard,
      JapanYou1Envelope,
      JapanYou2Envelope,
      JapanYou3Envelope,
      JapanYou4Envelope,
      JapanYou4EnvelopeRotated,
      JapanYou6Envelope,
      JapanYou6EnvelopeRotated,
      JisB0,
      JisB1,
      JisB10,
      JisB2,
      JisB3,
      JisB4,
      JisB4Rotated,
      JisB5,
      JisB5Rotated,
      JisB6,
      JisB6Rotated,
      JisB7,
      JisB8,
      JisB9,
      NorthAmerica10x11,
      NorthAmerica10x12,
      NorthAmerica10x14,
      NorthAmerica11x17,
      NorthAmerica14x17,
      NorthAmerica4x6,
      NorthAmerica4x8,
      NorthAmerica5x7,
      NorthAmerica8x10,
      NorthAmerica9x11,
      NorthAmericaArchitectureASheet,
      NorthAmericaArchitectureBSheet,
      NorthAmericaArchitectureCSheet,
      NorthAmericaArchitectureDSheet,
      NorthAmericaArchitectureESheet,
      NorthAmericaCSheet,
      NorthAmericaDSheet,
      NorthAmericaESheet,
      NorthAmericaExecutive,
      NorthAmericaGermanLegalFanfold,
      NorthAmericaGermanStandardFanfold,
      NorthAmericaLegal,
      NorthAmericaLegalExtra,
      NorthAmericaLetter,
      NorthAmericaLetterExtra,
      NorthAmericaLetterPlus,
      NorthAmericaLetterRotated,
      NorthAmericaMonarchEnvelope,
      NorthAmericaNote,
      NorthAmericaNumber10Envelope,
      NorthAmericaNumber10EnvelopeRotated,
      NorthAmericaNumber11Envelope,
      NorthAmericaNumber12Envelope,
      NorthAmericaNumber14Envelope,
      NorthAmericaNumber9Envelope,
      NorthAmericaPersonalEnvelope,
      NorthAmericaQuarto,
      NorthAmericaStatement,
      NorthAmericaSuperA,
      NorthAmericaSuperB,
      NorthAmericaTabloid,
      NorthAmericaTabloidExtra,
      OtherMetricA3Plus,
      OtherMetricA4Plus,
      OtherMetricFolio,
      OtherMetricInviteEnvelope,
      OtherMetricItalianEnvelope,
      Prc10Envelope,
      Prc10EnvelopeRotated,
      Prc16K,
      Prc16KRotated,
      Prc1Envelope,
      Prc1EnvelopeRotated,
      Prc2Envelope,
      Prc2EnvelopeRotated,
      Prc32K,
      Prc32KBig,
      Prc32KRotated,
      Prc3Envelope,
      Prc3EnvelopeRotated,
      Prc4Envelope,
      Prc4EnvelopeRotated,
      Prc5Envelope,
      Prc5EnvelopeRotated,
      Prc6Envelope,
      Prc6EnvelopeRotated,
      Prc7Envelope,
      Prc7EnvelopeRotated,
      Prc8Envelope,
      Prc8EnvelopeRotated,
      Prc9Envelope,
      Prc9EnvelopeRotated,
      Roll04Inch,
      Roll06Inch,
      Roll08Inch,
      Roll12Inch,
      Roll15Inch,
      Roll18Inch,
      Roll22Inch,
      Roll24Inch,
      Roll30Inch,
      Roll36Inch,
      Roll54Inch
   );
   for PrintMediaSize use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      BusinessCard => 3,
      CreditCard => 4,
      IsoA0 => 5,
      IsoA1 => 6,
      IsoA10 => 7,
      IsoA2 => 8,
      IsoA3 => 9,
      IsoA3Extra => 10,
      IsoA3Rotated => 11,
      IsoA4 => 12,
      IsoA4Extra => 13,
      IsoA4Rotated => 14,
      IsoA5 => 15,
      IsoA5Extra => 16,
      IsoA5Rotated => 17,
      IsoA6 => 18,
      IsoA6Rotated => 19,
      IsoA7 => 20,
      IsoA8 => 21,
      IsoA9 => 22,
      IsoB0 => 23,
      IsoB1 => 24,
      IsoB10 => 25,
      IsoB2 => 26,
      IsoB3 => 27,
      IsoB4 => 28,
      IsoB4Envelope => 29,
      IsoB5Envelope => 30,
      IsoB5Extra => 31,
      IsoB7 => 32,
      IsoB8 => 33,
      IsoB9 => 34,
      IsoC0 => 35,
      IsoC1 => 36,
      IsoC10 => 37,
      IsoC2 => 38,
      IsoC3 => 39,
      IsoC3Envelope => 40,
      IsoC4 => 41,
      IsoC4Envelope => 42,
      IsoC5 => 43,
      IsoC5Envelope => 44,
      IsoC6 => 45,
      IsoC6C5Envelope => 46,
      IsoC6Envelope => 47,
      IsoC7 => 48,
      IsoC8 => 49,
      IsoC9 => 50,
      IsoDLEnvelope => 51,
      IsoDLEnvelopeRotated => 52,
      IsoSRA3 => 53,
      Japan2LPhoto => 54,
      JapanChou3Envelope => 55,
      JapanChou3EnvelopeRotated => 56,
      JapanChou4Envelope => 57,
      JapanChou4EnvelopeRotated => 58,
      JapanDoubleHagakiPostcard => 59,
      JapanDoubleHagakiPostcardRotated => 60,
      JapanHagakiPostcard => 61,
      JapanHagakiPostcardRotated => 62,
      JapanKaku2Envelope => 63,
      JapanKaku2EnvelopeRotated => 64,
      JapanKaku3Envelope => 65,
      JapanKaku3EnvelopeRotated => 66,
      JapanLPhoto => 67,
      JapanQuadrupleHagakiPostcard => 68,
      JapanYou1Envelope => 69,
      JapanYou2Envelope => 70,
      JapanYou3Envelope => 71,
      JapanYou4Envelope => 72,
      JapanYou4EnvelopeRotated => 73,
      JapanYou6Envelope => 74,
      JapanYou6EnvelopeRotated => 75,
      JisB0 => 76,
      JisB1 => 77,
      JisB10 => 78,
      JisB2 => 79,
      JisB3 => 80,
      JisB4 => 81,
      JisB4Rotated => 82,
      JisB5 => 83,
      JisB5Rotated => 84,
      JisB6 => 85,
      JisB6Rotated => 86,
      JisB7 => 87,
      JisB8 => 88,
      JisB9 => 89,
      NorthAmerica10x11 => 90,
      NorthAmerica10x12 => 91,
      NorthAmerica10x14 => 92,
      NorthAmerica11x17 => 93,
      NorthAmerica14x17 => 94,
      NorthAmerica4x6 => 95,
      NorthAmerica4x8 => 96,
      NorthAmerica5x7 => 97,
      NorthAmerica8x10 => 98,
      NorthAmerica9x11 => 99,
      NorthAmericaArchitectureASheet => 100,
      NorthAmericaArchitectureBSheet => 101,
      NorthAmericaArchitectureCSheet => 102,
      NorthAmericaArchitectureDSheet => 103,
      NorthAmericaArchitectureESheet => 104,
      NorthAmericaCSheet => 105,
      NorthAmericaDSheet => 106,
      NorthAmericaESheet => 107,
      NorthAmericaExecutive => 108,
      NorthAmericaGermanLegalFanfold => 109,
      NorthAmericaGermanStandardFanfold => 110,
      NorthAmericaLegal => 111,
      NorthAmericaLegalExtra => 112,
      NorthAmericaLetter => 113,
      NorthAmericaLetterExtra => 114,
      NorthAmericaLetterPlus => 115,
      NorthAmericaLetterRotated => 116,
      NorthAmericaMonarchEnvelope => 117,
      NorthAmericaNote => 118,
      NorthAmericaNumber10Envelope => 119,
      NorthAmericaNumber10EnvelopeRotated => 120,
      NorthAmericaNumber11Envelope => 121,
      NorthAmericaNumber12Envelope => 122,
      NorthAmericaNumber14Envelope => 123,
      NorthAmericaNumber9Envelope => 124,
      NorthAmericaPersonalEnvelope => 125,
      NorthAmericaQuarto => 126,
      NorthAmericaStatement => 127,
      NorthAmericaSuperA => 128,
      NorthAmericaSuperB => 129,
      NorthAmericaTabloid => 130,
      NorthAmericaTabloidExtra => 131,
      OtherMetricA3Plus => 132,
      OtherMetricA4Plus => 133,
      OtherMetricFolio => 134,
      OtherMetricInviteEnvelope => 135,
      OtherMetricItalianEnvelope => 136,
      Prc10Envelope => 137,
      Prc10EnvelopeRotated => 138,
      Prc16K => 139,
      Prc16KRotated => 140,
      Prc1Envelope => 141,
      Prc1EnvelopeRotated => 142,
      Prc2Envelope => 143,
      Prc2EnvelopeRotated => 144,
      Prc32K => 145,
      Prc32KBig => 146,
      Prc32KRotated => 147,
      Prc3Envelope => 148,
      Prc3EnvelopeRotated => 149,
      Prc4Envelope => 150,
      Prc4EnvelopeRotated => 151,
      Prc5Envelope => 152,
      Prc5EnvelopeRotated => 153,
      Prc6Envelope => 154,
      Prc6EnvelopeRotated => 155,
      Prc7Envelope => 156,
      Prc7EnvelopeRotated => 157,
      Prc8Envelope => 158,
      Prc8EnvelopeRotated => 159,
      Prc9Envelope => 160,
      Prc9EnvelopeRotated => 161,
      Roll04Inch => 162,
      Roll06Inch => 163,
      Roll08Inch => 164,
      Roll12Inch => 165,
      Roll15Inch => 166,
      Roll18Inch => 167,
      Roll22Inch => 168,
      Roll24Inch => 169,
      Roll30Inch => 170,
      Roll36Inch => 171,
      Roll54Inch => 172
   );
   for PrintMediaSize'Size use 32;
   
   type PrintMediaSize_Ptr is access PrintMediaSize;
   
   type PrintMediaType is (
      Default,
      NotAvailable,
      PrinterCustom,
      AutoSelect,
      Archival,
      BackPrintFilm,
      Bond,
      CardStock,
      Continuous,
      EnvelopePlain,
      EnvelopeWindow,
      Fabric,
      HighResolution,
      Label,
      MultiLayerForm,
      MultiPartForm,
      Photographic,
      PhotographicFilm,
      PhotographicGlossy,
      PhotographicHighGloss,
      PhotographicMatte,
      PhotographicSatin,
      PhotographicSemiGloss,
      Plain,
      Screen,
      ScreenPaged,
      Stationery,
      TabStockFull,
      TabStockPreCut,
      Transparency,
      TShirtTransfer,
      None
   );
   for PrintMediaType use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      AutoSelect => 3,
      Archival => 4,
      BackPrintFilm => 5,
      Bond => 6,
      CardStock => 7,
      Continuous => 8,
      EnvelopePlain => 9,
      EnvelopeWindow => 10,
      Fabric => 11,
      HighResolution => 12,
      Label => 13,
      MultiLayerForm => 14,
      MultiPartForm => 15,
      Photographic => 16,
      PhotographicFilm => 17,
      PhotographicGlossy => 18,
      PhotographicHighGloss => 19,
      PhotographicMatte => 20,
      PhotographicSatin => 21,
      PhotographicSemiGloss => 22,
      Plain => 23,
      Screen => 24,
      ScreenPaged => 25,
      Stationery => 26,
      TabStockFull => 27,
      TabStockPreCut => 28,
      Transparency => 29,
      TShirtTransfer => 30,
      None => 31
   );
   for PrintMediaType'Size use 32;
   
   type PrintMediaType_Ptr is access PrintMediaType;
   
   type PrintOrientation is (
      Default,
      NotAvailable,
      PrinterCustom,
      Portrait,
      PortraitFlipped,
      Landscape,
      LandscapeFlipped
   );
   for PrintOrientation use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      Portrait => 3,
      PortraitFlipped => 4,
      Landscape => 5,
      LandscapeFlipped => 6
   );
   for PrintOrientation'Size use 32;
   
   type PrintOrientation_Ptr is access PrintOrientation;
   
   type PrintQuality is (
      Default,
      NotAvailable,
      PrinterCustom,
      Automatic,
      Draft,
      Fax,
      High,
      Normal,
      Photographic,
      Text
   );
   for PrintQuality use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      Automatic => 3,
      Draft => 4,
      Fax => 5,
      High => 6,
      Normal => 7,
      Photographic => 8,
      Text => 9
   );
   for PrintQuality'Size use 32;
   
   type PrintQuality_Ptr is access PrintQuality;
   
   type PrintColorMode is (
      Default,
      NotAvailable,
      PrinterCustom,
      Color,
      Grayscale,
      Monochrome
   );
   for PrintColorMode use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      Color => 3,
      Grayscale => 4,
      Monochrome => 5
   );
   for PrintColorMode'Size use 32;
   
   type PrintColorMode_Ptr is access PrintColorMode;
   
   type PrintDuplex is (
      Default,
      NotAvailable,
      PrinterCustom,
      OneSided,
      TwoSidedShortEdge,
      TwoSidedLongEdge
   );
   for PrintDuplex use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      OneSided => 3,
      TwoSidedShortEdge => 4,
      TwoSidedLongEdge => 5
   );
   for PrintDuplex'Size use 32;
   
   type PrintDuplex_Ptr is access PrintDuplex;
   
   type PrintCollation is (
      Default,
      NotAvailable,
      PrinterCustom,
      Collated,
      Uncollated
   );
   for PrintCollation use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      Collated => 3,
      Uncollated => 4
   );
   for PrintCollation'Size use 32;
   
   type PrintCollation_Ptr is access PrintCollation;
   
   type PrintStaple is (
      Default,
      NotAvailable,
      PrinterCustom,
      None,
      StapleTopLeft,
      StapleTopRight,
      StapleBottomLeft,
      StapleBottomRight,
      StapleDualLeft,
      StapleDualRight,
      StapleDualTop,
      StapleDualBottom,
      SaddleStitch
   );
   for PrintStaple use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      None => 3,
      StapleTopLeft => 4,
      StapleTopRight => 5,
      StapleBottomLeft => 6,
      StapleBottomRight => 7,
      StapleDualLeft => 8,
      StapleDualRight => 9,
      StapleDualTop => 10,
      StapleDualBottom => 11,
      SaddleStitch => 12
   );
   for PrintStaple'Size use 32;
   
   type PrintStaple_Ptr is access PrintStaple;
   
   type PrintHolePunch is (
      Default,
      NotAvailable,
      PrinterCustom,
      None,
      LeftEdge,
      RightEdge,
      TopEdge,
      BottomEdge
   );
   for PrintHolePunch use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      None => 3,
      LeftEdge => 4,
      RightEdge => 5,
      TopEdge => 6,
      BottomEdge => 7
   );
   for PrintHolePunch'Size use 32;
   
   type PrintHolePunch_Ptr is access PrintHolePunch;
   
   type PrintBinding is (
      Default,
      NotAvailable,
      PrinterCustom,
      None,
      Bale,
      BindBottom,
      BindLeft,
      BindRight,
      BindTop,
      Booklet,
      EdgeStitchBottom,
      EdgeStitchLeft,
      EdgeStitchRight,
      EdgeStitchTop,
      Fold,
      JogOffset,
      Trim
   );
   for PrintBinding use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      None => 3,
      Bale => 4,
      BindBottom => 5,
      BindLeft => 6,
      BindRight => 7,
      BindTop => 8,
      Booklet => 9,
      EdgeStitchBottom => 10,
      EdgeStitchLeft => 11,
      EdgeStitchRight => 12,
      EdgeStitchTop => 13,
      Fold => 14,
      JogOffset => 15,
      Trim => 16
   );
   for PrintBinding'Size use 32;
   
   type PrintBinding_Ptr is access PrintBinding;
   
   type PrintBordering is (
      Default,
      NotAvailable,
      PrinterCustom,
      Bordered,
      Borderless
   );
   for PrintBordering use (
      Default => 0,
      NotAvailable => 1,
      PrinterCustom => 2,
      Bordered => 3,
      Borderless => 4
   );
   for PrintBordering'Size use 32;
   
   type PrintBordering_Ptr is access PrintBordering;
   
   type PrintTaskCompletion is (
      Abandoned,
      Canceled,
      Failed,
      Submitted
   );
   for PrintTaskCompletion use (
      Abandoned => 0,
      Canceled => 1,
      Failed => 2,
      Submitted => 3
   );
   for PrintTaskCompletion'Size use 32;
   
   type PrintTaskCompletion_Ptr is access PrintTaskCompletion;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PrintPageDescription is record
      PageSize : Windows.Foundation.Size;
      ImageableRect : Windows.Foundation.Rect;
      DpiX : Windows.UInt32;
      DpiY : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , PrintPageDescription);
   
   type PrintPageDescription_Ptr is access PrintPageDescription;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type PrintTaskSourceRequestedHandler_Interface;
   type PrintTaskSourceRequestedHandler is access all PrintTaskSourceRequestedHandler_Interface'Class;
   type PrintTaskSourceRequestedHandler_Ptr is access all PrintTaskSourceRequestedHandler;
   type TypedEventHandler_IPrintTask_add_Previewing_Interface;
   type TypedEventHandler_IPrintTask_add_Previewing is access all TypedEventHandler_IPrintTask_add_Previewing_Interface'Class;
   type TypedEventHandler_IPrintTask_add_Previewing_Ptr is access all TypedEventHandler_IPrintTask_add_Previewing;
   type TypedEventHandler_IPrintTask_add_Submitting_Interface;
   type TypedEventHandler_IPrintTask_add_Submitting is access all TypedEventHandler_IPrintTask_add_Submitting_Interface'Class;
   type TypedEventHandler_IPrintTask_add_Submitting_Ptr is access all TypedEventHandler_IPrintTask_add_Submitting;
   type TypedEventHandler_IPrintTask_add_Progressing_Interface;
   type TypedEventHandler_IPrintTask_add_Progressing is access all TypedEventHandler_IPrintTask_add_Progressing_Interface'Class;
   type TypedEventHandler_IPrintTask_add_Progressing_Ptr is access all TypedEventHandler_IPrintTask_add_Progressing;
   type TypedEventHandler_IPrintTask_add_Completed_Interface;
   type TypedEventHandler_IPrintTask_add_Completed is access all TypedEventHandler_IPrintTask_add_Completed_Interface'Class;
   type TypedEventHandler_IPrintTask_add_Completed_Ptr is access all TypedEventHandler_IPrintTask_add_Completed;
   type TypedEventHandler_IPrintManager_add_PrintTaskRequested_Interface;
   type TypedEventHandler_IPrintManager_add_PrintTaskRequested is access all TypedEventHandler_IPrintManager_add_PrintTaskRequested_Interface'Class;
   type TypedEventHandler_IPrintManager_add_PrintTaskRequested_Ptr is access all TypedEventHandler_IPrintManager_add_PrintTaskRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrintPageRange_Interface;
   type IPrintPageRange is access all IPrintPageRange_Interface'Class;
   type IPrintPageRange_Ptr is access all IPrintPageRange;
   type IPrintPageRangeFactory_Interface;
   type IPrintPageRangeFactory is access all IPrintPageRangeFactory_Interface'Class;
   type IPrintPageRangeFactory_Ptr is access all IPrintPageRangeFactory;
   type IPrintPageRangeOptions_Interface;
   type IPrintPageRangeOptions is access all IPrintPageRangeOptions_Interface'Class;
   type IPrintPageRangeOptions_Ptr is access all IPrintPageRangeOptions;
   type IPrintTaskOptionsCoreProperties_Interface;
   type IPrintTaskOptionsCoreProperties is access all IPrintTaskOptionsCoreProperties_Interface'Class;
   type IPrintTaskOptionsCoreProperties_Ptr is access all IPrintTaskOptionsCoreProperties;
   type IPrintPageInfo_Interface;
   type IPrintPageInfo is access all IPrintPageInfo_Interface'Class;
   type IPrintPageInfo_Ptr is access all IPrintPageInfo;
   type IPrintTaskOptions_Interface;
   type IPrintTaskOptions is access all IPrintTaskOptions_Interface'Class;
   type IPrintTaskOptions_Ptr is access all IPrintTaskOptions;
   type IPrintTaskOptions2_Interface;
   type IPrintTaskOptions2 is access all IPrintTaskOptions2_Interface'Class;
   type IPrintTaskOptions2_Ptr is access all IPrintTaskOptions2;
   type IPrintTaskOptionsCoreUIConfiguration_Interface;
   type IPrintTaskOptionsCoreUIConfiguration is access all IPrintTaskOptionsCoreUIConfiguration_Interface'Class;
   type IPrintTaskOptionsCoreUIConfiguration_Ptr is access all IPrintTaskOptionsCoreUIConfiguration;
   type IPrintTaskOptionsCore_Interface;
   type IPrintTaskOptionsCore is access all IPrintTaskOptionsCore_Interface'Class;
   type IPrintTaskOptionsCore_Ptr is access all IPrintTaskOptionsCore;
   type IStandardPrintTaskOptionsStatic_Interface;
   type IStandardPrintTaskOptionsStatic is access all IStandardPrintTaskOptionsStatic_Interface'Class;
   type IStandardPrintTaskOptionsStatic_Ptr is access all IStandardPrintTaskOptionsStatic;
   type IStandardPrintTaskOptionsStatic2_Interface;
   type IStandardPrintTaskOptionsStatic2 is access all IStandardPrintTaskOptionsStatic2_Interface'Class;
   type IStandardPrintTaskOptionsStatic2_Ptr is access all IStandardPrintTaskOptionsStatic2;
   type IStandardPrintTaskOptionsStatic3_Interface;
   type IStandardPrintTaskOptionsStatic3 is access all IStandardPrintTaskOptionsStatic3_Interface'Class;
   type IStandardPrintTaskOptionsStatic3_Ptr is access all IStandardPrintTaskOptionsStatic3;
   type IPrintDocumentSource_Interface;
   type IPrintDocumentSource is access all IPrintDocumentSource_Interface'Class;
   type IPrintDocumentSource_Ptr is access all IPrintDocumentSource;
   type IPrintTaskProgressingEventArgs_Interface;
   type IPrintTaskProgressingEventArgs is access all IPrintTaskProgressingEventArgs_Interface'Class;
   type IPrintTaskProgressingEventArgs_Ptr is access all IPrintTaskProgressingEventArgs;
   type IPrintTaskCompletedEventArgs_Interface;
   type IPrintTaskCompletedEventArgs is access all IPrintTaskCompletedEventArgs_Interface'Class;
   type IPrintTaskCompletedEventArgs_Ptr is access all IPrintTaskCompletedEventArgs;
   type IPrintTask_Interface;
   type IPrintTask is access all IPrintTask_Interface'Class;
   type IPrintTask_Ptr is access all IPrintTask;
   type IPrintTaskTargetDeviceSupport_Interface;
   type IPrintTaskTargetDeviceSupport is access all IPrintTaskTargetDeviceSupport_Interface'Class;
   type IPrintTaskTargetDeviceSupport_Ptr is access all IPrintTaskTargetDeviceSupport;
   type IPrintTask2_Interface;
   type IPrintTask2 is access all IPrintTask2_Interface'Class;
   type IPrintTask2_Ptr is access all IPrintTask2;
   type IPrintTaskSourceRequestedDeferral_Interface;
   type IPrintTaskSourceRequestedDeferral is access all IPrintTaskSourceRequestedDeferral_Interface'Class;
   type IPrintTaskSourceRequestedDeferral_Ptr is access all IPrintTaskSourceRequestedDeferral;
   type IPrintTaskSourceRequestedArgs_Interface;
   type IPrintTaskSourceRequestedArgs is access all IPrintTaskSourceRequestedArgs_Interface'Class;
   type IPrintTaskSourceRequestedArgs_Ptr is access all IPrintTaskSourceRequestedArgs;
   type IPrintTaskRequestedDeferral_Interface;
   type IPrintTaskRequestedDeferral is access all IPrintTaskRequestedDeferral_Interface'Class;
   type IPrintTaskRequestedDeferral_Ptr is access all IPrintTaskRequestedDeferral;
   type IPrintTaskRequest_Interface;
   type IPrintTaskRequest is access all IPrintTaskRequest_Interface'Class;
   type IPrintTaskRequest_Ptr is access all IPrintTaskRequest;
   type IPrintTaskRequestedEventArgs_Interface;
   type IPrintTaskRequestedEventArgs is access all IPrintTaskRequestedEventArgs_Interface'Class;
   type IPrintTaskRequestedEventArgs_Ptr is access all IPrintTaskRequestedEventArgs;
   type IPrintManagerStatic_Interface;
   type IPrintManagerStatic is access all IPrintManagerStatic_Interface'Class;
   type IPrintManagerStatic_Ptr is access all IPrintManagerStatic;
   type IPrintManagerStatic2_Interface;
   type IPrintManagerStatic2 is access all IPrintManagerStatic2_Interface'Class;
   type IPrintManagerStatic2_Ptr is access all IPrintManagerStatic2;
   type IPrintManager_Interface;
   type IPrintManager is access all IPrintManager_Interface'Class;
   type IPrintManager_Ptr is access all IPrintManager;
   type IIterator_IPrintPageRange_Interface;
   type IIterator_IPrintPageRange is access all IIterator_IPrintPageRange_Interface'Class;
   type IIterator_IPrintPageRange_Ptr is access all IIterator_IPrintPageRange;
   type IIterable_IPrintPageRange_Interface;
   type IIterable_IPrintPageRange is access all IIterable_IPrintPageRange_Interface'Class;
   type IIterable_IPrintPageRange_Ptr is access all IIterable_IPrintPageRange;
   type IVectorView_IPrintPageRange_Interface;
   type IVectorView_IPrintPageRange is access all IVectorView_IPrintPageRange_Interface'Class;
   type IVectorView_IPrintPageRange_Ptr is access all IVectorView_IPrintPageRange;
   type IVector_IPrintPageRange_Interface;
   type IVector_IPrintPageRange is access all IVector_IPrintPageRange_Interface'Class;
   type IVector_IPrintPageRange_Ptr is access all IVector_IPrintPageRange;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrintPageRange : aliased constant Windows.IID := (4171263060, 28284, 20933, (87, 253, 6, 96, 194, 215, 21, 19 ));
   
   type IPrintPageRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FirstPageNumber
   (
      This       : access IPrintPageRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastPageNumber
   (
      This       : access IPrintPageRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintPageRangeFactory : aliased constant Windows.IID := (1083167839, 57415, 24453, (113, 41, 251, 8, 90, 79, 173, 20 ));
   
   type IPrintPageRangeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPrintPageRangeFactory_Interface
      ; firstPage : Windows.Int32
      ; lastPage : Windows.Int32
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithSinglePage
   (
      This       : access IPrintPageRangeFactory_Interface
      ; page : Windows.Int32
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintPageRangeOptions : aliased constant Windows.IID := (3463296808, 4951, 18098, (169, 35, 121, 249, 149, 244, 72, 252 ));
   
   type IPrintPageRangeOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AllowAllPages
   (
      This       : access IPrintPageRangeOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowAllPages
   (
      This       : access IPrintPageRangeOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowCurrentPage
   (
      This       : access IPrintPageRangeOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowCurrentPage
   (
      This       : access IPrintPageRangeOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowCustomSetOfPages
   (
      This       : access IPrintPageRangeOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowCustomSetOfPages
   (
      This       : access IPrintPageRangeOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionsCoreProperties : aliased constant Windows.IID := (3250001970, 40595, 20053, (129, 75, 51, 38, 165, 158, 252, 225 ));
   
   type IPrintTaskOptionsCoreProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_MediaSize
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaSize
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function put_MediaType
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintMediaType
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintMediaType
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   function put_PrintQuality
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintQuality
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintQuality
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintQuality
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorMode
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintColorMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorMode
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintColorMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Duplex
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintDuplex
   )
   return Windows.HRESULT is abstract;
   
   function get_Duplex
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintDuplex
   )
   return Windows.HRESULT is abstract;
   
   function put_Collation
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintCollation
   )
   return Windows.HRESULT is abstract;
   
   function get_Collation
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintCollation
   )
   return Windows.HRESULT is abstract;
   
   function put_Staple
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintStaple
   )
   return Windows.HRESULT is abstract;
   
   function get_Staple
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintStaple
   )
   return Windows.HRESULT is abstract;
   
   function put_HolePunch
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintHolePunch
   )
   return Windows.HRESULT is abstract;
   
   function get_HolePunch
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintHolePunch
   )
   return Windows.HRESULT is abstract;
   
   function put_Binding
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.Graphics.Printing.PrintBinding
   )
   return Windows.HRESULT is abstract;
   
   function get_Binding
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintBinding
   )
   return Windows.HRESULT is abstract;
   
   function get_MinCopies
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxCopies
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_NumberOfCopies
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfCopies
   (
      This       : access IPrintTaskOptionsCoreProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintPageInfo : aliased constant Windows.IID := (3712739785, 42657, 19162, (147, 14, 218, 135, 42, 79, 35, 211 ));
   
   type IPrintPageInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_MediaSize
   (
      This       : access IPrintPageInfo_Interface
      ; value : Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaSize
   (
      This       : access IPrintPageInfo_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function put_PageSize
   (
      This       : access IPrintPageInfo_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_PageSize
   (
      This       : access IPrintPageInfo_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_DpiX
   (
      This       : access IPrintPageInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiX
   (
      This       : access IPrintPageInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DpiY
   (
      This       : access IPrintPageInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiY
   (
      This       : access IPrintPageInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IPrintPageInfo_Interface
      ; value : Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IPrintPageInfo_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptions : aliased constant Windows.IID := (1510631099, 53897, 16827, (150, 221, 87, 226, 131, 56, 174, 63 ));
   
   type IPrintTaskOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Bordering
   (
      This       : access IPrintTaskOptions_Interface
      ; value : Windows.Graphics.Printing.PrintBordering
   )
   return Windows.HRESULT is abstract;
   
   function get_Bordering
   (
      This       : access IPrintTaskOptions_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintBordering
   )
   return Windows.HRESULT is abstract;
   
   function GetPagePrintTicket
   (
      This       : access IPrintTaskOptions_Interface
      ; printPageInfo : Windows.Graphics.Printing.IPrintPageInfo
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptions2 : aliased constant Windows.IID := (3952809478, 39478, 19289, (134, 23, 178, 23, 132, 146, 98, 225 ));
   
   type IPrintTaskOptions2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PageRangeOptions
   (
      This       : access IPrintTaskOptions2_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRangeOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomPageRanges
   (
      This       : access IPrintTaskOptions2_Interface
      ; RetVal : access Windows.Graphics.Printing.IVector_IPrintPageRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionsCoreUIConfiguration : aliased constant Windows.IID := (1659280931, 39454, 17206, (183, 79, 60, 199, 244, 207, 247, 9 ));
   
   type IPrintTaskOptionsCoreUIConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayedOptions
   (
      This       : access IPrintTaskOptionsCoreUIConfiguration_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionsCore : aliased constant Windows.IID := (467383412, 20177, 16875, (190, 60, 114, 209, 142, 214, 115, 55 ));
   
   type IPrintTaskOptionsCore_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPageDescription
   (
      This       : access IPrintTaskOptionsCore_Interface
      ; jobPageNumber : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing.PrintPageDescription
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStandardPrintTaskOptionsStatic : aliased constant Windows.IID := (3024633126, 3536, 19668, (186, 255, 147, 15, 199, 214, 165, 116 ));
   
   type IStandardPrintTaskOptionsStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaSize
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PrintQuality
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorMode
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Duplex
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Collation
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Staple
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HolePunch
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Binding
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Copies
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NUp
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InputBin
   (
      This       : access IStandardPrintTaskOptionsStatic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStandardPrintTaskOptionsStatic2 : aliased constant Windows.IID := (1004768244, 31300, 17001, (154, 82, 129, 38, 30, 40, 158, 233 ));
   
   type IStandardPrintTaskOptionsStatic2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bordering
   (
      This       : access IStandardPrintTaskOptionsStatic2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStandardPrintTaskOptionsStatic3 : aliased constant Windows.IID := (3153497734, 14424, 16819, (167, 153, 85, 221, 152, 136, 212, 117 ));
   
   type IStandardPrintTaskOptionsStatic3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CustomPageRanges
   (
      This       : access IStandardPrintTaskOptionsStatic3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintDocumentSource : aliased constant Windows.IID := (3738962992, 61931, 18399, (170, 230, 237, 84, 39, 81, 31, 1 ));
   
   type IPrintDocumentSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskProgressingEventArgs : aliased constant Windows.IID := (2165101515, 46096, 17026, (160, 115, 90, 195, 120, 35, 65, 116 ));
   
   type IPrintTaskProgressingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DocumentPageCount
   (
      This       : access IPrintTaskProgressingEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskCompletedEventArgs : aliased constant Windows.IID := (1540175023, 9449, 19472, (141, 7, 20, 195, 70, 186, 63, 206 ));
   
   type IPrintTaskCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Completion
   (
      This       : access IPrintTaskCompletedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTaskCompletion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTask : aliased constant Windows.IID := (1641546311, 27894, 20397, (132, 226, 165, 232, 46, 45, 76, 235 ));
   
   type IPrintTask_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IPrintTask_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IPrintTask_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintDocumentSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IPrintTask_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskOptionsCore
   )
   return Windows.HRESULT is abstract;
   
   function add_Previewing
   (
      This       : access IPrintTask_Interface
      ; eventHandler : TypedEventHandler_IPrintTask_add_Previewing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Previewing
   (
      This       : access IPrintTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Submitting
   (
      This       : access IPrintTask_Interface
      ; eventHandler : TypedEventHandler_IPrintTask_add_Submitting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Submitting
   (
      This       : access IPrintTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Progressing
   (
      This       : access IPrintTask_Interface
      ; eventHandler : TypedEventHandler_IPrintTask_add_Progressing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Progressing
   (
      This       : access IPrintTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access IPrintTask_Interface
      ; eventHandler : TypedEventHandler_IPrintTask_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IPrintTask_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskTargetDeviceSupport : aliased constant Windows.IID := (693989568, 49867, 19325, (176, 234, 147, 9, 80, 145, 162, 32 ));
   
   type IPrintTaskTargetDeviceSupport_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsPrinterTargetEnabled
   (
      This       : access IPrintTaskTargetDeviceSupport_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPrinterTargetEnabled
   (
      This       : access IPrintTaskTargetDeviceSupport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Is3DManufacturingTargetEnabled
   (
      This       : access IPrintTaskTargetDeviceSupport_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Is3DManufacturingTargetEnabled
   (
      This       : access IPrintTaskTargetDeviceSupport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTask2 : aliased constant Windows.IID := (908281975, 15955, 19869, (143, 94, 49, 106, 200, 222, 218, 225 ));
   
   type IPrintTask2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsPreviewEnabled
   (
      This       : access IPrintTask2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPreviewEnabled
   (
      This       : access IPrintTask2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskSourceRequestedDeferral : aliased constant Windows.IID := (1242915025, 27026, 19869, (133, 85, 76, 164, 86, 63, 177, 102 ));
   
   type IPrintTaskSourceRequestedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPrintTaskSourceRequestedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskSourceRequestedArgs : aliased constant Windows.IID := (4193281982, 62550, 16880, (156, 152, 92, 231, 62, 133, 20, 16 ));
   
   type IPrintTaskSourceRequestedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Deadline
   (
      This       : access IPrintTaskSourceRequestedArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SetSource
   (
      This       : access IPrintTaskSourceRequestedArgs_Interface
      ; source : Windows.Graphics.Printing.IPrintDocumentSource
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintTaskSourceRequestedArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskSourceRequestedDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskRequestedDeferral : aliased constant Windows.IID := (3488592880, 52798, 17095, (148, 150, 100, 128, 12, 98, 44, 68 ));
   
   type IPrintTaskRequestedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPrintTaskRequestedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskRequest : aliased constant Windows.IID := (1878400558, 10018, 16960, (166, 124, 243, 100, 132, 154, 23, 243 ));
   
   type IPrintTaskRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Deadline
   (
      This       : access IPrintTaskRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function CreatePrintTask
   (
      This       : access IPrintTaskRequest_Interface
      ; title : Windows.String
      ; handler : Windows.Graphics.Printing.PrintTaskSourceRequestedHandler
      ; RetVal : access Windows.Graphics.Printing.IPrintTask
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintTaskRequest_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskRequestedDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskRequestedEventArgs : aliased constant Windows.IID := (3501193508, 41755, 17740, (167, 182, 93, 12, 197, 34, 252, 22 ));
   
   type IPrintTaskRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IPrintTaskRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintManagerStatic : aliased constant Windows.IID := (1477991885, 58932, 18004, (132, 240, 224, 21, 42, 130, 23, 172 ));
   
   type IPrintManagerStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IPrintManagerStatic_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintManager
   )
   return Windows.HRESULT is abstract;
   
   function ShowPrintUIAsync
   (
      This       : access IPrintManagerStatic_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintManagerStatic2 : aliased constant Windows.IID := (900307285, 59051, 16697, (154, 189, 184, 106, 114, 155, 53, 152 ));
   
   type IPrintManagerStatic2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IPrintManagerStatic2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintManager : aliased constant Windows.IID := (4280981140, 35993, 17661, (174, 74, 25, 217, 170, 154, 15, 10 ));
   
   type IPrintManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PrintTaskRequested
   (
      This       : access IPrintManager_Interface
      ; eventHandler : TypedEventHandler_IPrintManager_add_PrintTaskRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PrintTaskRequested
   (
      This       : access IPrintManager_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPrintPageRange : aliased constant Windows.IID := (955733605, 64320, 21474, (169, 22, 21, 186, 117, 74, 106, 158 ));
   
   type IIterator_IPrintPageRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPrintPageRange_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPrintPageRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPrintPageRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPrintPageRange_Interface
      ; items : Windows.Graphics.Printing.IPrintPageRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPrintPageRange : aliased constant Windows.IID := (3983400760, 13519, 23087, (185, 172, 65, 61, 255, 206, 127, 129 ));
   
   type IIterable_IPrintPageRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPrintPageRange_Interface
      ; RetVal : access Windows.Graphics.Printing.IIterator_IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPrintPageRange : aliased constant Windows.IID := (6533406, 8344, 24319, (150, 82, 8, 163, 81, 108, 153, 166 ));
   
   type IVectorView_IPrintPageRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPrintPageRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPrintPageRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPrintPageRange_Interface
      ; value : Windows.Graphics.Printing.IPrintPageRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPrintPageRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing.IPrintPageRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPrintPageRange : aliased constant Windows.IID := (489769496, 10774, 21551, (169, 134, 27, 120, 65, 184, 120, 170 ));
   
   type IVector_IPrintPageRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPrintPageRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPrintPageRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPrintPageRange_Interface
      ; RetVal : access Windows.Graphics.Printing.IVectorView_IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPrintPageRange_Interface
      ; value : Windows.Graphics.Printing.IPrintPageRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPrintPageRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPrintPageRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPrintPageRange_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPrintPageRange_Interface
      ; value : Windows.Graphics.Printing.IPrintPageRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPrintPageRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPrintPageRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPrintPageRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Printing.IPrintPageRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPrintPageRange_Interface
      ; items : Windows.Graphics.Printing.IPrintPageRange_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_PrintTaskSourceRequestedHandler : aliased constant Windows.IID := (1813028776, 23734, 19258, (134, 99, 243, 156, 176, 45, 201, 180 ));
   
   type PrintTaskSourceRequestedHandler_Interface(Callback : access procedure (args : Windows.Graphics.Printing.IPrintTaskSourceRequestedArgs)) is new Windows.IMulticastDelegate_Interface(IID_PrintTaskSourceRequestedHandler'access) with null record;
   function Invoke
   (
      This       : access PrintTaskSourceRequestedHandler_Interface
      ; args : Windows.Graphics.Printing.IPrintTaskSourceRequestedArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTask_add_Previewing : aliased constant Windows.IID := (1287733716, 49369, 21024, (177, 206, 128, 255, 243, 189, 45, 68 ));
   
   type TypedEventHandler_IPrintTask_add_Previewing_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.IPrintTask ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTask_add_Previewing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Previewing_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTask_add_Submitting : aliased constant Windows.IID := (1287733716, 49369, 21024, (177, 206, 128, 255, 243, 189, 45, 68 ));
   
   type TypedEventHandler_IPrintTask_add_Submitting_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.IPrintTask ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTask_add_Submitting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Submitting_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTask_add_Progressing : aliased constant Windows.IID := (3230467364, 22681, 21356, (143, 70, 85, 253, 170, 76, 247, 139 ));
   
   type TypedEventHandler_IPrintTask_add_Progressing_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.IPrintTask ; args : Windows.Graphics.Printing.IPrintTaskProgressingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTask_add_Progressing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Progressing_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Graphics.Printing.IPrintTaskProgressingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTask_add_Completed : aliased constant Windows.IID := (2964333897, 47533, 21030, (137, 138, 123, 86, 59, 70, 100, 12 ));
   
   type TypedEventHandler_IPrintTask_add_Completed_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.IPrintTask ; args : Windows.Graphics.Printing.IPrintTaskCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTask_add_Completed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Completed_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Graphics.Printing.IPrintTaskCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintManager_add_PrintTaskRequested : aliased constant Windows.IID := (2324478071, 28869, 21710, (139, 66, 215, 144, 226, 145, 72, 89 ));
   
   type TypedEventHandler_IPrintManager_add_PrintTaskRequested_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.IPrintManager ; args : Windows.Graphics.Printing.IPrintTaskRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintManager_add_PrintTaskRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintManager_add_PrintTaskRequested_Interface
      ; sender : Windows.Graphics.Printing.IPrintManager
      ; args : Windows.Graphics.Printing.IPrintTaskRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintPageRange is Windows.Graphics.Printing.IPrintPageRange;
   function Create
   (
      firstPage : Windows.Int32
      ; lastPage : Windows.Int32
   )
   return Windows.Graphics.Printing.IPrintPageRange;
   
   function CreateWithSinglePage
   (
      page : Windows.Int32
   )
   return Windows.Graphics.Printing.IPrintPageRange;
   
   subtype PrintPageRangeOptions is Windows.Graphics.Printing.IPrintPageRangeOptions;
   subtype PrintPageInfo is Windows.Graphics.Printing.IPrintPageInfo;
   function Create return Windows.Graphics.Printing.IPrintPageInfo;
   
   subtype PrintTaskOptions is Windows.Graphics.Printing.IPrintTaskOptionsCore;
   subtype PrintTaskProgressingEventArgs is Windows.Graphics.Printing.IPrintTaskProgressingEventArgs;
   subtype PrintTaskCompletedEventArgs is Windows.Graphics.Printing.IPrintTaskCompletedEventArgs;
   subtype PrintTask is Windows.Graphics.Printing.IPrintTask;
   subtype PrintTaskSourceRequestedDeferral is Windows.Graphics.Printing.IPrintTaskSourceRequestedDeferral;
   subtype PrintTaskSourceRequestedArgs is Windows.Graphics.Printing.IPrintTaskSourceRequestedArgs;
   subtype PrintTaskRequestedDeferral is Windows.Graphics.Printing.IPrintTaskRequestedDeferral;
   subtype PrintTaskRequest is Windows.Graphics.Printing.IPrintTaskRequest;
   subtype PrintTaskRequestedEventArgs is Windows.Graphics.Printing.IPrintTaskRequestedEventArgs;
   subtype PrintManager is Windows.Graphics.Printing.IPrintManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_MediaSize
   return Windows.String;
   
   function get_MediaType
   return Windows.String;
   
   function get_Orientation
   return Windows.String;
   
   function get_PrintQuality
   return Windows.String;
   
   function get_ColorMode
   return Windows.String;
   
   function get_Duplex
   return Windows.String;
   
   function get_Collation
   return Windows.String;
   
   function get_Staple
   return Windows.String;
   
   function get_HolePunch
   return Windows.String;
   
   function get_Binding
   return Windows.String;
   
   function get_Copies
   return Windows.String;
   
   function get_NUp
   return Windows.String;
   
   function get_InputBin
   return Windows.String;
   
   function get_Bordering
   return Windows.String;
   
   function get_CustomPageRanges
   return Windows.String;
   
   function IsSupported
   return Windows.Boolean;
   
   function GetForCurrentView
   return Windows.Graphics.Printing.IPrintManager;
   
   function ShowPrintUIAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
end;
