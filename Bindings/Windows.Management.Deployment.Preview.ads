--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.Management.Deployment.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type DeploymentPreviewContract is null record;
   pragma Convention (C_Pass_By_Copy , DeploymentPreviewContract);
   
   type DeploymentPreviewContract_Ptr is access DeploymentPreviewContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInstalledClassicAppInfo_Interface;
   type IInstalledClassicAppInfo is access all IInstalledClassicAppInfo_Interface'Class;
   type IInstalledClassicAppInfo_Ptr is access all IInstalledClassicAppInfo;
   type IClassicAppManagerStatics_Interface;
   type IClassicAppManagerStatics is access all IClassicAppManagerStatics_Interface'Class;
   type IClassicAppManagerStatics_Ptr is access all IClassicAppManagerStatics;
   
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
   type IInstalledClassicAppInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IInstalledClassicAppInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayVersion
   (
      This       : access IInstalledClassicAppInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IInstalledClassicAppInfo : aliased constant Windows.IID := (175979939, 26064, 16518, (128, 214, 6, 16, 215, 96, 32, 125 ));
   
   ------------------------------------------------------------------------
   type IClassicAppManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindInstalledApp
   (
      This       : access IClassicAppManagerStatics_Interface
      ; appUninstallKey : Windows.String
      ; RetVal : access Windows.Management.Deployment.Preview.IInstalledClassicAppInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IClassicAppManagerStatics : aliased constant Windows.IID := (3808089704, 34860, 20275, (176, 53, 13, 247, 185, 13, 103, 230 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InstalledClassicAppInfo is Windows.Management.Deployment.Preview.IInstalledClassicAppInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindInstalledApp
   (
      appUninstallKey : Windows.String
   )
   return Windows.Management.Deployment.Preview.IInstalledClassicAppInfo;

end;
