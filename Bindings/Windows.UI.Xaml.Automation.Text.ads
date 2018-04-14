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
   
end;
