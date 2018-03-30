--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.Devices.Portable is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ServiceDeviceType is (
      CalendarService,
      ContactsService,
      DeviceStatusService,
      NotesService,
      RingtonesService,
      SmsService,
      TasksService
   );
   for ServiceDeviceType use (
      CalendarService => 0,
      ContactsService => 1,
      DeviceStatusService => 2,
      NotesService => 3,
      RingtonesService => 4,
      SmsService => 5,
      TasksService => 6
   );
   for ServiceDeviceType'Size use 32;
   
   type ServiceDeviceType_Ptr is access ServiceDeviceType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PortableDeviceContract is null record;
   pragma Convention (C_Pass_By_Copy , PortableDeviceContract);
   
   type PortableDeviceContract_Ptr is access PortableDeviceContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStorageDeviceStatics_Interface;
   type IStorageDeviceStatics is access all IStorageDeviceStatics_Interface'Class;
   type IStorageDeviceStatics_Ptr is access all IStorageDeviceStatics;
   type IServiceDeviceStatics_Interface;
   type IServiceDeviceStatics is access all IServiceDeviceStatics_Interface'Class;
   type IServiceDeviceStatics_Ptr is access all IServiceDeviceStatics;
   
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
   type IStorageDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromId
   (
      This       : access IStorageDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IStorageDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageDeviceStatics : aliased constant Windows.IID := (1590576366, 6947, 19922, (134, 82, 188, 22, 79, 0, 49, 40 ));
   
   ------------------------------------------------------------------------
   type IServiceDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IServiceDeviceStatics_Interface
      ; serviceType : Windows.Devices.Portable.ServiceDeviceType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromServiceId
   (
      This       : access IServiceDeviceStatics_Interface
      ; serviceId : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IServiceDeviceStatics : aliased constant Windows.IID := (2827097313, 22983, 18976, (171, 166, 159, 103, 7, 147, 114, 48 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Storage.IStorageFolder;
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelector
   (
      serviceType : Windows.Devices.Portable.ServiceDeviceType
   )
   return Windows.String;
   
   function GetDeviceSelectorFromServiceId
   (
      serviceId : Windows.Guid
   )
   return Windows.String;

end;
