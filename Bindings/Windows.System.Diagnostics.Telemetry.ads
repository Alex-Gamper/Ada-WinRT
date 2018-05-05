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
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPlatformTelemetryRegistrationSettings : aliased constant Windows.IID := (2174387586, 51737, 16734, (187, 121, 156, 34, 75, 250, 58, 115 ));
   
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
   
   ------------------------------------------------------------------------
   
   IID_IPlatformTelemetryRegistrationResult : aliased constant Windows.IID := (1300568235, 8850, 18877, (161, 90, 61, 113, 210, 20, 81, 18 ));
   
   type IPlatformTelemetryRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPlatformTelemetryRegistrationResult_Interface
      ; RetVal : access Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlatformTelemetryClientStatics : aliased constant Windows.IID := (2616455773, 54723, 20202, (141, 190, 156, 141, 187, 13, 157, 143 ));
   
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
