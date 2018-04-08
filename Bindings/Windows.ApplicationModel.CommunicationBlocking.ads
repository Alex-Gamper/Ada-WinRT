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
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.CommunicationBlocking is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CommunicationBlockingContract is null record;
   pragma Convention (C_Pass_By_Copy , CommunicationBlockingContract);
   
   type CommunicationBlockingContract_Ptr is access CommunicationBlockingContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICommunicationBlockingAppManagerStatics_Interface;
   type ICommunicationBlockingAppManagerStatics is access all ICommunicationBlockingAppManagerStatics_Interface'Class;
   type ICommunicationBlockingAppManagerStatics_Ptr is access all ICommunicationBlockingAppManagerStatics;
   type ICommunicationBlockingAppManagerStatics2_Interface;
   type ICommunicationBlockingAppManagerStatics2 is access all ICommunicationBlockingAppManagerStatics2_Interface'Class;
   type ICommunicationBlockingAppManagerStatics2_Ptr is access all ICommunicationBlockingAppManagerStatics2;
   type ICommunicationBlockingAccessManagerStatics_Interface;
   type ICommunicationBlockingAccessManagerStatics is access all ICommunicationBlockingAccessManagerStatics_Interface'Class;
   type ICommunicationBlockingAccessManagerStatics_Ptr is access all ICommunicationBlockingAccessManagerStatics;
   
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
   
   IID_ICommunicationBlockingAppManagerStatics : aliased constant Windows.IID := (2010863852, 5286, 19370, (148, 42, 106, 103, 61, 153, 155, 242 ));
   
   type ICommunicationBlockingAppManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCurrentAppActiveBlockingApp
   (
      This       : access ICommunicationBlockingAppManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowCommunicationBlockingSettingsUI
   (
      This       : access ICommunicationBlockingAppManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICommunicationBlockingAppManagerStatics2 : aliased constant Windows.IID := (346459869, 60808, 17786, (163, 100, 163, 99, 77, 111, 22, 109 ));
   
   type ICommunicationBlockingAppManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestSetAsActiveBlockingAppAsync
   (
      This       : access ICommunicationBlockingAppManagerStatics2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICommunicationBlockingAccessManagerStatics : aliased constant Windows.IID := (479631768, 40234, 23991, (237, 213, 12, 228, 7, 252, 37, 149 ));
   
   type ICommunicationBlockingAccessManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBlockingActive
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsBlockedNumberAsync
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
      ; number : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowBlockNumbersUI
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
      ; phoneNumbers : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowUnblockNumbersUI
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
      ; phoneNumbers : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowBlockedCallsUI
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ShowBlockedMessagesUI
   (
      This       : access ICommunicationBlockingAccessManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RequestSetAsActiveBlockingAppAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_IsCurrentAppActiveBlockingApp
   return Windows.Boolean;
   
   procedure ShowCommunicationBlockingSettingsUI
   ;
   
   function get_IsBlockingActive
   return Windows.Boolean;
   
   function IsBlockedNumberAsync
   (
      number : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function ShowBlockNumbersUI
   (
      phoneNumbers : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Boolean;
   
   function ShowUnblockNumbersUI
   (
      phoneNumbers : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Boolean;
   
   procedure ShowBlockedCallsUI
   ;
   
   procedure ShowBlockedMessagesUI
   ;

end;
