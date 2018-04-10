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
      ItemList
   );
   for PrintOptionType use (
      Unknown => 0,
      Number => 1,
      Text => 2,
      ItemList => 3
   );
   for PrintOptionType'Size use 32;
   
   type PrintOptionType_Ptr is access PrintOptionType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
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
   type IPrintTaskOptionChangedEventArgs_Interface;
   type IPrintTaskOptionChangedEventArgs is access all IPrintTaskOptionChangedEventArgs_Interface'Class;
   type IPrintTaskOptionChangedEventArgs_Ptr is access all IPrintTaskOptionChangedEventArgs;
   type IPrintTaskOptionDetails_Interface;
   type IPrintTaskOptionDetails is access all IPrintTaskOptionDetails_Interface'Class;
   type IPrintTaskOptionDetails_Ptr is access all IPrintTaskOptionDetails;
   type IPrintTaskOptionDetailsStatic_Interface;
   type IPrintTaskOptionDetailsStatic is access all IPrintTaskOptionDetailsStatic_Interface'Class;
   type IPrintTaskOptionDetailsStatic_Ptr is access all IPrintTaskOptionDetailsStatic;
   
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
   subtype PrintCustomTextOptionDetails is Windows.Graphics.Printing.OptionDetails.IPrintOptionDetails;
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
