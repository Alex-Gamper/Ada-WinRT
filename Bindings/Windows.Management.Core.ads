--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Management.Core is

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
   
   type IApplicationDataManagerStatics_Interface;
   type IApplicationDataManagerStatics is access all IApplicationDataManagerStatics_Interface'Class;
   type IApplicationDataManagerStatics_Ptr is access all IApplicationDataManagerStatics;
   type IApplicationDataManager_Interface;
   type IApplicationDataManager is access all IApplicationDataManager_Interface'Class;
   type IApplicationDataManager_Ptr is access all IApplicationDataManager;
   
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
   type IApplicationDataManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForPackageFamily
   (
      This       : access IApplicationDataManagerStatics_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.Storage.IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   IID_IApplicationDataManagerStatics : aliased constant Windows.IID := (504914659, 27022, 18849, (151, 82, 222, 233, 73, 37, 185, 179 ));
   
   ------------------------------------------------------------------------
   type IApplicationDataManager_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IApplicationDataManager : aliased constant Windows.IID := (1959855154, 11929, 16384, (154, 58, 100, 48, 126, 133, 129, 41 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ApplicationDataManager is Windows.Management.Core.IApplicationDataManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateForPackageFamily
   (
      packageFamilyName : Windows.String
   )
   return Windows.Storage.IApplicationData;

end;
