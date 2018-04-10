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
limited with Windows.System.Power;
--------------------------------------------------------------------------------
package Windows.Devices.Power is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IBattery_add_ReportUpdated_Interface;
   type TypedEventHandler_IBattery_add_ReportUpdated is access all TypedEventHandler_IBattery_add_ReportUpdated_Interface'Class;
   type TypedEventHandler_IBattery_add_ReportUpdated_Ptr is access all TypedEventHandler_IBattery_add_ReportUpdated;
   type AsyncOperationCompletedHandler_IBattery_Interface;
   type AsyncOperationCompletedHandler_IBattery is access all AsyncOperationCompletedHandler_IBattery_Interface'Class;
   type AsyncOperationCompletedHandler_IBattery_Ptr is access all AsyncOperationCompletedHandler_IBattery;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBattery_Interface;
   type IBattery is access all IBattery_Interface'Class;
   type IBattery_Ptr is access all IBattery;
   type IBatteryReport_Interface;
   type IBatteryReport is access all IBatteryReport_Interface'Class;
   type IBatteryReport_Ptr is access all IBatteryReport;
   type IBatteryStatics_Interface;
   type IBatteryStatics is access all IBatteryStatics_Interface'Class;
   type IBatteryStatics_Ptr is access all IBatteryStatics;
   type IAsyncOperation_IBattery_Interface;
   type IAsyncOperation_IBattery is access all IAsyncOperation_IBattery_Interface'Class;
   type IAsyncOperation_IBattery_Ptr is access all IAsyncOperation_IBattery;
   
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
   
   IID_IBattery : aliased constant Windows.IID := (3163115462, 114, 18376, (139, 93, 97, 74, 170, 122, 67, 126 ));
   
   type IBattery_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IBattery_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetReport
   (
      This       : access IBattery_Interface
      ; RetVal : access Windows.Devices.Power.IBatteryReport
   )
   return Windows.HRESULT is abstract;
   
   function add_ReportUpdated
   (
      This       : access IBattery_Interface
      ; handler : TypedEventHandler_IBattery_add_ReportUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReportUpdated
   (
      This       : access IBattery_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBatteryReport : aliased constant Windows.IID := (3380972602, 19987, 16906, (168, 208, 36, 241, 143, 57, 84, 1 ));
   
   type IBatteryReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChargeRateInMilliwatts
   (
      This       : access IBatteryReport_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DesignCapacityInMilliwattHours
   (
      This       : access IBatteryReport_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FullChargeCapacityInMilliwattHours
   (
      This       : access IBatteryReport_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RemainingCapacityInMilliwattHours
   (
      This       : access IBatteryReport_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IBatteryReport_Interface
      ; RetVal : access Windows.System.Power.BatteryStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBatteryStatics : aliased constant Windows.IID := (2043507382, 40542, 17490, (190, 166, 223, 205, 84, 30, 89, 127 ));
   
   type IBatteryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AggregateBattery
   (
      This       : access IBatteryStatics_Interface
      ; RetVal : access Windows.Devices.Power.IBattery
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IBatteryStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Power.IAsyncOperation_IBattery -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IBatteryStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBattery : aliased constant Windows.IID := (3668170070, 5417, 22226, (165, 248, 191, 182, 194, 42, 61, 254 ));
   
   type IAsyncOperation_IBattery_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBattery_Interface
      ; handler : Windows.Devices.Power.AsyncOperationCompletedHandler_IBattery
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBattery_Interface
      ; RetVal : access Windows.Devices.Power.AsyncOperationCompletedHandler_IBattery
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBattery_Interface
      ; RetVal : access Windows.Devices.Power.IBattery
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBattery_add_ReportUpdated : aliased constant Windows.IID := (1296737862, 30335, 22085, (175, 92, 84, 100, 100, 211, 236, 9 ));
   
   type TypedEventHandler_IBattery_add_ReportUpdated_Interface(Callback : access procedure (sender : Windows.Devices.Power.IBattery ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBattery_add_ReportUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBattery_add_ReportUpdated_Interface
      ; sender : Windows.Devices.Power.IBattery
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBattery : aliased constant Windows.IID := (2549621013, 14370, 20603, (130, 230, 39, 119, 179, 54, 233, 142 ));
   
   type AsyncOperationCompletedHandler_IBattery_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Power.IAsyncOperation_IBattery ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBattery'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBattery_Interface
      ; asyncInfo : Windows.Devices.Power.IAsyncOperation_IBattery
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BatteryReport is Windows.Devices.Power.IBatteryReport;
   subtype Battery is Windows.Devices.Power.IBattery;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_AggregateBattery
   return Windows.Devices.Power.IBattery;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Power.IAsyncOperation_IBattery;
   
   function GetDeviceSelector
   return Windows.String;
   

end;
