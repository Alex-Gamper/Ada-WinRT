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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Text is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access WordSegmentsTokenizingHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_WordSegmentsTokenizingHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WordSegmentsTokenizingHandler_Interface
      ; precedingWords : Windows.Data.Text.IIterable_IWordSegment
      ; words : Windows.Data.Text.IIterable_IWordSegment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(precedingWords, words);
      return Hr;
   end;
   
   function QueryInterface(This : access SelectableWordSegmentsTokenizingHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_SelectableWordSegmentsTokenizingHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SelectableWordSegmentsTokenizingHandler_Interface
      ; precedingWords : Windows.Data.Text.IIterable_ISelectableWordSegment
      ; words : Windows.Data.Text.IIterable_ISelectableWordSegment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(precedingWords, words);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      aqsFilter : Windows.String
   )
   return Windows.Data.Text.ISemanticTextQuery is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.SemanticTextQuery");
      m_Factory     : Windows.Data.Text.ISemanticTextQueryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ISemanticTextQuery := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISemanticTextQueryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithLanguage
   (
      aqsFilter : Windows.String
      ; filterLanguage : Windows.String
   )
   return Windows.Data.Text.ISemanticTextQuery is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.SemanticTextQuery");
      m_Factory     : Windows.Data.Text.ISemanticTextQueryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ISemanticTextQuery := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISemanticTextQueryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithLanguage(aqsFilter, filterLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithLanguage
   (
      language : Windows.String
   )
   return Windows.Data.Text.IWordsSegmenter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.WordsSegmenter");
      m_Factory     : Windows.Data.Text.IWordsSegmenterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.IWordsSegmenter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWordsSegmenterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithLanguage(language, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithLanguage
   (
      language : Windows.String
   )
   return Windows.Data.Text.ISelectableWordsSegmenter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.SelectableWordsSegmenter");
      m_Factory     : Windows.Data.Text.ISelectableWordsSegmenterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ISelectableWordsSegmenter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectableWordsSegmenterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithLanguage(language, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextPredictionGenerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.TextPredictionGenerator");
      m_Factory     : Windows.Data.Text.ITextPredictionGeneratorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ITextPredictionGenerator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextPredictionGeneratorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(languageTag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextConversionGenerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.TextConversionGenerator");
      m_Factory     : Windows.Data.Text.ITextConversionGeneratorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ITextConversionGenerator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConversionGeneratorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(languageTag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      languageTag : Windows.String
   )
   return Windows.Data.Text.ITextReverseConversionGenerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.TextReverseConversionGenerator");
      m_Factory     : Windows.Data.Text.ITextReverseConversionGeneratorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.ITextReverseConversionGenerator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextReverseConversionGeneratorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(languageTag, RetVal'Access);
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
   
   
   function GetCodepointFromSurrogatePair
   (
      highSurrogate : Windows.UInt32
      ; lowSurrogate : Windows.UInt32
   )
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCodepointFromSurrogatePair(highSurrogate, lowSurrogate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure GetSurrogatePairFromCodepoint
   (
      codepoint : Windows.UInt32
      ; highSurrogate : access Windows.UInt8
      ; lowSurrogate : access Windows.UInt8
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSurrogatePairFromCodepoint(codepoint, highSurrogate, lowSurrogate);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsHighSurrogate
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsHighSurrogate(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsLowSurrogate
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsLowSurrogate(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupplementary
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupplementary(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsNoncharacter
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsNoncharacter(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsWhitespace
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsWhitespace(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsAlphabetic
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsAlphabetic(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsCased
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsCased(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsUppercase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsUppercase(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsLowercase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsLowercase(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsIdStart
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsIdStart(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsIdContinue
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsIdContinue(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsGraphemeBase
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsGraphemeBase(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsGraphemeExtend
   (
      codepoint : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsGraphemeExtend(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetNumericType
   (
      codepoint : Windows.UInt32
   )
   return Windows.Data.Text.UnicodeNumericType is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.UnicodeNumericType;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetNumericType(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetGeneralCategory
   (
      codepoint : Windows.UInt32
   )
   return Windows.Data.Text.UnicodeGeneralCategory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Text.UnicodeCharacters");
      m_Factory     : IUnicodeCharactersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Text.UnicodeGeneralCategory;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUnicodeCharactersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetGeneralCategory(codepoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
