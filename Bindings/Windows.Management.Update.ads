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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.Management.Update is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPreviewBuildsManager_Interface;
   type IPreviewBuildsManager is access all IPreviewBuildsManager_Interface'Class;
   type IPreviewBuildsManager_Ptr is access all IPreviewBuildsManager;
   type IPreviewBuildsState_Interface;
   type IPreviewBuildsState is access all IPreviewBuildsState_Interface'Class;
   type IPreviewBuildsState_Ptr is access all IPreviewBuildsState;
   type IPreviewBuildsManagerStatics_Interface;
   type IPreviewBuildsManagerStatics is access all IPreviewBuildsManagerStatics_Interface'Class;
   type IPreviewBuildsManagerStatics_Ptr is access all IPreviewBuildsManagerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPreviewBuildsManager : aliased constant Windows.IID := (4194819425, 32335, 23031, (124, 159, 222, 249, 5, 28, 95, 98 ));
   
   type IPreviewBuildsManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ArePreviewBuildsAllowed
   (
      This       : access IPreviewBuildsManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ArePreviewBuildsAllowed
   (
      This       : access IPreviewBuildsManager_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentState
   (
      This       : access IPreviewBuildsManager_Interface
      ; RetVal : access Windows.Management.Update.IPreviewBuildsState
   )
   return Windows.HRESULT is abstract;
   
   function SyncAsync
   (
      This       : access IPreviewBuildsManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPreviewBuildsState : aliased constant Windows.IID := (2733805630, 45603, 24419, (117, 70, 62, 142, 172, 7, 10, 46 ));
   
   type IPreviewBuildsState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IPreviewBuildsState_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPreviewBuildsManagerStatics : aliased constant Windows.IID := (1044523143, 45330, 23152, (125, 161, 151, 215, 141, 50, 170, 41 ));
   
   type IPreviewBuildsManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IPreviewBuildsManagerStatics_Interface
      ; RetVal : access Windows.Management.Update.IPreviewBuildsManager
   )
   return Windows.HRESULT is abstract;
   
   function IsSupported
   (
      This       : access IPreviewBuildsManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PreviewBuildsState is Windows.Management.Update.IPreviewBuildsState;
   subtype PreviewBuildsManager is Windows.Management.Update.IPreviewBuildsManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefault
   return Windows.Management.Update.IPreviewBuildsManager;
   
   function IsSupported
   return Windows.Boolean;
   
end;