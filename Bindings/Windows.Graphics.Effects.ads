--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.Graphics.Effects is

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
   
   type IGraphicsEffectSource_Interface;
   type IGraphicsEffectSource is access all IGraphicsEffectSource_Interface'Class;
   type IGraphicsEffectSource_Ptr is access all IGraphicsEffectSource;
   type IGraphicsEffect_Interface;
   type IGraphicsEffect is access all IGraphicsEffect_Interface'Class;
   type IGraphicsEffect_Ptr is access all IGraphicsEffect;
   
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
   type IGraphicsEffectSource_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IGraphicsEffectSource : aliased constant Windows.IID := (764386780, 17209, 20153, (146, 22, 249, 222, 183, 86, 88, 162 ));
   
   ------------------------------------------------------------------------
   type IGraphicsEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGraphicsEffect_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IGraphicsEffect_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IGraphicsEffect : aliased constant Windows.IID := (3411132622, 36838, 17974, (178, 2, 134, 31, 170, 7, 216, 243 ));
   

end;
