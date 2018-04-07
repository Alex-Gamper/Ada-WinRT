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
limited with Windows.UI.Xaml.Media;
with Windows.Foundation;
limited with Windows.UI.Text;
limited with Windows.UI.Xaml.Input;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Documents is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type LogicalDirection is (
      Backward,
      Forward
   );
   for LogicalDirection use (
      Backward => 0,
      Forward => 1
   );
   for LogicalDirection'Size use 32;
   
   type LogicalDirection_Ptr is access LogicalDirection;
   
   type UnderlineStyle is (
      None,
      Single
   );
   for UnderlineStyle use (
      None => 0,
      Single => 1
   );
   for UnderlineStyle'Size use 32;
   
   type UnderlineStyle_Ptr is access UnderlineStyle;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type TextRange is record
      StartIndex : Windows.Int32;
      Length : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , TextRange);
   
   type TextRange_Ptr is access TextRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Interface;
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested is access all TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Interface'Class;
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Ptr is access all TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested;
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Interface;
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed is access all TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Interface'Class;
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Ptr is access all TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed;
   type TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Interface;
   type TypedEventHandler_ITextElement4_add_AccessKeyInvoked is access all TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Interface'Class;
   type TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Ptr is access all TypedEventHandler_ITextElement4_add_AccessKeyInvoked;
   type TypedEventHandler_IHyperlink_add_Click_Interface;
   type TypedEventHandler_IHyperlink_add_Click is access all TypedEventHandler_IHyperlink_add_Click_Interface'Class;
   type TypedEventHandler_IHyperlink_add_Click_Ptr is access all TypedEventHandler_IHyperlink_add_Click;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVector_Block_Interface;
   type IVector_Block is access all IVector_Block_Interface'Class;
   type IVector_Block_Ptr is access all IVector_Block;
   type IIterable_Block_Interface;
   type IIterable_Block is access all IIterable_Block_Interface'Class;
   type IIterable_Block_Ptr is access all IIterable_Block;
   type IVector_Inline_Interface;
   type IVector_Inline is access all IVector_Inline_Interface'Class;
   type IVector_Inline_Ptr is access all IVector_Inline;
   type IIterable_Inline_Interface;
   type IIterable_Inline is access all IIterable_Inline_Interface'Class;
   type IIterable_Inline_Ptr is access all IIterable_Inline;
   type ITextHighlighter_Interface;
   type ITextHighlighter is access all ITextHighlighter_Interface'Class;
   type ITextHighlighter_Ptr is access all ITextHighlighter;
   type ITextHighlighterStatics_Interface;
   type ITextHighlighterStatics is access all ITextHighlighterStatics_Interface'Class;
   type ITextHighlighterStatics_Ptr is access all ITextHighlighterStatics;
   type ITextHighlighterFactory_Interface;
   type ITextHighlighterFactory is access all ITextHighlighterFactory_Interface'Class;
   type ITextHighlighterFactory_Ptr is access all ITextHighlighterFactory;
   type ITextPointer_Interface;
   type ITextPointer is access all ITextPointer_Interface'Class;
   type ITextPointer_Ptr is access all ITextPointer;
   type ITypography_Interface;
   type ITypography is access all ITypography_Interface'Class;
   type ITypography_Ptr is access all ITypography;
   type ITypographyStatics_Interface;
   type ITypographyStatics is access all ITypographyStatics_Interface'Class;
   type ITypographyStatics_Ptr is access all ITypographyStatics;
   type ITextElement_Interface;
   type ITextElement is access all ITextElement_Interface'Class;
   type ITextElement_Ptr is access all ITextElement;
   type ITextElementOverrides_Interface;
   type ITextElementOverrides is access all ITextElementOverrides_Interface'Class;
   type ITextElementOverrides_Ptr is access all ITextElementOverrides;
   type ITextElementStatics_Interface;
   type ITextElementStatics is access all ITextElementStatics_Interface'Class;
   type ITextElementStatics_Ptr is access all ITextElementStatics;
   type ITextElementFactory_Interface;
   type ITextElementFactory is access all ITextElementFactory_Interface'Class;
   type ITextElementFactory_Ptr is access all ITextElementFactory;
   type ITextElement2_Interface;
   type ITextElement2 is access all ITextElement2_Interface'Class;
   type ITextElement2_Ptr is access all ITextElement2;
   type ITextElementStatics2_Interface;
   type ITextElementStatics2 is access all ITextElementStatics2_Interface'Class;
   type ITextElementStatics2_Ptr is access all ITextElementStatics2;
   type ITextElement3_Interface;
   type ITextElement3 is access all ITextElement3_Interface'Class;
   type ITextElement3_Ptr is access all ITextElement3;
   type ITextElementStatics3_Interface;
   type ITextElementStatics3 is access all ITextElementStatics3_Interface'Class;
   type ITextElementStatics3_Ptr is access all ITextElementStatics3;
   type ITextElement4_Interface;
   type ITextElement4 is access all ITextElement4_Interface'Class;
   type ITextElement4_Ptr is access all ITextElement4;
   type ITextElementStatics4_Interface;
   type ITextElementStatics4 is access all ITextElementStatics4_Interface'Class;
   type ITextElementStatics4_Ptr is access all ITextElementStatics4;
   type ITextHighlighterBase_Interface;
   type ITextHighlighterBase is access all ITextHighlighterBase_Interface'Class;
   type ITextHighlighterBase_Ptr is access all ITextHighlighterBase;
   type ITextHighlighterBaseFactory_Interface;
   type ITextHighlighterBaseFactory is access all ITextHighlighterBaseFactory_Interface'Class;
   type ITextHighlighterBaseFactory_Ptr is access all ITextHighlighterBaseFactory;
   type IBlock_Interface;
   type IBlock is access all IBlock_Interface'Class;
   type IBlock_Ptr is access all IBlock;
   type IBlockStatics_Interface;
   type IBlockStatics is access all IBlockStatics_Interface'Class;
   type IBlockStatics_Ptr is access all IBlockStatics;
   type IBlockFactory_Interface;
   type IBlockFactory is access all IBlockFactory_Interface'Class;
   type IBlockFactory_Ptr is access all IBlockFactory;
   type IBlock2_Interface;
   type IBlock2 is access all IBlock2_Interface'Class;
   type IBlock2_Ptr is access all IBlock2;
   type IBlockStatics2_Interface;
   type IBlockStatics2 is access all IBlockStatics2_Interface'Class;
   type IBlockStatics2_Ptr is access all IBlockStatics2;
   type IInline_Interface;
   type IInline is access all IInline_Interface'Class;
   type IInline_Ptr is access all IInline;
   type IInlineFactory_Interface;
   type IInlineFactory is access all IInlineFactory_Interface'Class;
   type IInlineFactory_Ptr is access all IInlineFactory;
   type IInlineUIContainer_Interface;
   type IInlineUIContainer is access all IInlineUIContainer_Interface'Class;
   type IInlineUIContainer_Ptr is access all IInlineUIContainer;
   type ILineBreak_Interface;
   type ILineBreak is access all ILineBreak_Interface'Class;
   type ILineBreak_Ptr is access all ILineBreak;
   type IParagraph_Interface;
   type IParagraph is access all IParagraph_Interface'Class;
   type IParagraph_Ptr is access all IParagraph;
   type IParagraphStatics_Interface;
   type IParagraphStatics is access all IParagraphStatics_Interface'Class;
   type IParagraphStatics_Ptr is access all IParagraphStatics;
   type IRun_Interface;
   type IRun is access all IRun_Interface'Class;
   type IRun_Ptr is access all IRun;
   type IRunStatics_Interface;
   type IRunStatics is access all IRunStatics_Interface'Class;
   type IRunStatics_Ptr is access all IRunStatics;
   type ISpan_Interface;
   type ISpan is access all ISpan_Interface'Class;
   type ISpan_Ptr is access all ISpan;
   type ISpanFactory_Interface;
   type ISpanFactory is access all ISpanFactory_Interface'Class;
   type ISpanFactory_Ptr is access all ISpanFactory;
   type IBold_Interface;
   type IBold is access all IBold_Interface'Class;
   type IBold_Ptr is access all IBold;
   type IItalic_Interface;
   type IItalic is access all IItalic_Interface'Class;
   type IItalic_Ptr is access all IItalic;
   type IUnderline_Interface;
   type IUnderline is access all IUnderline_Interface'Class;
   type IUnderline_Ptr is access all IUnderline;
   type IHyperlinkClickEventArgs_Interface;
   type IHyperlinkClickEventArgs is access all IHyperlinkClickEventArgs_Interface'Class;
   type IHyperlinkClickEventArgs_Ptr is access all IHyperlinkClickEventArgs;
   type IGlyphs_Interface;
   type IGlyphs is access all IGlyphs_Interface'Class;
   type IGlyphs_Ptr is access all IGlyphs;
   type IGlyphsStatics_Interface;
   type IGlyphsStatics is access all IGlyphsStatics_Interface'Class;
   type IGlyphsStatics_Ptr is access all IGlyphsStatics;
   type IGlyphs2_Interface;
   type IGlyphs2 is access all IGlyphs2_Interface'Class;
   type IGlyphs2_Ptr is access all IGlyphs2;
   type IGlyphsStatics2_Interface;
   type IGlyphsStatics2 is access all IGlyphsStatics2_Interface'Class;
   type IGlyphsStatics2_Ptr is access all IGlyphsStatics2;
   type IHyperlink_Interface;
   type IHyperlink is access all IHyperlink_Interface'Class;
   type IHyperlink_Ptr is access all IHyperlink;
   type IHyperlinkStatics_Interface;
   type IHyperlinkStatics is access all IHyperlinkStatics_Interface'Class;
   type IHyperlinkStatics_Ptr is access all IHyperlinkStatics;
   type IHyperlink2_Interface;
   type IHyperlink2 is access all IHyperlink2_Interface'Class;
   type IHyperlink2_Ptr is access all IHyperlink2;
   type IHyperlinkStatics2_Interface;
   type IHyperlinkStatics2 is access all IHyperlinkStatics2_Interface'Class;
   type IHyperlinkStatics2_Ptr is access all IHyperlinkStatics2;
   type IHyperlink3_Interface;
   type IHyperlink3 is access all IHyperlink3_Interface'Class;
   type IHyperlink3_Ptr is access all IHyperlink3;
   type IHyperlinkStatics3_Interface;
   type IHyperlinkStatics3 is access all IHyperlinkStatics3_Interface'Class;
   type IHyperlinkStatics3_Ptr is access all IHyperlinkStatics3;
   type IHyperlink4_Interface;
   type IHyperlink4 is access all IHyperlink4_Interface'Class;
   type IHyperlink4_Ptr is access all IHyperlink4;
   type IHyperlinkStatics4_Interface;
   type IHyperlinkStatics4 is access all IHyperlinkStatics4_Interface'Class;
   type IHyperlinkStatics4_Ptr is access all IHyperlinkStatics4;
   type IHyperlink5_Interface;
   type IHyperlink5 is access all IHyperlink5_Interface'Class;
   type IHyperlink5_Ptr is access all IHyperlink5;
   type IHyperlinkStatics5_Interface;
   type IHyperlinkStatics5 is access all IHyperlinkStatics5_Interface'Class;
   type IHyperlinkStatics5_Ptr is access all IHyperlinkStatics5;
   type IIterator_TextRange_Interface;
   type IIterator_TextRange is access all IIterator_TextRange_Interface'Class;
   type IIterator_TextRange_Ptr is access all IIterator_TextRange;
   type IIterable_TextRange_Interface;
   type IIterable_TextRange is access all IIterable_TextRange_Interface'Class;
   type IIterable_TextRange_Ptr is access all IIterable_TextRange;
   type IVectorView_TextRange_Interface;
   type IVectorView_TextRange is access all IVectorView_TextRange_Interface'Class;
   type IVectorView_TextRange_Ptr is access all IVectorView_TextRange;
   type IVector_TextRange_Interface;
   type IVector_TextRange is access all IVector_TextRange_Interface'Class;
   type IVector_TextRange_Ptr is access all IVector_TextRange;
   type IIterator_ITextHighlighter_Interface;
   type IIterator_ITextHighlighter is access all IIterator_ITextHighlighter_Interface'Class;
   type IIterator_ITextHighlighter_Ptr is access all IIterator_ITextHighlighter;
   type IIterable_ITextHighlighter_Interface;
   type IIterable_ITextHighlighter is access all IIterable_ITextHighlighter_Interface'Class;
   type IIterable_ITextHighlighter_Ptr is access all IIterable_ITextHighlighter;
   type IVectorView_ITextHighlighter_Interface;
   type IVectorView_ITextHighlighter is access all IVectorView_ITextHighlighter_Interface'Class;
   type IVectorView_ITextHighlighter_Ptr is access all IVectorView_ITextHighlighter;
   type IVector_ITextHighlighter_Interface;
   type IVector_ITextHighlighter is access all IVector_ITextHighlighter_Interface'Class;
   type IVector_ITextHighlighter_Ptr is access all IVector_ITextHighlighter;
   
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
   type IVector_Block_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Block_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Block_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Block_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Block_Interface
      ; value : Windows.UI.Xaml.Documents.IBlock
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Block_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Block_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Block_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Block_Interface
      ; value : Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Block_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Block_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Block_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.IBlock_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Block_Interface
      ; items : Windows.UI.Xaml.Documents.IBlock_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Block : aliased constant Windows.IID := (1055361588, 5646, 20735, (181, 170, 9, 242, 99, 166, 105, 248 ));
   
   ------------------------------------------------------------------------
   type IIterable_Block_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Block_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Block : aliased constant Windows.IID := (4144118682, 59089, 24109, (143, 65, 178, 140, 51, 50, 62, 4 ));
   
   ------------------------------------------------------------------------
   type IVector_Inline_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Inline_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Inline_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Inline_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Inline_Interface
      ; value : Windows.UI.Xaml.Documents.IInline
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Inline_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Inline_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Inline_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Inline_Interface
      ; value : Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Inline_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Inline_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Inline_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.IInline_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Inline_Interface
      ; items : Windows.UI.Xaml.Documents.IInline_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_Inline : aliased constant Windows.IID := (2464977490, 36579, 21974, (132, 180, 48, 182, 53, 7, 119, 120 ));
   
   ------------------------------------------------------------------------
   type IIterable_Inline_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Inline_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_Inline : aliased constant Windows.IID := (3788683536, 6338, 22790, (143, 138, 214, 42, 99, 249, 63, 24 ));
   
   ------------------------------------------------------------------------
   type ITextHighlighter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Ranges
   (
      This       : access ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IVector_TextRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Foreground
   (
      This       : access ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Foreground
   (
      This       : access ITextHighlighter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Background
   (
      This       : access ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Background
   (
      This       : access ITextHighlighter_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextHighlighter : aliased constant Windows.IID := (3127686475, 32117, 17717, (179, 13, 168, 26, 0, 182, 55, 164 ));
   
   ------------------------------------------------------------------------
   type ITextHighlighterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ForegroundProperty
   (
      This       : access ITextHighlighterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundProperty
   (
      This       : access ITextHighlighterStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextHighlighterStatics : aliased constant Windows.IID := (3014658500, 14974, 18892, (171, 132, 41, 196, 5, 72, 135, 101 ));
   
   ------------------------------------------------------------------------
   type ITextHighlighterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ITextHighlighterFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextHighlighterFactory : aliased constant Windows.IID := (1880249441, 39567, 20384, (178, 53, 143, 250, 165, 7, 190, 242 ));
   
   ------------------------------------------------------------------------
   type ITextPointer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Parent
   (
      This       : access ITextPointer_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_VisualParent
   (
      This       : access ITextPointer_Interface
      ; RetVal : access Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalDirection
   (
      This       : access ITextPointer_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.LogicalDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ITextPointer_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacterRect
   (
      This       : access ITextPointer_Interface
      ; direction : Windows.UI.Xaml.Documents.LogicalDirection
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetPositionAtOffset
   (
      This       : access ITextPointer_Interface
      ; offset : Windows.Int32
      ; direction : Windows.UI.Xaml.Documents.LogicalDirection
      ; RetVal : access Windows.UI.Xaml.Documents.ITextPointer
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextPointer : aliased constant Windows.IID := (2892528289, 27201, 17407, (133, 30, 69, 52, 138, 162, 207, 123 ));
   
   ------------------------------------------------------------------------
   type ITypography_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITypography : aliased constant Windows.IID := (2255447509, 60055, 17067, (146, 136, 156, 1, 174, 188, 122, 151 ));
   
   ------------------------------------------------------------------------
   type ITypographyStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnnotationAlternatesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetAnnotationAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_EastAsianExpertFormsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetEastAsianExpertForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetEastAsianExpertForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_EastAsianLanguageProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetEastAsianLanguage
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontEastAsianLanguage
   )
   return Windows.HRESULT is abstract;
   
   function SetEastAsianLanguage
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontEastAsianLanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_EastAsianWidthsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetEastAsianWidths
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontEastAsianWidths
   )
   return Windows.HRESULT is abstract;
   
   function SetEastAsianWidths
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontEastAsianWidths
   )
   return Windows.HRESULT is abstract;
   
   function get_StandardLigaturesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStandardLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStandardLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ContextualLigaturesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetContextualLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetContextualLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DiscretionaryLigaturesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetDiscretionaryLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetDiscretionaryLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HistoricalLigaturesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetHistoricalLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetHistoricalLigatures
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StandardSwashesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStandardSwashes
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetStandardSwashes
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ContextualSwashesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetContextualSwashes
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetContextualSwashes
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ContextualAlternatesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetContextualAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetContextualAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticAlternatesProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticAlternates
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet1Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet1
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet1
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet2Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet2
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet2
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet3Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet3
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet3
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet4Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet4
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet4
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet5Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet5
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet5
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet6Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet6
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet6
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet7Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet7
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet7
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet8Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet8
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet8
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet9Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet9
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet9
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet10Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet10
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet10
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet11Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet11
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet11
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet12Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet12
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet12
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet13Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet13
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet13
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet14Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet14
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet14
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet15Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet15
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet15
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet16Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet16
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet16
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet17Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet17
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet17
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet18Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet18
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet18
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet19Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet19
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet19
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StylisticSet20Property
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetStylisticSet20
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetStylisticSet20
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CapitalsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetCapitals
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontCapitals
   )
   return Windows.HRESULT is abstract;
   
   function SetCapitals
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontCapitals
   )
   return Windows.HRESULT is abstract;
   
   function get_CapitalSpacingProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetCapitalSpacing
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetCapitalSpacing
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KerningProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetKerning
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetKerning
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CaseSensitiveFormsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetCaseSensitiveForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetCaseSensitiveForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HistoricalFormsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetHistoricalForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetHistoricalForms
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FractionProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetFraction
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontFraction
   )
   return Windows.HRESULT is abstract;
   
   function SetFraction
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontFraction
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralStyleProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetNumeralStyle
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontNumeralStyle
   )
   return Windows.HRESULT is abstract;
   
   function SetNumeralStyle
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontNumeralStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralAlignmentProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetNumeralAlignment
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontNumeralAlignment
   )
   return Windows.HRESULT is abstract;
   
   function SetNumeralAlignment
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontNumeralAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_SlashedZeroProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetSlashedZero
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetSlashedZero
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MathematicalGreekProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetMathematicalGreek
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetMathematicalGreek
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_VariantsProperty
   (
      This       : access ITypographyStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetVariants
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.FontVariants
   )
   return Windows.HRESULT is abstract;
   
   function SetVariants
   (
      This       : access ITypographyStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontVariants
   )
   return Windows.HRESULT is abstract;
   
   IID_ITypographyStatics : aliased constant Windows.IID := (1740237960, 27735, 19680, (149, 241, 212, 185, 237, 99, 47, 180 ));
   
   ------------------------------------------------------------------------
   type ITextElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FontSize
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FontSize
   (
      This       : access ITextElement_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FontFamily
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IFontFamily
   )
   return Windows.HRESULT is abstract;
   
   function put_FontFamily
   (
      This       : access ITextElement_Interface
      ; value : Windows.UI.Xaml.Media.IFontFamily
   )
   return Windows.HRESULT is abstract;
   
   function get_FontWeight
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function put_FontWeight
   (
      This       : access ITextElement_Interface
      ; value : Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStyle
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_FontStyle
   (
      This       : access ITextElement_Interface
      ; value : Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStretch
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function put_FontStretch
   (
      This       : access ITextElement_Interface
      ; value : Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterSpacing
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_CharacterSpacing
   (
      This       : access ITextElement_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Foreground
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Foreground
   (
      This       : access ITextElement_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access ITextElement_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentStart
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.ITextPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentEnd
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.ITextPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementStart
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.ITextPointer
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementEnd
   (
      This       : access ITextElement_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.ITextPointer
   )
   return Windows.HRESULT is abstract;
   
   function FindName
   (
      This       : access ITextElement_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElement : aliased constant Windows.IID := (3896180834, 55158, 20370, (186, 234, 64, 231, 125, 71, 145, 213 ));
   
   ------------------------------------------------------------------------
   type ITextElementOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnDisconnectVisualChildren
   (
      This       : access ITextElementOverrides_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElementOverrides : aliased constant Windows.IID := (216145639, 20342, 19929, (191, 145, 22, 59, 236, 207, 132, 188 ));
   
   ------------------------------------------------------------------------
   type ITextElementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FontSizeProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontFamilyProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontWeightProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStyleProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStretchProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterSpacingProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageProperty
   (
      This       : access ITextElementStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElementStatics : aliased constant Windows.IID := (170892184, 27651, 17520, (167, 155, 50, 152, 161, 4, 130, 206 ));
   
   ------------------------------------------------------------------------
   type ITextElementFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITextElementFactory : aliased constant Windows.IID := (889221765, 53063, 19454, (177, 188, 57, 201, 58, 244, 174, 128 ));
   
   ------------------------------------------------------------------------
   type ITextElement2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTextScaleFactorEnabled
   (
      This       : access ITextElement2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTextScaleFactorEnabled
   (
      This       : access ITextElement2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElement2 : aliased constant Windows.IID := (2819058344, 63634, 18934, (140, 210, 137, 173, 218, 240, 109, 45 ));
   
   ------------------------------------------------------------------------
   type ITextElementStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTextScaleFactorEnabledProperty
   (
      This       : access ITextElementStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElementStatics2 : aliased constant Windows.IID := (373462962, 38955, 18913, (140, 3, 202, 67, 188, 77, 91, 109 ));
   
   ------------------------------------------------------------------------
   type ITextElement3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowFocusOnInteraction
   (
      This       : access ITextElement3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowFocusOnInteraction
   (
      This       : access ITextElement3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKey
   (
      This       : access ITextElement3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AccessKey
   (
      This       : access ITextElement3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitDisplayModeOnAccessKeyInvoked
   (
      This       : access ITextElement3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitDisplayModeOnAccessKeyInvoked
   (
      This       : access ITextElement3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElement3 : aliased constant Windows.IID := (3520803855, 7108, 19624, (188, 247, 119, 11, 255, 155, 39, 171 ));
   
   ------------------------------------------------------------------------
   type ITextElementStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowFocusOnInteractionProperty
   (
      This       : access ITextElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyProperty
   (
      This       : access ITextElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitDisplayModeOnAccessKeyInvokedProperty
   (
      This       : access ITextElementStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElementStatics3 : aliased constant Windows.IID := (3488599983, 4001, 17900, (154, 78, 155, 51, 102, 77, 200, 177 ));
   
   ------------------------------------------------------------------------
   type ITextElement4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextDecorations
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.UI.Text.TextDecorations
   )
   return Windows.HRESULT is abstract;
   
   function put_TextDecorations
   (
      This       : access ITextElement4_Interface
      ; value : Windows.UI.Text.TextDecorations
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAccessKeyScope
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAccessKeyScope
   (
      This       : access ITextElement4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyScopeOwner
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_AccessKeyScopeOwner
   (
      This       : access ITextElement4_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipPlacementMode
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.UI.Xaml.Input.KeyTipPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipPlacementMode
   (
      This       : access ITextElement4_Interface
      ; value : Windows.UI.Xaml.Input.KeyTipPlacementMode
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipHorizontalOffset
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipHorizontalOffset
   (
      This       : access ITextElement4_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipVerticalOffset
   (
      This       : access ITextElement4_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyTipVerticalOffset
   (
      This       : access ITextElement4_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyDisplayRequested
   (
      This       : access ITextElement4_Interface
      ; value : TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyDisplayRequested
   (
      This       : access ITextElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyDisplayDismissed
   (
      This       : access ITextElement4_Interface
      ; value : TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyDisplayDismissed
   (
      This       : access ITextElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessKeyInvoked
   (
      This       : access ITextElement4_Interface
      ; value : TypedEventHandler_ITextElement4_add_AccessKeyInvoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessKeyInvoked
   (
      This       : access ITextElement4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElement4 : aliased constant Windows.IID := (2979455522, 51726, 18601, (131, 188, 54, 206, 80, 86, 106, 199 ));
   
   ------------------------------------------------------------------------
   type ITextElementStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextDecorationsProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAccessKeyScopeProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyScopeOwnerProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipPlacementModeProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipHorizontalOffsetProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyTipVerticalOffsetProperty
   (
      This       : access ITextElementStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextElementStatics4 : aliased constant Windows.IID := (4254032926, 27410, 16597, (182, 239, 209, 189, 18, 172, 144, 102 ));
   
   ------------------------------------------------------------------------
   type ITextHighlighterBase_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITextHighlighterBase : aliased constant Windows.IID := (3646382106, 24333, 19679, (151, 88, 151, 224, 235, 149, 200, 250 ));
   
   ------------------------------------------------------------------------
   type ITextHighlighterBaseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ITextHighlighterBaseFactory : aliased constant Windows.IID := (2509419216, 60124, 19572, (146, 200, 110, 137, 110, 34, 80, 109 ));
   
   ------------------------------------------------------------------------
   type IBlock_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextAlignment
   (
      This       : access IBlock_Interface
      ; RetVal : access Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_TextAlignment
   (
      This       : access IBlock_Interface
      ; value : Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_LineHeight
   (
      This       : access IBlock_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LineHeight
   (
      This       : access IBlock_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LineStackingStrategy
   (
      This       : access IBlock_Interface
      ; RetVal : access Windows.UI.Xaml.LineStackingStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_LineStackingStrategy
   (
      This       : access IBlock_Interface
      ; value : Windows.UI.Xaml.LineStackingStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_Margin
   (
      This       : access IBlock_Interface
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   function put_Margin
   (
      This       : access IBlock_Interface
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is abstract;
   
   IID_IBlock : aliased constant Windows.IID := (1271791638, 56647, 17232, (140, 176, 225, 113, 96, 10, 200, 150 ));
   
   ------------------------------------------------------------------------
   type IBlockStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextAlignmentProperty
   (
      This       : access IBlockStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LineHeightProperty
   (
      This       : access IBlockStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LineStackingStrategyProperty
   (
      This       : access IBlockStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MarginProperty
   (
      This       : access IBlockStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBlockStatics : aliased constant Windows.IID := (4167732276, 36120, 19539, (174, 189, 145, 230, 16, 165, 224, 16 ));
   
   ------------------------------------------------------------------------
   type IBlockFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IBlockFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Documents.IBlock
   )
   return Windows.HRESULT is abstract;
   
   IID_IBlockFactory : aliased constant Windows.IID := (118555954, 20313, 20283, (156, 229, 37, 120, 76, 67, 5, 7 ));
   
   ------------------------------------------------------------------------
   type IBlock2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalTextAlignment
   (
      This       : access IBlock2_Interface
      ; RetVal : access Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalTextAlignment
   (
      This       : access IBlock2_Interface
      ; value : Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT is abstract;
   
   IID_IBlock2 : aliased constant Windows.IID := (1590148595, 4915, 19090, (131, 24, 108, 174, 220, 18, 239, 137 ));
   
   ------------------------------------------------------------------------
   type IBlockStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontalTextAlignmentProperty
   (
      This       : access IBlockStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IBlockStatics2 : aliased constant Windows.IID := (2936120534, 995, 19694, (155, 2, 43, 252, 48, 139, 39, 169 ));
   
   ------------------------------------------------------------------------
   type IInline_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IInline : aliased constant Windows.IID := (210923821, 7113, 18737, (140, 177, 26, 234, 223, 28, 198, 133 ));
   
   ------------------------------------------------------------------------
   type IInlineFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IInlineFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Documents.IInline
   )
   return Windows.HRESULT is abstract;
   
   IID_IInlineFactory : aliased constant Windows.IID := (1079553233, 12176, 19343, (153, 221, 66, 24, 239, 95, 3, 222 ));
   
   ------------------------------------------------------------------------
   type IInlineUIContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Child
   (
      This       : access IInlineUIContainer_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_Child
   (
      This       : access IInlineUIContainer_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   IID_IInlineUIContainer : aliased constant Windows.IID := (337038977, 10478, 17710, (177, 33, 95, 196, 246, 11, 134, 166 ));
   
   ------------------------------------------------------------------------
   type ILineBreak_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ILineBreak : aliased constant Windows.IID := (1683327428, 63337, 16877, (137, 91, 138, 27, 47, 179, 21, 98 ));
   
   ------------------------------------------------------------------------
   type IParagraph_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Inlines
   (
      This       : access IParagraph_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IVector_Inline
   )
   return Windows.HRESULT is abstract;
   
   function get_TextIndent
   (
      This       : access IParagraph_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TextIndent
   (
      This       : access IParagraph_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IParagraph : aliased constant Windows.IID := (4164875674, 64097, 19439, (174, 51, 11, 10, 215, 86, 168, 77 ));
   
   ------------------------------------------------------------------------
   type IParagraphStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextIndentProperty
   (
      This       : access IParagraphStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IParagraphStatics : aliased constant Windows.IID := (4010313882, 21339, 20044, (141, 132, 40, 59, 51, 233, 138, 55 ));
   
   ------------------------------------------------------------------------
   type IRun_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access IRun_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IRun_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowDirection
   (
      This       : access IRun_Interface
      ; RetVal : access Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_FlowDirection
   (
      This       : access IRun_Interface
      ; value : Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is abstract;
   
   IID_IRun : aliased constant Windows.IID := (1498758275, 3604, 18877, (184, 75, 197, 38, 243, 3, 67, 73 ));
   
   ------------------------------------------------------------------------
   type IRunStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FlowDirectionProperty
   (
      This       : access IRunStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IRunStatics : aliased constant Windows.IID := (3912252655, 26016, 19341, (167, 247, 143, 219, 40, 123, 70, 243 ));
   
   ------------------------------------------------------------------------
   type ISpan_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Inlines
   (
      This       : access ISpan_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IVector_Inline
   )
   return Windows.HRESULT is abstract;
   
   function put_Inlines
   (
      This       : access ISpan_Interface
      ; value : Windows.UI.Xaml.Documents.IVector_Inline
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpan : aliased constant Windows.IID := (2553926825, 687, 18449, (170, 21, 107, 239, 58, 202, 201, 122 ));
   
   ------------------------------------------------------------------------
   type ISpanFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ISpanFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Documents.ISpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpanFactory : aliased constant Windows.IID := (1536257884, 52525, 16576, (149, 106, 56, 100, 72, 50, 47, 121 ));
   
   ------------------------------------------------------------------------
   type IBold_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IBold : aliased constant Windows.IID := (2917611396, 7001, 19876, (187, 35, 15, 32, 232, 133, 180, 191 ));
   
   ------------------------------------------------------------------------
   type IItalic_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IItalic : aliased constant Windows.IID := (2448712092, 64699, 16727, (128, 44, 118, 246, 59, 95, 182, 87 ));
   
   ------------------------------------------------------------------------
   type IUnderline_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IUnderline : aliased constant Windows.IID := (2784657922, 25024, 18391, (147, 239, 188, 11, 87, 124, 95, 38 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkClickEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IHyperlinkClickEventArgs : aliased constant Windows.IID := (3344273771, 31708, 19431, (179, 115, 146, 64, 165, 3, 216, 112 ));
   
   ------------------------------------------------------------------------
   type IGlyphs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnicodeString
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UnicodeString
   (
      This       : access IGlyphs_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Indices
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Indices
   (
      This       : access IGlyphs_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FontUri
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_FontUri
   (
      This       : access IGlyphs_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleSimulations
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.UI.Xaml.Media.StyleSimulations
   )
   return Windows.HRESULT is abstract;
   
   function put_StyleSimulations
   (
      This       : access IGlyphs_Interface
      ; value : Windows.UI.Xaml.Media.StyleSimulations
   )
   return Windows.HRESULT is abstract;
   
   function get_FontRenderingEmSize
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FontRenderingEmSize
   (
      This       : access IGlyphs_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginX
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OriginX
   (
      This       : access IGlyphs_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginY
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OriginY
   (
      This       : access IGlyphs_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Fill
   (
      This       : access IGlyphs_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Fill
   (
      This       : access IGlyphs_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlyphs : aliased constant Windows.IID := (3497609611, 62129, 17025, (153, 162, 228, 208, 89, 50, 178, 181 ));
   
   ------------------------------------------------------------------------
   type IGlyphsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnicodeStringProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IndicesProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontUriProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleSimulationsProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FontRenderingEmSizeProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginXProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginYProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FillProperty
   (
      This       : access IGlyphsStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlyphsStatics : aliased constant Windows.IID := (576517317, 65009, 17389, (149, 143, 65, 78, 134, 241, 3, 242 ));
   
   ------------------------------------------------------------------------
   type IGlyphs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsColorFontEnabled
   (
      This       : access IGlyphs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsColorFontEnabled
   (
      This       : access IGlyphs2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorFontPaletteIndex
   (
      This       : access IGlyphs2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorFontPaletteIndex
   (
      This       : access IGlyphs2_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlyphs2 : aliased constant Windows.IID := (2861301340, 14164, 19438, (187, 225, 68, 3, 238, 155, 134, 240 ));
   
   ------------------------------------------------------------------------
   type IGlyphsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsColorFontEnabledProperty
   (
      This       : access IGlyphsStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorFontPaletteIndexProperty
   (
      This       : access IGlyphsStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlyphsStatics2 : aliased constant Windows.IID := (273193639, 5653, 18995, (170, 2, 215, 239, 42, 239, 199, 57 ));
   
   ------------------------------------------------------------------------
   type IHyperlink_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NavigateUri
   (
      This       : access IHyperlink_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_NavigateUri
   (
      This       : access IHyperlink_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function add_Click
   (
      This       : access IHyperlink_Interface
      ; value : TypedEventHandler_IHyperlink_add_Click
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Click
   (
      This       : access IHyperlink_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlink : aliased constant Windows.IID := (266483259, 5353, 16722, (158, 88, 90, 234, 91, 33, 240, 141 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NavigateUriProperty
   (
      This       : access IHyperlinkStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlinkStatics : aliased constant Windows.IID := (977589204, 64833, 16859, (140, 114, 59, 121, 10, 205, 159, 211 ));
   
   ------------------------------------------------------------------------
   type IHyperlink2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnderlineStyle
   (
      This       : access IHyperlink2_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.UnderlineStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_UnderlineStyle
   (
      This       : access IHyperlink2_Interface
      ; value : Windows.UI.Xaml.Documents.UnderlineStyle
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlink2 : aliased constant Windows.IID := (1290394207, 31999, 17041, (183, 143, 223, 236, 114, 73, 5, 118 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnderlineStyleProperty
   (
      This       : access IHyperlinkStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlinkStatics2 : aliased constant Windows.IID := (1344854199, 31455, 17390, (164, 174, 156, 146, 95, 117, 87, 22 ));
   
   ------------------------------------------------------------------------
   type IHyperlink3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_XYFocusLeft
   (
      This       : access IHyperlink3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusLeft
   (
      This       : access IHyperlink3_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRight
   (
      This       : access IHyperlink3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusRight
   (
      This       : access IHyperlink3_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUp
   (
      This       : access IHyperlink3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusUp
   (
      This       : access IHyperlink3_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDown
   (
      This       : access IHyperlink3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusDown
   (
      This       : access IHyperlink3_Interface
      ; value : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementSoundMode
   (
      This       : access IHyperlink3_Interface
      ; RetVal : access Windows.UI.Xaml.ElementSoundMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ElementSoundMode
   (
      This       : access IHyperlink3_Interface
      ; value : Windows.UI.Xaml.ElementSoundMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlink3 : aliased constant Windows.IID := (3287373785, 58835, 20407, (135, 2, 79, 109, 133, 221, 158, 10 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_XYFocusLeftProperty
   (
      This       : access IHyperlinkStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRightProperty
   (
      This       : access IHyperlinkStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUpProperty
   (
      This       : access IHyperlinkStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDownProperty
   (
      This       : access IHyperlinkStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementSoundModeProperty
   (
      This       : access IHyperlinkStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlinkStatics3 : aliased constant Windows.IID := (1041620640, 8286, 18759, (153, 165, 116, 231, 87, 232, 225, 180 ));
   
   ------------------------------------------------------------------------
   type IHyperlink4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusState
   (
      This       : access IHyperlink4_Interface
      ; RetVal : access Windows.UI.Xaml.FocusState
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUpNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusUpNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDownNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusDownNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusLeftNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusLeftNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRightNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; RetVal : access Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function put_XYFocusRightNavigationStrategy
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.Input.XYFocusNavigationStrategy
   )
   return Windows.HRESULT is abstract;
   
   function add_GotFocus
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GotFocus
   (
      This       : access IHyperlink4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LostFocus
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LostFocus
   (
      This       : access IHyperlink4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Focus
   (
      This       : access IHyperlink4_Interface
      ; value : Windows.UI.Xaml.FocusState
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlink4 : aliased constant Windows.IID := (4157614425, 33531, 16394, (164, 7, 90, 78, 230, 119, 152, 138 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusStateProperty
   (
      This       : access IHyperlinkStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusUpNavigationStrategyProperty
   (
      This       : access IHyperlinkStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusDownNavigationStrategyProperty
   (
      This       : access IHyperlinkStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusLeftNavigationStrategyProperty
   (
      This       : access IHyperlinkStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_XYFocusRightNavigationStrategyProperty
   (
      This       : access IHyperlinkStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlinkStatics4 : aliased constant Windows.IID := (74888056, 36778, 20004, (179, 182, 233, 222, 77, 60, 112, 140 ));
   
   ------------------------------------------------------------------------
   type IHyperlink5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTabStop
   (
      This       : access IHyperlink5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsTabStop
   (
      This       : access IHyperlink5_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TabIndex
   (
      This       : access IHyperlink5_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TabIndex
   (
      This       : access IHyperlink5_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlink5 : aliased constant Windows.IID := (1618859986, 2373, 17192, (145, 238, 148, 204, 236, 46, 166, 195 ));
   
   ------------------------------------------------------------------------
   type IHyperlinkStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTabStopProperty
   (
      This       : access IHyperlinkStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TabIndexProperty
   (
      This       : access IHyperlinkStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IHyperlinkStatics5 : aliased constant Windows.IID := (1496354026, 7753, 18721, (189, 136, 162, 135, 141, 7, 227, 14 ));
   
   ------------------------------------------------------------------------
   type IIterator_TextRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_TextRange_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_TextRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_TextRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_TextRange_Interface
      ; items : Windows.UI.Xaml.Documents.TextRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_TextRange : aliased constant Windows.IID := (1911961122, 49406, 21539, (145, 78, 211, 25, 210, 91, 204, 132 ));
   
   ------------------------------------------------------------------------
   type IIterable_TextRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TextRange_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IIterator_TextRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_TextRange : aliased constant Windows.IID := (718548955, 22235, 20491, (142, 168, 61, 87, 237, 250, 223, 198 ));
   
   ------------------------------------------------------------------------
   type IVectorView_TextRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_TextRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_TextRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_TextRange_Interface
      ; value : Windows.UI.Xaml.Documents.TextRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_TextRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.TextRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_TextRange : aliased constant Windows.IID := (3357856208, 30490, 20771, (144, 204, 82, 40, 31, 15, 40, 122 ));
   
   ------------------------------------------------------------------------
   type IVector_TextRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_TextRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_TextRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_TextRange_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IVectorView_TextRange
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_TextRange_Interface
      ; value : Windows.UI.Xaml.Documents.TextRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_TextRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_TextRange_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_TextRange_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_TextRange_Interface
      ; value : Windows.UI.Xaml.Documents.TextRange
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_TextRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_TextRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_TextRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.TextRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_TextRange_Interface
      ; items : Windows.UI.Xaml.Documents.TextRange_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_TextRange : aliased constant Windows.IID := (4003286234, 1872, 23583, (147, 170, 89, 173, 216, 193, 66, 27 ));
   
   ------------------------------------------------------------------------
   type IIterator_ITextHighlighter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITextHighlighter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITextHighlighter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITextHighlighter_Interface
      ; items : Windows.UI.Xaml.Documents.ITextHighlighter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ITextHighlighter : aliased constant Windows.IID := (4268695277, 58991, 21046, (164, 31, 129, 117, 68, 225, 231, 189 ));
   
   ------------------------------------------------------------------------
   type IIterable_ITextHighlighter_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IIterator_ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ITextHighlighter : aliased constant Windows.IID := (1300104255, 26263, 22938, (161, 59, 141, 222, 113, 213, 83, 125 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ITextHighlighter_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITextHighlighter_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITextHighlighter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITextHighlighter_Interface
      ; value : Windows.UI.Xaml.Documents.ITextHighlighter
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITextHighlighter_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.ITextHighlighter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ITextHighlighter : aliased constant Windows.IID := (2806215383, 17889, 22000, (162, 156, 21, 202, 9, 146, 235, 120 ));
   
   ------------------------------------------------------------------------
   type IVector_ITextHighlighter_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ITextHighlighter_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ITextHighlighter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ITextHighlighter_Interface
      ; RetVal : access Windows.UI.Xaml.Documents.IVectorView_ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ITextHighlighter_Interface
      ; value : Windows.UI.Xaml.Documents.ITextHighlighter
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ITextHighlighter_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ITextHighlighter_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ITextHighlighter_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ITextHighlighter_Interface
      ; value : Windows.UI.Xaml.Documents.ITextHighlighter
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ITextHighlighter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ITextHighlighter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ITextHighlighter_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Documents.ITextHighlighter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ITextHighlighter_Interface
      ; items : Windows.UI.Xaml.Documents.ITextHighlighter_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ITextHighlighter : aliased constant Windows.IID := (1687180632, 53346, 24369, (132, 175, 74, 95, 168, 150, 174, 80 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Documents.ITextElement ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested_Interface
      ; sender : Windows.UI.Xaml.Documents.ITextElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITextElement4_add_AccessKeyDisplayRequested : aliased constant Windows.IID := (967669512, 9550, 22026, (158, 46, 115, 177, 219, 49, 249, 53 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Documents.ITextElement ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed_Interface
      ; sender : Windows.UI.Xaml.Documents.ITextElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITextElement4_add_AccessKeyDisplayDismissed : aliased constant Windows.IID := (2831766603, 28792, 21270, (190, 182, 217, 236, 145, 106, 184, 138 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Documents.ITextElement ; args : Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITextElement4_add_AccessKeyInvoked_Interface
      ; sender : Windows.UI.Xaml.Documents.ITextElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITextElement4_add_AccessKeyInvoked : aliased constant Windows.IID := (2804706049, 11836, 22453, (158, 196, 148, 143, 108, 109, 147, 10 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IHyperlink_add_Click_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Documents.IHyperlink ; args : Windows.UI.Xaml.Documents.IHyperlinkClickEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IHyperlink_add_Click_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHyperlink_add_Click_Interface
      ; sender : Windows.UI.Xaml.Documents.IHyperlink
      ; args : Windows.UI.Xaml.Documents.IHyperlinkClickEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IHyperlink_add_Click : aliased constant Windows.IID := (1609224402, 58967, 23279, (169, 27, 127, 82, 234, 209, 127, 227 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BlockCollection is Windows.UI.Xaml.Documents.IVector_Block;
   subtype InlineCollection is Windows.UI.Xaml.Documents.IVector_Inline;
   subtype TextHighlighter is Windows.UI.Xaml.Documents.ITextHighlighter;
   
   type ITextHighlighter_Interface_Impl is new ITextHighlighter_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ITextHighlighter := null;
      m_ITextHighlighter : ITextHighlighter := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ITextHighlighter_Impl is access all ITextHighlighter_Interface_Impl'Class;
   type ITextHighlighter_Impl_Ptr is access all ITextHighlighter_Impl;
   
   function QueryInterface
   (
      This       : access ITextHighlighter_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ITextHighlighter_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ITextHighlighter_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ITextHighlighter_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ITextHighlighter_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ITextHighlighter_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Ranges
   (
      This       : access ITextHighlighter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Documents.IVector_TextRange -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   function get_Foreground
   (
      This       : access ITextHighlighter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_Foreground
   (
      This       : access ITextHighlighter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_Background
   (
      This       : access ITextHighlighter_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_Background
   (
      This       : access ITextHighlighter_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   subtype TextPointer is Windows.UI.Xaml.Documents.ITextPointer;
   subtype Typography is Windows.UI.Xaml.Documents.ITypography;
   subtype TextElement is Windows.UI.Xaml.Documents.ITextElement;
   
   subtype TextHighlighterBase is Windows.UI.Xaml.Documents.ITextHighlighterBase;
   
   subtype Block is Windows.UI.Xaml.Documents.IBlock;
   
   type IBlock_Interface_Impl is new IBlock_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IBlock := null;
      m_IBlock : IBlock := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IBlock_Impl is access all IBlock_Interface_Impl'Class;
   type IBlock_Impl_Ptr is access all IBlock_Impl;
   
   function QueryInterface
   (
      This       : access IBlock_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IBlock_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IBlock_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IBlock_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IBlock_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IBlock_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_TextAlignment
   (
      This       : access IBlock_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT;
   
   function put_TextAlignment
   (
      This       : access IBlock_Interface_Impl
      ; value : Windows.UI.Xaml.TextAlignment
   )
   return Windows.HRESULT;
   
   function get_LineHeight
   (
      This       : access IBlock_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_LineHeight
   (
      This       : access IBlock_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_LineStackingStrategy
   (
      This       : access IBlock_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.LineStackingStrategy
   )
   return Windows.HRESULT;
   
   function put_LineStackingStrategy
   (
      This       : access IBlock_Interface_Impl
      ; value : Windows.UI.Xaml.LineStackingStrategy
   )
   return Windows.HRESULT;
   
   function get_Margin
   (
      This       : access IBlock_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   function put_Margin
   (
      This       : access IBlock_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT;
   
   subtype Inline is Windows.UI.Xaml.Documents.IInline;
   
   type IInline_Interface_Impl is new IInline_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IInline := null;
      m_IInline : IInline := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IInline_Impl is access all IInline_Interface_Impl'Class;
   type IInline_Impl_Ptr is access all IInline_Impl;
   
   function QueryInterface
   (
      This       : access IInline_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IInline_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IInline_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IInline_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IInline_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IInline_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype InlineUIContainer is Windows.UI.Xaml.Documents.IInlineUIContainer;
   
   function CreateInlineUIContainer return Windows.UI.Xaml.Documents.IInlineUIContainer;
   
   subtype LineBreak is Windows.UI.Xaml.Documents.ILineBreak;
   
   function CreateLineBreak return Windows.UI.Xaml.Documents.ILineBreak;
   
   subtype Paragraph is Windows.UI.Xaml.Documents.IParagraph;
   
   function CreateParagraph return Windows.UI.Xaml.Documents.IParagraph;
   
   subtype Run is Windows.UI.Xaml.Documents.IRun;
   
   function CreateRun return Windows.UI.Xaml.Documents.IRun;
   
   subtype Span is Windows.UI.Xaml.Documents.ISpan;
   
   type ISpan_Interface_Impl is new ISpan_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ISpan := null;
      m_ISpan : ISpan := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ISpan_Impl is access all ISpan_Interface_Impl'Class;
   type ISpan_Impl_Ptr is access all ISpan_Impl;
   
   function QueryInterface
   (
      This       : access ISpan_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ISpan_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ISpan_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ISpan_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ISpan_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ISpan_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_Inlines
   (
      This       : access ISpan_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Documents.IVector_Inline
   )
   return Windows.HRESULT;
   
   function put_Inlines
   (
      This       : access ISpan_Interface_Impl
      ; value : Windows.UI.Xaml.Documents.IVector_Inline
   )
   return Windows.HRESULT;
   
   subtype Bold is Windows.UI.Xaml.Documents.IBold;
   
   function CreateBold return Windows.UI.Xaml.Documents.IBold;
   
   subtype Italic is Windows.UI.Xaml.Documents.IItalic;
   
   function CreateItalic return Windows.UI.Xaml.Documents.IItalic;
   
   subtype Underline is Windows.UI.Xaml.Documents.IUnderline;
   
   function CreateUnderline return Windows.UI.Xaml.Documents.IUnderline;
   
   subtype Hyperlink is Windows.UI.Xaml.Documents.IHyperlink;
   
   function CreateHyperlink return Windows.UI.Xaml.Documents.IHyperlink;
   
   subtype HyperlinkClickEventArgs is Windows.UI.Xaml.Documents.IHyperlinkClickEventArgs;
   subtype Glyphs is Windows.UI.Xaml.Documents.IGlyphs;
   
   function CreateGlyphs return Windows.UI.Xaml.Documents.IGlyphs;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Documents.ITextHighlighter;
   
   function get_ForegroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_BackgroundProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AnnotationAlternatesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAnnotationAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetAnnotationAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_EastAsianExpertFormsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetEastAsianExpertForms
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetEastAsianExpertForms
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_EastAsianLanguageProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetEastAsianLanguage
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontEastAsianLanguage;
   
   procedure SetEastAsianLanguage
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontEastAsianLanguage
   )
   ;
   
   function get_EastAsianWidthsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetEastAsianWidths
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontEastAsianWidths;
   
   procedure SetEastAsianWidths
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontEastAsianWidths
   )
   ;
   
   function get_StandardLigaturesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStandardLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStandardLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_ContextualLigaturesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetContextualLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetContextualLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_DiscretionaryLigaturesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetDiscretionaryLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetDiscretionaryLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_HistoricalLigaturesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetHistoricalLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetHistoricalLigatures
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StandardSwashesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStandardSwashes
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetStandardSwashes
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_ContextualSwashesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetContextualSwashes
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetContextualSwashes
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_ContextualAlternatesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetContextualAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetContextualAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticAlternatesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetStylisticAlternates
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_StylisticSet1Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet1
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet1
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet2Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet2
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet2
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet3Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet3
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet3
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet4Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet4
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet4
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet5Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet5
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet5
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet6Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet6
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet6
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet7Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet7
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet7
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet8Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet8
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet8
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet9Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet9
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet9
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet10Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet10
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet10
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet11Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet11
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet11
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet12Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet12
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet12
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet13Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet13
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet13
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet14Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet14
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet14
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet15Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet15
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet15
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet16Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet16
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet16
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet17Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet17
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet17
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet18Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet18
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet18
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet19Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet19
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet19
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_StylisticSet20Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetStylisticSet20
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetStylisticSet20
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_CapitalsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetCapitals
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontCapitals;
   
   procedure SetCapitals
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontCapitals
   )
   ;
   
   function get_CapitalSpacingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetCapitalSpacing
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetCapitalSpacing
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_KerningProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetKerning
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetKerning
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_CaseSensitiveFormsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetCaseSensitiveForms
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetCaseSensitiveForms
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_HistoricalFormsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetHistoricalForms
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetHistoricalForms
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_FractionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetFraction
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontFraction;
   
   procedure SetFraction
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontFraction
   )
   ;
   
   function get_NumeralStyleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetNumeralStyle
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontNumeralStyle;
   
   procedure SetNumeralStyle
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontNumeralStyle
   )
   ;
   
   function get_NumeralAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetNumeralAlignment
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontNumeralAlignment;
   
   procedure SetNumeralAlignment
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontNumeralAlignment
   )
   ;
   
   function get_SlashedZeroProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetSlashedZero
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetSlashedZero
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_MathematicalGreekProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetMathematicalGreek
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetMathematicalGreek
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_VariantsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetVariants
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.FontVariants;
   
   procedure SetVariants
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.FontVariants
   )
   ;
   
   function get_TextDecorationsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsAccessKeyScopeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AccessKeyScopeOwnerProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipPlacementModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_KeyTipVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AllowFocusOnInteractionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ExitDisplayModeOnAccessKeyInvokedProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontSizeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontFamilyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontWeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontStyleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontStretchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CharacterSpacingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ForegroundProperty_ITextElement
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LanguageProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsTextScaleFactorEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TextAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LineHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_LineStackingStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_MarginProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_HorizontalTextAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Documents.IBlock;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Documents.IInline;
   
   function get_TextIndentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FlowDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Documents.ISpan;
   
   function get_NavigateUriProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusLeftProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusRightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusUpProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusDownProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ElementSoundModeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FocusStateProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusUpNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusDownNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusLeftNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_XYFocusRightNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_UnderlineStyleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsTabStopProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TabIndexProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsColorFontEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ColorFontPaletteIndexProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_UnicodeStringProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IndicesProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontUriProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StyleSimulationsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FontRenderingEmSizeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OriginXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OriginYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillProperty
   return Windows.UI.Xaml.IDependencyProperty;

end;
