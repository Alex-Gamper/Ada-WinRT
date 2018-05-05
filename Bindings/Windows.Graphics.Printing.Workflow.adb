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
with Windows.Graphics.Printing.PrintTicket;
with Windows.Storage.Streams;
with Windows.System;
with Windows.ApplicationModel.Activation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Printing.Workflow is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSetupRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession(sender), Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSetupRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession(sender), Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSetupRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession(sender), Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSetupRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowXpsDataAvailableEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession(sender), Windows.Graphics.Printing.Workflow.IPrintWorkflowXpsDataAvailableEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
end;
