--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Devices.Background is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeviceUseDetails_Interface;
   type IDeviceUseDetails is access all IDeviceUseDetails_Interface'Class;
   type IDeviceUseDetails_Ptr is access all IDeviceUseDetails;
   type IDeviceServicingDetails_Interface;
   type IDeviceServicingDetails is access all IDeviceServicingDetails_Interface'Class;
   type IDeviceServicingDetails_Ptr is access all IDeviceServicingDetails;
   
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
   type IDeviceUseDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceUseDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access IDeviceUseDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IDeviceUseDetails : aliased constant Windows.IID := (2102808897, 21886, 16724, (185, 148, 228, 247, 161, 31, 179, 35 ));
   
   ------------------------------------------------------------------------
   type IDeviceServicingDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpectedDuration
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IDeviceServicingDetails : aliased constant Windows.IID := (1252781609, 9028, 19140, (133, 39, 74, 142, 246, 144, 86, 69 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeviceUseDetails is Windows.Devices.Background.IDeviceUseDetails;
   subtype DeviceServicingDetails is Windows.Devices.Background.IDeviceServicingDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
