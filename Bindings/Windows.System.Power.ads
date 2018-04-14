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
with Windows.Foundation;
package Windows.System.Power is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BatteryStatus is (
      NotPresent,
      Discharging,
      Idle,
      Charging
   );
   for BatteryStatus use (
      NotPresent => 0,
      Discharging => 1,
      Idle => 2,
      Charging => 3
   );
   for BatteryStatus'Size use 32;
   
   type BatteryStatus_Ptr is access BatteryStatus;
   
   type EnergySaverStatus is (
      Disabled,
      Off,
      On
   );
   for EnergySaverStatus use (
      Disabled => 0,
      Off => 1,
      On => 2
   );
   for EnergySaverStatus'Size use 32;
   
   type EnergySaverStatus_Ptr is access EnergySaverStatus;
   
   type PowerSupplyStatus is (
      NotPresent,
      Inadequate,
      Adequate
   );
   for PowerSupplyStatus use (
      NotPresent => 0,
      Inadequate => 1,
      Adequate => 2
   );
   for PowerSupplyStatus'Size use 32;
   
   type PowerSupplyStatus_Ptr is access PowerSupplyStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPowerManagerStatics_Interface;
   type IPowerManagerStatics is access all IPowerManagerStatics_Interface'Class;
   type IPowerManagerStatics_Ptr is access all IPowerManagerStatics;
   type IBackgroundEnergyManagerStatics_Interface;
   type IBackgroundEnergyManagerStatics is access all IBackgroundEnergyManagerStatics_Interface'Class;
   type IBackgroundEnergyManagerStatics_Ptr is access all IBackgroundEnergyManagerStatics;
   type IForegroundEnergyManagerStatics_Interface;
   type IForegroundEnergyManagerStatics is access all IForegroundEnergyManagerStatics_Interface'Class;
   type IForegroundEnergyManagerStatics_Ptr is access all IForegroundEnergyManagerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPowerManagerStatics : aliased constant Windows.IID := (328499805, 25294, 17252, (152, 213, 170, 40, 199, 251, 209, 91 ));
   
   type IPowerManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnergySaverStatus
   (
      This       : access IPowerManagerStatics_Interface
      ; RetVal : access Windows.System.Power.EnergySaverStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_EnergySaverStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnergySaverStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_BatteryStatus
   (
      This       : access IPowerManagerStatics_Interface
      ; RetVal : access Windows.System.Power.BatteryStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_BatteryStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BatteryStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerSupplyStatus
   (
      This       : access IPowerManagerStatics_Interface
      ; RetVal : access Windows.System.Power.PowerSupplyStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_PowerSupplyStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PowerSupplyStatusChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_RemainingChargePercent
   (
      This       : access IPowerManagerStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function add_RemainingChargePercentChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemainingChargePercentChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_RemainingDischargeTime
   (
      This       : access IPowerManagerStatics_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_RemainingDischargeTimeChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemainingDischargeTimeChanged
   (
      This       : access IPowerManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundEnergyManagerStatics : aliased constant Windows.IID := (3004571029, 4480, 17270, (150, 225, 64, 149, 86, 129, 71, 206 ));
   
   type IBackgroundEnergyManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LowUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NearMaxAcceptableUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAcceptableUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExcessiveUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NearTerminationUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TerminationUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_RecentEnergyUsage
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_RecentEnergyUsageLevel
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_RecentEnergyUsageIncreased
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecentEnergyUsageIncreased
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RecentEnergyUsageReturnedToLow
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecentEnergyUsageReturnedToLow
   (
      This       : access IBackgroundEnergyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IForegroundEnergyManagerStatics : aliased constant Windows.IID := (2683857010, 58999, 18452, (154, 32, 83, 55, 202, 115, 43, 152 ));
   
   type IForegroundEnergyManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LowUsageLevel
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NearMaxAcceptableUsageLevel
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAcceptableUsageLevel
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExcessiveUsageLevel
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_RecentEnergyUsage
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_RecentEnergyUsageLevel
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_RecentEnergyUsageIncreased
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecentEnergyUsageIncreased
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RecentEnergyUsageReturnedToLow
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecentEnergyUsageReturnedToLow
   (
      This       : access IForegroundEnergyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_EnergySaverStatus
   return Windows.System.Power.EnergySaverStatus;
   
   function add_EnergySaverStatusChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_EnergySaverStatusChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_BatteryStatus
   return Windows.System.Power.BatteryStatus;
   
   function add_BatteryStatusChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_BatteryStatusChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_PowerSupplyStatus
   return Windows.System.Power.PowerSupplyStatus;
   
   function add_PowerSupplyStatusChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_PowerSupplyStatusChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_RemainingChargePercent
   return Windows.Int32;
   
   function add_RemainingChargePercentChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RemainingChargePercentChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_RemainingDischargeTime
   return Windows.Foundation.TimeSpan;
   
   function add_RemainingDischargeTimeChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RemainingDischargeTimeChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_LowUsageLevel
   return Windows.UInt32;
   
   function get_NearMaxAcceptableUsageLevel
   return Windows.UInt32;
   
   function get_MaxAcceptableUsageLevel
   return Windows.UInt32;
   
   function get_ExcessiveUsageLevel
   return Windows.UInt32;
   
   function get_NearTerminationUsageLevel
   return Windows.UInt32;
   
   function get_TerminationUsageLevel
   return Windows.UInt32;
   
   function get_RecentEnergyUsage
   return Windows.UInt32;
   
   function get_RecentEnergyUsageLevel
   return Windows.UInt32;
   
   function add_RecentEnergyUsageIncreased
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RecentEnergyUsageIncreased
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_RecentEnergyUsageReturnedToLow
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RecentEnergyUsageReturnedToLow
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_LowUsageLevel_ForegroundEnergyManager
   return Windows.UInt32;
   
   function get_NearMaxAcceptableUsageLevel_ForegroundEnergyManager
   return Windows.UInt32;
   
   function get_MaxAcceptableUsageLevel_ForegroundEnergyManager
   return Windows.UInt32;
   
   function get_ExcessiveUsageLevel_ForegroundEnergyManager
   return Windows.UInt32;
   
   function get_RecentEnergyUsage_ForegroundEnergyManager
   return Windows.UInt32;
   
   function get_RecentEnergyUsageLevel_ForegroundEnergyManager
   return Windows.UInt32;
   
   function add_RecentEnergyUsageIncreased_ForegroundEnergyManager
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RecentEnergyUsageIncreased_ForegroundEnergyManager
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_RecentEnergyUsageReturnedToLow_ForegroundEnergyManager
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RecentEnergyUsageReturnedToLow_ForegroundEnergyManager
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
end;
