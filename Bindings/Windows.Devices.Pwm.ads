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
with Windows.Foundation.Collections;
limited with Windows.Devices.Pwm.Provider;
--------------------------------------------------------------------------------
package Windows.Devices.Pwm is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PwmPulsePolarity is (
      ActiveHigh,
      ActiveLow
   );
   for PwmPulsePolarity use (
      ActiveHigh => 0,
      ActiveLow => 1
   );
   for PwmPulsePolarity'Size use 32;
   
   type PwmPulsePolarity_Ptr is access PwmPulsePolarity;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPwmController_Interface;
   type AsyncOperationCompletedHandler_IPwmController is access all AsyncOperationCompletedHandler_IPwmController_Interface'Class;
   type AsyncOperationCompletedHandler_IPwmController_Ptr is access all AsyncOperationCompletedHandler_IPwmController;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPwmController_Interface;
   type IPwmController is access all IPwmController_Interface'Class;
   type IPwmController_Ptr is access all IPwmController;
   type IPwmControllerStatics_Interface;
   type IPwmControllerStatics is access all IPwmControllerStatics_Interface'Class;
   type IPwmControllerStatics_Ptr is access all IPwmControllerStatics;
   type IPwmControllerStatics2_Interface;
   type IPwmControllerStatics2 is access all IPwmControllerStatics2_Interface'Class;
   type IPwmControllerStatics2_Ptr is access all IPwmControllerStatics2;
   type IPwmControllerStatics3_Interface;
   type IPwmControllerStatics3 is access all IPwmControllerStatics3_Interface'Class;
   type IPwmControllerStatics3_Ptr is access all IPwmControllerStatics3;
   type IPwmPin_Interface;
   type IPwmPin is access all IPwmPin_Interface'Class;
   type IPwmPin_Ptr is access all IPwmPin;
   type IAsyncOperation_IPwmController_Interface;
   type IAsyncOperation_IPwmController is access all IAsyncOperation_IPwmController_Interface'Class;
   type IAsyncOperation_IPwmController_Ptr is access all IAsyncOperation_IPwmController;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPwmController : aliased constant Windows.IID := (3294583941, 53992, 17103, (155, 214, 207, 94, 208, 41, 230, 167 ));
   
   type IPwmController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinCount
   (
      This       : access IPwmController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualFrequency
   (
      This       : access IPwmController_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetDesiredFrequency
   (
      This       : access IPwmController_Interface
      ; desiredFrequency : Windows.Double
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinFrequency
   (
      This       : access IPwmController_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxFrequency
   (
      This       : access IPwmController_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function OpenPin
   (
      This       : access IPwmController_Interface
      ; pinNumber : Windows.Int32
      ; RetVal : access Windows.Devices.Pwm.IPwmPin
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPwmControllerStatics : aliased constant Windows.IID := (1113832865, 35142, 17412, (189, 72, 129, 221, 18, 74, 244, 217 ));
   
   type IPwmControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access IPwmControllerStatics_Interface
      ; provider : Windows.Devices.Pwm.Provider.IPwmProvider
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPwmControllerStatics2 : aliased constant Windows.IID := (1157389087, 61721, 19421, (151, 173, 247, 110, 249, 134, 115, 109 ));
   
   type IPwmControllerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IPwmControllerStatics2_Interface
      ; RetVal : access Windows.Devices.Pwm.IAsyncOperation_IPwmController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPwmControllerStatics3 : aliased constant Windows.IID := (2992117873, 553, 17220, (174, 63, 155, 124, 208, 230, 107, 148 ));
   
   type IPwmControllerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IPwmControllerStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromFriendlyName
   (
      This       : access IPwmControllerStatics3_Interface
      ; friendlyName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IPwmControllerStatics3_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Pwm.IAsyncOperation_IPwmController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPwmPin : aliased constant Windows.IID := (580333000, 50895, 18465, (183, 249, 198, 69, 79, 182, 175, 121 ));
   
   type IPwmPin_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Controller
   (
      This       : access IPwmPin_Interface
      ; RetVal : access Windows.Devices.Pwm.IPwmController
   )
   return Windows.HRESULT is abstract;
   
   function GetActiveDutyCyclePercentage
   (
      This       : access IPwmPin_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetActiveDutyCyclePercentage
   (
      This       : access IPwmPin_Interface
      ; dutyCyclePercentage : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Polarity
   (
      This       : access IPwmPin_Interface
      ; RetVal : access Windows.Devices.Pwm.PwmPulsePolarity
   )
   return Windows.HRESULT is abstract;
   
   function put_Polarity
   (
      This       : access IPwmPin_Interface
      ; value : Windows.Devices.Pwm.PwmPulsePolarity
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPwmPin_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPwmPin_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStarted
   (
      This       : access IPwmPin_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPwmController : aliased constant Windows.IID := (170429761, 7968, 23830, (133, 221, 82, 133, 91, 17, 86, 154 ));
   
   type IAsyncOperation_IPwmController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPwmController_Interface
      ; handler : Windows.Devices.Pwm.AsyncOperationCompletedHandler_IPwmController
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPwmController_Interface
      ; RetVal : access Windows.Devices.Pwm.AsyncOperationCompletedHandler_IPwmController
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPwmController_Interface
      ; RetVal : access Windows.Devices.Pwm.IPwmController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPwmController : aliased constant Windows.IID := (1606848159, 65535, 23891, (186, 33, 156, 51, 239, 86, 178, 64 ));
   
   type AsyncOperationCompletedHandler_IPwmController_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Pwm.IAsyncOperation_IPwmController ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPwmController'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPwmController_Interface
      ; asyncInfo : Windows.Devices.Pwm.IAsyncOperation_IPwmController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PwmPin is Windows.Devices.Pwm.IPwmPin;
   subtype PwmController is Windows.Devices.Pwm.IPwmController;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelectorFromFriendlyName
   (
      friendlyName : Windows.String
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Pwm.IAsyncOperation_IPwmController;
   
   function GetDefaultAsync
   return Windows.Devices.Pwm.IAsyncOperation_IPwmController;
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Pwm.Provider.IPwmProvider
   )
   return Windows.Address;
   
end;
