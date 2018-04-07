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
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Data.Text is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UnicodeGeneralCategory is (
      UppercaseLetter,
      LowercaseLetter,
      TitlecaseLetter,
      ModifierLetter,
      OtherLetter,
      NonspacingMark,
      SpacingCombiningMark,
      EnclosingMark,
      DecimalDigitNumber,
      LetterNumber,
      OtherNumber,
      SpaceSeparator,
      LineSeparator,
      ParagraphSeparator,
      Control,
      Format,
      Surrogate,
      PrivateUse,
      ConnectorPunctuation,
      DashPunctuation,
      OpenPunctuation,
      ClosePunctuation,
      InitialQuotePunctuation,
      FinalQuotePunctuation,
      OtherPunctuation,
      MathSymbol,
      CurrencySymbol,
      ModifierSymbol,
      OtherSymbol,
      NotAssigned
   );
   for UnicodeGeneralCategory use (
      UppercaseLetter => 0,
      LowercaseLetter => 1,
      TitlecaseLetter => 2,
      ModifierLetter => 3,
      OtherLetter => 4,
      NonspacingMark => 5,
      SpacingCombiningMark => 6,
      EnclosingMark => 7,
      DecimalDigitNumber => 8,
      LetterNumber => 9,
      OtherNumber => 10,
      SpaceSeparator => 11,
      LineSeparator => 12,
      ParagraphSeparator => 13,
      Control => 14,
      Format => 15,
      Surrogate => 16,
      PrivateUse => 17,
      ConnectorPunctuation => 18,
      DashPunctuation => 19,
      OpenPunctuation => 20,
      ClosePunctuation => 21,
      InitialQuotePunctuation => 22,
      FinalQuotePunctuation => 23,
      OtherPunctuation => 24,
      MathSymbol => 25,
      CurrencySymbol => 26,
      ModifierSymbol => 27,
      OtherSymbol => 28,
      NotAssigned => 29
   );
   for UnicodeGeneralCategory'Size use 32;
   
   type UnicodeGeneralCategory_Ptr is access UnicodeGeneralCategory;
   
   type UnicodeNumericType is (
      None,
      Decimal,
      Digit,
      Numeric
   );
   for UnicodeNumericType use (
      None => 0,
      Decimal => 1,
      Digit => 2,
      Numeric => 3
   );
   for UnicodeNumericType'Size use 32;
   
   type UnicodeNumericType_Ptr is access UnicodeNumericType;
   
   type AlternateNormalizationFormat is (
      NotNormalized,
      Number,
      Currency,
      Date,
      Time
   );
   for AlternateNormalizationFormat use (
      NotNormalized => 0,
      Number => 1,
      Currency => 3,
      Date => 4,
      Time => 5
   );
   for AlternateNormalizationFormat'Size use 32;
   
   type AlternateNormalizationFormat_Ptr is access AlternateNormalizationFormat;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type TextSegment is record
      StartPosition : Windows.UInt32;
      Length : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , TextSegment);
   
   type TextSegment_Ptr is access TextSegment;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type WordSegmentsTokenizingHandler_Interface;
   type WordSegmentsTokenizingHandler is access all WordSegmentsTokenizingHandler_Interface'Class;
   type WordSegmentsTokenizingHandler_Ptr is access all WordSegmentsTokenizingHandler;
   type SelectableWordSegmentsTokenizingHandler_Interface;
   type SelectableWordSegmentsTokenizingHandler is access all SelectableWordSegmentsTokenizingHandler_Interface'Class;
   type SelectableWordSegmentsTokenizingHandler_Ptr is access all SelectableWordSegmentsTokenizingHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISemanticTextQueryFactory_Interface;
   type ISemanticTextQueryFactory is access all ISemanticTextQueryFactory_Interface'Class;
   type ISemanticTextQueryFactory_Ptr is access all ISemanticTextQueryFactory;
   type ISemanticTextQuery_Interface;
   type ISemanticTextQuery is access all ISemanticTextQuery_Interface'Class;
   type ISemanticTextQuery_Ptr is access all ISemanticTextQuery;
   type IUnicodeCharactersStatics_Interface;
   type IUnicodeCharactersStatics is access all IUnicodeCharactersStatics_Interface'Class;
   type IUnicodeCharactersStatics_Ptr is access all IUnicodeCharactersStatics;
   type IAlternateWordForm_Interface;
   type IAlternateWordForm is access all IAlternateWordForm_Interface'Class;
   type IAlternateWordForm_Ptr is access all IAlternateWordForm;
   type ISelectableWordSegment_Interface;
   type ISelectableWordSegment is access all ISelectableWordSegment_Interface'Class;
   type ISelectableWordSegment_Ptr is access all ISelectableWordSegment;
   type IWordSegment_Interface;
   type IWordSegment is access all IWordSegment_Interface'Class;
   type IWordSegment_Ptr is access all IWordSegment;
   type IWordsSegmenter_Interface;
   type IWordsSegmenter is access all IWordsSegmenter_Interface'Class;
   type IWordsSegmenter_Ptr is access all IWordsSegmenter;
   type IWordsSegmenterFactory_Interface;
   type IWordsSegmenterFactory is access all IWordsSegmenterFactory_Interface'Class;
   type IWordsSegmenterFactory_Ptr is access all IWordsSegmenterFactory;
   type ISelectableWordsSegmenter_Interface;
   type ISelectableWordsSegmenter is access all ISelectableWordsSegmenter_Interface'Class;
   type ISelectableWordsSegmenter_Ptr is access all ISelectableWordsSegmenter;
   type ISelectableWordsSegmenterFactory_Interface;
   type ISelectableWordsSegmenterFactory is access all ISelectableWordsSegmenterFactory_Interface'Class;
   type ISelectableWordsSegmenterFactory_Ptr is access all ISelectableWordsSegmenterFactory;
   type ITextPredictionGenerator_Interface;
   type ITextPredictionGenerator is access all ITextPredictionGenerator_Interface'Class;
   type ITextPredictionGenerator_Ptr is access all ITextPredictionGenerator;
   type ITextPredictionGeneratorFactory_Interface;
   type ITextPredictionGeneratorFactory is access all ITextPredictionGeneratorFactory_Interface'Class;
   type ITextPredictionGeneratorFactory_Ptr is access all ITextPredictionGeneratorFactory;
   type ITextConversionGenerator_Interface;
   type ITextConversionGenerator is access all ITextConversionGenerator_Interface'Class;
   type ITextConversionGenerator_Ptr is access all ITextConversionGenerator;
   type ITextConversionGeneratorFactory_Interface;
   type ITextConversionGeneratorFactory is access all ITextConversionGeneratorFactory_Interface'Class;
   type ITextConversionGeneratorFactory_Ptr is access all ITextConversionGeneratorFactory;
   type ITextReverseConversionGenerator_Interface;
   type ITextReverseConversionGenerator is access all ITextReverseConversionGenerator_Interface'Class;
   type ITextReverseConversionGenerator_Ptr is access all ITextReverseConversionGenerator;
   type ITextReverseConversionGeneratorFactory_Interface;
   type ITextReverseConversionGeneratorFactory is access all ITextReverseConversionGeneratorFactory_Interface'Class;
   type ITextReverseConversionGeneratorFactory_Ptr is access all ITextReverseConversionGeneratorFactory;
   type ITextPhoneme_Interface;
   type ITextPhoneme is access all ITextPhoneme_Interface'Class;
   type ITextPhoneme_Ptr is access all ITextPhoneme;
   type ITextReverseConversionGenerator2_Interface;
   type ITextReverseConversionGenerator2 is access all ITextReverseConversionGenerator2_Interface'Class;
   type ITextReverseConversionGenerator2_Ptr is access all ITextReverseConversionGenerator2;
   type IIterator_TextSegment_Interface;
   type IIterator_TextSegment is access all IIterator_TextSegment_Interface'Class;
   type IIterator_TextSegment_Ptr is access all IIterator_TextSegment;
   type IIterable_TextSegment_Interface;
   type IIterable_TextSegment is access all IIterable_TextSegment_Interface'Class;
   type IIterable_TextSegment_Ptr is access all IIterable_TextSegment;
   type IVectorView_TextSegment_Interface;
   type IVectorView_TextSegment is access all IVectorView_TextSegment_Interface'Class;
   type IVectorView_TextSegment_Ptr is access all IVectorView_TextSegment;
   type IIterator_IAlternateWordForm_Interface;
   type IIterator_IAlternateWordForm is access all IIterator_IAlternateWordForm_Interface'Class;
   type IIterator_IAlternateWordForm_Ptr is access all IIterator_IAlternateWordForm;
   type IIterable_IAlternateWordForm_Interface;
   type IIterable_IAlternateWordForm is access all IIterable_IAlternateWordForm_Interface'Class;
   type IIterable_IAlternateWordForm_Ptr is access all IIterable_IAlternateWordForm;
   type IVectorView_IAlternateWordForm_Interface;
   type IVectorView_IAlternateWordForm is access all IVectorView_IAlternateWordForm_Interface'Class;
   type IVectorView_IAlternateWordForm_Ptr is access all IVectorView_IAlternateWordForm;
   type IIterator_IWordSegment_Interface;
   type IIterator_IWordSegment is access all IIterator_IWordSegment_Interface'Class;
   type IIterator_IWordSegment_Ptr is access all IIterator_IWordSegment;
   type IIterable_IWordSegment_Interface;
   type IIterable_IWordSegment is access all IIterable_IWordSegment_Interface'Class;
   type IIterable_IWordSegment_Ptr is access all IIterable_IWordSegment;
   type IVectorView_IWordSegment_Interface;
   type IVectorView_IWordSegment is access all IVectorView_IWordSegment_Interface'Class;
   type IVectorView_IWordSegment_Ptr is access all IVectorView_IWordSegment;
   type IIterator_ISelectableWordSegment_Interface;
   type IIterator_ISelectableWordSegment is access all IIterator_ISelectableWordSegment_Interface'Class;
   type IIterator_ISelectableWordSegment_Ptr is access all IIterator_ISelectableWordSegment;
   type IIterable_ISelectableWordSegment_Interface;
   type IIterable_ISelectableWordSegment is access all IIterable_ISelectableWordSegment_Interface'Class;
   type IIterable_ISelectableWordSegment_Ptr is access all IIterable_ISelectableWordSegment;
   type IVectorView_ISelectableWordSegment_Interface;
   type IVectorView_ISelectableWordSegment is access all IVectorView_ISelectableWordSegment_Interface'Class;
   type IVectorView_ISelectableWordSegment_Ptr is access all IVectorView_ISelectableWordSegment;
   
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
   type ISemanticTextQueryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISemanticTextQueryFactory_Interface
      ; aqsFilter : Windows.String
      ; RetVal : access Windows.Data.Text.ISemanticTextQuery
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithLanguage
   (
      This       : access ISemanticTextQueryFactory_Interface
      ; aqsFilter : Windows.String
      ; filterLanguage : Windows.String
      ; RetVal : access Windows.Data.Text.ISemanticTextQuery
   )
   return Windows.HRESULT is abstract;
   
   IID_ISemanticTextQueryFactory : aliased constant Windows.IID := (596378883, 63893, 17799, (135, 119, 162, 183, 216, 10, 207, 239 ));
   
   ------------------------------------------------------------------------
   type ISemanticTextQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function Find
   (
      This       : access ISemanticTextQuery_Interface
      ; content : Windows.String
      ; RetVal : access Windows.Data.Text.IVectorView_TextSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindInProperty
   (
      This       : access ISemanticTextQuery_Interface
      ; propertyContent : Windows.String
      ; propertyName : Windows.String
      ; RetVal : access Windows.Data.Text.IVectorView_TextSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISemanticTextQuery : aliased constant Windows.IID := (1780263761, 8114, 18697, (128, 184, 53, 115, 26, 43, 62, 127 ));
   
   ------------------------------------------------------------------------
   type IUnicodeCharactersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCodepointFromSurrogatePair
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; highSurrogate : Windows.UInt32
      ; lowSurrogate : Windows.UInt32
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetSurrogatePairFromCodepoint
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; highSurrogate : access Windows.UInt8
      ; lowSurrogate : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function IsHighSurrogate
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsLowSurrogate
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsSupplementary
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsNoncharacter
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsWhitespace
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsAlphabetic
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCased
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsUppercase
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsLowercase
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsIdStart
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsIdContinue
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsGraphemeBase
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsGraphemeExtend
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericType
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Data.Text.UnicodeNumericType
   )
   return Windows.HRESULT is abstract;
   
   function GetGeneralCategory
   (
      This       : access IUnicodeCharactersStatics_Interface
      ; codepoint : Windows.UInt32
      ; RetVal : access Windows.Data.Text.UnicodeGeneralCategory
   )
   return Windows.HRESULT is abstract;
   
   IID_IUnicodeCharactersStatics : aliased constant Windows.IID := (2542837383, 37521, 20369, (182, 200, 182, 227, 89, 215, 167, 251 ));
   
   ------------------------------------------------------------------------
   type IAlternateWordForm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceTextSegment
   (
      This       : access IAlternateWordForm_Interface
      ; RetVal : access Windows.Data.Text.TextSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateText
   (
      This       : access IAlternateWordForm_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizationFormat
   (
      This       : access IAlternateWordForm_Interface
      ; RetVal : access Windows.Data.Text.AlternateNormalizationFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IAlternateWordForm : aliased constant Windows.IID := (1194945566, 20921, 16903, (145, 70, 36, 142, 99, 106, 29, 29 ));
   
   ------------------------------------------------------------------------
   type ISelectableWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ISelectableWordSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceTextSegment
   (
      This       : access ISelectableWordSegment_Interface
      ; RetVal : access Windows.Data.Text.TextSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectableWordSegment : aliased constant Windows.IID := (2439662775, 35495, 19576, (179, 116, 93, 237, 183, 82, 230, 11 ));
   
   ------------------------------------------------------------------------
   type IWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access IWordSegment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceTextSegment
   (
      This       : access IWordSegment_Interface
      ; RetVal : access Windows.Data.Text.TextSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateForms
   (
      This       : access IWordSegment_Interface
      ; RetVal : access Windows.Data.Text.IVectorView_IAlternateWordForm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWordSegment : aliased constant Windows.IID := (3537156717, 39036, 19648, (182, 189, 212, 154, 17, 179, 143, 154 ));
   
   ------------------------------------------------------------------------
   type IWordsSegmenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolvedLanguage
   (
      This       : access IWordsSegmenter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetTokenAt
   (
      This       : access IWordsSegmenter_Interface
      ; text : Windows.String
      ; startIndex : Windows.UInt32
      ; RetVal : access Windows.Data.Text.IWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function GetTokens
   (
      This       : access IWordsSegmenter_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Data.Text.IVectorView_IWordSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Tokenize
   (
      This       : access IWordsSegmenter_Interface
      ; text : Windows.String
      ; startIndex : Windows.UInt32
      ; handler : Windows.Data.Text.WordSegmentsTokenizingHandler
   )
   return Windows.HRESULT is abstract;
   
   IID_IWordsSegmenter : aliased constant Windows.IID := (2259997905, 45822, 20020, (168, 29, 102, 100, 3, 0, 69, 79 ));
   
   ------------------------------------------------------------------------
   type IWordsSegmenterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithLanguage
   (
      This       : access IWordsSegmenterFactory_Interface
      ; language : Windows.String
      ; RetVal : access Windows.Data.Text.IWordsSegmenter
   )
   return Windows.HRESULT is abstract;
   
   IID_IWordsSegmenterFactory : aliased constant Windows.IID := (3868684916, 64565, 17756, (139, 251, 109, 127, 70, 83, 202, 151 ));
   
   ------------------------------------------------------------------------
   type ISelectableWordsSegmenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolvedLanguage
   (
      This       : access ISelectableWordsSegmenter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetTokenAt
   (
      This       : access ISelectableWordsSegmenter_Interface
      ; text : Windows.String
      ; startIndex : Windows.UInt32
      ; RetVal : access Windows.Data.Text.ISelectableWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function GetTokens
   (
      This       : access ISelectableWordsSegmenter_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Data.Text.IVectorView_ISelectableWordSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Tokenize
   (
      This       : access ISelectableWordsSegmenter_Interface
      ; text : Windows.String
      ; startIndex : Windows.UInt32
      ; handler : Windows.Data.Text.SelectableWordSegmentsTokenizingHandler
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectableWordsSegmenter : aliased constant Windows.IID := (4141625831, 19219, 17861, (136, 151, 125, 113, 38, 158, 8, 93 ));
   
   ------------------------------------------------------------------------
   type ISelectableWordsSegmenterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithLanguage
   (
      This       : access ISelectableWordsSegmenterFactory_Interface
      ; language : Windows.String
      ; RetVal : access Windows.Data.Text.ISelectableWordsSegmenter
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectableWordsSegmenterFactory : aliased constant Windows.IID := (2356835912, 24663, 17209, (188, 112, 242, 16, 1, 10, 65, 80 ));
   
   ------------------------------------------------------------------------
   type ITextPredictionGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolvedLanguage
   (
      This       : access ITextPredictionGenerator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageAvailableButNotInstalled
   (
      This       : access ITextPredictionGenerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCandidatesAsync
   (
      This       : access ITextPredictionGenerator_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCandidatesWithMaxCountAsync
   (
      This       : access ITextPredictionGenerator_Interface
      ; input : Windows.String
      ; maxCandidates : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextPredictionGenerator : aliased constant Windows.IID := (1588374279, 44017, 19638, (157, 158, 50, 111, 43, 70, 135, 86 ));
   
   ------------------------------------------------------------------------
   type ITextPredictionGeneratorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ITextPredictionGeneratorFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Data.Text.ITextPredictionGenerator
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextPredictionGeneratorFactory : aliased constant Windows.IID := (1918350358, 35746, 18257, (157, 48, 157, 133, 67, 86, 83, 162 ));
   
   ------------------------------------------------------------------------
   type ITextConversionGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolvedLanguage
   (
      This       : access ITextConversionGenerator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageAvailableButNotInstalled
   (
      This       : access ITextConversionGenerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCandidatesAsync
   (
      This       : access ITextConversionGenerator_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCandidatesWithMaxCountAsync
   (
      This       : access ITextConversionGenerator_Interface
      ; input : Windows.String
      ; maxCandidates : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextConversionGenerator : aliased constant Windows.IID := (56650334, 10921, 19126, (175, 139, 165, 98, 182, 58, 137, 146 ));
   
   ------------------------------------------------------------------------
   type ITextConversionGeneratorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ITextConversionGeneratorFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Data.Text.ITextConversionGenerator
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextConversionGeneratorFactory : aliased constant Windows.IID := (4239013761, 12419, 18859, (190, 21, 86, 223, 187, 183, 77, 111 ));
   
   ------------------------------------------------------------------------
   type ITextReverseConversionGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolvedLanguage
   (
      This       : access ITextReverseConversionGenerator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageAvailableButNotInstalled
   (
      This       : access ITextReverseConversionGenerator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ConvertBackAsync
   (
      This       : access ITextReverseConversionGenerator_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextReverseConversionGenerator : aliased constant Windows.IID := (1374156052, 40017, 19846, (174, 27, 180, 152, 251, 173, 131, 19 ));
   
   ------------------------------------------------------------------------
   type ITextReverseConversionGeneratorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ITextReverseConversionGeneratorFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Data.Text.ITextReverseConversionGenerator
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextReverseConversionGeneratorFactory : aliased constant Windows.IID := (1673450278, 8154, 16886, (137, 213, 35, 221, 234, 60, 114, 154 ));
   
   ------------------------------------------------------------------------
   type ITextPhoneme_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayText
   (
      This       : access ITextPhoneme_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingText
   (
      This       : access ITextPhoneme_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextPhoneme : aliased constant Windows.IID := (2472715274, 39802, 17769, (148, 207, 216, 79, 47, 56, 207, 155 ));
   
   ------------------------------------------------------------------------
   type ITextReverseConversionGenerator2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPhonemesAsync
   (
      This       : access ITextReverseConversionGenerator2_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextReverseConversionGenerator2 : aliased constant Windows.IID := (447730412, 34262, 18173, (130, 138, 58, 72, 48, 250, 110, 24 ));
   
   ------------------------------------------------------------------------
   type IIterator_TextSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_TextSegment_Interface
      ; RetVal : access Windows.Data.Text.TextSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_TextSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_TextSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_TextSegment_Interface
      ; items : Windows.Data.Text.TextSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_TextSegment : aliased constant Windows.IID := (1683634612, 61441, 21106, (144, 21, 251, 74, 50, 113, 121, 174 ));
   
   ------------------------------------------------------------------------
   type IIterable_TextSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TextSegment_Interface
      ; RetVal : access Windows.Data.Text.IIterator_TextSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_TextSegment : aliased constant Windows.IID := (1419310323, 52964, 23410, (151, 41, 129, 92, 74, 215, 185, 220 ));
   
   ------------------------------------------------------------------------
   type IVectorView_TextSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_TextSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Text.TextSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_TextSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_TextSegment_Interface
      ; value : Windows.Data.Text.TextSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_TextSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Text.TextSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_TextSegment : aliased constant Windows.IID := (790912925, 60255, 22081, (157, 204, 106, 177, 148, 108, 199, 230 ));
   
   ------------------------------------------------------------------------
   type IIterator_IAlternateWordForm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAlternateWordForm_Interface
      ; RetVal : access Windows.Data.Text.IAlternateWordForm
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAlternateWordForm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAlternateWordForm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAlternateWordForm_Interface
      ; items : Windows.Data.Text.IAlternateWordForm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IAlternateWordForm : aliased constant Windows.IID := (2135310218, 57487, 20846, (180, 184, 129, 181, 65, 123, 251, 88 ));
   
   ------------------------------------------------------------------------
   type IIterable_IAlternateWordForm_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAlternateWordForm_Interface
      ; RetVal : access Windows.Data.Text.IIterator_IAlternateWordForm
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IAlternateWordForm : aliased constant Windows.IID := (2927856681, 24769, 20627, (174, 97, 14, 210, 40, 87, 219, 5 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IAlternateWordForm_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAlternateWordForm_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Text.IAlternateWordForm
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAlternateWordForm_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAlternateWordForm_Interface
      ; value : Windows.Data.Text.IAlternateWordForm
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAlternateWordForm_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Text.IAlternateWordForm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IAlternateWordForm : aliased constant Windows.IID := (1802776562, 29802, 21829, (166, 237, 59, 186, 69, 60, 245, 217 ));
   
   ------------------------------------------------------------------------
   type IIterator_IWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWordSegment_Interface
      ; RetVal : access Windows.Data.Text.IWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWordSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWordSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWordSegment_Interface
      ; items : Windows.Data.Text.IWordSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IWordSegment : aliased constant Windows.IID := (2931312307, 26187, 21598, (171, 147, 245, 252, 102, 210, 78, 50 ));
   
   ------------------------------------------------------------------------
   type IIterable_IWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWordSegment_Interface
      ; RetVal : access Windows.Data.Text.IIterator_IWordSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IWordSegment : aliased constant Windows.IID := (3511535946, 41745, 24028, (191, 139, 213, 135, 149, 216, 125, 109 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWordSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Text.IWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWordSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWordSegment_Interface
      ; value : Windows.Data.Text.IWordSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWordSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Text.IWordSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IWordSegment : aliased constant Windows.IID := (3339089050, 57629, 24071, (133, 52, 43, 210, 62, 194, 16, 249 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISelectableWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISelectableWordSegment_Interface
      ; RetVal : access Windows.Data.Text.ISelectableWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISelectableWordSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISelectableWordSegment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISelectableWordSegment_Interface
      ; items : Windows.Data.Text.ISelectableWordSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISelectableWordSegment : aliased constant Windows.IID := (2776900697, 5245, 23176, (143, 35, 163, 57, 138, 253, 138, 133 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISelectableWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISelectableWordSegment_Interface
      ; RetVal : access Windows.Data.Text.IIterator_ISelectableWordSegment
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISelectableWordSegment : aliased constant Windows.IID := (2018184428, 4936, 21300, (145, 229, 46, 1, 50, 148, 226, 17 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISelectableWordSegment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISelectableWordSegment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Text.ISelectableWordSegment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISelectableWordSegment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISelectableWordSegment_Interface
      ; value : Windows.Data.Text.ISelectableWordSegment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISelectableWordSegment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Text.ISelectableWordSegment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISelectableWordSegment : aliased constant Windows.IID := (871959154, 34548, 20519, (181, 10, 105, 57, 161, 249, 213, 96 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type WordSegmentsTokenizingHandler_Interface(Callback : access procedure (precedingWords : Windows.Data.Text.IIterable_IWordSegment ; words : Windows.Data.Text.IIterable_IWordSegment)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access WordSegmentsTokenizingHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access WordSegmentsTokenizingHandler_Interface
      ; precedingWords : Windows.Data.Text.IIterable_IWordSegment
      ; words : Windows.Data.Text.IIterable_IWordSegment
   )
   return Windows.HRESULT;
   
   IID_WordSegmentsTokenizingHandler : aliased constant Windows.IID := (2782749527, 48938, 19535, (163, 31, 41, 231, 28, 111, 139, 53 ));
   
   ------------------------------------------------------------------------
   type SelectableWordSegmentsTokenizingHandler_Interface(Callback : access procedure (precedingWords : Windows.Data.Text.IIterable_ISelectableWordSegment ; words : Windows.Data.Text.IIterable_ISelectableWordSegment)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access SelectableWordSegmentsTokenizingHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access SelectableWordSegmentsTokenizingHandler_Interface
      ; precedingWords : Windows.Data.Text.IIterable_ISelectableWordSegment
      ; words : Windows.Data.Text.IIterable_ISelectableWordSegment
   )
   return Windows.HRESULT;
   
   IID_SelectableWordSegmentsTokenizingHandler : aliased constant Windows.IID := (977140892, 44766, 19911, (158, 108, 65, 192, 68, 189, 53, 146 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SemanticTextQuery is Windows.Data.Text.ISemanticTextQuery;
   
   function Create
   (
      aqsFilter : Windows.String
   )
   return Windows.Data.Text.ISemanticTextQuery;
   
   function CreateWithLanguage
   (
      aqsFilter : Windows.String
      ; filterLanguage : Windows.String
   )
   return Windows.Data.Text.ISemanticTextQuery;
   
   subtype AlternateWordForm is Windows.Data.Text.IAlternateWordForm;
   subtype WordSegment is Windows.Data.Text.IWordSegment;
   subtype WordsSegmenter is Windows.Data.Text.IWordsSegmenter;
   
   function CreateWithLanguage
   (
      language : Windows.String
   )
   return Windows.Data.Text.IWordsSegmenter;
   
   subtype SelectableWordSegment is Windows.Data.Text.ISelectableWordSegment;
   subtype SelectableWordsSegmenter is Windows.Data.Text.ISelectableWordsSegmenter;
   
   function CreateWithLanguage
   (
      language : Windows.String
   )
   return Windows.Data.Text.ISelectableWordsSegmenter;
   
   subtype TextPredictionGenerator is Windows.Data.Text.ITextPredictionGenerator;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextPredictionGenerator;
   
   subtype TextConversionGenerator is Windows.Data.Text.ITextConversionGenerator;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextConversionGenerator;
   
   subtype TextReverseConversionGenerator is Windows.Data.Text.ITextReverseConversionGenerator;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextReverseConversionGenerator;
   
   subtype TextPhoneme is Windows.Data.Text.ITextPhoneme;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetCodepointFromSurrogatePair
   (
      highSurrogate : Windows.UInt32
      ; lowSurrogate : Windows.UInt32
   )
   return Windows.UInt32;
   
   procedure GetSurrogatePairFromCodepoint
   (
      codepoint : Windows.UInt32
      ; highSurrogate : access Windows.UInt8
      ; lowSurrogate : access Windows.UInt8
   )
   ;
   
   function IsHighSurrogate
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsLowSurrogate
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsSupplementary
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsNoncharacter
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsWhitespace
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsAlphabetic
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsCased
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsUppercase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsLowercase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsIdStart
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsIdContinue
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsGraphemeBase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsGraphemeExtend
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean;
   
   function GetNumericType
   (
      codepoint : Windows.UInt32
   )
   return Windows.Data.Text.UnicodeNumericType;
   
   function GetGeneralCategory
   (
      codepoint : Windows.UInt32
   )
   return Windows.Data.Text.UnicodeGeneralCategory;

end;
