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
package body Windows.System.Diagnostics.Telemetry is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreatePlatformTelemetryRegistrationSettings return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.Diagnostics.Telemetry.IID_IPlatformTelemetryRegistrationSettings'Access, RetVal'access);
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
   
   function Register
   (
      id : Windows.String
   )
   return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.Telemetry.PlatformTelemetryClient");
      m_Factory     : IPlatformTelemetryClientStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformTelemetryClientStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Register(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RegisterWithSettings
   (
      id : Windows.String
      ; settings : Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
   )
   return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.Telemetry.PlatformTelemetryClient");
      m_Factory     : IPlatformTelemetryClientStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformTelemetryClientStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterWithSettings(id, settings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
