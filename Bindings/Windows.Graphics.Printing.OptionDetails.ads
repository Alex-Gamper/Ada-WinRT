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
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Graphics.Printing.OptionDetails is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PrintOptionStates is (
      None,
      Enabled,
      Constrained
   );
   for PrintOptionStates use (
      None => 0,
      Enabled => 1,
      Constrained => 2
   );
   for PrintOptionStates'Size use 32;
   
   type PrintOptionStates_Ptr is access PrintOptionStates;
   
   type PrintOptionType is (
      Unknown,
      Number,
      Text,
      ItemList,
      Toggle
   );
   for PrintOptionType use (
      Unknown => 0,
      Number => 1,
      Text => 2,
      ItemList => 3,
      Toggle => 4
   );
   for PrintOptionType'Size use 32;
   
   type PrintOptionType_Ptr is access PrintOptionType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Interface;
   type TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged is access all TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Interface'Class;
   type TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Ptr is access all TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged;
   type TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Interface;
   type TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation is access all TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Interface'Class;
   type TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Ptr is access all TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrintOptionDetails_Interface;
   type IPrintOptionDetails is access all IPrintOptionDetails_Interface'Class;
   type IPrintOptionDetails_Ptr is access all IPrintOptionDetails;
   type IPrintCopiesOptionDetails_Interface;
   type IPrintCopiesOptionDetails is access all IPrintCopiesOptionDetails_Interface'Class;
   type IPrintCopiesOptionDetails_Ptr is access all IPrintCopiesOptionDetails;
   type IPrintMediaSizeOptionDetails_Interface;
   type IPrintMediaSizeOptionDetails is access all IPrintMediaSizeOptionDetails_Interface'Class;
   type IPrintMediaSizeOptionDetails_Ptr is access all IPrintMediaSizeOptionDetails;
   type IPrintMediaTypeOptionDetails_Interface;
   type IPrintMediaTypeOptionDetails is access all IPrintMediaTypeOptionDetails_Interface'Class;
   type IPrintMediaTypeOptionDetails_Ptr is access all IPrintMediaTypeOptionDetails;
   type IPrintOrientationOptionDetails_Interface;
   type IPrintOrientationOptionDetails is access all IPrintOrientationOptionDetails_Interface'Class;
   type IPrintOrientationOptionDetails_Ptr is access all IPrintOrientationOptionDetails;
   type IPrintQualityOptionDetails_Interface;
   type IPrintQualityOptionDetails is access all IPrintQualityOptionDetails_Interface'Class;
   type IPrintQualityOptionDetails_Ptr is access all IPrintQualityOptionDetails;
   type IPrintColorModeOptionDetails_Interface;
   type IPrintColorModeOptionDetails is access all IPrintColorModeOptionDetails_Interface'Class;
   type IPrintColorModeOptionDetails_Ptr is access all IPrintColorModeOptionDetails;
   type IPrintDuplexOptionDetails_Interface;
   type IPrintDuplexOptionDetails is access all IPrintDuplexOptionDetails_Interface'Class;
   type IPrintDuplexOptionDetails_Ptr is access all IPrintDuplexOptionDetails;
   type IPrintCollationOptionDetails_Interface;
   type IPrintCollationOptionDetails is access all IPrintCollationOptionDetails_Interface'Class;
   type IPrintCollationOptionDetails_Ptr is access all IPrintCollationOptionDetails;
   type IPrintStapleOptionDetails_Interface;
   type IPrintStapleOptionDetails is access all IPrintStapleOptionDetails_Interface'Class;
   type IPrintStapleOptionDetails_Ptr is access all IPrintStapleOptionDetails;
   type IPrintHolePunchOptionDetails_Interface;
   type IPrintHolePunchOptionDetails is access all IPrintHolePunchOptionDetails_Interface'Class;
   type IPrintHolePunchOptionDetails_Ptr is access all IPrintHolePunchOptionDetails;
   type IPrintBindingOptionDetails_Interface;
   type IPrintBindingOptionDetails is access all IPrintBindingOptionDetails_Interface'Class;
   type IPrintBindingOptionDetails_Ptr is access all IPrintBindingOptionDetails;
   type IPrintBorderingOptionDetails_Interface;
   type IPrintBorderingOptionDetails is access all IPrintBorderingOptionDetails_Interface'Class;
   type IPrintBorderingOptionDetails_Ptr is access all IPrintBorderingOptionDetails;
   type IPrintPageRangeOptionDetails_Interface;
   type IPrintPageRangeOptionDetails is access all IPrintPageRangeOptionDetails_Interface'Class;
   type IPrintPageRangeOptionDetails_Ptr is access all IPrintPageRangeOptionDetails;
   type IPrintCustomTextOptionDetails2_Interface;
   type IPrintCustomTextOptionDetails2 is access all IPrintCustomTextOptionDetails2_Interface'Class;
   type IPrintCustomTextOptionDetails2_Ptr is access all IPrintCustomTextOptionDetails2;
   type IPrintCustomToggleOptionDetails_Interface;
   type IPrintCustomToggleOptionDetails is access all IPrintCustomToggleOptionDetails_Interface'Class;
   type IPrintCustomToggleOptionDetails_Ptr is access all IPrintCustomToggleOptionDetails;
   type IPrintCustomItemListOptionDetails3_Interface;
   type IPrintCustomItemListOptionDetails3 is access all IPrintCustomItemListOptionDetails3_Interface'Class;
   type IPrintCustomItemListOptionDetails3_Ptr is access all IPrintCustomItemListOptionDetails3;
   type IPrintNumberOptionDetails_Interface;
   type IPrintNumberOptionDetails is access all IPrintNumberOptionDetails_Interface'Class;
   type IPrintNumberOptionDetails_Ptr is access all IPrintNumberOptionDetails;
   type IPrintTextOptionDetails_Interface;
   type IPrintTextOptionDetails is access all IPrintTextOptionDetails_Interface'Class;
   type IPrintTextOptionDetails_Ptr is access all IPrintTextOptionDetails;
   type IPrintItemListOptionDetails_Interface;
   type IPrintItemListOptionDetails is access all IPrintItemListOptionDetails_Interface'Class;
   type IPrintItemListOptionDetails_Ptr is access all IPrintItemListOptionDetails;
   type IPrintCustomOptionDetails_Interface;
   type IPrintCustomOptionDetails is access all IPrintCustomOptionDetails_Interface'Class;
   type IPrintCustomOptionDetails_Ptr is access all IPrintCustomOptionDetails;
   type IPrintCustomTextOptionDetails_Interface;
   type IPrintCustomTextOptionDetails is access all IPrintCustomTextOptionDetails_Interface'Class;
   type IPrintCustomTextOptionDetails_Ptr is access all IPrintCustomTextOptionDetails;
   type IPrintCustomItemDetails_Interface;
   type IPrintCustomItemDetails is access all IPrintCustomItemDetails_Interface'Class;
   type IPrintCustomItemDetails_Ptr is access all IPrintCustomItemDetails;
   type IPrintCustomItemListOptionDetails_Interface;
   type IPrintCustomItemListOptionDetails is access all IPrintCustomItemListOptionDetails_Interface'Class;
   type IPrintCustomItemListOptionDetails_Ptr is access all IPrintCustomItemListOptionDetails;
   type IPrintCustomItemListOptionDetails2_Interface;
   type IPrintCustomItemListOptionDetails2 is access all IPrintCustomItemListOptionDetails2_Interface'Class;
   type IPrintCustomItemListOptionDetails2_Ptr is access all IPrintCustomItemListOptionDetails2;
   type IPrintTaskOptionChangedEventArgs_Interface;
   type IPrintTaskOptionChangedEventArgs is access all IPrintTaskOptionChangedEventArgs_Interface'Class;
   type IPrintTaskOptionChangedEventArgs_Ptr is access all IPrintTaskOptionChangedEventArgs;
   type IPrintTaskOptionDetails_Interface;
   type IPrintTaskOptionDetails is access all IPrintTaskOptionDetails_Interface'Class;
   type IPrintTaskOptionDetails_Ptr is access all IPrintTaskOptionDetails;
   type IPrintTaskOptionDetails2_Interface;
   type IPrintTaskOptionDetails2 is access all IPrintTaskOptionDetails2_Interface'Class;
   type IPrintTaskOptionDetails2_Ptr is access all IPrintTaskOptionDetails2;
   type IPrintTaskOptionDetailsStatic_Interface;
   type IPrintTaskOptionDetailsStatic is access all IPrintTaskOptionDetailsStatic_Interface'Class;
   type IPrintTaskOptionDetailsStatic_Ptr is access all IPrintTaskOptionDetailsStatic;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrintOptionDetails : aliased constant Windows.IID := (956729039, 54914, 18783, (173, 254, 215, 51, 63, 92, 24, 8 ));
   
   type IPrintOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OptionId
   (
      This       : access IPrintOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OptionType
   (
      This       : access IPrintOptionDetails_Interface
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.PrintOptionType
   )
   return Windows.HRESULT is abstract;
   
   function put_ErrorText
   (
      This       : access IPrintOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorText
   (
      This       : access IPrintOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_State
   (
      This       : access IPrintOptionDetails_Interface
      ; value : Windows.Graphics.Printing.OptionDetails.PrintOptionStates
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IPrintOptionDetails_Interface
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.PrintOptionStates
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IPrintOptionDetails_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function TrySetValue
   (
      This       : access IPrintOptionDetails_Interface
      ; value : Windows.Object
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCopiesOptionDetails : aliased constant Windows.IID := (1107636377, 17209, 17219, (137, 141, 44, 71, 181, 224, 195, 65 ));
   
   type IPrintCopiesOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintCopiesOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintCopiesOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintCopiesOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintCopiesOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintMediaSizeOptionDetails : aliased constant Windows.IID := (1821203407, 49343, 18376, (184, 74, 98, 142, 125, 13, 26, 29 ));
   
   type IPrintMediaSizeOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintMediaSizeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintMediaSizeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintMediaSizeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintMediaSizeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintMediaTypeOptionDetails : aliased constant Windows.IID := (4173791243, 44019, 19132, (142, 134, 34, 171, 197, 116, 74, 67 ));
   
   type IPrintMediaTypeOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintMediaTypeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintMediaTypeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintMediaTypeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintMediaTypeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintOrientationOptionDetails : aliased constant Windows.IID := (1187219577, 26336, 19872, (135, 180, 210, 84, 87, 130, 78, 183 ));
   
   type IPrintOrientationOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintOrientationOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintOrientationOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintOrientationOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintOrientationOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintQualityOptionDetails : aliased constant Windows.IID := (768633761, 52762, 17638, (132, 249, 58, 146, 234, 30, 48, 68 ));
   
   type IPrintQualityOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintQualityOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintQualityOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintQualityOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintQualityOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintColorModeOptionDetails : aliased constant Windows.IID := (3685316356, 61910, 18499, (164, 132, 155, 68, 124, 220, 243, 182 ));
   
   type IPrintColorModeOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintColorModeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintColorModeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintColorModeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintColorModeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintDuplexOptionDetails : aliased constant Windows.IID := (4242097553, 54436, 17658, (179, 254, 66, 224, 186, 40, 213, 173 ));
   
   type IPrintDuplexOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintDuplexOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintDuplexOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintDuplexOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintDuplexOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCollationOptionDetails : aliased constant Windows.IID := (3601576294, 42406, 16604, (172, 195, 115, 159, 40, 241, 229, 211 ));
   
   type IPrintCollationOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintCollationOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintCollationOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintCollationOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintCollationOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintStapleOptionDetails : aliased constant Windows.IID := (3560011197, 39947, 17632, (132, 246, 206, 235, 206, 101, 56, 0 ));
   
   type IPrintStapleOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintStapleOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintStapleOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintStapleOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintStapleOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintHolePunchOptionDetails : aliased constant Windows.IID := (2799574808, 18476, 18007, (157, 113, 141, 221, 219, 234, 30, 30 ));
   
   type IPrintHolePunchOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintHolePunchOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintHolePunchOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintHolePunchOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintHolePunchOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintBindingOptionDetails : aliased constant Windows.IID := (3287600280, 38244, 20246, (160, 85, 169, 139, 154, 73, 233, 211 ));
   
   type IPrintBindingOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintBindingOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintBindingOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintBindingOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintBindingOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintBorderingOptionDetails : aliased constant Windows.IID := (1299430543, 64339, 20146, (152, 95, 29, 145, 222, 11, 118, 57 ));
   
   type IPrintBorderingOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintBorderingOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintBorderingOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintBorderingOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintBorderingOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintPageRangeOptionDetails : aliased constant Windows.IID := (1511646391, 11240, 19111, (158, 165, 222, 251, 232, 113, 59, 78 ));
   
   type IPrintPageRangeOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintPageRangeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintPageRangeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintPageRangeOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintPageRangeOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomTextOptionDetails2 : aliased constant Windows.IID := (3467053908, 47479, 18200, (131, 56, 126, 210, 176, 216, 111, 227 ));
   
   type IPrintCustomTextOptionDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintCustomTextOptionDetails2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintCustomTextOptionDetails2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintCustomTextOptionDetails2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintCustomTextOptionDetails2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomToggleOptionDetails : aliased constant Windows.IID := (2645873940, 58465, 17928, (142, 233, 219, 111, 94, 208, 115, 198 ));
   
   type IPrintCustomToggleOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintCustomToggleOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintCustomToggleOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintCustomToggleOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintCustomToggleOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomItemListOptionDetails3 : aliased constant Windows.IID := (1335997759, 15412, 18536, (164, 7, 252, 94, 171, 37, 155, 33 ));
   
   type IPrintCustomItemListOptionDetails3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WarningText
   (
      This       : access IPrintCustomItemListOptionDetails3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningText
   (
      This       : access IPrintCustomItemListOptionDetails3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IPrintCustomItemListOptionDetails3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPrintCustomItemListOptionDetails3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintNumberOptionDetails : aliased constant Windows.IID := (1291959215, 25692, 19945, (150, 95, 111, 198, 187, 196, 124, 171 ));
   
   type IPrintNumberOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinValue
   (
      This       : access IPrintNumberOptionDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxValue
   (
      This       : access IPrintNumberOptionDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTextOptionDetails : aliased constant Windows.IID := (2910184803, 23780, 18108, (153, 24, 171, 159, 173, 20, 76, 91 ));
   
   type IPrintTextOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxCharacters
   (
      This       : access IPrintTextOptionDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintItemListOptionDetails : aliased constant Windows.IID := (2585941951, 65121, 17368, (162, 79, 163, 246, 171, 115, 32, 231 ));
   
   type IPrintItemListOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Items
   (
      This       : access IPrintItemListOptionDetails_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomOptionDetails : aliased constant Windows.IID := (3811302940, 10415, 19344, (149, 218, 163, 172, 243, 32, 185, 41 ));
   
   type IPrintCustomOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DisplayName
   (
      This       : access IPrintCustomOptionDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPrintCustomOptionDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomTextOptionDetails : aliased constant Windows.IID := (718369272, 51389, 18693, (145, 146, 13, 117, 19, 110, 139, 49 ));
   
   type IPrintCustomTextOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_MaxCharacters
   (
      This       : access IPrintCustomTextOptionDetails_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxCharacters
   (
      This       : access IPrintCustomTextOptionDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomItemDetails : aliased constant Windows.IID := (1459926583, 23610, 17562, (170, 54, 179, 41, 27, 17, 146, 253 ));
   
   type IPrintCustomItemDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemId
   (
      This       : access IPrintCustomItemDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ItemDisplayName
   (
      This       : access IPrintCustomItemDetails_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemDisplayName
   (
      This       : access IPrintCustomItemDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomItemListOptionDetails : aliased constant Windows.IID := (2784689544, 22770, 20157, (185, 15, 81, 228, 242, 148, 76, 93 ));
   
   type IPrintCustomItemListOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function AddItem
   (
      This       : access IPrintCustomItemListOptionDetails_Interface
      ; itemId : Windows.String
      ; displayName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintCustomItemListOptionDetails2 : aliased constant Windows.IID := (3386258749, 25884, 19001, (144, 110, 16, 145, 161, 128, 27, 241 ));
   
   type IPrintCustomItemListOptionDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddItem
   (
      This       : access IPrintCustomItemListOptionDetails2_Interface
      ; itemId : Windows.String
      ; displayName : Windows.String
      ; description : Windows.String
      ; icon : Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionChangedEventArgs : aliased constant Windows.IID := (1696169221, 42478, 17159, (148, 7, 154, 202, 209, 71, 103, 156 ));
   
   type IPrintTaskOptionChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OptionId
   (
      This       : access IPrintTaskOptionChangedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionDetails : aliased constant Windows.IID := (4117891825, 43166, 17062, (129, 175, 248, 224, 16, 179, 138, 104 ));
   
   type IPrintTaskOptionDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Options
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateItemListOption
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; optionId : Windows.String
      ; displayName : Windows.String
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails
   )
   return Windows.HRESULT is abstract;
   
   function CreateTextOption
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; optionId : Windows.String
      ; displayName : Windows.String
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails
   )
   return Windows.HRESULT is abstract;
   
   function add_OptionChanged
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; eventHandler : TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OptionChanged
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BeginValidation
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; eventHandler : TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BeginValidation
   (
      This       : access IPrintTaskOptionDetails_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionDetails2 : aliased constant Windows.IID := (1400048137, 63848, 18066, (161, 119, 192, 116, 89, 113, 134, 219 ));
   
   type IPrintTaskOptionDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateToggleOption
   (
      This       : access IPrintTaskOptionDetails2_Interface
      ; optionId : Windows.String
      ; displayName : Windows.String
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskOptionDetailsStatic : aliased constant Windows.IID := (324903315, 2401, 19310, (135, 102, 241, 59, 127, 188, 205, 88 ));
   
   type IPrintTaskOptionDetailsStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFromPrintTaskOptions
   (
      This       : access IPrintTaskOptionDetailsStatic_Interface
      ; printTaskOptions : Windows.Graphics.Printing.IPrintTaskOptionsCore
      ; RetVal : access Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged : aliased constant Windows.IID := (455034219, 34849, 22830, (180, 167, 155, 76, 55, 18, 81, 142 ));
   
   type TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails ; args : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Interface
      ; sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails
      ; args : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation : aliased constant Windows.IID := (1552434524, 23385, 21884, (128, 100, 94, 79, 61, 89, 168, 236 ));
   
   type TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Interface
      ; sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintCopiesOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintMediaSizeOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintMediaTypeOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintOrientationOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintQualityOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintColorModeOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintDuplexOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintCollationOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintStapleOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintHolePunchOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintBindingOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintBorderingOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintPageRangeOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintCustomTextOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintCustomToggleOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintCustomItemDetails is Windows.Graphics.Printing.OptionDetails.IPrintCustomItemDetails;
   subtype PrintCustomItemListOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
   subtype PrintTaskOptionChangedEventArgs is Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionChangedEventArgs;
   subtype PrintTaskOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetFromPrintTaskOptions
   (
      printTaskOptions : Windows.Graphics.Printing.IPrintTaskOptionsCore
   )
   return Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails;
   
end;
