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
package Windows.Globalization is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DayOfWeek is (
      Sunday,
      Monday,
      Tuesday,
      Wednesday,
      Thursday,
      Friday,
      Saturday
   );
   for DayOfWeek use (
      Sunday => 0,
      Monday => 1,
      Tuesday => 2,
      Wednesday => 3,
      Thursday => 4,
      Friday => 5,
      Saturday => 6
   );
   for DayOfWeek'Size use 32;
   
   type DayOfWeek_Ptr is access DayOfWeek;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GlobalizationJapanesePhoneticAnalyzerContract is null record;
   pragma Convention (C_Pass_By_Copy , GlobalizationJapanesePhoneticAnalyzerContract);
   
   type GlobalizationJapanesePhoneticAnalyzerContract_Ptr is access GlobalizationJapanesePhoneticAnalyzerContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICalendarIdentifiersStatics_Interface;
   type ICalendarIdentifiersStatics is access all ICalendarIdentifiersStatics_Interface'Class;
   type ICalendarIdentifiersStatics_Ptr is access all ICalendarIdentifiersStatics;
   type ICalendarIdentifiersStatics2_Interface;
   type ICalendarIdentifiersStatics2 is access all ICalendarIdentifiersStatics2_Interface'Class;
   type ICalendarIdentifiersStatics2_Ptr is access all ICalendarIdentifiersStatics2;
   type ICalendarIdentifiersStatics3_Interface;
   type ICalendarIdentifiersStatics3 is access all ICalendarIdentifiersStatics3_Interface'Class;
   type ICalendarIdentifiersStatics3_Ptr is access all ICalendarIdentifiersStatics3;
   type IClockIdentifiersStatics_Interface;
   type IClockIdentifiersStatics is access all IClockIdentifiersStatics_Interface'Class;
   type IClockIdentifiersStatics_Ptr is access all IClockIdentifiersStatics;
   type INumeralSystemIdentifiersStatics_Interface;
   type INumeralSystemIdentifiersStatics is access all INumeralSystemIdentifiersStatics_Interface'Class;
   type INumeralSystemIdentifiersStatics_Ptr is access all INumeralSystemIdentifiersStatics;
   type INumeralSystemIdentifiersStatics2_Interface;
   type INumeralSystemIdentifiersStatics2 is access all INumeralSystemIdentifiersStatics2_Interface'Class;
   type INumeralSystemIdentifiersStatics2_Ptr is access all INumeralSystemIdentifiersStatics2;
   type ICurrencyIdentifiersStatics_Interface;
   type ICurrencyIdentifiersStatics is access all ICurrencyIdentifiersStatics_Interface'Class;
   type ICurrencyIdentifiersStatics_Ptr is access all ICurrencyIdentifiersStatics;
   type ICurrencyIdentifiersStatics2_Interface;
   type ICurrencyIdentifiersStatics2 is access all ICurrencyIdentifiersStatics2_Interface'Class;
   type ICurrencyIdentifiersStatics2_Ptr is access all ICurrencyIdentifiersStatics2;
   type IGeographicRegion_Interface;
   type IGeographicRegion is access all IGeographicRegion_Interface'Class;
   type IGeographicRegion_Ptr is access all IGeographicRegion;
   type IGeographicRegionFactory_Interface;
   type IGeographicRegionFactory is access all IGeographicRegionFactory_Interface'Class;
   type IGeographicRegionFactory_Ptr is access all IGeographicRegionFactory;
   type IGeographicRegionStatics_Interface;
   type IGeographicRegionStatics is access all IGeographicRegionStatics_Interface'Class;
   type IGeographicRegionStatics_Ptr is access all IGeographicRegionStatics;
   type ILanguage_Interface;
   type ILanguage is access all ILanguage_Interface'Class;
   type ILanguage_Ptr is access all ILanguage;
   type ILanguageExtensionSubtags_Interface;
   type ILanguageExtensionSubtags is access all ILanguageExtensionSubtags_Interface'Class;
   type ILanguageExtensionSubtags_Ptr is access all ILanguageExtensionSubtags;
   type ILanguageFactory_Interface;
   type ILanguageFactory is access all ILanguageFactory_Interface'Class;
   type ILanguageFactory_Ptr is access all ILanguageFactory;
   type ILanguageStatics_Interface;
   type ILanguageStatics is access all ILanguageStatics_Interface'Class;
   type ILanguageStatics_Ptr is access all ILanguageStatics;
   type ILanguageStatics2_Interface;
   type ILanguageStatics2 is access all ILanguageStatics2_Interface'Class;
   type ILanguageStatics2_Ptr is access all ILanguageStatics2;
   type ICalendar_Interface;
   type ICalendar is access all ICalendar_Interface'Class;
   type ICalendar_Ptr is access all ICalendar;
   type ICalendarFactory2_Interface;
   type ICalendarFactory2 is access all ICalendarFactory2_Interface'Class;
   type ICalendarFactory2_Ptr is access all ICalendarFactory2;
   type ITimeZoneOnCalendar_Interface;
   type ITimeZoneOnCalendar is access all ITimeZoneOnCalendar_Interface'Class;
   type ITimeZoneOnCalendar_Ptr is access all ITimeZoneOnCalendar;
   type ICalendarFactory_Interface;
   type ICalendarFactory is access all ICalendarFactory_Interface'Class;
   type ICalendarFactory_Ptr is access all ICalendarFactory;
   type IApplicationLanguagesStatics_Interface;
   type IApplicationLanguagesStatics is access all IApplicationLanguagesStatics_Interface'Class;
   type IApplicationLanguagesStatics_Ptr is access all IApplicationLanguagesStatics;
   type IJapanesePhoneticAnalyzerStatics_Interface;
   type IJapanesePhoneticAnalyzerStatics is access all IJapanesePhoneticAnalyzerStatics_Interface'Class;
   type IJapanesePhoneticAnalyzerStatics_Ptr is access all IJapanesePhoneticAnalyzerStatics;
   type IJapanesePhoneme_Interface;
   type IJapanesePhoneme is access all IJapanesePhoneme_Interface'Class;
   type IJapanesePhoneme_Ptr is access all IJapanesePhoneme;
   type IIterator_ILanguage_Interface;
   type IIterator_ILanguage is access all IIterator_ILanguage_Interface'Class;
   type IIterator_ILanguage_Ptr is access all IIterator_ILanguage;
   type IIterable_ILanguage_Interface;
   type IIterable_ILanguage is access all IIterable_ILanguage_Interface'Class;
   type IIterable_ILanguage_Ptr is access all IIterable_ILanguage;
   type IVectorView_ILanguage_Interface;
   type IVectorView_ILanguage is access all IVectorView_ILanguage_Interface'Class;
   type IVectorView_ILanguage_Ptr is access all IVectorView_ILanguage;
   type IIterator_IJapanesePhoneme_Interface;
   type IIterator_IJapanesePhoneme is access all IIterator_IJapanesePhoneme_Interface'Class;
   type IIterator_IJapanesePhoneme_Ptr is access all IIterator_IJapanesePhoneme;
   type IIterable_IJapanesePhoneme_Interface;
   type IIterable_IJapanesePhoneme is access all IIterable_IJapanesePhoneme_Interface'Class;
   type IIterable_IJapanesePhoneme_Ptr is access all IIterable_IJapanesePhoneme;
   type IVectorView_IJapanesePhoneme_Interface;
   type IVectorView_IJapanesePhoneme is access all IVectorView_IJapanesePhoneme_Interface'Class;
   type IVectorView_IJapanesePhoneme_Ptr is access all IVectorView_IJapanesePhoneme;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICalendarIdentifiersStatics : aliased constant Windows.IID := (2154119016, 11442, 19487, (181, 144, 240, 245, 43, 244, 253, 26 ));
   
   type ICalendarIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Gregorian
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hebrew
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hijri
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Japanese
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Julian
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Korean
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Taiwan
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thai
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UmAlQura
   (
      This       : access ICalendarIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICalendarIdentifiersStatics2 : aliased constant Windows.IID := (2113197192, 24528, 17063, (149, 181, 125, 152, 216, 35, 7, 95 ));
   
   type ICalendarIdentifiersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Persian
   (
      This       : access ICalendarIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICalendarIdentifiersStatics3 : aliased constant Windows.IID := (740447267, 8109, 16576, (147, 52, 168, 235, 144, 219, 4, 245 ));
   
   type ICalendarIdentifiersStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChineseLunar
   (
      This       : access ICalendarIdentifiersStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JapaneseLunar
   (
      This       : access ICalendarIdentifiersStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KoreanLunar
   (
      This       : access ICalendarIdentifiersStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TaiwanLunar
   (
      This       : access ICalendarIdentifiersStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VietnameseLunar
   (
      This       : access ICalendarIdentifiersStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClockIdentifiersStatics : aliased constant Windows.IID := (1379403195, 4844, 20355, (188, 49, 177, 180, 55, 107, 8, 8 ));
   
   type IClockIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TwelveHour
   (
      This       : access IClockIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TwentyFourHour
   (
      This       : access IClockIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumeralSystemIdentifiersStatics : aliased constant Windows.IID := (2781242051, 26825, 19773, (183, 101, 151, 32, 41, 226, 29, 236 ));
   
   type INumeralSystemIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arab
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ArabExt
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bali
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Beng
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Cham
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Deva
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FullWide
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Gujr
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Guru
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HaniDec
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Java
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kali
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Khmr
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Knda
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Lana
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LanaTham
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Laoo
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Latn
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Lepc
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Limb
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mlym
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mong
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mtei
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mymr
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MymrShan
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Nkoo
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Olck
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Orya
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Saur
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sund
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Talu
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TamlDec
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Telu
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thai
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tibt
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Vaii
   (
      This       : access INumeralSystemIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumeralSystemIdentifiersStatics2 : aliased constant Windows.IID := (2130719272, 40411, 18996, (145, 4, 2, 96, 192, 145, 167, 199 ));
   
   type INumeralSystemIdentifiersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Brah
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Osma
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MathBold
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MathDbl
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MathSans
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MathSanb
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MathMono
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZmthBold
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZmthDbl
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZmthSans
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZmthSanb
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZmthMono
   (
      This       : access INumeralSystemIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrencyIdentifiersStatics : aliased constant Windows.IID := (2669480219, 54662, 18707, (155, 106, 169, 189, 45, 193, 40, 116 ));
   
   type ICurrencyIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AED
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AFN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ALL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AMD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ANG
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AOA
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ARS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AUD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AWG
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AZN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BAM
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BBD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BDT
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BGN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BHD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BIF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BMD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BND
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BOB
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BRL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BSD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BTN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BWP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BYR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BZD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CAD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CDF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CHF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CLP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CNY
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_COP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CRC
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CUP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CVE
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CZK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DJF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DKK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DOP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DZD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EGP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ERN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ETB
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EUR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FJD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FKP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GBP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GEL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GHS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GIP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GMD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GNF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GTQ
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GYD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HKD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HNL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HRK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HTG
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HUF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IDR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ILS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_INR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IQD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IRR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ISK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JMD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JOD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JPY
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KES
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KGS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KHR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KMF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KPW
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KRW
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KWD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KYD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KZT
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LAK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LBP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LKR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LRD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LSL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LTL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LVL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LYD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MAD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MDL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MGA
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MKD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MMK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MNT
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MOP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MRO
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MUR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MVR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MWK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MXN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MYR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MZN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NAD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NGN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NIO
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NOK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NPR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NZD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OMR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PAB
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PEN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PGK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PHP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PKR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PLN
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PYG
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_QAR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RON
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RSD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RUB
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RWF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SAR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SBD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SCR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SDG
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SEK
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SGD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SHP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SLL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SOS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SRD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_STD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SYP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SZL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_THB
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TJS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TMT
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TND
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TOP
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TRY
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TTD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TWD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TZS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UAH
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UGX
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_USD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UYU
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UZS
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VEF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VND
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VUV
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WST
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XAF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XCD
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XOF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XPF
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_XXX
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_YER
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZAR
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZMW
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ZWL
   (
      This       : access ICurrencyIdentifiersStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrencyIdentifiersStatics2 : aliased constant Windows.IID := (403995007, 50098, 19507, (149, 145, 152, 0, 17, 149, 13, 55 ));
   
   type ICurrencyIdentifiersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BYN
   (
      This       : access ICurrencyIdentifiersStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeographicRegion : aliased constant Windows.IID := (32089633, 19044, 20185, (149, 79, 158, 222, 176, 123, 217, 3 ));
   
   type IGeographicRegion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Code
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CodeTwoLetter
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CodeThreeLetter
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CodeThreeDigit
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeName
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrenciesInUse
   (
      This       : access IGeographicRegion_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeographicRegionFactory : aliased constant Windows.IID := (1396855408, 30644, 17003, (133, 159, 129, 225, 157, 81, 37, 70 ));
   
   type IGeographicRegionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateGeographicRegion
   (
      This       : access IGeographicRegionFactory_Interface
      ; geographicRegionCode : Windows.String
      ; RetVal : access Windows.Globalization.IGeographicRegion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeographicRegionStatics : aliased constant Windows.IID := (702712180, 31449, 20212, (135, 153, 179, 180, 79, 173, 236, 8 ));
   
   type IGeographicRegionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IGeographicRegionStatics_Interface
      ; geographicRegionCode : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguage : aliased constant Windows.IID := (3933841234, 63426, 16997, (177, 189, 196, 222, 196, 228, 240, 128 ));
   
   type ILanguage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LanguageTag
   (
      This       : access ILanguage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access ILanguage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeName
   (
      This       : access ILanguage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Script
   (
      This       : access ILanguage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageExtensionSubtags : aliased constant Windows.IID := (2105388869, 13965, 17252, (133, 43, 222, 201, 39, 3, 123, 133 ));
   
   type ILanguageExtensionSubtags_Interface is interface and Windows.IInspectable_Interface;
   
   function GetExtensionSubtags
   (
      This       : access ILanguageExtensionSubtags_Interface
      ; singleton : Windows.String
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageFactory : aliased constant Windows.IID := (2600620716, 3111, 17656, (183, 146, 151, 147, 251, 102, 198, 62 ));
   
   type ILanguageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLanguage
   (
      This       : access ILanguageFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageStatics : aliased constant Windows.IID := (2990331223, 2149, 18132, (137, 184, 213, 155, 232, 153, 15, 13 ));
   
   type ILanguageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsWellFormed
   (
      This       : access ILanguageStatics_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentInputMethodLanguageTag
   (
      This       : access ILanguageStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageStatics2 : aliased constant Windows.IID := (806985582, 37195, 19242, (157, 110, 227, 176, 226, 125, 190, 79 ));
   
   type ILanguageStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetInputMethodLanguageTag
   (
      This       : access ILanguageStatics2_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICalendar : aliased constant Windows.IID := (3392152093, 34521, 16635, (162, 107, 212, 78, 183, 207, 8, 234 ));
   
   type ICalendar_Interface is interface and Windows.IInspectable_Interface;
   
   function Clone
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Globalization.ICalendar
   )
   return Windows.HRESULT is abstract;
   
   function SetToMin
   (
      This       : access ICalendar_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetToMax
   (
      This       : access ICalendar_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Languages
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralSystem
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NumeralSystem
   (
      This       : access ICalendar_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetCalendarSystem
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ChangeCalendarSystem
   (
      This       : access ICalendar_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetClock
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ChangeClock
   (
      This       : access ICalendar_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDateTime
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SetDateTime
   (
      This       : access ICalendar_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SetToNow
   (
      This       : access ICalendar_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstEra
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastEra
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfEras
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Era
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Era
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddEras
   (
      This       : access ICalendar_Interface
      ; eras : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function EraAsFullString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function EraAsString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstYearInThisEra
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastYearInThisEra
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfYearsInThisEra
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Year
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Year
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddYears
   (
      This       : access ICalendar_Interface
      ; years : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function YearAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function YearAsTruncatedString
   (
      This       : access ICalendar_Interface
      ; remainingDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function YearAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstMonthInThisYear
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastMonthInThisYear
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfMonthsInThisYear
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Month
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Month
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddMonths
   (
      This       : access ICalendar_Interface
      ; months : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsFullString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsFullSoloString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsSoloString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsNumericString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MonthAsPaddedNumericString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddWeeks
   (
      This       : access ICalendar_Interface
      ; weeks : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstDayInThisMonth
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastDayInThisMonth
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfDaysInThisMonth
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Day
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Day
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddDays
   (
      This       : access ICalendar_Interface
      ; days : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function DayAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DayAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DayOfWeek
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Globalization.DayOfWeek
   )
   return Windows.HRESULT is abstract;
   
   function DayOfWeekAsFullString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DayOfWeekAsString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DayOfWeekAsFullSoloString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DayOfWeekAsSoloString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstPeriodInThisDay
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastPeriodInThisDay
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfPeriodsInThisDay
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Period
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Period
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddPeriods
   (
      This       : access ICalendar_Interface
      ; periods : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function PeriodAsFullString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PeriodAsString
   (
      This       : access ICalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstHourInThisPeriod
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastHourInThisPeriod
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfHoursInThisPeriod
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Hour
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Hour
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddHours
   (
      This       : access ICalendar_Interface
      ; hours : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function HourAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function HourAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Minute
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Minute
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddMinutes
   (
      This       : access ICalendar_Interface
      ; minutes : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MinuteAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function MinuteAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Second
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Second
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddSeconds
   (
      This       : access ICalendar_Interface
      ; seconds : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SecondAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SecondAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Nanosecond
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Nanosecond
   (
      This       : access ICalendar_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddNanoseconds
   (
      This       : access ICalendar_Interface
      ; nanoseconds : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function NanosecondAsString
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function NanosecondAsPaddedString
   (
      This       : access ICalendar_Interface
      ; minDigits : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Compare
   (
      This       : access ICalendar_Interface
      ; other : Windows.Globalization.ICalendar
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function CompareDateTime
   (
      This       : access ICalendar_Interface
      ; other : Windows.Foundation.DateTime
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function CopyTo
   (
      This       : access ICalendar_Interface
      ; other : Windows.Globalization.ICalendar
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstMinuteInThisHour
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastMinuteInThisHour
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfMinutesInThisHour
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstSecondInThisMinute
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSecondInThisMinute
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfSecondsInThisMinute
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedLanguage
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDaylightSavingTime
   (
      This       : access ICalendar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICalendarFactory2 : aliased constant Windows.IID := (3024828300, 51838, 17808, (158, 114, 234, 43, 236, 26, 81, 21 ));
   
   type ICalendarFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCalendarWithTimeZone
   (
      This       : access ICalendarFactory2_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; timeZoneId : Windows.String
      ; RetVal : access Windows.Globalization.ICalendar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimeZoneOnCalendar : aliased constant Windows.IID := (3141281253, 18127, 17175, (163, 245, 2, 98, 26, 213, 68, 120 ));
   
   type ITimeZoneOnCalendar_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTimeZone
   (
      This       : access ITimeZoneOnCalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ChangeTimeZone
   (
      This       : access ITimeZoneOnCalendar_Interface
      ; timeZoneId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TimeZoneAsFullString
   (
      This       : access ITimeZoneOnCalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TimeZoneAsString
   (
      This       : access ITimeZoneOnCalendar_Interface
      ; idealLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICalendarFactory : aliased constant Windows.IID := (2213905426, 58731, 19573, (166, 110, 15, 99, 213, 119, 88, 166 ));
   
   type ICalendarFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCalendarDefaultCalendarAndClock
   (
      This       : access ICalendarFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Globalization.ICalendar
   )
   return Windows.HRESULT is abstract;
   
   function CreateCalendar
   (
      This       : access ICalendarFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; RetVal : access Windows.Globalization.ICalendar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationLanguagesStatics : aliased constant Windows.IID := (1974732871, 2636, 19090, (149, 101, 253, 99, 201, 95, 122, 237 ));
   
   type IApplicationLanguagesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrimaryLanguageOverride
   (
      This       : access IApplicationLanguagesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PrimaryLanguageOverride
   (
      This       : access IApplicationLanguagesStatics_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Languages
   (
      This       : access IApplicationLanguagesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ManifestLanguages
   (
      This       : access IApplicationLanguagesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJapanesePhoneticAnalyzerStatics : aliased constant Windows.IID := (2292948624, 37854, 16818, (180, 213, 142, 219, 34, 127, 209, 194 ));
   
   type IJapanesePhoneticAnalyzerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetWords
   (
      This       : access IJapanesePhoneticAnalyzerStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Globalization.IVectorView_IJapanesePhoneme -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWordsWithMonoRubyOption
   (
      This       : access IJapanesePhoneticAnalyzerStatics_Interface
      ; input : Windows.String
      ; monoRuby : Windows.Boolean
      ; RetVal : access Windows.Globalization.IVectorView_IJapanesePhoneme -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJapanesePhoneme : aliased constant Windows.IID := (795513600, 59483, 17382, (137, 125, 93, 130, 248, 98, 223, 33 ));
   
   type IJapanesePhoneme_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayText
   (
      This       : access IJapanesePhoneme_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_YomiText
   (
      This       : access IJapanesePhoneme_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPhraseStart
   (
      This       : access IJapanesePhoneme_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILanguage : aliased constant Windows.IID := (820615910, 62484, 21059, (141, 178, 170, 179, 142, 163, 241, 241 ));
   
   type IIterator_ILanguage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILanguage_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILanguage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILanguage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILanguage_Interface
      ; items : Windows.Globalization.ILanguage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILanguage : aliased constant Windows.IID := (1212193296, 25014, 23985, (166, 157, 138, 188, 70, 172, 96, 138 ));
   
   type IIterable_ILanguage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILanguage_Interface
      ; RetVal : access Windows.Globalization.IIterator_ILanguage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ILanguage : aliased constant Windows.IID := (340463421, 11609, 24018, (176, 18, 144, 142, 195, 224, 100, 53 ));
   
   type IVectorView_ILanguage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ILanguage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ILanguage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ILanguage_Interface
      ; value : Windows.Globalization.ILanguage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ILanguage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Globalization.ILanguage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IJapanesePhoneme : aliased constant Windows.IID := (4049381351, 27048, 22093, (156, 32, 77, 167, 90, 119, 52, 50 ));
   
   type IIterator_IJapanesePhoneme_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IJapanesePhoneme_Interface
      ; RetVal : access Windows.Globalization.IJapanesePhoneme
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IJapanesePhoneme_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IJapanesePhoneme_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IJapanesePhoneme_Interface
      ; items : Windows.Globalization.IJapanesePhoneme_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IJapanesePhoneme : aliased constant Windows.IID := (447551435, 6185, 21046, (138, 239, 11, 117, 248, 223, 215, 166 ));
   
   type IIterable_IJapanesePhoneme_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IJapanesePhoneme_Interface
      ; RetVal : access Windows.Globalization.IIterator_IJapanesePhoneme
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IJapanesePhoneme : aliased constant Windows.IID := (1289509840, 54442, 23392, (191, 37, 113, 68, 144, 80, 80, 249 ));
   
   type IVectorView_IJapanesePhoneme_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IJapanesePhoneme_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Globalization.IJapanesePhoneme
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IJapanesePhoneme_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IJapanesePhoneme_Interface
      ; value : Windows.Globalization.IJapanesePhoneme
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IJapanesePhoneme_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Globalization.IJapanesePhoneme_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GeographicRegion is Windows.Globalization.IGeographicRegion;
   
   function CreateGeographicRegion return Windows.Globalization.IGeographicRegion;
   
   subtype Language is Windows.Globalization.ILanguage;
   function CreateLanguage
   (
      languageTag : Windows.String
   )
   return Windows.Globalization.ILanguage;
   
   
   subtype Calendar is Windows.Globalization.ICalendar;
   function CreateCalendarWithTimeZone
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; timeZoneId : Windows.String
   )
   return Windows.Globalization.ICalendar;
   
   
   subtype JapanesePhoneme is Windows.Globalization.IJapanesePhoneme;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Gregorian
   return Windows.String;
   
   function get_Hebrew
   return Windows.String;
   
   function get_Hijri
   return Windows.String;
   
   function get_Japanese
   return Windows.String;
   
   function get_Julian
   return Windows.String;
   
   function get_Korean
   return Windows.String;
   
   function get_Taiwan
   return Windows.String;
   
   function get_Thai
   return Windows.String;
   
   function get_UmAlQura
   return Windows.String;
   
   function get_ChineseLunar
   return Windows.String;
   
   function get_JapaneseLunar
   return Windows.String;
   
   function get_KoreanLunar
   return Windows.String;
   
   function get_TaiwanLunar
   return Windows.String;
   
   function get_VietnameseLunar
   return Windows.String;
   
   function get_Persian
   return Windows.String;
   
   function get_TwelveHour
   return Windows.String;
   
   function get_TwentyFourHour
   return Windows.String;
   
   function get_Arab
   return Windows.String;
   
   function get_ArabExt
   return Windows.String;
   
   function get_Bali
   return Windows.String;
   
   function get_Beng
   return Windows.String;
   
   function get_Cham
   return Windows.String;
   
   function get_Deva
   return Windows.String;
   
   function get_FullWide
   return Windows.String;
   
   function get_Gujr
   return Windows.String;
   
   function get_Guru
   return Windows.String;
   
   function get_HaniDec
   return Windows.String;
   
   function get_Java
   return Windows.String;
   
   function get_Kali
   return Windows.String;
   
   function get_Khmr
   return Windows.String;
   
   function get_Knda
   return Windows.String;
   
   function get_Lana
   return Windows.String;
   
   function get_LanaTham
   return Windows.String;
   
   function get_Laoo
   return Windows.String;
   
   function get_Latn
   return Windows.String;
   
   function get_Lepc
   return Windows.String;
   
   function get_Limb
   return Windows.String;
   
   function get_Mlym
   return Windows.String;
   
   function get_Mong
   return Windows.String;
   
   function get_Mtei
   return Windows.String;
   
   function get_Mymr
   return Windows.String;
   
   function get_MymrShan
   return Windows.String;
   
   function get_Nkoo
   return Windows.String;
   
   function get_Olck
   return Windows.String;
   
   function get_Orya
   return Windows.String;
   
   function get_Saur
   return Windows.String;
   
   function get_Sund
   return Windows.String;
   
   function get_Talu
   return Windows.String;
   
   function get_TamlDec
   return Windows.String;
   
   function get_Telu
   return Windows.String;
   
   function get_Thai_NumeralSystemIdentifiers
   return Windows.String;
   
   function get_Tibt
   return Windows.String;
   
   function get_Vaii
   return Windows.String;
   
   function get_Brah
   return Windows.String;
   
   function get_Osma
   return Windows.String;
   
   function get_MathBold
   return Windows.String;
   
   function get_MathDbl
   return Windows.String;
   
   function get_MathSans
   return Windows.String;
   
   function get_MathSanb
   return Windows.String;
   
   function get_MathMono
   return Windows.String;
   
   function get_ZmthBold
   return Windows.String;
   
   function get_ZmthDbl
   return Windows.String;
   
   function get_ZmthSans
   return Windows.String;
   
   function get_ZmthSanb
   return Windows.String;
   
   function get_ZmthMono
   return Windows.String;
   
   function get_BYN
   return Windows.String;
   
   function get_AED
   return Windows.String;
   
   function get_AFN
   return Windows.String;
   
   function get_ALL
   return Windows.String;
   
   function get_AMD
   return Windows.String;
   
   function get_ANG
   return Windows.String;
   
   function get_AOA
   return Windows.String;
   
   function get_ARS
   return Windows.String;
   
   function get_AUD
   return Windows.String;
   
   function get_AWG
   return Windows.String;
   
   function get_AZN
   return Windows.String;
   
   function get_BAM
   return Windows.String;
   
   function get_BBD
   return Windows.String;
   
   function get_BDT
   return Windows.String;
   
   function get_BGN
   return Windows.String;
   
   function get_BHD
   return Windows.String;
   
   function get_BIF
   return Windows.String;
   
   function get_BMD
   return Windows.String;
   
   function get_BND
   return Windows.String;
   
   function get_BOB
   return Windows.String;
   
   function get_BRL
   return Windows.String;
   
   function get_BSD
   return Windows.String;
   
   function get_BTN
   return Windows.String;
   
   function get_BWP
   return Windows.String;
   
   function get_BYR
   return Windows.String;
   
   function get_BZD
   return Windows.String;
   
   function get_CAD
   return Windows.String;
   
   function get_CDF
   return Windows.String;
   
   function get_CHF
   return Windows.String;
   
   function get_CLP
   return Windows.String;
   
   function get_CNY
   return Windows.String;
   
   function get_COP
   return Windows.String;
   
   function get_CRC
   return Windows.String;
   
   function get_CUP
   return Windows.String;
   
   function get_CVE
   return Windows.String;
   
   function get_CZK
   return Windows.String;
   
   function get_DJF
   return Windows.String;
   
   function get_DKK
   return Windows.String;
   
   function get_DOP
   return Windows.String;
   
   function get_DZD
   return Windows.String;
   
   function get_EGP
   return Windows.String;
   
   function get_ERN
   return Windows.String;
   
   function get_ETB
   return Windows.String;
   
   function get_EUR
   return Windows.String;
   
   function get_FJD
   return Windows.String;
   
   function get_FKP
   return Windows.String;
   
   function get_GBP
   return Windows.String;
   
   function get_GEL
   return Windows.String;
   
   function get_GHS
   return Windows.String;
   
   function get_GIP
   return Windows.String;
   
   function get_GMD
   return Windows.String;
   
   function get_GNF
   return Windows.String;
   
   function get_GTQ
   return Windows.String;
   
   function get_GYD
   return Windows.String;
   
   function get_HKD
   return Windows.String;
   
   function get_HNL
   return Windows.String;
   
   function get_HRK
   return Windows.String;
   
   function get_HTG
   return Windows.String;
   
   function get_HUF
   return Windows.String;
   
   function get_IDR
   return Windows.String;
   
   function get_ILS
   return Windows.String;
   
   function get_INR
   return Windows.String;
   
   function get_IQD
   return Windows.String;
   
   function get_IRR
   return Windows.String;
   
   function get_ISK
   return Windows.String;
   
   function get_JMD
   return Windows.String;
   
   function get_JOD
   return Windows.String;
   
   function get_JPY
   return Windows.String;
   
   function get_KES
   return Windows.String;
   
   function get_KGS
   return Windows.String;
   
   function get_KHR
   return Windows.String;
   
   function get_KMF
   return Windows.String;
   
   function get_KPW
   return Windows.String;
   
   function get_KRW
   return Windows.String;
   
   function get_KWD
   return Windows.String;
   
   function get_KYD
   return Windows.String;
   
   function get_KZT
   return Windows.String;
   
   function get_LAK
   return Windows.String;
   
   function get_LBP
   return Windows.String;
   
   function get_LKR
   return Windows.String;
   
   function get_LRD
   return Windows.String;
   
   function get_LSL
   return Windows.String;
   
   function get_LTL
   return Windows.String;
   
   function get_LVL
   return Windows.String;
   
   function get_LYD
   return Windows.String;
   
   function get_MAD
   return Windows.String;
   
   function get_MDL
   return Windows.String;
   
   function get_MGA
   return Windows.String;
   
   function get_MKD
   return Windows.String;
   
   function get_MMK
   return Windows.String;
   
   function get_MNT
   return Windows.String;
   
   function get_MOP
   return Windows.String;
   
   function get_MRO
   return Windows.String;
   
   function get_MUR
   return Windows.String;
   
   function get_MVR
   return Windows.String;
   
   function get_MWK
   return Windows.String;
   
   function get_MXN
   return Windows.String;
   
   function get_MYR
   return Windows.String;
   
   function get_MZN
   return Windows.String;
   
   function get_NAD
   return Windows.String;
   
   function get_NGN
   return Windows.String;
   
   function get_NIO
   return Windows.String;
   
   function get_NOK
   return Windows.String;
   
   function get_NPR
   return Windows.String;
   
   function get_NZD
   return Windows.String;
   
   function get_OMR
   return Windows.String;
   
   function get_PAB
   return Windows.String;
   
   function get_PEN
   return Windows.String;
   
   function get_PGK
   return Windows.String;
   
   function get_PHP
   return Windows.String;
   
   function get_PKR
   return Windows.String;
   
   function get_PLN
   return Windows.String;
   
   function get_PYG
   return Windows.String;
   
   function get_QAR
   return Windows.String;
   
   function get_RON
   return Windows.String;
   
   function get_RSD
   return Windows.String;
   
   function get_RUB
   return Windows.String;
   
   function get_RWF
   return Windows.String;
   
   function get_SAR
   return Windows.String;
   
   function get_SBD
   return Windows.String;
   
   function get_SCR
   return Windows.String;
   
   function get_SDG
   return Windows.String;
   
   function get_SEK
   return Windows.String;
   
   function get_SGD
   return Windows.String;
   
   function get_SHP
   return Windows.String;
   
   function get_SLL
   return Windows.String;
   
   function get_SOS
   return Windows.String;
   
   function get_SRD
   return Windows.String;
   
   function get_STD
   return Windows.String;
   
   function get_SYP
   return Windows.String;
   
   function get_SZL
   return Windows.String;
   
   function get_THB
   return Windows.String;
   
   function get_TJS
   return Windows.String;
   
   function get_TMT
   return Windows.String;
   
   function get_TND
   return Windows.String;
   
   function get_TOP
   return Windows.String;
   
   function get_TRY
   return Windows.String;
   
   function get_TTD
   return Windows.String;
   
   function get_TWD
   return Windows.String;
   
   function get_TZS
   return Windows.String;
   
   function get_UAH
   return Windows.String;
   
   function get_UGX
   return Windows.String;
   
   function get_USD
   return Windows.String;
   
   function get_UYU
   return Windows.String;
   
   function get_UZS
   return Windows.String;
   
   function get_VEF
   return Windows.String;
   
   function get_VND
   return Windows.String;
   
   function get_VUV
   return Windows.String;
   
   function get_WST
   return Windows.String;
   
   function get_XAF
   return Windows.String;
   
   function get_XCD
   return Windows.String;
   
   function get_XOF
   return Windows.String;
   
   function get_XPF
   return Windows.String;
   
   function get_XXX
   return Windows.String;
   
   function get_YER
   return Windows.String;
   
   function get_ZAR
   return Windows.String;
   
   function get_ZMW
   return Windows.String;
   
   function get_ZWL
   return Windows.String;
   
   function IsSupported
   (
      geographicRegionCode : Windows.String
   )
   return Windows.Boolean;
   
   function IsWellFormed
   (
      languageTag : Windows.String
   )
   return Windows.Boolean;
   
   function get_CurrentInputMethodLanguageTag
   return Windows.String;
   
   function TrySetInputMethodLanguageTag
   (
      languageTag : Windows.String
   )
   return Windows.Boolean;
   
   function get_PrimaryLanguageOverride
   return Windows.String;
   
   procedure put_PrimaryLanguageOverride
   (
      value : Windows.String
   )
   ;
   
   function get_Languages
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_ManifestLanguages
   return Windows.Foundation.Collections.IVectorView_String;
   
   function GetWords
   (
      input : Windows.String
   )
   return Windows.Globalization.IVectorView_IJapanesePhoneme;
   
   function GetWordsWithMonoRubyOption
   (
      input : Windows.String
      ; monoRuby : Windows.Boolean
   )
   return Windows.Globalization.IVectorView_IJapanesePhoneme;
   
end;
