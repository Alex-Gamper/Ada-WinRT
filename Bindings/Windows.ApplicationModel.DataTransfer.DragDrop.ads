--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.ApplicationModel.DataTransfer.DragDrop is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DragDropModifiers is (
      None,
      Shift,
      Control,
      Alt,
      LeftButton,
      MiddleButton,
      RightButton
   );
   for DragDropModifiers use (
      None => 0,
      Shift => 1,
      Control => 2,
      Alt => 4,
      LeftButton => 8,
      MiddleButton => 16,
      RightButton => 32
   );
   for DragDropModifiers'Size use 32;
   
   type DragDropModifiers_Ptr is access DragDropModifiers;
   
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
