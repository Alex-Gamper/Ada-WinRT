--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.UI.Text;
--------------------------------------------------------------------------------
package Windows.Globalization.Fonts is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
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
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
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
   
   IID_ILanguageFontGroup : aliased constant Windows.IID := (4080697283, 14940, 19178, (185, 255, 179, 159, 178, 66, 247, 246 ));
   
   ------------------------------------------------------------------------
   type ILanguageFontGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLanguageFontGroup
   (
      This       : access ILanguageFontGroupFactory_Interface
      ; languageTag : Windows.String
      ; RetVal : access Windows.Globalization.Fonts.ILanguageFontGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_ILanguageFontGroupFactory : aliased constant Windows.IID := (4239305831, 20087, 18887, (184, 86, 221, 233, 52, 252, 115, 91 ));
   
   ------------------------------------------------------------------------
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
   
   IID_ILanguageFont : aliased constant Windows.IID := (2972605498, 46957, 17819, (190, 235, 144, 17, 81, 205, 119, 209 ));
   
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
