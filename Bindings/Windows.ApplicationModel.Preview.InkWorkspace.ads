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
limited with Windows.Graphics.Imaging;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Preview.InkWorkspace is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PreviewInkWorkspaceContract is null record;
   pragma Convention (C_Pass_By_Copy , PreviewInkWorkspaceContract);
   
   type PreviewInkWorkspaceContract_Ptr is access PreviewInkWorkspaceContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInkWorkspaceHostedAppManager_Interface;
   type IInkWorkspaceHostedAppManager is access all IInkWorkspaceHostedAppManager_Interface'Class;
   type IInkWorkspaceHostedAppManager_Ptr is access all IInkWorkspaceHostedAppManager;
   type IInkWorkspaceHostedAppManagerStatics_Interface;
   type IInkWorkspaceHostedAppManagerStatics is access all IInkWorkspaceHostedAppManagerStatics_Interface'Class;
   type IInkWorkspaceHostedAppManagerStatics_Ptr is access all IInkWorkspaceHostedAppManagerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IInkWorkspaceHostedAppManager : aliased constant Windows.IID := (4262099344, 24153, 19383, (138, 99, 125, 33, 140, 217, 99, 0 ));
   
   type IInkWorkspaceHostedAppManager_Interface is interface and Windows.IInspectable_Interface;
   
   function SetThumbnailAsync
   (
      This       : access IInkWorkspaceHostedAppManager_Interface
      ; bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInkWorkspaceHostedAppManagerStatics : aliased constant Windows.IID := (3422391493, 41314, 19396, (132, 238, 232, 113, 109, 82, 51, 197 ));
   
   type IInkWorkspaceHostedAppManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentApp
   (
      This       : access IInkWorkspaceHostedAppManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Preview.InkWorkspace.IInkWorkspaceHostedAppManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InkWorkspaceHostedAppManager is Windows.ApplicationModel.Preview.InkWorkspace.IInkWorkspaceHostedAppManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentApp
   return Windows.ApplicationModel.Preview.InkWorkspace.IInkWorkspaceHostedAppManager;
   
end;
