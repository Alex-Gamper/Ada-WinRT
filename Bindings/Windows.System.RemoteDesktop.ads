--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.System.RemoteDesktop is

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
   
   type IInteractiveSessionStatics_Interface;
   type IInteractiveSessionStatics is access all IInteractiveSessionStatics_Interface'Class;
   type IInteractiveSessionStatics_Ptr is access all IInteractiveSessionStatics;
   
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
   type IInteractiveSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsRemote
   (
      This       : access IInteractiveSessionStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInteractiveSessionStatics : aliased constant Windows.IID := (1619543601, 56634, 17782, (156, 141, 232, 2, 118, 24, 189, 206 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_IsRemote
   return Windows.Boolean;

end;
