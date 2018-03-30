--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Automation.Text is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type TextPatternRangeEndpoint is (
      Start,
      End_x
   );
   for TextPatternRangeEndpoint use (
      Start => 0,
      End_x => 1
   );
   for TextPatternRangeEndpoint'Size use 32;
   
   type TextPatternRangeEndpoint_Ptr is access TextPatternRangeEndpoint;
   
   type TextUnit is (
      Character,
      Format,
      Word,
      Line,
      Paragraph,
      Page,
      Document
   );
   for TextUnit use (
      Character => 0,
      Format => 1,
      Word => 2,
      Line => 3,
      Paragraph => 4,
      Page => 5,
      Document => 6
   );
   for TextUnit'Size use 32;
   
   type TextUnit_Ptr is access TextUnit;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   

end;
