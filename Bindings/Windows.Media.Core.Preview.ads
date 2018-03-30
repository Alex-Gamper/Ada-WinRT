--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Media.Core.Preview is

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
   
   type ISoundLevelBrokerStatics_Interface;
   type ISoundLevelBrokerStatics is access all ISoundLevelBrokerStatics_Interface'Class;
   type ISoundLevelBrokerStatics_Ptr is access all ISoundLevelBrokerStatics;
   
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
   type ISoundLevelBrokerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SoundLevel
   (
      This       : access ISoundLevelBrokerStatics_Interface
      ; RetVal : access Windows.Media.SoundLevel
   )
   return Windows.HRESULT is abstract;
   
   function add_SoundLevelChanged
   (
      This       : access ISoundLevelBrokerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SoundLevelChanged
   (
      This       : access ISoundLevelBrokerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISoundLevelBrokerStatics : aliased constant Windows.IID := (1784887649, 56301, 17996, (160, 154, 51, 65, 47, 92, 170, 63 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_SoundLevel
   return Windows.Media.SoundLevel;
   
   function add_SoundLevelChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_SoundLevelChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;

end;
