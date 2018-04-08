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
with Windows.Foundation;
limited with Windows.Globalization;
limited with Windows.UI.ViewManagement;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.UI.Text.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CoreTextInputScope is (
      Default,
      Url,
      FilePath,
      FileName,
      EmailUserName,
      EmailAddress,
      UserName,
      PersonalFullName,
      PersonalNamePrefix,
      PersonalGivenName,
      PersonalMiddleName,
      PersonalSurname,
      PersonalNameSuffix,
      Address,
      AddressPostalCode,
      AddressStreet,
      AddressStateOrProvince,
      AddressCity,
      AddressCountryName,
      AddressCountryShortName,
      CurrencyAmountAndSymbol,
      CurrencyAmount,
      Date,
      DateMonth,
      DateDay,
      DateYear,
      DateMonthName,
      DateDayName,
      Digits_x,
      Number,
      SingleCharacter,
      Password,
      TelephoneNumber,
      TelephoneCountryCode,
      TelephoneAreaCode,
      TelephoneLocalNumber,
      Time,
      TimeHour,
      TimeMinuteOrSecond,
      NumberFullWidth,
      AlphanumericHalfWidth,
      AlphanumericFullWidth,
      CurrencyChinese,
      Bopomofo,
      Hiragana,
      KatakanaHalfWidth,
      KatakanaFullWidth,
      Hanja,
      HangulHalfWidth,
      HangulFullWidth,
      Search,
      Formula,
      SearchIncremental,
      ChineseHalfWidth,
      ChineseFullWidth,
      NativeScript,
      Text,
      Chat,
      NameOrPhoneNumber,
      EmailUserNameOrAddress,
      Private_x,
      Maps,
      PasswordNumeric,
      PinNumeric,
      PinAlphanumeric,
      FormulaNumber,
      ChatWithoutEmoji
   );
   for CoreTextInputScope use (
      Default => 0,
      Url => 1,
      FilePath => 2,
      FileName => 3,
      EmailUserName => 4,
      EmailAddress => 5,
      UserName => 6,
      PersonalFullName => 7,
      PersonalNamePrefix => 8,
      PersonalGivenName => 9,
      PersonalMiddleName => 10,
      PersonalSurname => 11,
      PersonalNameSuffix => 12,
      Address => 13,
      AddressPostalCode => 14,
      AddressStreet => 15,
      AddressStateOrProvince => 16,
      AddressCity => 17,
      AddressCountryName => 18,
      AddressCountryShortName => 19,
      CurrencyAmountAndSymbol => 20,
      CurrencyAmount => 21,
      Date => 22,
      DateMonth => 23,
      DateDay => 24,
      DateYear => 25,
      DateMonthName => 26,
      DateDayName => 27,
      Digits_x => 28,
      Number => 29,
      SingleCharacter => 30,
      Password => 31,
      TelephoneNumber => 32,
      TelephoneCountryCode => 33,
      TelephoneAreaCode => 34,
      TelephoneLocalNumber => 35,
      Time => 36,
      TimeHour => 37,
      TimeMinuteOrSecond => 38,
      NumberFullWidth => 39,
      AlphanumericHalfWidth => 40,
      AlphanumericFullWidth => 41,
      CurrencyChinese => 42,
      Bopomofo => 43,
      Hiragana => 44,
      KatakanaHalfWidth => 45,
      KatakanaFullWidth => 46,
      Hanja => 47,
      HangulHalfWidth => 48,
      HangulFullWidth => 49,
      Search => 50,
      Formula => 51,
      SearchIncremental => 52,
      ChineseHalfWidth => 53,
      ChineseFullWidth => 54,
      NativeScript => 55,
      Text => 57,
      Chat => 58,
      NameOrPhoneNumber => 59,
      EmailUserNameOrAddress => 60,
      Private_x => 61,
      Maps => 62,
      PasswordNumeric => 63,
      PinNumeric => 64,
      PinAlphanumeric => 65,
      FormulaNumber => 67,
      ChatWithoutEmoji => 68
   );
   for CoreTextInputScope'Size use 32;
   
   type CoreTextInputScope_Ptr is access CoreTextInputScope;
   
   type CoreTextInputPaneDisplayPolicy is (
      Automatic,
      Manual
   );
   for CoreTextInputPaneDisplayPolicy use (
      Automatic => 0,
      Manual => 1
   );
   for CoreTextInputPaneDisplayPolicy'Size use 32;
   
   type CoreTextInputPaneDisplayPolicy_Ptr is access CoreTextInputPaneDisplayPolicy;
   
   type CoreTextTextUpdatingResult is (
      Succeeded,
      Failed
   );
   for CoreTextTextUpdatingResult use (
      Succeeded => 0,
      Failed => 1
   );
   for CoreTextTextUpdatingResult'Size use 32;
   
   type CoreTextTextUpdatingResult_Ptr is access CoreTextTextUpdatingResult;
   
   type CoreTextSelectionUpdatingResult is (
      Succeeded,
      Failed
   );
   for CoreTextSelectionUpdatingResult use (
      Succeeded => 0,
      Failed => 1
   );
   for CoreTextSelectionUpdatingResult'Size use 32;
   
   type CoreTextSelectionUpdatingResult_Ptr is access CoreTextSelectionUpdatingResult;
   
   type CoreTextFormatUpdatingResult is (
      Succeeded,
      Failed
   );
   for CoreTextFormatUpdatingResult use (
      Succeeded => 0,
      Failed => 1
   );
   for CoreTextFormatUpdatingResult'Size use 32;
   
   type CoreTextFormatUpdatingResult_Ptr is access CoreTextFormatUpdatingResult;
   
   type CoreTextFormatUpdatingReason is (
      None,
      CompositionUnconverted,
      CompositionConverted,
      CompositionTargetUnconverted,
      CompositionTargetConverted
   );
   for CoreTextFormatUpdatingReason use (
      None => 0,
      CompositionUnconverted => 1,
      CompositionConverted => 2,
      CompositionTargetUnconverted => 3,
      CompositionTargetConverted => 4
   );
   for CoreTextFormatUpdatingReason'Size use 32;
   
   type CoreTextFormatUpdatingReason_Ptr is access CoreTextFormatUpdatingReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CoreTextRange is record
      StartCaretPosition : Windows.Int32;
      EndCaretPosition : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , CoreTextRange);
   
   type CoreTextRange_Ptr is access CoreTextRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Interface;
   type TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted is access all TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Ptr is access all TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted;
   type TypedEventHandler_ICoreTextEditContext_add_TextRequested_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_TextRequested is access all TypedEventHandler_ICoreTextEditContext_add_TextRequested_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_TextRequested_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_TextRequested;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionRequested is access all TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_SelectionRequested;
   type TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_LayoutRequested is access all TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_LayoutRequested;
   type TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_TextUpdating is access all TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_TextUpdating;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating is access all TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating;
   type TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_FormatUpdating is access all TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_FormatUpdating;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionStarted is access all TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_CompositionStarted;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted is access all TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted;
   type TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Interface;
   type TypedEventHandler_ICoreTextEditContext_add_FocusRemoved is access all TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Interface'Class;
   type TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Ptr is access all TypedEventHandler_ICoreTextEditContext_add_FocusRemoved;
   type TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Interface;
   type TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged is access all TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Interface'Class;
   type TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Ptr is access all TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreTextTextRequest_Interface;
   type ICoreTextTextRequest is access all ICoreTextTextRequest_Interface'Class;
   type ICoreTextTextRequest_Ptr is access all ICoreTextTextRequest;
   type ICoreTextTextRequestedEventArgs_Interface;
   type ICoreTextTextRequestedEventArgs is access all ICoreTextTextRequestedEventArgs_Interface'Class;
   type ICoreTextTextRequestedEventArgs_Ptr is access all ICoreTextTextRequestedEventArgs;
   type ICoreTextSelectionRequest_Interface;
   type ICoreTextSelectionRequest is access all ICoreTextSelectionRequest_Interface'Class;
   type ICoreTextSelectionRequest_Ptr is access all ICoreTextSelectionRequest;
   type ICoreTextSelectionRequestedEventArgs_Interface;
   type ICoreTextSelectionRequestedEventArgs is access all ICoreTextSelectionRequestedEventArgs_Interface'Class;
   type ICoreTextSelectionRequestedEventArgs_Ptr is access all ICoreTextSelectionRequestedEventArgs;
   type ICoreTextLayoutBounds_Interface;
   type ICoreTextLayoutBounds is access all ICoreTextLayoutBounds_Interface'Class;
   type ICoreTextLayoutBounds_Ptr is access all ICoreTextLayoutBounds;
   type ICoreTextLayoutRequest_Interface;
   type ICoreTextLayoutRequest is access all ICoreTextLayoutRequest_Interface'Class;
   type ICoreTextLayoutRequest_Ptr is access all ICoreTextLayoutRequest;
   type ICoreTextLayoutRequestedEventArgs_Interface;
   type ICoreTextLayoutRequestedEventArgs is access all ICoreTextLayoutRequestedEventArgs_Interface'Class;
   type ICoreTextLayoutRequestedEventArgs_Ptr is access all ICoreTextLayoutRequestedEventArgs;
   type ICoreTextTextUpdatingEventArgs_Interface;
   type ICoreTextTextUpdatingEventArgs is access all ICoreTextTextUpdatingEventArgs_Interface'Class;
   type ICoreTextTextUpdatingEventArgs_Ptr is access all ICoreTextTextUpdatingEventArgs;
   type ICoreTextSelectionUpdatingEventArgs_Interface;
   type ICoreTextSelectionUpdatingEventArgs is access all ICoreTextSelectionUpdatingEventArgs_Interface'Class;
   type ICoreTextSelectionUpdatingEventArgs_Ptr is access all ICoreTextSelectionUpdatingEventArgs;
   type ICoreTextFormatUpdatingEventArgs_Interface;
   type ICoreTextFormatUpdatingEventArgs is access all ICoreTextFormatUpdatingEventArgs_Interface'Class;
   type ICoreTextFormatUpdatingEventArgs_Ptr is access all ICoreTextFormatUpdatingEventArgs;
   type ICoreTextCompositionStartedEventArgs_Interface;
   type ICoreTextCompositionStartedEventArgs is access all ICoreTextCompositionStartedEventArgs_Interface'Class;
   type ICoreTextCompositionStartedEventArgs_Ptr is access all ICoreTextCompositionStartedEventArgs;
   type ICoreTextCompositionCompletedEventArgs_Interface;
   type ICoreTextCompositionCompletedEventArgs is access all ICoreTextCompositionCompletedEventArgs_Interface'Class;
   type ICoreTextCompositionCompletedEventArgs_Ptr is access all ICoreTextCompositionCompletedEventArgs;
   type ICoreTextEditContext2_Interface;
   type ICoreTextEditContext2 is access all ICoreTextEditContext2_Interface'Class;
   type ICoreTextEditContext2_Ptr is access all ICoreTextEditContext2;
   type ICoreTextEditContext_Interface;
   type ICoreTextEditContext is access all ICoreTextEditContext_Interface'Class;
   type ICoreTextEditContext_Ptr is access all ICoreTextEditContext;
   type ICoreTextServicesManager_Interface;
   type ICoreTextServicesManager is access all ICoreTextServicesManager_Interface'Class;
   type ICoreTextServicesManager_Ptr is access all ICoreTextServicesManager;
   type ICoreTextServicesManagerStatics_Interface;
   type ICoreTextServicesManagerStatics is access all ICoreTextServicesManagerStatics_Interface'Class;
   type ICoreTextServicesManagerStatics_Ptr is access all ICoreTextServicesManagerStatics;
   type ICoreTextServicesStatics_Interface;
   type ICoreTextServicesStatics is access all ICoreTextServicesStatics_Interface'Class;
   type ICoreTextServicesStatics_Ptr is access all ICoreTextServicesStatics;
   type ICoreTextCompositionSegment_Interface;
   type ICoreTextCompositionSegment is access all ICoreTextCompositionSegment_Interface'Class;
   type ICoreTextCompositionSegment_Ptr is access all ICoreTextCompositionSegment;
   type IIterator_ICoreTextCompositionSegment_Interface;
   type IIterator_ICoreTextCompositionSegment is access all IIterator_ICoreTextCompositionSegment_Interface'Class;
   type IIterator_ICoreTextCompositionSegment_Ptr is access all IIterator_ICoreTextCompositionSegment;
   type IIterable_ICoreTextCompositionSegment_Interface;
   type IIterable_ICoreTextCompositionSegment is access all IIterable_ICoreTextCompositionSegment_Interface'Class;
   type IIterable_ICoreTextCompositionSegment_Ptr is access all IIterable_ICoreTextCompositionSegment;
   type IVectorView_ICoreTextCompositionSegment_Interface;
   type IVectorView_ICoreTextCompositionSegment is access all IVectorView_ICoreTextCompositionSegment_Interface'Class;
   type IVectorView_ICoreTextCompositionSegment_Ptr is access all IVectorView_ICoreTextCompositionSegment;
   
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
   
   IID_ICoreTextTextRequest : aliased constant Windows.IID := (1356419241, 62750, 19649, (140, 161, 230, 52, 109, 26, 97, 190 ));
   
   type ICoreTextTextRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Range
   (
      This       : access ICoreTextTextRequest_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ICoreTextTextRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ICoreTextTextRequest_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextTextRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextTextRequest_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextTextRequestedEventArgs : aliased constant Windows.IID := (4036403920, 16838, 19458, (139, 26, 217, 83, 176, 12, 171, 179 ));
   
   type ICoreTextTextRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ICoreTextTextRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextTextRequest
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextSelectionRequest : aliased constant Windows.IID := (4037477379, 8331, 17153, (136, 60, 116, 202, 116, 133, 253, 141 ));
   
   type ICoreTextSelectionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Selection
   (
      This       : access ICoreTextSelectionRequest_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function put_Selection
   (
      This       : access ICoreTextSelectionRequest_Interface
      ; value : Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextSelectionRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextSelectionRequest_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextSelectionRequestedEventArgs : aliased constant Windows.IID := (331769899, 62996, 16922, (143, 75, 158, 200, 165, 163, 127, 205 ));
   
   type ICoreTextSelectionRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ICoreTextSelectionRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextSelectionRequest
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextLayoutBounds : aliased constant Windows.IID := (3916614004, 17462, 18711, (128, 208, 165, 37, 228, 202, 103, 128 ));
   
   type ICoreTextLayoutBounds_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextBounds
   (
      This       : access ICoreTextLayoutBounds_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_TextBounds
   (
      This       : access ICoreTextLayoutBounds_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlBounds
   (
      This       : access ICoreTextLayoutBounds_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_ControlBounds
   (
      This       : access ICoreTextLayoutBounds_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextLayoutRequest : aliased constant Windows.IID := (626370764, 20989, 20227, (152, 191, 172, 120, 23, 77, 104, 224 ));
   
   type ICoreTextLayoutRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Range
   (
      This       : access ICoreTextLayoutRequest_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_LayoutBounds
   (
      This       : access ICoreTextLayoutRequest_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextLayoutBounds
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextLayoutRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextLayoutRequest_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextLayoutRequestedEventArgs : aliased constant Windows.IID := (2984012512, 39547, 20126, (165, 102, 74, 107, 95, 138, 214, 118 ));
   
   type ICoreTextLayoutRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ICoreTextLayoutRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextLayoutRequest
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextTextUpdatingEventArgs : aliased constant Windows.IID := (4003959181, 52267, 20227, (143, 246, 2, 253, 33, 125, 180, 80 ));
   
   type ICoreTextTextUpdatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Range
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NewSelection
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_InputLanguage
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextTextUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function put_Result
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; value : Windows.UI.Text.Core.CoreTextTextUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextTextUpdatingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextSelectionUpdatingEventArgs : aliased constant Windows.IID := (3561325471, 65151, 19413, (138, 38, 9, 34, 193, 179, 230, 57 ));
   
   type ICoreTextSelectionUpdatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Selection
   (
      This       : access ICoreTextSelectionUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access ICoreTextSelectionUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextSelectionUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function put_Result
   (
      This       : access ICoreTextSelectionUpdatingEventArgs_Interface
      ; value : Windows.UI.Text.Core.CoreTextSelectionUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextSelectionUpdatingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextSelectionUpdatingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextFormatUpdatingEventArgs : aliased constant Windows.IID := (1930476851, 46248, 17329, (179, 123, 7, 36, 212, 172, 167, 171 ));
   
   type ICoreTextFormatUpdatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Range
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_TextColor
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.ViewManagement.IReference_UIElementType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.ViewManagement.IReference_UIElementType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UnderlineColor
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.ViewManagement.IReference_UIElementType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UnderlineType
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.IReference_UnderlineType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Reason
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextFormatUpdatingReason
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextFormatUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function put_Result
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; value : Windows.UI.Text.Core.CoreTextFormatUpdatingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextFormatUpdatingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextCompositionStartedEventArgs : aliased constant Windows.IID := (661329577, 25831, 19120, (188, 75, 160, 45, 115, 131, 91, 251 ));
   
   type ICoreTextCompositionStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCanceled
   (
      This       : access ICoreTextCompositionStartedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextCompositionStartedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextCompositionCompletedEventArgs : aliased constant Windows.IID := (523561910, 47007, 16673, (165, 231, 253, 169, 184, 97, 110, 48 ));
   
   type ICoreTextCompositionCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCanceled
   (
      This       : access ICoreTextCompositionCompletedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CompositionSegments
   (
      This       : access ICoreTextCompositionCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Text.Core.IVectorView_ICoreTextCompositionSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICoreTextCompositionCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextEditContext2 : aliased constant Windows.IID := (2978381243, 2107, 18913, (178, 129, 43, 53, 214, 43, 244, 102 ));
   
   type ICoreTextEditContext2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_NotifyFocusLeaveCompleted
   (
      This       : access ICoreTextEditContext2_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NotifyFocusLeaveCompleted
   (
      This       : access ICoreTextEditContext2_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextEditContext : aliased constant Windows.IID := (3211135151, 16449, 18371, (178, 99, 169, 24, 235, 94, 174, 242 ));
   
   type ICoreTextEditContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ICoreTextEditContext_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ICoreTextEditContext_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InputScope
   (
      This       : access ICoreTextEditContext_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextInputScope
   )
   return Windows.HRESULT is abstract;
   
   function put_InputScope
   (
      This       : access ICoreTextEditContext_Interface
      ; value : Windows.UI.Text.Core.CoreTextInputScope
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadOnly
   (
      This       : access ICoreTextEditContext_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsReadOnly
   (
      This       : access ICoreTextEditContext_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InputPaneDisplayPolicy
   (
      This       : access ICoreTextEditContext_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextInputPaneDisplayPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_InputPaneDisplayPolicy
   (
      This       : access ICoreTextEditContext_Interface
      ; value : Windows.UI.Text.Core.CoreTextInputPaneDisplayPolicy
   )
   return Windows.HRESULT is abstract;
   
   function add_TextRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_TextRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TextRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SelectionRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_SelectionRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectionRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LayoutRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_LayoutRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LayoutRequested
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TextUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_TextUpdating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TextUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SelectionUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectionUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FormatUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_FormatUpdating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FormatUpdating
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CompositionStarted
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_CompositionStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CompositionStarted
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CompositionCompleted
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CompositionCompleted
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FocusRemoved
   (
      This       : access ICoreTextEditContext_Interface
      ; handler : TypedEventHandler_ICoreTextEditContext_add_FocusRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FocusRemoved
   (
      This       : access ICoreTextEditContext_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function NotifyFocusEnter
   (
      This       : access ICoreTextEditContext_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyFocusLeave
   (
      This       : access ICoreTextEditContext_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyTextChanged
   (
      This       : access ICoreTextEditContext_Interface
      ; modifiedRange : Windows.UI.Text.Core.CoreTextRange
      ; newLength : Windows.Int32
      ; newSelection : Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function NotifySelectionChanged
   (
      This       : access ICoreTextEditContext_Interface
      ; selection : Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   
   function NotifyLayoutChanged
   (
      This       : access ICoreTextEditContext_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextServicesManager : aliased constant Windows.IID := (3260054915, 28170, 19082, (189, 248, 25, 72, 135, 72, 84, 186 ));
   
   type ICoreTextServicesManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputLanguage
   (
      This       : access ICoreTextServicesManager_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function add_InputLanguageChanged
   (
      This       : access ICoreTextServicesManager_Interface
      ; handler : TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InputLanguageChanged
   (
      This       : access ICoreTextServicesManager_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateEditContext
   (
      This       : access ICoreTextServicesManager_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextEditContext
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextServicesManagerStatics : aliased constant Windows.IID := (354460552, 58063, 19813, (174, 185, 179, 45, 134, 254, 57, 185 ));
   
   type ICoreTextServicesManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ICoreTextServicesManagerStatics_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextServicesManager
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextServicesStatics : aliased constant Windows.IID := (2441452102, 60623, 18340, (138, 231, 9, 138, 156, 111, 187, 21 ));
   
   type ICoreTextServicesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HiddenCharacter
   (
      This       : access ICoreTextServicesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICoreTextCompositionSegment : aliased constant Windows.IID := (2003594201, 20141, 19879, (143, 71, 58, 136, 181, 35, 204, 52 ));
   
   type ICoreTextCompositionSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreconversionString
   (
      This       : access ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Range
   (
      This       : access ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.UI.Text.Core.CoreTextRange
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ICoreTextCompositionSegment : aliased constant Windows.IID := (968118925, 9072, 22522, (181, 212, 181, 162, 7, 154, 124, 234 ));
   
   type IIterator_ICoreTextCompositionSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.UI.Text.Core.ICoreTextCompositionSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICoreTextCompositionSegment_Interface
      ; items : Windows.UI.Text.Core.ICoreTextCompositionSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ICoreTextCompositionSegment : aliased constant Windows.IID := (943139794, 54270, 23250, (157, 57, 209, 102, 182, 142, 120, 231 ));
   
   type IIterable_ICoreTextCompositionSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.UI.Text.Core.IIterator_ICoreTextCompositionSegment
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICoreTextCompositionSegment : aliased constant Windows.IID := (558589183, 53069, 24020, (147, 42, 123, 198, 110, 105, 3, 110 ));
   
   type IVectorView_ICoreTextCompositionSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICoreTextCompositionSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Text.Core.ICoreTextCompositionSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICoreTextCompositionSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICoreTextCompositionSegment_Interface
      ; value : Windows.UI.Text.Core.ICoreTextCompositionSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICoreTextCompositionSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Text.Core.ICoreTextCompositionSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted : aliased constant Windows.IID := (4015240295, 50290, 23385, (168, 39, 56, 173, 195, 169, 211, 38 ));
   
   type TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_TextRequested : aliased constant Windows.IID := (3353379190, 16692, 20663, (188, 115, 114, 158, 159, 154, 210, 42 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_TextRequested_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextTextRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_TextRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_TextRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextTextRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_SelectionRequested : aliased constant Windows.IID := (2284736993, 62627, 22501, (147, 146, 106, 140, 56, 87, 145, 129 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextSelectionRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_SelectionRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextSelectionRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_LayoutRequested : aliased constant Windows.IID := (442455446, 22044, 22518, (164, 255, 203, 133, 1, 60, 101, 68 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextLayoutRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_LayoutRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextLayoutRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_TextUpdating : aliased constant Windows.IID := (4253641348, 57212, 20693, (145, 103, 88, 246, 22, 189, 219, 110 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextTextUpdatingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_TextUpdating'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextTextUpdatingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating : aliased constant Windows.IID := (1796475456, 54369, 21850, (182, 235, 93, 187, 142, 33, 1, 229 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextSelectionUpdatingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextSelectionUpdatingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_FormatUpdating : aliased constant Windows.IID := (1045362073, 19650, 21064, (191, 45, 19, 241, 118, 19, 176, 166 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextFormatUpdatingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_FormatUpdating'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextFormatUpdatingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_CompositionStarted : aliased constant Windows.IID := (3866220069, 23385, 22502, (169, 46, 64, 0, 149, 7, 133, 58 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextCompositionStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_CompositionStarted'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextCompositionStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted : aliased constant Windows.IID := (2732000670, 26861, 21088, (141, 142, 29, 207, 61, 37, 214, 99 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.UI.Text.Core.ICoreTextCompositionCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextCompositionCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextEditContext_add_FocusRemoved : aliased constant Windows.IID := (4015240295, 50290, 23385, (168, 39, 56, 173, 195, 169, 211, 38 ));
   
   type TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextEditContext ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextEditContext_add_FocusRemoved'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged : aliased constant Windows.IID := (288337949, 9738, 20934, (145, 152, 93, 179, 230, 233, 239, 61 ));
   
   type TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Interface(Callback : access procedure (sender : Windows.UI.Text.Core.ICoreTextServicesManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextServicesManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CoreTextTextRequest is Windows.UI.Text.Core.ICoreTextTextRequest;
   subtype CoreTextSelectionRequest is Windows.UI.Text.Core.ICoreTextSelectionRequest;
   subtype CoreTextLayoutBounds is Windows.UI.Text.Core.ICoreTextLayoutBounds;
   subtype CoreTextLayoutRequest is Windows.UI.Text.Core.ICoreTextLayoutRequest;
   subtype CoreTextCompositionSegment is Windows.UI.Text.Core.ICoreTextCompositionSegment;
   subtype CoreTextEditContext is Windows.UI.Text.Core.ICoreTextEditContext;
   subtype CoreTextTextRequestedEventArgs is Windows.UI.Text.Core.ICoreTextTextRequestedEventArgs;
   subtype CoreTextSelectionRequestedEventArgs is Windows.UI.Text.Core.ICoreTextSelectionRequestedEventArgs;
   subtype CoreTextLayoutRequestedEventArgs is Windows.UI.Text.Core.ICoreTextLayoutRequestedEventArgs;
   subtype CoreTextTextUpdatingEventArgs is Windows.UI.Text.Core.ICoreTextTextUpdatingEventArgs;
   subtype CoreTextSelectionUpdatingEventArgs is Windows.UI.Text.Core.ICoreTextSelectionUpdatingEventArgs;
   subtype CoreTextFormatUpdatingEventArgs is Windows.UI.Text.Core.ICoreTextFormatUpdatingEventArgs;
   subtype CoreTextCompositionStartedEventArgs is Windows.UI.Text.Core.ICoreTextCompositionStartedEventArgs;
   subtype CoreTextCompositionCompletedEventArgs is Windows.UI.Text.Core.ICoreTextCompositionCompletedEventArgs;
   subtype CoreTextServicesManager is Windows.UI.Text.Core.ICoreTextServicesManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForCurrentView
   return Windows.UI.Text.Core.ICoreTextServicesManager;
   
   function get_HiddenCharacter
   return Windows.UInt8;

end;
