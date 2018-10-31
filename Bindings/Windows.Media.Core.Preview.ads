--------------------------------------------------------------------------------
-- <auto-generated>                                                           --
--     This code was generated by a tool.                                     --
--                                                                            --
--     Changes to this file may cause incorrect behavior and will be lost if  --
--     the code is regenerated.                                               --
-- </auto-generated>                                                          --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 1.1.0.0                                                     --
--    Microsoft SDK Version : 10.0.17134.0                                    --
--    Microsoft Windows Release : 1803                                        --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
package Windows.Media.Core.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISoundLevelBrokerStatics_Interface;
   type ISoundLevelBrokerStatics is access all ISoundLevelBrokerStatics_Interface'Class;
   type ISoundLevelBrokerStatics_Ptr is access all ISoundLevelBrokerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISoundLevelBrokerStatics : aliased constant Windows.IID := (1784887649, 56301, 17996, (160, 154, 51, 65, 47, 92, 170, 63 ));
   
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
