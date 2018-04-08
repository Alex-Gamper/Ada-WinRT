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
with Windows.Web.Http;
with Windows.ApplicationModel.AppService;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Diagnostics.DevicePortal is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection(sender), Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection(sender), Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs(args));
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
   
   
   function GetForAppServiceConnection
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.DevicePortal.DevicePortalConnection");
      m_Factory     : IDevicePortalConnectionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDevicePortalConnectionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForAppServiceConnection(appServiceConnection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
