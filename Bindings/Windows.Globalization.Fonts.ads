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
limited with Windows.UI.Text;
--------------------------------------------------------------------------------
package Windows.Globalization.Fonts is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILanguageFontGroup_Interface;
   type ILanguageFontGroup is access all ILanguageFontGroup_Interface'Class;
   type ILanguageFontGroup_Ptr is access all ILanguageFontGroup;
   type ILanguageFontGroupFactory_Interface;
   type ILanguageFontGroupFactory is access all ILanguageFontGroupFactory_Interface'Class;
   type ILanguageFontGroupFactory_Ptr is access all ILanguageFontGroupFactory;
   type ILanguageFont_Interface;
   type ILanguageFont is access all ILanguageFont_Interface'Class;
   type ILanguageFont_Ptr is access all ILanguageFont;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ILanguageFontGroup : aliased constant Windows.IID := (4080697283, 14940, 19178, (185, 255, 179, 159, 178, 66, 247, 246 ));
   
   type ILanguageFontGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UITextFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_UIHeadingFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_UITitleFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_UICaptionFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_UINotificationHeadingFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_TraditionalDocumentFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_ModernDocumentFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentHeadingFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_FixedWidthTextFont
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentAlternate1Font
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentAlternate2Font
   (
      This       : access ILanguageFontGroup_Interface
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFont
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageFontGroupFactory : aliased constant Windows.IID := (4239305831, 20087, 18887, (184, 86, 221, 233, 52, 252, 115, 91 ));
   
   type ILanguageFontGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLanguageFontGroup
   (
      This       : access ILanguageFontGroupFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFontGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanguageFont : aliased constant Windows.IID := (2972605498, 46957, 17819, (190, 235, 144, 17, 81, 205, 119, 209 ));
   
   type ILanguageFont_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FontFamily
   (
      This       : access ILanguageFont_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FontWeight
   (
      This       : access ILanguageFont_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStretch
   (
      This       : access ILanguageFont_Interface
      ; RetVal : access Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStyle
   (
      This       : access ILanguageFont_Interface
      ; RetVal : access Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleFactor
   (
      This       : access ILanguageFont_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LanguageFont is Windows.Globalization.Fonts.ILanguageFont;
   subtype LanguageFontGroup is Windows.Globalization.Fonts.ILanguageFontGroup;
   function CreateLanguageFontGroup
   (
      languageTag : Windows.String
   )
   return Windows.Globalization.Fonts.ILanguageFontGroup;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
