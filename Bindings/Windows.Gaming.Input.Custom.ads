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
limited with Windows.Storage.Streams;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.Gaming.Input.Custom is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GipFirmwareUpdateStatus is (
      Completed,
      UpToDate,
      Failed
   );
   for GipFirmwareUpdateStatus use (
      Completed => 0,
      UpToDate => 1,
      Failed => 2
   );
   for GipFirmwareUpdateStatus'Size use 32;
   
   type GipFirmwareUpdateStatus_Ptr is access GipFirmwareUpdateStatus;
   
   type GipMessageClass is (
      Command,
      LowLatency,
      StandardLatency
   );
   for GipMessageClass use (
      Command => 0,
      LowLatency => 1,
      StandardLatency => 2
   );
   for GipMessageClass'Size use 32;
   
   type GipMessageClass_Ptr is access GipMessageClass;
   
   type XusbDeviceType is (
      Unknown,
      Gamepad
   );
   for XusbDeviceType use (
      Unknown => 0,
      Gamepad => 1
   );
   for XusbDeviceType'Size use 32;
   
   type XusbDeviceType_Ptr is access XusbDeviceType;
   
   type XusbDeviceSubtype is (
      Unknown,
      Gamepad,
      ArcadePad,
      ArcadeStick,
      FlightStick,
      Wheel,
      Guitar,
      GuitarAlternate,
      GuitarBass,
      DrumKit,
      DancePad
   );
   for XusbDeviceSubtype use (
      Unknown => 0,
      Gamepad => 1,
      ArcadePad => 2,
      ArcadeStick => 3,
      FlightStick => 4,
      Wheel => 5,
      Guitar => 6,
      GuitarAlternate => 7,
      GuitarBass => 8,
      DrumKit => 9,
      DancePad => 10
   );
   for XusbDeviceSubtype'Size use 32;
   
   type XusbDeviceSubtype_Ptr is access XusbDeviceSubtype;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GameControllerVersionInfo is record
      Major : Windows.UInt16;
      Minor : Windows.UInt16;
      Build : Windows.UInt16;
      Revision : Windows.UInt16;
   end record;
   pragma Convention (C_Pass_By_Copy , GameControllerVersionInfo);
   
   type GameControllerVersionInfo_Ptr is access GameControllerVersionInfo;
   
   type GipFirmwareUpdateProgress is record
      PercentCompleted : Windows.Double;
      CurrentComponentId : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , GipFirmwareUpdateProgress);
   
   type GipFirmwareUpdateProgress_Ptr is access GipFirmwareUpdateProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameControllerInputSink_Interface;
   type IGameControllerInputSink is access all IGameControllerInputSink_Interface'Class;
   type IGameControllerInputSink_Ptr is access all IGameControllerInputSink;
   type IGipGameControllerInputSink_Interface;
   type IGipGameControllerInputSink is access all IGipGameControllerInputSink_Interface'Class;
   type IGipGameControllerInputSink_Ptr is access all IGipGameControllerInputSink;
   type IHidGameControllerInputSink_Interface;
   type IHidGameControllerInputSink is access all IHidGameControllerInputSink_Interface'Class;
   type IHidGameControllerInputSink_Ptr is access all IHidGameControllerInputSink;
   type IXusbGameControllerInputSink_Interface;
   type IXusbGameControllerInputSink is access all IXusbGameControllerInputSink_Interface'Class;
   type IXusbGameControllerInputSink_Ptr is access all IXusbGameControllerInputSink;
   type IGipFirmwareUpdateResult_Interface;
   type IGipFirmwareUpdateResult is access all IGipFirmwareUpdateResult_Interface'Class;
   type IGipFirmwareUpdateResult_Ptr is access all IGipFirmwareUpdateResult;
   type IGameControllerProvider_Interface;
   type IGameControllerProvider is access all IGameControllerProvider_Interface'Class;
   type IGameControllerProvider_Ptr is access all IGameControllerProvider;
   type IGipGameControllerProvider_Interface;
   type IGipGameControllerProvider is access all IGipGameControllerProvider_Interface'Class;
   type IGipGameControllerProvider_Ptr is access all IGipGameControllerProvider;
   type IHidGameControllerProvider_Interface;
   type IHidGameControllerProvider is access all IHidGameControllerProvider_Interface'Class;
   type IHidGameControllerProvider_Ptr is access all IHidGameControllerProvider;
   type IXusbGameControllerProvider_Interface;
   type IXusbGameControllerProvider is access all IXusbGameControllerProvider_Interface'Class;
   type IXusbGameControllerProvider_Ptr is access all IXusbGameControllerProvider;
   type ICustomGameControllerFactory_Interface;
   type ICustomGameControllerFactory is access all ICustomGameControllerFactory_Interface'Class;
   type ICustomGameControllerFactory_Ptr is access all ICustomGameControllerFactory;
   type IGameControllerFactoryManagerStatics_Interface;
   type IGameControllerFactoryManagerStatics is access all IGameControllerFactoryManagerStatics_Interface'Class;
   type IGameControllerFactoryManagerStatics_Ptr is access all IGameControllerFactoryManagerStatics;
   type IGameControllerFactoryManagerStatics2_Interface;
   type IGameControllerFactoryManagerStatics2 is access all IGameControllerFactoryManagerStatics2_Interface'Class;
   type IGameControllerFactoryManagerStatics2_Ptr is access all IGameControllerFactoryManagerStatics2;
   
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
   
   IID_IGameControllerInputSink : aliased constant Windows.IID := (536279330, 50752, 19576, (168, 32, 154, 113, 92, 85, 139, 203 ));
   
   type IGameControllerInputSink_Interface is interface and Windows.IInspectable_Interface;
   
   function OnInputResumed
   (
      This       : access IGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function OnInputSuspended
   (
      This       : access IGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGipGameControllerInputSink : aliased constant Windows.IID := (2718993087, 2545, 17340, (161, 64, 128, 248, 153, 236, 54, 251 ));
   
   type IGipGameControllerInputSink_Interface is interface and Windows.IInspectable_Interface;
   
   function OnKeyReceived
   (
      This       : access IGipGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
      ; keyCode : Windows.UInt8
      ; isPressed : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function OnMessageReceived
   (
      This       : access IGipGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
      ; messageClass : Windows.Gaming.Input.Custom.GipMessageClass
      ; messageId : Windows.UInt8
      ; sequenceId : Windows.UInt8
      ; messageBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHidGameControllerInputSink : aliased constant Windows.IID := (4149527330, 6189, 16612, (161, 38, 252, 238, 79, 250, 30, 49 ));
   
   type IHidGameControllerInputSink_Interface is interface and Windows.IInspectable_Interface;
   
   function OnInputReportReceived
   (
      This       : access IHidGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
      ; reportId : Windows.UInt8
      ; reportBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXusbGameControllerInputSink : aliased constant Windows.IID := (2997624213, 28363, 17075, (138, 171, 2, 84, 1, 202, 71, 18 ));
   
   type IXusbGameControllerInputSink_Interface is interface and Windows.IInspectable_Interface;
   
   function OnInputReceived
   (
      This       : access IXusbGameControllerInputSink_Interface
      ; timestamp : Windows.UInt64
      ; reportId : Windows.UInt8
      ; inputBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGipFirmwareUpdateResult : aliased constant Windows.IID := (1803111730, 34131, 17042, (142, 3, 225, 102, 81, 162, 248, 188 ));
   
   type IGipFirmwareUpdateResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedErrorCode
   (
      This       : access IGipFirmwareUpdateResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FinalComponentId
   (
      This       : access IGipFirmwareUpdateResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IGipFirmwareUpdateResult_Interface
      ; RetVal : access Windows.Gaming.Input.Custom.GipFirmwareUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameControllerProvider : aliased constant Windows.IID := (3872864642, 10646, 17753, (177, 108, 62, 87, 212, 110, 88, 214 ));
   
   type IGameControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FirmwareVersionInfo
   (
      This       : access IGameControllerProvider_Interface
      ; RetVal : access Windows.Gaming.Input.Custom.GameControllerVersionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareProductId
   (
      This       : access IGameControllerProvider_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareVendorId
   (
      This       : access IGameControllerProvider_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareVersionInfo
   (
      This       : access IGameControllerProvider_Interface
      ; RetVal : access Windows.Gaming.Input.Custom.GameControllerVersionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConnected
   (
      This       : access IGameControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGipGameControllerProvider : aliased constant Windows.IID := (3687783961, 6901, 17832, (191, 2, 160, 238, 80, 200, 35, 252 ));
   
   type IGipGameControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function SendMessage
   (
      This       : access IGipGameControllerProvider_Interface
      ; messageClass : Windows.Gaming.Input.Custom.GipMessageClass
      ; messageId : Windows.UInt8
      ; messageBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function SendReceiveMessage
   (
      This       : access IGipGameControllerProvider_Interface
      ; messageClass : Windows.Gaming.Input.Custom.GipMessageClass
      ; messageId : Windows.UInt8
      ; requestMessageBuffer : Windows.UInt8_Ptr
      ; responseMessageBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function UpdateFirmwareAsync
   (
      This       : access IGipGameControllerProvider_Interface
      ; firmwareImage : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHidGameControllerProvider : aliased constant Windows.IID := (2513320692, 44016, 19304, (160, 129, 59, 125, 231, 63, 240, 231 ));
   
   type IHidGameControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UsageId
   (
      This       : access IHidGameControllerProvider_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidGameControllerProvider_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function GetFeatureReport
   (
      This       : access IHidGameControllerProvider_Interface
      ; reportId : Windows.UInt8
      ; reportBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function SendFeatureReport
   (
      This       : access IHidGameControllerProvider_Interface
      ; reportId : Windows.UInt8
      ; reportBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function SendOutputReport
   (
      This       : access IHidGameControllerProvider_Interface
      ; reportId : Windows.UInt8
      ; reportBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXusbGameControllerProvider : aliased constant Windows.IID := (1848209899, 3835, 18612, (128, 139, 131, 118, 67, 178, 242, 22 ));
   
   type IXusbGameControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function SetVibration
   (
      This       : access IXusbGameControllerProvider_Interface
      ; lowFrequencyMotorSpeed : Windows.Double
      ; highFrequencyMotorSpeed : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomGameControllerFactory : aliased constant Windows.IID := (1772138078, 30094, 19646, (172, 230, 98, 21, 95, 233, 18, 111 ));
   
   type ICustomGameControllerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateGameController
   (
      This       : access ICustomGameControllerFactory_Interface
      ; provider : Windows.Gaming.Input.Custom.IGameControllerProvider
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function OnGameControllerAdded
   (
      This       : access ICustomGameControllerFactory_Interface
      ; value : Windows.Gaming.Input.IGameController
   )
   return Windows.HRESULT is abstract;
   
   function OnGameControllerRemoved
   (
      This       : access ICustomGameControllerFactory_Interface
      ; value : Windows.Gaming.Input.IGameController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameControllerFactoryManagerStatics : aliased constant Windows.IID := (919299811, 53409, 18822, (162, 76, 64, 177, 55, 222, 186, 158 ));
   
   type IGameControllerFactoryManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterCustomFactoryForGipInterface
   (
      This       : access IGameControllerFactoryManagerStatics_Interface
      ; factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; interfaceId : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RegisterCustomFactoryForHardwareId
   (
      This       : access IGameControllerFactoryManagerStatics_Interface
      ; factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; hardwareVendorId : Windows.UInt16
      ; hardwareProductId : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function RegisterCustomFactoryForXusbType
   (
      This       : access IGameControllerFactoryManagerStatics_Interface
      ; factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; xusbType : Windows.Gaming.Input.Custom.XusbDeviceType
      ; xusbSubtype : Windows.Gaming.Input.Custom.XusbDeviceSubtype
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameControllerFactoryManagerStatics2 : aliased constant Windows.IID := (3939391044, 6623, 16661, (179, 42, 39, 147, 226, 174, 163, 187 ));
   
   type IGameControllerFactoryManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetFactoryControllerFromGameController
   (
      This       : access IGameControllerFactoryManagerStatics2_Interface
      ; factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IGameController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GipFirmwareUpdateResult is Windows.Gaming.Input.Custom.IGipFirmwareUpdateResult;
   subtype GipGameControllerProvider is Windows.Gaming.Input.Custom.IGipGameControllerProvider;
   subtype HidGameControllerProvider is Windows.Gaming.Input.Custom.IHidGameControllerProvider;
   subtype XusbGameControllerProvider is Windows.Gaming.Input.Custom.IXusbGameControllerProvider;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   procedure RegisterCustomFactoryForGipInterface
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; interfaceId : Windows.Guid
   )
   ;
   
   procedure RegisterCustomFactoryForHardwareId
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; hardwareVendorId : Windows.UInt16
      ; hardwareProductId : Windows.UInt16
   )
   ;
   
   procedure RegisterCustomFactoryForXusbType
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; xusbType : Windows.Gaming.Input.Custom.XusbDeviceType
      ; xusbSubtype : Windows.Gaming.Input.Custom.XusbDeviceSubtype
   )
   ;
   
   function TryGetFactoryControllerFromGameController
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IGameController;
   

end;
