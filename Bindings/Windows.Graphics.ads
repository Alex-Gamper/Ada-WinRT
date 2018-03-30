--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.Graphics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PointInt32 is record
      X : Windows.Int32;
      Y : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , PointInt32);
   
   type PointInt32_Ptr is access PointInt32;
   
   type SizeInt32 is record
      Width : Windows.Int32;
      Height : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , SizeInt32);
   
   type SizeInt32_Ptr is access SizeInt32;
   
   type RectInt32 is record
      X : Windows.Int32;
      Y : Windows.Int32;
      Width : Windows.Int32;
      Height : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , RectInt32);
   
   type RectInt32_Ptr is access RectInt32;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   

end;
