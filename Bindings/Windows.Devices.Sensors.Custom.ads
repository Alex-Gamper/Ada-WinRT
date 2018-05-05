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
with Windows; use Windows;
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.Devices.Sensors.Custom is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICustomSensor_Interface;
   type AsyncOperationCompletedHandler_ICustomSensor is access all AsyncOperationCompletedHandler_ICustomSensor_Interface'Class;
   type AsyncOperationCompletedHandler_ICustomSensor_Ptr is access all AsyncOperationCompletedHandler_ICustomSensor;
   type TypedEventHandler_ICustomSensor_add_ReadingChanged_Interface;
   type TypedEventHandler_ICustomSensor_add_ReadingChanged is access all TypedEventHandler_ICustomSensor_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_ICustomSensor_add_ReadingChanged_Ptr is access all TypedEventHandler_ICustomSensor_add_ReadingChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICustomSensorStatics_Interface;
   type ICustomSensorStatics is access all ICustomSensorStatics_Interface'Class;
   type ICustomSensorStatics_Ptr is access all ICustomSensorStatics;
   type ICustomSensor_Interface;
   type ICustomSensor is access all ICustomSensor_Interface'Class;
   type ICustomSensor_Ptr is access all ICustomSensor;
   type ICustomSensor2_Interface;
   type ICustomSensor2 is access all ICustomSensor2_Interface'Class;
   type ICustomSensor2_Ptr is access all ICustomSensor2;
   type ICustomSensorReading_Interface;
   type ICustomSensorReading is access all ICustomSensorReading_Interface'Class;
   type ICustomSensorReading_Ptr is access all ICustomSensorReading;
   type ICustomSensorReading2_Interface;
   type ICustomSensorReading2 is access all ICustomSensorReading2_Interface'Class;
   type ICustomSensorReading2_Ptr is access all ICustomSensorReading2;
   type ICustomSensorReadingChangedEventArgs_Interface;
   type ICustomSensorReadingChangedEventArgs is access all ICustomSensorReadingChangedEventArgs_Interface'Class;
   type ICustomSensorReadingChangedEventArgs_Ptr is access all ICustomSensorReadingChangedEventArgs;
   type IAsyncOperation_ICustomSensor_Interface;
   type IAsyncOperation_ICustomSensor is access all IAsyncOperation_ICustomSensor_Interface'Class;
   type IAsyncOperation_ICustomSensor_Ptr is access all IAsyncOperation_ICustomSensor;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensorStatics : aliased constant Windows.IID := (2569032399, 62498, 19581, (131, 107, 231, 220, 116, 167, 18, 75 ));
   
   type ICustomSensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ICustomSensorStatics_Interface
      ; interfaceId : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ICustomSensorStatics_Interface
      ; sensorId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.Custom.IAsyncOperation_ICustomSensor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensor : aliased constant Windows.IID := (2704734637, 16436, 19277, (153, 221, 83, 26, 172, 100, 156, 9 ));
   
   type ICustomSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access ICustomSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.Custom.ICustomSensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access ICustomSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access ICustomSensor_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access ICustomSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access ICustomSensor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access ICustomSensor_Interface
      ; handler : TypedEventHandler_ICustomSensor_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access ICustomSensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensor2 : aliased constant Windows.IID := (551235857, 60504, 19871, (191, 189, 231, 120, 37, 8, 133, 16 ));
   
   type ICustomSensor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access ICustomSensor2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access ICustomSensor2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access ICustomSensor2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensorReading : aliased constant Windows.IID := (1677741901, 17514, 17254, (168, 122, 95, 150, 50, 104, 236, 83 ));
   
   type ICustomSensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ICustomSensorReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ICustomSensorReading_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensorReading2 : aliased constant Windows.IID := (574396650, 49011, 18834, (154, 72, 211, 200, 151, 89, 76, 203 ));
   
   type ICustomSensorReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access ICustomSensorReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomSensorReadingChangedEventArgs : aliased constant Windows.IID := (1797267491, 53245, 19649, (143, 240, 226, 24, 35, 215, 111, 204 ));
   
   type ICustomSensorReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access ICustomSensorReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.Custom.ICustomSensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICustomSensor : aliased constant Windows.IID := (2143272533, 38516, 21731, (162, 105, 156, 170, 130, 14, 210, 60 ));
   
   type IAsyncOperation_ICustomSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICustomSensor_Interface
      ; handler : Windows.Devices.Sensors.Custom.AsyncOperationCompletedHandler_ICustomSensor
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICustomSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.Custom.AsyncOperationCompletedHandler_ICustomSensor
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICustomSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.Custom.ICustomSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICustomSensor : aliased constant Windows.IID := (2156618455, 28162, 22144, (165, 158, 17, 138, 152, 164, 231, 15 ));
   
   type AsyncOperationCompletedHandler_ICustomSensor_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.Custom.IAsyncOperation_ICustomSensor ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICustomSensor'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICustomSensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.Custom.IAsyncOperation_ICustomSensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICustomSensor_add_ReadingChanged : aliased constant Windows.IID := (2861850827, 61580, 22883, (178, 50, 204, 64, 117, 233, 132, 231 ));
   
   type TypedEventHandler_ICustomSensor_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.Custom.ICustomSensor ; args : Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICustomSensor_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICustomSensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.Custom.ICustomSensor
      ; args : Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CustomSensor is Windows.Devices.Sensors.Custom.ICustomSensor;
   subtype CustomSensorReading is Windows.Devices.Sensors.Custom.ICustomSensorReading;
   subtype CustomSensorReadingChangedEventArgs is Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   (
      interfaceId : Windows.Guid
   )
   return Windows.String;
   
   function FromIdAsync
   (
      sensorId : Windows.String
   )
   return Windows.Devices.Sensors.Custom.IAsyncOperation_ICustomSensor;
   
end;
