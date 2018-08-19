--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Windows.Foundation.Collections;
package Windows.Security.Authentication.Identity is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IEnterpriseKeyCredentialRegistrationInfo_Interface;
   type IEnterpriseKeyCredentialRegistrationInfo is access all IEnterpriseKeyCredentialRegistrationInfo_Interface'Class;
   type IEnterpriseKeyCredentialRegistrationInfo_Ptr is access all IEnterpriseKeyCredentialRegistrationInfo;
   type IEnterpriseKeyCredentialRegistrationManagerStatics_Interface;
   type IEnterpriseKeyCredentialRegistrationManagerStatics is access all IEnterpriseKeyCredentialRegistrationManagerStatics_Interface'Class;
   type IEnterpriseKeyCredentialRegistrationManagerStatics_Ptr is access all IEnterpriseKeyCredentialRegistrationManagerStatics;
   type IEnterpriseKeyCredentialRegistrationManager_Interface;
   type IEnterpriseKeyCredentialRegistrationManager is access all IEnterpriseKeyCredentialRegistrationManager_Interface'Class;
   type IEnterpriseKeyCredentialRegistrationManager_Ptr is access all IEnterpriseKeyCredentialRegistrationManager;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IEnterpriseKeyCredentialRegistrationInfo : aliased constant Windows.IID := (942807756, 26411, 18467, (182, 3, 107, 60, 117, 61, 175, 151 ));
   
   type IEnterpriseKeyCredentialRegistrationInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TenantId
   (
      This       : access IEnterpriseKeyCredentialRegistrationInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TenantName
   (
      This       : access IEnterpriseKeyCredentialRegistrationInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IEnterpriseKeyCredentialRegistrationInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyId
   (
      This       : access IEnterpriseKeyCredentialRegistrationInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyName
   (
      This       : access IEnterpriseKeyCredentialRegistrationInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEnterpriseKeyCredentialRegistrationManagerStatics : aliased constant Windows.IID := (2008571550, 44276, 19392, (186, 194, 64, 187, 70, 239, 187, 63 ));
   
   type IEnterpriseKeyCredentialRegistrationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IEnterpriseKeyCredentialRegistrationManagerStatics_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.IEnterpriseKeyCredentialRegistrationManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEnterpriseKeyCredentialRegistrationManager : aliased constant Windows.IID := (2213789247, 41567, 19642, (187, 142, 189, 195, 45, 3, 194, 151 ));
   
   type IEnterpriseKeyCredentialRegistrationManager_Interface is interface and Windows.IInspectable_Interface;
   
   function GetRegistrationsAsync
   (
      This       : access IEnterpriseKeyCredentialRegistrationManager_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EnterpriseKeyCredentialRegistrationInfo is Windows.Security.Authentication.Identity.IEnterpriseKeyCredentialRegistrationInfo;
   subtype EnterpriseKeyCredentialRegistrationManager is Windows.Security.Authentication.Identity.IEnterpriseKeyCredentialRegistrationManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Current
   return Windows.Security.Authentication.Identity.IEnterpriseKeyCredentialRegistrationManager;
   
end;
