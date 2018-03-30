--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows; use Windows;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.ApplicationModel;
--------------------------------------------------------------------------------
package Windows.Management.Deployment is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DeploymentProgressState is (
      Queued,
      Processing
   );
   for DeploymentProgressState use (
      Queued => 0,
      Processing => 1
   );
   for DeploymentProgressState'Size use 32;
   
   type DeploymentProgressState_Ptr is access DeploymentProgressState;
   
   type DeploymentOptions is (
      None,
      ForceApplicationShutdown,
      DevelopmentMode,
      InstallAllResources,
      ForceTargetApplicationShutdown,
      RequiredContentGroupOnly
   );
   for DeploymentOptions use (
      None => 0,
      ForceApplicationShutdown => 1,
      DevelopmentMode => 2,
      InstallAllResources => 32,
      ForceTargetApplicationShutdown => 64,
      RequiredContentGroupOnly => 256
   );
   for DeploymentOptions'Size use 32;
   
   type DeploymentOptions_Ptr is access DeploymentOptions;
   
   type RemovalOptions is (
      None,
      PreserveApplicationData
   );
   for RemovalOptions use (
      None => 0,
      PreserveApplicationData => 4096
   );
   for RemovalOptions'Size use 32;
   
   type RemovalOptions_Ptr is access RemovalOptions;
   
   type AddPackageByAppInstallerOptions is (
      None,
      InstallAllResources,
      ForceTargetAppShutdown,
      RequiredContentGroupOnly
   );
   for AddPackageByAppInstallerOptions use (
      None => 0,
      InstallAllResources => 32,
      ForceTargetAppShutdown => 64,
      RequiredContentGroupOnly => 256
   );
   for AddPackageByAppInstallerOptions'Size use 32;
   
   type AddPackageByAppInstallerOptions_Ptr is access AddPackageByAppInstallerOptions;
   
   type PackageTypes is (
      None,
      Main,
      Framework,
      Resource,
      Bundle,
      Xap,
      Optional
   );
   for PackageTypes use (
      None => 0,
      Main => 1,
      Framework => 2,
      Resource => 4,
      Bundle => 8,
      Xap => 16,
      Optional => 32
   );
   for PackageTypes'Size use 32;
   
   type PackageTypes_Ptr is access PackageTypes;
   
   type PackageInstallState is (
      NotInstalled,
      Staged,
      Installed,
      Paused
   );
   for PackageInstallState use (
      NotInstalled => 0,
      Staged => 1,
      Installed => 2,
      Paused => 6
   );
   for PackageInstallState'Size use 32;
   
   type PackageInstallState_Ptr is access PackageInstallState;
   
   type PackageState is (
      Normal,
      LicenseInvalid,
      Modified,
      Tampered
   );
   for PackageState use (
      Normal => 0,
      LicenseInvalid => 1,
      Modified => 2,
      Tampered => 3
   );
   for PackageState'Size use 32;
   
   type PackageState_Ptr is access PackageState;
   
   type PackageStatus is (
      OK,
      LicenseIssue,
      Modified,
      Tampered,
      Disabled
   );
   for PackageStatus use (
      OK => 0,
      LicenseIssue => 1,
      Modified => 2,
      Tampered => 4,
      Disabled => 8
   );
   for PackageStatus'Size use 32;
   
   type PackageStatus_Ptr is access PackageStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type DeploymentProgress is record
      state : Windows.Management.Deployment.DeploymentProgressState;
      percentage : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , DeploymentProgress);
   
   type DeploymentProgress_Ptr is access DeploymentProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPackageVolume_Interface;
   type AsyncOperationCompletedHandler_IPackageVolume is access all AsyncOperationCompletedHandler_IPackageVolume_Interface'Class;
   type AsyncOperationCompletedHandler_IPackageVolume_Ptr is access all AsyncOperationCompletedHandler_IPackageVolume;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeploymentResult_Interface;
   type IDeploymentResult is access all IDeploymentResult_Interface'Class;
   type IDeploymentResult_Ptr is access all IDeploymentResult;
   type IDeploymentResult2_Interface;
   type IDeploymentResult2 is access all IDeploymentResult2_Interface'Class;
   type IDeploymentResult2_Ptr is access all IDeploymentResult2;
   type IPackageUserInformation_Interface;
   type IPackageUserInformation is access all IPackageUserInformation_Interface'Class;
   type IPackageUserInformation_Ptr is access all IPackageUserInformation;
   type IPackageManager_Interface;
   type IPackageManager is access all IPackageManager_Interface'Class;
   type IPackageManager_Ptr is access all IPackageManager;
   type IPackageManager2_Interface;
   type IPackageManager2 is access all IPackageManager2_Interface'Class;
   type IPackageManager2_Ptr is access all IPackageManager2;
   type IPackageManager3_Interface;
   type IPackageManager3 is access all IPackageManager3_Interface'Class;
   type IPackageManager3_Ptr is access all IPackageManager3;
   type IPackageManager4_Interface;
   type IPackageManager4 is access all IPackageManager4_Interface'Class;
   type IPackageManager4_Ptr is access all IPackageManager4;
   type IPackageManager5_Interface;
   type IPackageManager5 is access all IPackageManager5_Interface'Class;
   type IPackageManager5_Ptr is access all IPackageManager5;
   type IPackageManager6_Interface;
   type IPackageManager6 is access all IPackageManager6_Interface'Class;
   type IPackageManager6_Ptr is access all IPackageManager6;
   type IPackageVolume_Interface;
   type IPackageVolume is access all IPackageVolume_Interface'Class;
   type IPackageVolume_Ptr is access all IPackageVolume;
   type IPackageVolume2_Interface;
   type IPackageVolume2 is access all IPackageVolume2_Interface'Class;
   type IPackageVolume2_Ptr is access all IPackageVolume2;
   type IPackageManagerDebugSettings_Interface;
   type IPackageManagerDebugSettings is access all IPackageManagerDebugSettings_Interface'Class;
   type IPackageManagerDebugSettings_Ptr is access all IPackageManagerDebugSettings;
   type IIterator_IPackageUserInformation_Interface;
   type IIterator_IPackageUserInformation is access all IIterator_IPackageUserInformation_Interface'Class;
   type IIterator_IPackageUserInformation_Ptr is access all IIterator_IPackageUserInformation;
   type IIterable_IPackageUserInformation_Interface;
   type IIterable_IPackageUserInformation is access all IIterable_IPackageUserInformation_Interface'Class;
   type IIterable_IPackageUserInformation_Ptr is access all IIterable_IPackageUserInformation;
   type IAsyncOperation_IPackageVolume_Interface;
   type IAsyncOperation_IPackageVolume is access all IAsyncOperation_IPackageVolume_Interface'Class;
   type IAsyncOperation_IPackageVolume_Ptr is access all IAsyncOperation_IPackageVolume;
   type IIterator_IPackageVolume_Interface;
   type IIterator_IPackageVolume is access all IIterator_IPackageVolume_Interface'Class;
   type IIterator_IPackageVolume_Ptr is access all IIterator_IPackageVolume;
   type IIterable_IPackageVolume_Interface;
   type IIterable_IPackageVolume is access all IIterable_IPackageVolume_Interface'Class;
   type IIterable_IPackageVolume_Ptr is access all IIterable_IPackageVolume;
   
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
   type IDeploymentResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorText
   (
      This       : access IDeploymentResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivityId
   (
      This       : access IDeploymentResult_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedErrorCode
   (
      This       : access IDeploymentResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IDeploymentResult : aliased constant Windows.IID := (627292590, 46973, 19487, (138, 123, 32, 230, 173, 81, 94, 243 ));
   
   ------------------------------------------------------------------------
   type IDeploymentResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsRegistered
   (
      This       : access IDeploymentResult2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IDeploymentResult2 : aliased constant Windows.IID := (4228804956, 23041, 19415, (188, 241, 56, 28, 140, 130, 224, 74 ));
   
   ------------------------------------------------------------------------
   type IPackageUserInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserSecurityId
   (
      This       : access IPackageUserInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InstallState
   (
      This       : access IPackageUserInformation_Interface
      ; RetVal : access Windows.Management.Deployment.PackageInstallState
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageUserInformation : aliased constant Windows.IID := (4130878499, 64009, 19644, (144, 85, 21, 202, 39, 94, 46, 126 ));
   
   ------------------------------------------------------------------------
   type IPackageManager_Interface is interface and Windows.IInspectable_Interface;
   
   function AddPackageAsync
   (
      This       : access IPackageManager_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdatePackageAsync
   (
      This       : access IPackageManager_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemovePackageAsync
   (
      This       : access IPackageManager_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StagePackageAsync
   (
      This       : access IPackageManager_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterPackageAsync
   (
      This       : access IPackageManager_Interface
      ; manifestUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackages
   (
      This       : access IPackageManager_Interface
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityId
   (
      This       : access IPackageManager_Interface
      ; userSecurityId : Windows.String
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByNamePublisher
   (
      This       : access IPackageManager_Interface
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdNamePublisher
   (
      This       : access IPackageManager_Interface
      ; userSecurityId : Windows.String
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindUsers
   (
      This       : access IPackageManager_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.Management.Deployment.IIterable_IPackageUserInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPackageState
   (
      This       : access IPackageManager_Interface
      ; packageFullName : Windows.String
      ; packageState : Windows.Management.Deployment.PackageState
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageByPackageFullName
   (
      This       : access IPackageManager_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function CleanupPackageForUserAsync
   (
      This       : access IPackageManager_Interface
      ; packageName : Windows.String
      ; userSecurityId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByPackageFamilyName
   (
      This       : access IPackageManager_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdPackageFamilyName
   (
      This       : access IPackageManager_Interface
      ; userSecurityId : Windows.String
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageByUserSecurityIdPackageFullName
   (
      This       : access IPackageManager_Interface
      ; userSecurityId : Windows.String
      ; packageFullName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager : aliased constant Windows.IID := (2591902565, 24207, 20423, (162, 229, 127, 105, 37, 203, 139, 83 ));
   
   ------------------------------------------------------------------------
   type IPackageManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function RemovePackageWithOptionsAsync
   (
      This       : access IPackageManager2_Interface
      ; packageFullName : Windows.String
      ; removalOptions : Windows.Management.Deployment.RemovalOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StagePackageWithOptionsAsync
   (
      This       : access IPackageManager2_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterPackageByFullNameAsync
   (
      This       : access IPackageManager2_Interface
      ; mainPackageFullName : Windows.String
      ; dependencyPackageFullNames : Windows.Foundation.Collections.IIterable_String
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; userSecurityId : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByNamePublisherWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdNamePublisherWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; userSecurityId : Windows.String
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByPackageFamilyNameWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; packageFamilyName : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdPackageFamilyNameWithPackageTypes
   (
      This       : access IPackageManager2_Interface
      ; userSecurityId : Windows.String
      ; packageFamilyName : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IIterable_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StageUserDataAsync
   (
      This       : access IPackageManager2_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager2 : aliased constant Windows.IID := (4155166861, 2112, 18162, (181, 216, 202, 212, 118, 147, 160, 149 ));
   
   ------------------------------------------------------------------------
   type IPackageManager3_Interface is interface and Windows.IInspectable_Interface;
   
   function AddPackageVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; packageStorePath : Windows.String
      ; RetVal : access Windows.Management.Deployment.IAsyncOperation_IPackageVolume -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddPackageToVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ClearPackageStatus
   (
      This       : access IPackageManager3_Interface
      ; packageFullName : Windows.String
      ; status : Windows.Management.Deployment.PackageStatus
   )
   return Windows.HRESULT is abstract;
   
   function RegisterPackageWithAppDataVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; manifestUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; appDataVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageVolumeByName
   (
      This       : access IPackageManager3_Interface
      ; volumeName : Windows.String
      ; RetVal : access Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageVolumes
   (
      This       : access IPackageManager3_Interface
      ; RetVal : access Windows.Management.Deployment.IIterable_IPackageVolume -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultPackageVolume
   (
      This       : access IPackageManager3_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function MovePackageToVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; packageFullName : Windows.String
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemovePackageVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; volume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultPackageVolume
   (
      This       : access IPackageManager3_Interface
      ; volume : Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function SetPackageStatus
   (
      This       : access IPackageManager3_Interface
      ; packageFullName : Windows.String
      ; status : Windows.Management.Deployment.PackageStatus
   )
   return Windows.HRESULT is abstract;
   
   function SetPackageVolumeOfflineAsync
   (
      This       : access IPackageManager3_Interface
      ; packageVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPackageVolumeOnlineAsync
   (
      This       : access IPackageManager3_Interface
      ; packageVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StagePackageToVolumeAsync
   (
      This       : access IPackageManager3_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StageUserDataWithOptionsAsync
   (
      This       : access IPackageManager3_Interface
      ; packageFullName : Windows.String
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager3 : aliased constant Windows.IID := (3668810056, 14065, 16807, (145, 136, 188, 38, 62, 13, 203, 114 ));
   
   ------------------------------------------------------------------------
   type IPackageManager4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPackageVolumesAsync
   (
      This       : access IPackageManager4_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager4 : aliased constant Windows.IID := (1014077795, 47798, 18111, (143, 247, 218, 71, 25, 35, 10, 230 ));
   
   ------------------------------------------------------------------------
   type IPackageManager5_Interface is interface and Windows.IInspectable_Interface;
   
   function AddPackageToVolumeAndOptionalPackagesAsync
   (
      This       : access IPackageManager5_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; externalPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StagePackageToVolumeAndOptionalPackagesAsync
   (
      This       : access IPackageManager5_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; externalPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterPackageByFamilyNameAndOptionalPackagesAsync
   (
      This       : access IPackageManager5_Interface
      ; mainPackageFamilyName : Windows.String
      ; dependencyPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; appDataVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DebugSettings
   (
      This       : access IPackageManager5_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageManagerDebugSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager5 : aliased constant Windows.IID := (1897869591, 6909, 17171, (151, 140, 155, 182, 225, 184, 100, 167 ));
   
   ------------------------------------------------------------------------
   type IPackageManager6_Interface is interface and Windows.IInspectable_Interface;
   
   function ProvisionPackageForAllUsersAsync
   (
      This       : access IPackageManager6_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddPackageByAppInstallerFileAsync
   (
      This       : access IPackageManager6_Interface
      ; appInstallerFileUri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.Management.Deployment.AddPackageByAppInstallerOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAddPackageByAppInstallerFileAsync
   (
      This       : access IPackageManager6_Interface
      ; appInstallerFileUri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.Management.Deployment.AddPackageByAppInstallerOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddPackageToVolumeAndRelatedSetAsync
   (
      This       : access IPackageManager6_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; options : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; packageUrisToInstall : Windows.Foundation.IIterable_IUriRuntimeClass
      ; relatedPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StagePackageToVolumeAndRelatedSetAsync
   (
      This       : access IPackageManager6_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; options : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; packageUrisToInstall : Windows.Foundation.IIterable_IUriRuntimeClass
      ; relatedPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAddPackageAsync
   (
      This       : access IPackageManager6_Interface
      ; packageUri : Windows.Foundation.IUriRuntimeClass
      ; dependencyPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; deploymentOptions : Windows.Management.Deployment.DeploymentOptions
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; relatedPackageUris : Windows.Foundation.IIterable_IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManager6 : aliased constant Windows.IID := (138930441, 21453, 20047, (131, 46, 87, 209, 128, 246, 228, 71 ));
   
   ------------------------------------------------------------------------
   type IPackageVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsOffline
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSystemVolume
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MountPoint
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageStorePath
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsHardLinks
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function FindPackages
   (
      This       : access IPackageVolume_Interface
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByNamePublisher
   (
      This       : access IPackageVolume_Interface
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByPackageFamilyName
   (
      This       : access IPackageVolume_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesWithPackageTypes
   (
      This       : access IPackageVolume_Interface
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByNamePublisherWithPackagesTypes
   (
      This       : access IPackageVolume_Interface
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByPackageFamilyNameWithPackageTypes
   (
      This       : access IPackageVolume_Interface
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageByPackageFullName
   (
      This       : access IPackageVolume_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityId
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdNamePublisher
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdPackageFamilyName
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdWithPackageTypes
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdNamePublisherWithPackageTypes
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; packageName : Windows.String
      ; packagePublisher : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesByUserSecurityIdPackageFamilyNameWithPackagesTypes
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageTypes : Windows.Management.Deployment.PackageTypes
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackageByUserSecurityIdPackageFullName
   (
      This       : access IPackageVolume_Interface
      ; userSecurityId : Windows.String
      ; packageFullName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IVector_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageVolume : aliased constant Windows.IID := (3475403459, 6720, 17488, (151, 57, 42, 206, 46, 137, 136, 83 ));
   
   ------------------------------------------------------------------------
   type IPackageVolume2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsFullTrustPackageSupported
   (
      This       : access IPackageVolume2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAppxInstallSupported
   (
      This       : access IPackageVolume2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetAvailableSpaceAsync
   (
      This       : access IPackageVolume2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageVolume2 : aliased constant Windows.IID := (1185664814, 40404, 18338, (171, 140, 198, 64, 131, 73, 188, 216 ));
   
   ------------------------------------------------------------------------
   type IPackageManagerDebugSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function SetContentGroupStateAsync
   (
      This       : access IPackageManagerDebugSettings_Interface
      ; package_x : Windows.ApplicationModel.IPackage
      ; contentGroupName : Windows.String
      ; state : Windows.ApplicationModel.PackageContentGroupState
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetContentGroupStateWithPercentageAsync
   (
      This       : access IPackageManagerDebugSettings_Interface
      ; package_x : Windows.ApplicationModel.IPackage
      ; contentGroupName : Windows.String
      ; state : Windows.ApplicationModel.PackageContentGroupState
      ; completionPercentage : Windows.Double
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPackageManagerDebugSettings : aliased constant Windows.IID := (442570371, 43400, 20431, (143, 15, 206, 23, 88, 152, 232, 235 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPackageUserInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPackageUserInformation_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageUserInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPackageUserInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPackageUserInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPackageUserInformation_Interface
      ; items : Windows.Management.Deployment.IPackageUserInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPackageUserInformation : aliased constant Windows.IID := (1969620326, 44611, 22616, (173, 166, 213, 125, 218, 233, 2, 119 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPackageUserInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPackageUserInformation_Interface
      ; RetVal : access Windows.Management.Deployment.IIterator_IPackageUserInformation
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPackageUserInformation : aliased constant Windows.IID := (873679033, 21192, 23383, (158, 145, 241, 159, 42, 5, 177, 136 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPackageVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPackageVolume_Interface
      ; handler : Windows.Management.Deployment.AsyncOperationCompletedHandler_IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPackageVolume_Interface
      ; RetVal : access Windows.Management.Deployment.AsyncOperationCompletedHandler_IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPackageVolume_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPackageVolume : aliased constant Windows.IID := (51768758, 56408, 20940, (165, 25, 68, 144, 26, 210, 207, 21 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPackageVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPackageVolume_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPackageVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPackageVolume_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPackageVolume_Interface
      ; items : Windows.Management.Deployment.IPackageVolume_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPackageVolume : aliased constant Windows.IID := (2832578358, 20072, 24305, (159, 7, 240, 104, 55, 152, 140, 115 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPackageVolume_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPackageVolume_Interface
      ; RetVal : access Windows.Management.Deployment.IIterator_IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPackageVolume : aliased constant Windows.IID := (2786693474, 45411, 22177, (153, 128, 219, 12, 63, 78, 146, 132 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPackageVolume_Interface(Callback : access procedure (asyncInfo : Windows.Management.Deployment.IAsyncOperation_IPackageVolume ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPackageVolume_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPackageVolume_Interface
      ; asyncInfo : Windows.Management.Deployment.IAsyncOperation_IPackageVolume
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPackageVolume : aliased constant Windows.IID := (905896801, 27882, 24156, (142, 218, 52, 179, 242, 45, 244, 231 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeploymentResult is Windows.Management.Deployment.IDeploymentResult;
   subtype PackageUserInformation is Windows.Management.Deployment.IPackageUserInformation;
   subtype PackageVolume is Windows.Management.Deployment.IPackageVolume;
   subtype PackageManagerDebugSettings is Windows.Management.Deployment.IPackageManagerDebugSettings;
   subtype PackageManager is Windows.Management.Deployment.IPackageManager;
   
   function CreatePackageManager return Windows.Management.Deployment.IPackageManager;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
