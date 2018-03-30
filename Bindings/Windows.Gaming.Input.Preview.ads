--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Gaming.Input.Custom;
--------------------------------------------------------------------------------
package Windows.Gaming.Input.Preview is

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
   
   type IGameControllerProviderInfoStatics_Interface;
   type IGameControllerProviderInfoStatics is access all IGameControllerProviderInfoStatics_Interface'Class;
   type IGameControllerProviderInfoStatics_Ptr is access all IGameControllerProviderInfoStatics;
   
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
   type IGameControllerProviderInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetParentProviderId
   (
      This       : access IGameControllerProviderInfoStatics_Interface
      ; provider : Windows.Gaming.Input.Custom.IGameControllerProvider
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetProviderId
   (
      This       : access IGameControllerProviderInfoStatics_Interface
      ; provider : Windows.Gaming.Input.Custom.IGameControllerProvider
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameControllerProviderInfoStatics : aliased constant Windows.IID := (199354053, 55741, 17646, (131, 98, 72, 139, 46, 70, 75, 251 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetParentProviderId
   (
      provider : Windows.Gaming.Input.Custom.IGameControllerProvider
   )
   return Windows.String;
   
   function GetProviderId
   (
      provider : Windows.Gaming.Input.Custom.IGameControllerProvider
   )
   return Windows.String;

end;
