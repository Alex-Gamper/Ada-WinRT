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
--------------------------------------------------------------------------------
package Windows.Media.Render is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AudioRenderCategory is (
      Other,
      Communications,
      Alerts,
      SoundEffects,
      GameEffects,
      GameMedia,
      GameChat,
      Speech,
      Movie,
      Media
   );
   for AudioRenderCategory use (
      Other => 0,
      Communications => 3,
      Alerts => 4,
      SoundEffects => 5,
      GameEffects => 6,
      GameMedia => 7,
      GameChat => 8,
      Speech => 9,
      Movie => 10,
      Media => 11
   );
   for AudioRenderCategory'Size use 32;
   
   type AudioRenderCategory_Ptr is access AudioRenderCategory;
   
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
