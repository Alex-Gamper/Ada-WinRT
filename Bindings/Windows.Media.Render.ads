--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
