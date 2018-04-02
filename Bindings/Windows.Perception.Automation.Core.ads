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
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Perception.Automation.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PerceptionAutomationCoreContract is null record;
   pragma Convention (C_Pass_By_Copy , PerceptionAutomationCoreContract);
   
   type PerceptionAutomationCoreContract_Ptr is access PerceptionAutomationCoreContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICorePerceptionAutomationStatics_Interface;
   type ICorePerceptionAutomationStatics is access all ICorePerceptionAutomationStatics_Interface'Class;
   type ICorePerceptionAutomationStatics_Ptr is access all ICorePerceptionAutomationStatics;
   
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
   type ICorePerceptionAutomationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetActivationFactoryProvider
   (
      This       : access ICorePerceptionAutomationStatics_Interface
      ; provider : Windows.Foundation.IGetActivationFactory
   )
   return Windows.HRESULT is abstract;
   
   IID_ICorePerceptionAutomationStatics : aliased constant Windows.IID := (196101441, 19682, 18723, (154, 118, 129, 135, 236, 197, 145, 18 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   procedure SetActivationFactoryProvider
   (
      provider : Windows.Foundation.IGetActivationFactory
   )
   ;

end;
