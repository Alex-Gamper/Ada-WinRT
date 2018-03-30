--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.System.Display is

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
   
   type IDisplayRequest_Interface;
   type IDisplayRequest is access all IDisplayRequest_Interface'Class;
   type IDisplayRequest_Ptr is access all IDisplayRequest;
   
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
   type IDisplayRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestActive
   (
      This       : access IDisplayRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RequestRelease
   (
      This       : access IDisplayRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IDisplayRequest : aliased constant Windows.IID := (3849527364, 62623, 19296, (141, 212, 94, 126, 58, 99, 42, 192 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DisplayRequest is Windows.System.Display.IDisplayRequest;
   
   function CreateDisplayRequest return Windows.System.Display.IDisplayRequest;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
