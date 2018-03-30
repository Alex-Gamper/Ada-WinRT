--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Appointments.AppointmentsProvider is

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
   
   type IAppointmentsProviderLaunchActionVerbsStatics_Interface;
   type IAppointmentsProviderLaunchActionVerbsStatics is access all IAppointmentsProviderLaunchActionVerbsStatics_Interface'Class;
   type IAppointmentsProviderLaunchActionVerbsStatics_Ptr is access all IAppointmentsProviderLaunchActionVerbsStatics;
   type IAppointmentsProviderLaunchActionVerbsStatics2_Interface;
   type IAppointmentsProviderLaunchActionVerbsStatics2 is access all IAppointmentsProviderLaunchActionVerbsStatics2_Interface'Class;
   type IAppointmentsProviderLaunchActionVerbsStatics2_Ptr is access all IAppointmentsProviderLaunchActionVerbsStatics2;
   type IAddAppointmentOperation_Interface;
   type IAddAppointmentOperation is access all IAddAppointmentOperation_Interface'Class;
   type IAddAppointmentOperation_Ptr is access all IAddAppointmentOperation;
   type IReplaceAppointmentOperation_Interface;
   type IReplaceAppointmentOperation is access all IReplaceAppointmentOperation_Interface'Class;
   type IReplaceAppointmentOperation_Ptr is access all IReplaceAppointmentOperation;
   type IRemoveAppointmentOperation_Interface;
   type IRemoveAppointmentOperation is access all IRemoveAppointmentOperation_Interface'Class;
   type IRemoveAppointmentOperation_Ptr is access all IRemoveAppointmentOperation;
   
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
   type IAppointmentsProviderLaunchActionVerbsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AddAppointment
   (
      This       : access IAppointmentsProviderLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReplaceAppointment
   (
      This       : access IAppointmentsProviderLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoveAppointment
   (
      This       : access IAppointmentsProviderLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowTimeFrame
   (
      This       : access IAppointmentsProviderLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentsProviderLaunchActionVerbsStatics : aliased constant Windows.IID := (920369704, 40494, 18886, (142, 247, 58, 183, 165, 220, 200, 184 ));
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderLaunchActionVerbsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShowAppointmentDetails
   (
      This       : access IAppointmentsProviderLaunchActionVerbsStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentsProviderLaunchActionVerbsStatics2 : aliased constant Windows.IID := (4019210660, 44833, 18236, (136, 220, 118, 205, 137, 246, 12, 165 ));
   
   ------------------------------------------------------------------------
   type IAddAppointmentOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentInformation
   (
      This       : access IAddAppointmentOperation_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePackageFamilyName
   (
      This       : access IAddAppointmentOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IAddAppointmentOperation_Interface
      ; itemId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCanceled
   (
      This       : access IAddAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportError
   (
      This       : access IAddAppointmentOperation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DismissUI
   (
      This       : access IAddAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IAddAppointmentOperation : aliased constant Windows.IID := (3964312307, 25101, 19561, (173, 215, 151, 148, 233, 24, 8, 31 ));
   
   ------------------------------------------------------------------------
   type IReplaceAppointmentOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentId
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentInformation
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_InstanceStartDate
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePackageFamilyName
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; itemId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCanceled
   (
      This       : access IReplaceAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportError
   (
      This       : access IReplaceAppointmentOperation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DismissUI
   (
      This       : access IReplaceAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IReplaceAppointmentOperation : aliased constant Windows.IID := (4103093659, 40545, 19938, (167, 50, 38, 135, 192, 125, 29, 232 ));
   
   ------------------------------------------------------------------------
   type IRemoveAppointmentOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentId
   (
      This       : access IRemoveAppointmentOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InstanceStartDate
   (
      This       : access IRemoveAppointmentOperation_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePackageFamilyName
   (
      This       : access IRemoveAppointmentOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IRemoveAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportCanceled
   (
      This       : access IRemoveAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportError
   (
      This       : access IRemoveAppointmentOperation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DismissUI
   (
      This       : access IRemoveAppointmentOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IRemoveAppointmentOperation : aliased constant Windows.IID := (146172602, 65075, 18125, (165, 12, 168, 255, 179, 38, 5, 55 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AddAppointmentOperation is Windows.ApplicationModel.Appointments.AppointmentsProvider.IAddAppointmentOperation;
   subtype ReplaceAppointmentOperation is Windows.ApplicationModel.Appointments.AppointmentsProvider.IReplaceAppointmentOperation;
   subtype RemoveAppointmentOperation is Windows.ApplicationModel.Appointments.AppointmentsProvider.IRemoveAppointmentOperation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_AddAppointment
   return Windows.String;
   
   function get_ReplaceAppointment
   return Windows.String;
   
   function get_RemoveAppointment
   return Windows.String;
   
   function get_ShowTimeFrame
   return Windows.String;
   
   function get_ShowAppointmentDetails
   return Windows.String;

end;
