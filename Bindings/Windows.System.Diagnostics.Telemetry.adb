--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
      RetVal        : aliased Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.Diagnostics.Telemetry.IID_IPlatformTelemetryRegistrationSettings'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
