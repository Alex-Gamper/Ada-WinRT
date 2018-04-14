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
with Windows.Graphics.Display;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Sensors is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAccelerometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IAccelerometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAccelerometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IAccelerometer
      ; args : Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IAccelerometer(sender), Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAccelerometer_add_Shaken_Interface
      ; sender : Windows.Devices.Sensors.IAccelerometer
      ; args : Windows.Devices.Sensors.IAccelerometerShakenEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IAccelerometer(sender), Windows.Devices.Sensors.IAccelerometerShakenEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IInclinometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IInclinometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IInclinometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IInclinometer
      ; args : Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IInclinometer(sender), Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGyrometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IGyrometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGyrometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IGyrometer
      ; args : Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IGyrometer(sender), Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICompass_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ICompass
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICompass_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.ICompass
      ; args : Windows.Devices.Sensors.ICompassReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.ICompass(sender), Windows.Devices.Sensors.ICompassReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILightSensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ILightSensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILightSensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.ILightSensor
      ; args : Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.ILightSensor(sender), Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOrientationSensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IOrientationSensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IOrientationSensor
      ; args : Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IOrientationSensor(sender), Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Interface
      ; sender : Windows.Devices.Sensors.ISimpleOrientationSensor
      ; args : Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.ISimpleOrientationSensor(sender), Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMagnetometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IMagnetometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMagnetometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IMagnetometer
      ; args : Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IMagnetometer(sender), Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IActivitySensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IActivitySensorReading_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensorReading
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IActivitySensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IActivitySensor
      ; args : Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IActivitySensor(sender), Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBarometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IBarometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBarometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IBarometer
      ; args : Windows.Devices.Sensors.IBarometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IBarometer(sender), Windows.Devices.Sensors.IBarometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPedometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IPedometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPedometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IPedometer
      ; args : Windows.Devices.Sensors.IPedometerReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IPedometer(sender), Windows.Devices.Sensors.IPedometerReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IProximitySensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IProximitySensor
      ; args : Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IProximitySensor(sender), Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAltimeter_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IAltimeter
      ; args : Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sensors.IAltimeter(sender), Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      sensor : Windows.Devices.Sensors.IPedometer
      ; stepGoal : Windows.Int32
   )
   return Windows.Devices.Sensors.ISensorDataThreshold is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.PedometerDataThreshold");
      m_Factory     : Windows.Devices.Sensors.IPedometerDataThresholdFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.ISensorDataThreshold := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerDataThresholdFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(sensor, stepGoal, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      sensor : Windows.Devices.Sensors.IProximitySensor
   )
   return Windows.Devices.Sensors.ISensorDataThreshold is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ProximitySensorDataThreshold");
      m_Factory     : Windows.Devices.Sensors.IProximitySensorDataThresholdFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.ISensorDataThreshold := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximitySensorDataThresholdFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(sensor, RetVal'Access);
         RefCount := m_Factory.Release;
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
   
   function GetDefaultWithAccelerometerReadingType
   (
      readingType : Windows.Devices.Sensors.AccelerometerReadingType
   )
   return Windows.Devices.Sensors.IAccelerometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Accelerometer");
      m_Factory     : IAccelerometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAccelerometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccelerometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultWithAccelerometerReadingType(readingType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IAccelerometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Accelerometer");
      m_Factory     : IAccelerometerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IAccelerometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccelerometerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   (
      readingType : Windows.Devices.Sensors.AccelerometerReadingType
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Accelerometer");
      m_Factory     : IAccelerometerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccelerometerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(readingType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IAccelerometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Accelerometer");
      m_Factory     : IAccelerometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAccelerometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccelerometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IInclinometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Inclinometer");
      m_Factory     : IInclinometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IInclinometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInclinometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Inclinometer");
      m_Factory     : IInclinometerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInclinometerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(readingType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IInclinometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Inclinometer");
      m_Factory     : IInclinometerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IInclinometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInclinometerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultWithSensorReadingType
   (
      sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.Devices.Sensors.IInclinometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Inclinometer");
      m_Factory     : IInclinometerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IInclinometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInclinometerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultWithSensorReadingType(sensorReadingtype, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultForRelativeReadings
   return Windows.Devices.Sensors.IInclinometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Inclinometer");
      m_Factory     : IInclinometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IInclinometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInclinometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultForRelativeReadings(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Gyrometer");
      m_Factory     : IGyrometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGyrometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IGyrometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Gyrometer");
      m_Factory     : IGyrometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IGyrometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGyrometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IGyrometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Gyrometer");
      m_Factory     : IGyrometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IGyrometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGyrometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.ICompass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Compass");
      m_Factory     : ICompassStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.ICompass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompassStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_ICompass
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Compass");
      m_Factory     : ICompassStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompassStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_ICompass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Compass");
      m_Factory     : ICompassStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_ICompass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompassStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.ILightSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.LightSensor");
      m_Factory     : ILightSensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.ILightSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILightSensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_ILightSensor
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.LightSensor");
      m_Factory     : ILightSensorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILightSensorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_ILightSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.LightSensor");
      m_Factory     : ILightSensorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_ILightSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILightSensorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultForRelativeReadings
   return Windows.Devices.Sensors.IOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultForRelativeReadings(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IOrientationSensor
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(readingType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal(readingType, optimizationGoal, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultWithSensorReadingType
   (
      sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.Devices.Sensors.IOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultWithSensorReadingType(sensorReadingtype, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal
   (
      sensorReadingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
   )
   return Windows.Devices.Sensors.IOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.OrientationSensor");
      m_Factory     : IOrientationSensorStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOrientationSensorStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal(sensorReadingType, optimizationGoal, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.ISimpleOrientationSensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.SimpleOrientationSensor");
      m_Factory     : ISimpleOrientationSensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.ISimpleOrientationSensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISimpleOrientationSensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IMagnetometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Magnetometer");
      m_Factory     : IMagnetometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IMagnetometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMagnetometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IMagnetometer
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Magnetometer");
      m_Factory     : IMagnetometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMagnetometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IMagnetometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Magnetometer");
      m_Factory     : IMagnetometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IMagnetometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMagnetometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.Sensors.IAsyncOperation_IActivitySensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ActivitySensor");
      m_Factory     : IActivitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IActivitySensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IActivitySensor
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ActivitySensor");
      m_Factory     : IActivitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IActivitySensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ActivitySensor");
      m_Factory     : IActivitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IActivitySensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSystemHistoryAsync
   (
      fromTime : Windows.Foundation.DateTime
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ActivitySensor");
      m_Factory     : IActivitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemHistoryAsync(fromTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSystemHistoryWithDurationAsync
   (
      fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ActivitySensor");
      m_Factory     : IActivitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemHistoryWithDurationAsync(fromTime, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IBarometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Barometer");
      m_Factory     : IBarometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IBarometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBarometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IBarometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Barometer");
      m_Factory     : IBarometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IBarometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBarometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IBarometer
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Barometer");
      m_Factory     : IBarometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBarometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IPedometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IPedometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.Sensors.IAsyncOperation_IPedometer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAsyncOperation_IPedometer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IPedometer
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSystemHistoryAsync_IPedometer
   (
      fromTime : Windows.Foundation.DateTime
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemHistoryAsync(fromTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSystemHistoryWithDurationAsync_IPedometer
   (
      fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemHistoryWithDurationAsync(fromTime, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetReadingsFromTriggerDetails
   (
      triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
   )
   return Windows.Devices.Sensors.IVectorView_IPedometerReading is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Pedometer");
      m_Factory     : IPedometerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IVectorView_IPedometerReading;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPedometerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetReadingsFromTriggerDetails(triggerDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetReadingsFromTriggerDetails
   (
      triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
   )
   return Windows.Devices.Sensors.IVectorView_IProximitySensorReading is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ProximitySensor");
      m_Factory     : IProximitySensorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IVectorView_IProximitySensorReading;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximitySensorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetReadingsFromTriggerDetails(triggerDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IProximitySensor
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ProximitySensor");
      m_Factory     : IProximitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      sensorId : Windows.String
   )
   return Windows.Devices.Sensors.IProximitySensor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.ProximitySensor");
      m_Factory     : IProximitySensorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IProximitySensor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximitySensorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(sensorId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sensors.IAltimeter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sensors.Altimeter");
      m_Factory     : IAltimeterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sensors.IAltimeter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAltimeterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
