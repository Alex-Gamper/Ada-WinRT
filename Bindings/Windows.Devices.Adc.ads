--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Devices.Adc.Provider;
--------------------------------------------------------------------------------
package Windows.Devices.Adc is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AdcChannelMode is (
      SingleEnded,
      Differential
   );
   for AdcChannelMode use (
      SingleEnded => 0,
      Differential => 1
   );
   for AdcChannelMode'Size use 32;
   
   type AdcChannelMode_Ptr is access AdcChannelMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IAdcController_Interface;
   type AsyncOperationCompletedHandler_IAdcController is access all AsyncOperationCompletedHandler_IAdcController_Interface'Class;
   type AsyncOperationCompletedHandler_IAdcController_Ptr is access all AsyncOperationCompletedHandler_IAdcController;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAdcController_Interface;
   type IAdcController is access all IAdcController_Interface'Class;
   type IAdcController_Ptr is access all IAdcController;
   type IAdcControllerStatics_Interface;
   type IAdcControllerStatics is access all IAdcControllerStatics_Interface'Class;
   type IAdcControllerStatics_Ptr is access all IAdcControllerStatics;
   type IAdcControllerStatics2_Interface;
   type IAdcControllerStatics2 is access all IAdcControllerStatics2_Interface'Class;
   type IAdcControllerStatics2_Ptr is access all IAdcControllerStatics2;
   type IAdcChannel_Interface;
   type IAdcChannel is access all IAdcChannel_Interface'Class;
   type IAdcChannel_Ptr is access all IAdcChannel;
   type IAsyncOperation_IAdcController_Interface;
   type IAsyncOperation_IAdcController is access all IAsyncOperation_IAdcController_Interface'Class;
   type IAsyncOperation_IAdcController_Ptr is access all IAsyncOperation_IAdcController;
   
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
   type IAdcController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChannelCount
   (
      This       : access IAdcController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionInBits
   (
      This       : access IAdcController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinValue
   (
      This       : access IAdcController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxValue
   (
      This       : access IAdcController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelMode
   (
      This       : access IAdcController_Interface
      ; RetVal : access Windows.Devices.Adc.AdcChannelMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ChannelMode
   (
      This       : access IAdcController_Interface
      ; value : Windows.Devices.Adc.AdcChannelMode
   )
   return Windows.HRESULT is abstract;
   
   function IsChannelModeSupported
   (
      This       : access IAdcController_Interface
      ; channelMode : Windows.Devices.Adc.AdcChannelMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function OpenChannel
   (
      This       : access IAdcController_Interface
      ; channelNumber : Windows.Int32
      ; RetVal : access Windows.Devices.Adc.IAdcChannel
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdcController : aliased constant Windows.IID := (712434864, 43158, 16921, (134, 182, 234, 140, 220, 233, 143, 86 ));
   
   ------------------------------------------------------------------------
   type IAdcControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access IAdcControllerStatics_Interface
      ; provider : Windows.Devices.Adc.Provider.IAdcProvider
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdcControllerStatics : aliased constant Windows.IID := (3437858316, 504, 18577, (188, 59, 190, 83, 239, 39, 156, 164 ));
   
   ------------------------------------------------------------------------
   type IAdcControllerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IAdcControllerStatics2_Interface
      ; RetVal : access Windows.Devices.Adc.IAsyncOperation_IAdcController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdcControllerStatics2 : aliased constant Windows.IID := (2730048285, 38779, 20314, (165, 254, 166, 171, 175, 254, 100, 132 ));
   
   ------------------------------------------------------------------------
   type IAdcChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Controller
   (
      This       : access IAdcChannel_Interface
      ; RetVal : access Windows.Devices.Adc.IAdcController
   )
   return Windows.HRESULT is abstract;
   
   function ReadValue
   (
      This       : access IAdcChannel_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReadRatio
   (
      This       : access IAdcChannel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdcChannel : aliased constant Windows.IID := (67892244, 9608, 19030, (171, 239, 115, 162, 96, 172, 198, 10 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAdcController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAdcController_Interface
      ; handler : Windows.Devices.Adc.AsyncOperationCompletedHandler_IAdcController
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAdcController_Interface
      ; RetVal : access Windows.Devices.Adc.AsyncOperationCompletedHandler_IAdcController
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAdcController_Interface
      ; RetVal : access Windows.Devices.Adc.IAdcController
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAdcController : aliased constant Windows.IID := (1765933666, 13769, 22591, (164, 14, 194, 105, 69, 98, 201, 226 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAdcController_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Adc.IAsyncOperation_IAdcController ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAdcController_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdcController_Interface
      ; asyncInfo : Windows.Devices.Adc.IAsyncOperation_IAdcController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAdcController : aliased constant Windows.IID := (3136709768, 8239, 23889, (176, 94, 24, 96, 108, 70, 184, 8 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AdcChannel is Windows.Devices.Adc.IAdcChannel;
   subtype AdcController is Windows.Devices.Adc.IAdcController;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDefaultAsync
   return Windows.Devices.Adc.IAsyncOperation_IAdcController;
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Adc.Provider.IAdcProvider
   )
   return Windows.Address;

end;
