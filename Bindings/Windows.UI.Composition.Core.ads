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
package Windows.UI.Composition.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICompositorController_add_CommitNeeded_Interface;
   type TypedEventHandler_ICompositorController_add_CommitNeeded is access all TypedEventHandler_ICompositorController_add_CommitNeeded_Interface'Class;
   type TypedEventHandler_ICompositorController_add_CommitNeeded_Ptr is access all TypedEventHandler_ICompositorController_add_CommitNeeded;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICompositorController_Interface;
   type ICompositorController is access all ICompositorController_Interface'Class;
   type ICompositorController_Ptr is access all ICompositorController;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICompositorController : aliased constant Windows.IID := (762704730, 28839, 17301, (186, 45, 206, 240, 177, 131, 153, 249 ));
   
   type ICompositorController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Compositor
   (
      This       : access ICompositorController_Interface
      ; RetVal : access Windows.UI.Composition.ICompositor
   )
   return Windows.HRESULT is abstract;
   
   function Commit
   (
      This       : access ICompositorController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function EnsurePreviousCommitCompletedAsync
   (
      This       : access ICompositorController_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_CommitNeeded
   (
      This       : access ICompositorController_Interface
      ; handler : TypedEventHandler_ICompositorController_add_CommitNeeded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CommitNeeded
   (
      This       : access ICompositorController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompositorController_add_CommitNeeded : aliased constant Windows.IID := (3859579940, 12628, 22126, (154, 162, 238, 196, 159, 206, 0, 74 ));
   
   type TypedEventHandler_ICompositorController_add_CommitNeeded_Interface(Callback : access procedure (sender : Windows.UI.Composition.Core.ICompositorController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompositorController_add_CommitNeeded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompositorController_add_CommitNeeded_Interface
      ; sender : Windows.UI.Composition.Core.ICompositorController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CompositorController is Windows.UI.Composition.Core.ICompositorController;
   function CreateCompositorController return Windows.UI.Composition.Core.ICompositorController;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
