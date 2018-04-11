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
with Windows.Foundation.Collections;
package Windows.Globalization.NumberFormatting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type RoundingAlgorithm is (
      None,
      RoundDown,
      RoundUp,
      RoundTowardsZero,
      RoundAwayFromZero,
      RoundHalfDown,
      RoundHalfUp,
      RoundHalfTowardsZero,
      RoundHalfAwayFromZero,
      RoundHalfToEven,
      RoundHalfToOdd
   );
   for RoundingAlgorithm use (
      None => 0,
      RoundDown => 1,
      RoundUp => 2,
      RoundTowardsZero => 3,
      RoundAwayFromZero => 4,
      RoundHalfDown => 5,
      RoundHalfUp => 6,
      RoundHalfTowardsZero => 7,
      RoundHalfAwayFromZero => 8,
      RoundHalfToEven => 9,
      RoundHalfToOdd => 10
   );
   for RoundingAlgorithm'Size use 32;
   
   type RoundingAlgorithm_Ptr is access RoundingAlgorithm;
   
   type CurrencyFormatterMode is (
      UseSymbol,
      UseCurrencyCode
   );
   for CurrencyFormatterMode use (
      UseSymbol => 0,
      UseCurrencyCode => 1
   );
   for CurrencyFormatterMode'Size use 32;
   
   type CurrencyFormatterMode_Ptr is access CurrencyFormatterMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type INumberRounder_Interface;
   type INumberRounder is access all INumberRounder_Interface'Class;
   type INumberRounder_Ptr is access all INumberRounder;
   type ISignificantDigitsNumberRounder_Interface;
   type ISignificantDigitsNumberRounder is access all ISignificantDigitsNumberRounder_Interface'Class;
   type ISignificantDigitsNumberRounder_Ptr is access all ISignificantDigitsNumberRounder;
   type IIncrementNumberRounder_Interface;
   type IIncrementNumberRounder is access all IIncrementNumberRounder_Interface'Class;
   type IIncrementNumberRounder_Ptr is access all IIncrementNumberRounder;
   type INumberFormatter_Interface;
   type INumberFormatter is access all INumberFormatter_Interface'Class;
   type INumberFormatter_Ptr is access all INumberFormatter;
   type INumberFormatter2_Interface;
   type INumberFormatter2 is access all INumberFormatter2_Interface'Class;
   type INumberFormatter2_Ptr is access all INumberFormatter2;
   type INumberParser_Interface;
   type INumberParser is access all INumberParser_Interface'Class;
   type INumberParser_Ptr is access all INumberParser;
   type INumberFormatterOptions_Interface;
   type INumberFormatterOptions is access all INumberFormatterOptions_Interface'Class;
   type INumberFormatterOptions_Ptr is access all INumberFormatterOptions;
   type ISignificantDigitsOption_Interface;
   type ISignificantDigitsOption is access all ISignificantDigitsOption_Interface'Class;
   type ISignificantDigitsOption_Ptr is access all ISignificantDigitsOption;
   type INumberRounderOption_Interface;
   type INumberRounderOption is access all INumberRounderOption_Interface'Class;
   type INumberRounderOption_Ptr is access all INumberRounderOption;
   type ISignedZeroOption_Interface;
   type ISignedZeroOption is access all ISignedZeroOption_Interface'Class;
   type ISignedZeroOption_Ptr is access all ISignedZeroOption;
   type IDecimalFormatterFactory_Interface;
   type IDecimalFormatterFactory is access all IDecimalFormatterFactory_Interface'Class;
   type IDecimalFormatterFactory_Ptr is access all IDecimalFormatterFactory;
   type IPercentFormatterFactory_Interface;
   type IPercentFormatterFactory is access all IPercentFormatterFactory_Interface'Class;
   type IPercentFormatterFactory_Ptr is access all IPercentFormatterFactory;
   type IPermilleFormatterFactory_Interface;
   type IPermilleFormatterFactory is access all IPermilleFormatterFactory_Interface'Class;
   type IPermilleFormatterFactory_Ptr is access all IPermilleFormatterFactory;
   type ICurrencyFormatterFactory_Interface;
   type ICurrencyFormatterFactory is access all ICurrencyFormatterFactory_Interface'Class;
   type ICurrencyFormatterFactory_Ptr is access all ICurrencyFormatterFactory;
   type ICurrencyFormatter_Interface;
   type ICurrencyFormatter is access all ICurrencyFormatter_Interface'Class;
   type ICurrencyFormatter_Ptr is access all ICurrencyFormatter;
   type ICurrencyFormatter2_Interface;
   type ICurrencyFormatter2 is access all ICurrencyFormatter2_Interface'Class;
   type ICurrencyFormatter2_Ptr is access all ICurrencyFormatter2;
   type INumeralSystemTranslatorFactory_Interface;
   type INumeralSystemTranslatorFactory is access all INumeralSystemTranslatorFactory_Interface'Class;
   type INumeralSystemTranslatorFactory_Ptr is access all INumeralSystemTranslatorFactory;
   type INumeralSystemTranslator_Interface;
   type INumeralSystemTranslator is access all INumeralSystemTranslator_Interface'Class;
   type INumeralSystemTranslator_Ptr is access all INumeralSystemTranslator;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_INumberRounder : aliased constant Windows.IID := (1416872821, 14573, 17969, (184, 12, 239, 52, 252, 72, 183, 245 ));
   
   type INumberRounder_Interface is interface and Windows.IInspectable_Interface;
   
   function RoundInt32
   (
      This       : access INumberRounder_Interface
      ; value : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RoundUInt32
   (
      This       : access INumberRounder_Interface
      ; value : Windows.UInt32
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function RoundInt64
   (
      This       : access INumberRounder_Interface
      ; value : Windows.Int64
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function RoundUInt64
   (
      This       : access INumberRounder_Interface
      ; value : Windows.UInt64
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function RoundSingle
   (
      This       : access INumberRounder_Interface
      ; value : Windows.Single
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function RoundDouble
   (
      This       : access INumberRounder_Interface
      ; value : Windows.Double
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISignificantDigitsNumberRounder : aliased constant Windows.IID := (4120124362, 26182, 18707, (140, 118, 27, 25, 31, 249, 77, 253 ));
   
   type ISignificantDigitsNumberRounder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RoundingAlgorithm
   (
      This       : access ISignificantDigitsNumberRounder_Interface
      ; RetVal : access Windows.Globalization.NumberFormatting.RoundingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_RoundingAlgorithm
   (
      This       : access ISignificantDigitsNumberRounder_Interface
      ; value : Windows.Globalization.NumberFormatting.RoundingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_SignificantDigits
   (
      This       : access ISignificantDigitsNumberRounder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_SignificantDigits
   (
      This       : access ISignificantDigitsNumberRounder_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIncrementNumberRounder : aliased constant Windows.IID := (1889947640, 26283, 16725, (157, 161, 115, 158, 70, 118, 69, 67 ));
   
   type IIncrementNumberRounder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RoundingAlgorithm
   (
      This       : access IIncrementNumberRounder_Interface
      ; RetVal : access Windows.Globalization.NumberFormatting.RoundingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_RoundingAlgorithm
   (
      This       : access IIncrementNumberRounder_Interface
      ; value : Windows.Globalization.NumberFormatting.RoundingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_Increment
   (
      This       : access IIncrementNumberRounder_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Increment
   (
      This       : access IIncrementNumberRounder_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumberFormatter : aliased constant Windows.IID := (2768272457, 30326, 19895, (134, 49, 27, 111, 242, 101, 202, 169 ));
   
   type INumberFormatter_Interface is interface and Windows.IInspectable_Interface;
   
   function FormatInt
   (
      This       : access INumberFormatter_Interface
      ; value : Windows.Int64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatUInt
   (
      This       : access INumberFormatter_Interface
      ; value : Windows.UInt64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatDouble
   (
      This       : access INumberFormatter_Interface
      ; value : Windows.Double
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumberFormatter2 : aliased constant Windows.IID := (3567829488, 32976, 19213, (168, 158, 136, 44, 30, 143, 131, 16 ));
   
   type INumberFormatter2_Interface is interface and Windows.IInspectable_Interface;
   
   function FormatInt
   (
      This       : access INumberFormatter2_Interface
      ; value : Windows.Int64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatUInt
   (
      This       : access INumberFormatter2_Interface
      ; value : Windows.UInt64
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatDouble
   (
      This       : access INumberFormatter2_Interface
      ; value : Windows.Double
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumberParser : aliased constant Windows.IID := (3865416722, 18963, 19027, (131, 161, 57, 47, 190, 76, 255, 159 ));
   
   type INumberParser_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseInt
   (
      This       : access INumberParser_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Foundation.IReference_Int64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ParseUInt
   (
      This       : access INumberParser_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ParseDouble
   (
      This       : access INumberParser_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumberFormatterOptions : aliased constant Windows.IID := (2150837537, 44769, 19001, (186, 162, 7, 237, 140, 150, 218, 246 ));
   
   type INumberFormatterOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Languages
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_GeographicRegion
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IntegerDigits
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_IntegerDigits
   (
      This       : access INumberFormatterOptions_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_FractionDigits
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_FractionDigits
   (
      This       : access INumberFormatterOptions_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGrouped
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsGrouped
   (
      This       : access INumberFormatterOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDecimalPointAlwaysDisplayed
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDecimalPointAlwaysDisplayed
   (
      This       : access INumberFormatterOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralSystem
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NumeralSystem
   (
      This       : access INumberFormatterOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedLanguage
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedGeographicRegion
   (
      This       : access INumberFormatterOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISignificantDigitsOption : aliased constant Windows.IID := (491650269, 11587, 20200, (187, 241, 193, 178, 106, 113, 26, 88 ));
   
   type ISignificantDigitsOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SignificantDigits
   (
      This       : access ISignificantDigitsOption_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_SignificantDigits
   (
      This       : access ISignificantDigitsOption_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumberRounderOption : aliased constant Windows.IID := (990413875, 25711, 20222, (141, 72, 102, 235, 46, 73, 231, 54 ));
   
   type INumberRounderOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NumberRounder
   (
      This       : access INumberRounderOption_Interface
      ; RetVal : access Windows.Globalization.NumberFormatting.INumberRounder
   )
   return Windows.HRESULT is abstract;
   
   function put_NumberRounder
   (
      This       : access INumberRounderOption_Interface
      ; value : Windows.Globalization.NumberFormatting.INumberRounder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISignedZeroOption : aliased constant Windows.IID := (4246527281, 2620, 18884, (166, 66, 150, 161, 86, 79, 79, 48 ));
   
   type ISignedZeroOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsZeroSigned
   (
      This       : access ISignedZeroOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsZeroSigned
   (
      This       : access ISignedZeroOption_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDecimalFormatterFactory : aliased constant Windows.IID := (218205338, 58259, 18104, (184, 48, 122, 105, 200, 248, 159, 187 ));
   
   type IDecimalFormatterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDecimalFormatter
   (
      This       : access IDecimalFormatterFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; RetVal : access Windows.Globalization.NumberFormatting.INumberFormatterOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPercentFormatterFactory : aliased constant Windows.IID := (3078785775, 65236, 16408, (166, 226, 224, 153, 97, 224, 55, 101 ));
   
   type IPercentFormatterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePercentFormatter
   (
      This       : access IPercentFormatterFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; RetVal : access Windows.Globalization.NumberFormatting.INumberFormatterOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPermilleFormatterFactory : aliased constant Windows.IID := (725071020, 58936, 20181, (169, 152, 98, 246, 176, 106, 73, 174 ));
   
   type IPermilleFormatterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePermilleFormatter
   (
      This       : access IPermilleFormatterFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; RetVal : access Windows.Globalization.NumberFormatting.INumberFormatterOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrencyFormatterFactory : aliased constant Windows.IID := (2261209982, 47416, 19106, (132, 176, 44, 51, 220, 91, 20, 80 ));
   
   type ICurrencyFormatterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCurrencyFormatterCode
   (
      This       : access ICurrencyFormatterFactory_Interface
      ; currencyCode : Windows.String
      ; RetVal : access Windows.Globalization.NumberFormatting.ICurrencyFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateCurrencyFormatterCodeContext
   (
      This       : access ICurrencyFormatterFactory_Interface
      ; currencyCode : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; RetVal : access Windows.Globalization.NumberFormatting.ICurrencyFormatter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrencyFormatter : aliased constant Windows.IID := (292752549, 19200, 16818, (179, 50, 115, 177, 42, 73, 125, 84 ));
   
   type ICurrencyFormatter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Currency
   (
      This       : access ICurrencyFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Currency
   (
      This       : access ICurrencyFormatter_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrencyFormatter2 : aliased constant Windows.IID := (120336157, 59322, 16791, (146, 14, 36, 124, 146, 247, 222, 166 ));
   
   type ICurrencyFormatter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access ICurrencyFormatter2_Interface
      ; RetVal : access Windows.Globalization.NumberFormatting.CurrencyFormatterMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access ICurrencyFormatter2_Interface
      ; value : Windows.Globalization.NumberFormatting.CurrencyFormatterMode
   )
   return Windows.HRESULT is abstract;
   
   function ApplyRoundingForCurrency
   (
      This       : access ICurrencyFormatter2_Interface
      ; roundingAlgorithm : Windows.Globalization.NumberFormatting.RoundingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumeralSystemTranslatorFactory : aliased constant Windows.IID := (2519779546, 14063, 19848, (168, 92, 111, 13, 152, 214, 32, 166 ));
   
   type INumeralSystemTranslatorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access INumeralSystemTranslatorFactory_Interface
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Globalization.NumberFormatting.INumeralSystemTranslator
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INumeralSystemTranslator : aliased constant Windows.IID := (687193132, 35875, 16948, (173, 46, 250, 90, 58, 66, 110, 155 ));
   
   type INumeralSystemTranslator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Languages
   (
      This       : access INumeralSystemTranslator_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedLanguage
   (
      This       : access INumeralSystemTranslator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralSystem
   (
      This       : access INumeralSystemTranslator_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NumeralSystem
   (
      This       : access INumeralSystemTranslator_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TranslateNumerals
   (
      This       : access INumeralSystemTranslator_Interface
      ; value : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SignificantDigitsNumberRounder is Windows.Globalization.NumberFormatting.INumberRounder;
   function CreateSignificantDigitsNumberRounder return Windows.Globalization.NumberFormatting.INumberRounder;
   
   subtype IncrementNumberRounder is Windows.Globalization.NumberFormatting.INumberRounder;
   function CreateIncrementNumberRounder return Windows.Globalization.NumberFormatting.INumberRounder;
   
   subtype DecimalFormatter is Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   function CreateDecimalFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   
   subtype PercentFormatter is Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   function CreatePercentFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   
   subtype PermilleFormatter is Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   function CreatePermilleFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions;
   
   subtype CurrencyFormatter is Windows.Globalization.NumberFormatting.ICurrencyFormatter;
   function CreateCurrencyFormatterCode
   (
      currencyCode : Windows.String
   )
   return Windows.Globalization.NumberFormatting.ICurrencyFormatter;
   
   function CreateCurrencyFormatterCodeContext
   (
      currencyCode : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.ICurrencyFormatter;
   
   subtype NumeralSystemTranslator is Windows.Globalization.NumberFormatting.INumeralSystemTranslator;
   function CreateNumeralSystemTranslator return Windows.Globalization.NumberFormatting.INumeralSystemTranslator;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
