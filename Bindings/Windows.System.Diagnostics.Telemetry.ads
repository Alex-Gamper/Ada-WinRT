--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.System.Diagnostics.Telemetry is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PlatformTelemetryRegistrationStatus is (
      Success,
      SettingsOutOfRange,
      UnknownFailure
   );
   for PlatformTelemetryRegistrationStatus use (
      Success => 0,
      SettingsOutOfRange => 1,
      UnknownFailure => 2
   );
   for PlatformTelemetryRegistrationStatus'Size use 32;
   
   type PlatformTelemetryRegistrationStatus_Ptr is access PlatformTelemetryRegistrationStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPlatformTelemetryRegistrationSettings_Interface;
   type IPlatformTelemetryRegistrationSettings is access all IPlatformTelemetryRegistrationSettings_Interface'Class;
   type IPlatformTelemetryRegistrationSettings_Ptr is access all IPlatformTelemetryRegistrationSettings;
   type IPlatformTelemetryRegistrationResult_Interface;
   type IPlatformTelemetryRegistrationResult is access all IPlatformTelemetryRegistrationResult_Interface'Class;
   type IPlatformTelemetryRegistrationResult_Ptr is access all IPlatformTelemetryRegistrationResult;
   type IPlatformTelemetryClientStatics_Interface;
   type IPlatformTelemetryClientStatics is access all IPlatformTelemetryClientStatics_Interface'Class;
   type IPlatformTelemetryClientStatics_Ptr is access all IPlatformTelemetryClientStatics;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IPlatformTelemetryRegistrationSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StorageSize
   (
      This       : access IPlatformTelemetryRegistrationSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_StorageSize
   (
      This       : access IPlatformTelemetryRegistrationSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UploadQuotaSize
   (
      This       : access IPlatformTelemetryRegistrationSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_UploadQuotaSize
   (
      This       : access IPlatformTelemetryRegistrationSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlatformTelemetryRegistrationSettings : aliased constant Windows.IID := (2174387586, 51737, 16734, (187, 121, 156, 34, 75, 250, 58, 115 ));
   
   ------------------------------------------------------------------------
   type IPlatformTelemetryRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPlatformTelemetryRegistrationResult_Interface
      ; RetVal : access Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlatformTelemetryRegistrationResult : aliased constant Windows.IID := (1300568235, 8850, 18877, (161, 90, 61, 113, 210, 20, 81, 18 ));
   
   ------------------------------------------------------------------------
   type IPlatformTelemetryClientStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Register
   (
      This       : access IPlatformTelemetryClientStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   function RegisterWithSettings
   (
      This       : access IPlatformTelemetryClientStatics_Interface
      ; id : Windows.String
      ; settings : Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
      ; RetVal : access Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlatformTelemetryClientStatics : aliased constant Windows.IID := (2616455773, 54723, 20202, (141, 190, 156, 141, 187, 13, 157, 143 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PlatformTelemetryRegistrationResult is Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult;
   subtype PlatformTelemetryRegistrationSettings is Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings;
   
   function CreatePlatformTelemetryRegistrationSettings return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function Register
   (
      id : Windows.String
   )
   return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult;
   
   function RegisterWithSettings
   (
      id : Windows.String
      ; settings : Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
   )
   return Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult;

end;
