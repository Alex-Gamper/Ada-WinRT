--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Printers.Extensions is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskConfiguration_add_SaveRequested_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrintTaskConfiguration
      ; args : Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Printers.Extensions.IPrintTaskConfiguration(sender), Windows.Devices.Printers.Extensions.IPrintTaskConfigurationSaveRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DWorkflow_add_PrintRequested_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow
      ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrintRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Printers.Extensions.IPrint3DWorkflow(sender), Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrintRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DWorkflow2_add_PrinterChanged_Interface
      ; sender : Windows.Devices.Printers.Extensions.IPrint3DWorkflow
      ; args : Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrinterChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Printers.Extensions.IPrint3DWorkflow(sender), Windows.Devices.Printers.Extensions.IPrint3DWorkflowPrinterChangedEventArgs(args));
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
   
   function FromDeviceId
   (
      deviceId : Windows.String
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Printers.Extensions.PrintExtensionContext");
      m_Factory     : IPrintExtensionContextStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintExtensionContextStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromDeviceId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
