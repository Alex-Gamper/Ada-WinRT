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
with Windows.Devices.PointOfService;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.PointOfService.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_EnableScannerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerEnableScannerRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_DisableScannerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerDisableScannerRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_SetActiveSymbologiesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerSetActiveSymbologiesRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_StartSoftwareTriggerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerStartSoftwareTriggerRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_StopSoftwareTriggerRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerStopSoftwareTriggerRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_GetBarcodeSymbologyAttributesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerGetSymbologyAttributesRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_SetBarcodeSymbologyAttributesRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerSetSymbologyAttributesRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarcodeScannerProviderConnection_add_HideVideoPreviewRequested_Interface
      ; sender : Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection
      ; args : Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.PointOfService.Provider.IBarcodeScannerProviderConnection(sender), Windows.Devices.PointOfService.Provider.IBarcodeScannerHideVideoPreviewRequestEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Devices.PointOfService.Provider.IBarcodeSymbologyAttributesBuilder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.PointOfService.Provider.BarcodeSymbologyAttributesBuilder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.PointOfService.Provider.IBarcodeSymbologyAttributesBuilder) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.PointOfService.Provider.IID_IBarcodeSymbologyAttributesBuilder'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
end;