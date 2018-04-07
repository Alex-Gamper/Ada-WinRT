--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Storage.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CachedFileTarget is (
      Local,
      Remote
   );
   for CachedFileTarget use (
      Local => 0,
      Remote => 1
   );
   for CachedFileTarget'Size use 32;
   
   type CachedFileTarget_Ptr is access CachedFileTarget;
   
   type UIStatus is (
      Unavailable,
      Hidden,
      Visible,
      Complete
   );
   for UIStatus use (
      Unavailable => 0,
      Hidden => 1,
      Visible => 2,
      Complete => 3
   );
   for UIStatus'Size use 32;
   
   type UIStatus_Ptr is access UIStatus;
   
   type FileUpdateStatus is (
      Incomplete,
      Complete,
      UserInputNeeded,
      CurrentlyUnavailable,
      Failed,
      CompleteAndRenamed
   );
   for FileUpdateStatus use (
      Incomplete => 0,
      Complete => 1,
      UserInputNeeded => 2,
      CurrentlyUnavailable => 3,
      Failed => 4,
      CompleteAndRenamed => 5
   );
   for FileUpdateStatus'Size use 32;
   
   type FileUpdateStatus_Ptr is access FileUpdateStatus;
   
   type CachedFileOptions is (
      None,
      RequireUpdateOnAccess,
      UseCachedFileWhenOffline,
      DenyAccessWhenOffline
   );
   for CachedFileOptions use (
      None => 0,
      RequireUpdateOnAccess => 1,
      UseCachedFileWhenOffline => 2,
      DenyAccessWhenOffline => 4
   );
   for CachedFileOptions'Size use 32;
   
   type CachedFileOptions_Ptr is access CachedFileOptions;
   
   type ReadActivationMode is (
      NotNeeded,
      BeforeAccess
   );
   for ReadActivationMode use (
      NotNeeded => 0,
      BeforeAccess => 1
   );
   for ReadActivationMode'Size use 32;
   
   type ReadActivationMode_Ptr is access ReadActivationMode;
   
   type WriteActivationMode is (
      ReadOnly,
      NotNeeded,
      AfterWrite
   );
   for WriteActivationMode use (
      ReadOnly => 0,
      NotNeeded => 1,
      AfterWrite => 2
   );
   for WriteActivationMode'Size use 32;
   
   type WriteActivationMode_Ptr is access WriteActivationMode;
   
   type StorageProviderHydrationPolicy is (
      Partial,
      Progressive,
      Full,
      AlwaysFull
   );
   for StorageProviderHydrationPolicy use (
      Partial => 0,
      Progressive => 1,
      Full => 2,
      AlwaysFull => 3
   );
   for StorageProviderHydrationPolicy'Size use 32;
   
   type StorageProviderHydrationPolicy_Ptr is access StorageProviderHydrationPolicy;
   
   type StorageProviderPopulationPolicy is (
      Full,
      AlwaysFull
   );
   for StorageProviderPopulationPolicy use (
      Full => 1,
      AlwaysFull => 2
   );
   for StorageProviderPopulationPolicy'Size use 32;
   
   type StorageProviderPopulationPolicy_Ptr is access StorageProviderPopulationPolicy;
   
   type StorageProviderHydrationPolicyModifier is (
      None,
      ValidationRequired,
      StreamingAllowed
   );
   for StorageProviderHydrationPolicyModifier use (
      None => 0,
      ValidationRequired => 1,
      StreamingAllowed => 2
   );
   for StorageProviderHydrationPolicyModifier'Size use 32;
   
   type StorageProviderHydrationPolicyModifier_Ptr is access StorageProviderHydrationPolicyModifier;
   
   type StorageProviderInSyncPolicy is (
      Default,
      FileCreationTime,
      FileReadOnlyAttribute,
      FileHiddenAttribute,
      FileSystemAttribute,
      DirectoryCreationTime,
      DirectoryReadOnlyAttribute,
      DirectoryHiddenAttribute,
      DirectorySystemAttribute,
      FileLastWriteTime,
      DirectoryLastWriteTime,
      PreserveInsyncForSyncEngine
   );
   for StorageProviderInSyncPolicy use (
      Default => 0,
      FileCreationTime => 1,
      FileReadOnlyAttribute => 2,
      FileHiddenAttribute => 4,
      FileSystemAttribute => 8,
      DirectoryCreationTime => 16,
      DirectoryReadOnlyAttribute => 32,
      DirectoryHiddenAttribute => 64,
      DirectorySystemAttribute => 128,
      FileLastWriteTime => 256,
      DirectoryLastWriteTime => 512,
      PreserveInsyncForSyncEngine => 2147483648
   );
   for StorageProviderInSyncPolicy'Size use 32;
   
   type StorageProviderInSyncPolicy_Ptr is access StorageProviderInSyncPolicy;
   
   type StorageProviderHardlinkPolicy is (
      None,
      Allowed
   );
   for StorageProviderHardlinkPolicy use (
      None => 0,
      Allowed => 1
   );
   for StorageProviderHardlinkPolicy'Size use 32;
   
   type StorageProviderHardlinkPolicy_Ptr is access StorageProviderHardlinkPolicy;
   
   type StorageProviderProtectionMode is (
      Unknown,
      Personal
   );
   for StorageProviderProtectionMode use (
      Unknown => 0,
      Personal => 1
   );
   for StorageProviderProtectionMode'Size use 32;
   
   type StorageProviderProtectionMode_Ptr is access StorageProviderProtectionMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CloudFilesContract is null record;
   pragma Convention (C_Pass_By_Copy , CloudFilesContract);
   
   type CloudFilesContract_Ptr is access CloudFilesContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface;
   type TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested is access all TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface'Class;
   type TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Ptr is access all TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested;
   type TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface;
   type TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested is access all TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface'Class;
   type TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Ptr is access all TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested;
   type AsyncOperationCompletedHandler_FileUpdateStatus_Interface;
   type AsyncOperationCompletedHandler_FileUpdateStatus is access all AsyncOperationCompletedHandler_FileUpdateStatus_Interface'Class;
   type AsyncOperationCompletedHandler_FileUpdateStatus_Ptr is access all AsyncOperationCompletedHandler_FileUpdateStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICachedFileUpdaterUI_Interface;
   type ICachedFileUpdaterUI is access all ICachedFileUpdaterUI_Interface'Class;
   type ICachedFileUpdaterUI_Ptr is access all ICachedFileUpdaterUI;
   type IFileUpdateRequestedEventArgs_Interface;
   type IFileUpdateRequestedEventArgs is access all IFileUpdateRequestedEventArgs_Interface'Class;
   type IFileUpdateRequestedEventArgs_Ptr is access all IFileUpdateRequestedEventArgs;
   type IFileUpdateRequest_Interface;
   type IFileUpdateRequest is access all IFileUpdateRequest_Interface'Class;
   type IFileUpdateRequest_Ptr is access all IFileUpdateRequest;
   type IFileUpdateRequestDeferral_Interface;
   type IFileUpdateRequestDeferral is access all IFileUpdateRequestDeferral_Interface'Class;
   type IFileUpdateRequestDeferral_Ptr is access all IFileUpdateRequestDeferral;
   type ICachedFileUpdaterUI2_Interface;
   type ICachedFileUpdaterUI2 is access all ICachedFileUpdaterUI2_Interface'Class;
   type ICachedFileUpdaterUI2_Ptr is access all ICachedFileUpdaterUI2;
   type IFileUpdateRequest2_Interface;
   type IFileUpdateRequest2 is access all IFileUpdateRequest2_Interface'Class;
   type IFileUpdateRequest2_Ptr is access all IFileUpdateRequest2;
   type ICachedFileUpdaterStatics_Interface;
   type ICachedFileUpdaterStatics is access all ICachedFileUpdaterStatics_Interface'Class;
   type ICachedFileUpdaterStatics_Ptr is access all ICachedFileUpdaterStatics;
   type IStorageProviderPropertyCapabilities_Interface;
   type IStorageProviderPropertyCapabilities is access all IStorageProviderPropertyCapabilities_Interface'Class;
   type IStorageProviderPropertyCapabilities_Ptr is access all IStorageProviderPropertyCapabilities;
   type IStorageProviderItemProperty_Interface;
   type IStorageProviderItemProperty is access all IStorageProviderItemProperty_Interface'Class;
   type IStorageProviderItemProperty_Ptr is access all IStorageProviderItemProperty;
   type IStorageProviderItemPropertiesStatics_Interface;
   type IStorageProviderItemPropertiesStatics is access all IStorageProviderItemPropertiesStatics_Interface'Class;
   type IStorageProviderItemPropertiesStatics_Ptr is access all IStorageProviderItemPropertiesStatics;
   type IStorageProviderItemPropertySource_Interface;
   type IStorageProviderItemPropertySource is access all IStorageProviderItemPropertySource_Interface'Class;
   type IStorageProviderItemPropertySource_Ptr is access all IStorageProviderItemPropertySource;
   type IStorageProviderItemPropertyDefinition_Interface;
   type IStorageProviderItemPropertyDefinition is access all IStorageProviderItemPropertyDefinition_Interface'Class;
   type IStorageProviderItemPropertyDefinition_Ptr is access all IStorageProviderItemPropertyDefinition;
   type IStorageProviderSyncRootInfo_Interface;
   type IStorageProviderSyncRootInfo is access all IStorageProviderSyncRootInfo_Interface'Class;
   type IStorageProviderSyncRootInfo_Ptr is access all IStorageProviderSyncRootInfo;
   type IStorageProviderSyncRootManagerStatics_Interface;
   type IStorageProviderSyncRootManagerStatics is access all IStorageProviderSyncRootManagerStatics_Interface'Class;
   type IStorageProviderSyncRootManagerStatics_Ptr is access all IStorageProviderSyncRootManagerStatics;
   type IAsyncOperation_FileUpdateStatus_Interface;
   type IAsyncOperation_FileUpdateStatus is access all IAsyncOperation_FileUpdateStatus_Interface'Class;
   type IAsyncOperation_FileUpdateStatus_Ptr is access all IAsyncOperation_FileUpdateStatus;
   type IIterator_IStorageProviderItemProperty_Interface;
   type IIterator_IStorageProviderItemProperty is access all IIterator_IStorageProviderItemProperty_Interface'Class;
   type IIterator_IStorageProviderItemProperty_Ptr is access all IIterator_IStorageProviderItemProperty;
   type IIterable_IStorageProviderItemProperty_Interface;
   type IIterable_IStorageProviderItemProperty is access all IIterable_IStorageProviderItemProperty_Interface'Class;
   type IIterable_IStorageProviderItemProperty_Ptr is access all IIterable_IStorageProviderItemProperty;
   type IIterator_IStorageProviderItemPropertyDefinition_Interface;
   type IIterator_IStorageProviderItemPropertyDefinition is access all IIterator_IStorageProviderItemPropertyDefinition_Interface'Class;
   type IIterator_IStorageProviderItemPropertyDefinition_Ptr is access all IIterator_IStorageProviderItemPropertyDefinition;
   type IIterable_IStorageProviderItemPropertyDefinition_Interface;
   type IIterable_IStorageProviderItemPropertyDefinition is access all IIterable_IStorageProviderItemPropertyDefinition_Interface'Class;
   type IIterable_IStorageProviderItemPropertyDefinition_Ptr is access all IIterable_IStorageProviderItemPropertyDefinition;
   type IVectorView_IStorageProviderItemPropertyDefinition_Interface;
   type IVectorView_IStorageProviderItemPropertyDefinition is access all IVectorView_IStorageProviderItemPropertyDefinition_Interface'Class;
   type IVectorView_IStorageProviderItemPropertyDefinition_Ptr is access all IVectorView_IStorageProviderItemPropertyDefinition;
   type IVector_IStorageProviderItemPropertyDefinition_Interface;
   type IVector_IStorageProviderItemPropertyDefinition is access all IVector_IStorageProviderItemPropertyDefinition_Interface'Class;
   type IVector_IStorageProviderItemPropertyDefinition_Ptr is access all IVector_IStorageProviderItemPropertyDefinition;
   type IIterator_IStorageProviderSyncRootInfo_Interface;
   type IIterator_IStorageProviderSyncRootInfo is access all IIterator_IStorageProviderSyncRootInfo_Interface'Class;
   type IIterator_IStorageProviderSyncRootInfo_Ptr is access all IIterator_IStorageProviderSyncRootInfo;
   type IIterable_IStorageProviderSyncRootInfo_Interface;
   type IIterable_IStorageProviderSyncRootInfo is access all IIterable_IStorageProviderSyncRootInfo_Interface'Class;
   type IIterable_IStorageProviderSyncRootInfo_Ptr is access all IIterable_IStorageProviderSyncRootInfo;
   type IVectorView_IStorageProviderSyncRootInfo_Interface;
   type IVectorView_IStorageProviderSyncRootInfo is access all IVectorView_IStorageProviderSyncRootInfo_Interface'Class;
   type IVectorView_IStorageProviderSyncRootInfo_Ptr is access all IVectorView_IStorageProviderSyncRootInfo;
   
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
   type ICachedFileUpdaterUI_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateTarget
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; RetVal : access Windows.Storage.Provider.CachedFileTarget
   )
   return Windows.HRESULT is abstract;
   
   function add_FileUpdateRequested
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; handler : TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FileUpdateRequested
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UIRequested
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; handler : TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UIRequested
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_UIStatus
   (
      This       : access ICachedFileUpdaterUI_Interface
      ; RetVal : access Windows.Storage.Provider.UIStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ICachedFileUpdaterUI : aliased constant Windows.IID := (2658091494, 47858, 19095, (182, 0, 147, 51, 245, 223, 128, 253 ));
   
   ------------------------------------------------------------------------
   type IFileUpdateRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IFileUpdateRequestedEventArgs_Interface
      ; RetVal : access Windows.Storage.Provider.IFileUpdateRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUpdateRequestedEventArgs : aliased constant Windows.IID := (2064290626, 14597, 17293, (170, 239, 120, 174, 38, 95, 141, 210 ));
   
   ------------------------------------------------------------------------
   type IFileUpdateRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentId
   (
      This       : access IFileUpdateRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_File
   (
      This       : access IFileUpdateRequest_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IFileUpdateRequest_Interface
      ; RetVal : access Windows.Storage.Provider.FileUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IFileUpdateRequest_Interface
      ; value : Windows.Storage.Provider.FileUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IFileUpdateRequest_Interface
      ; RetVal : access Windows.Storage.Provider.IFileUpdateRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   function UpdateLocalFile
   (
      This       : access IFileUpdateRequest_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUpdateRequest : aliased constant Windows.IID := (1086858550, 49662, 19859, (167, 146, 30, 115, 107, 199, 8, 55 ));
   
   ------------------------------------------------------------------------
   type IFileUpdateRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IFileUpdateRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUpdateRequestDeferral : aliased constant Windows.IID := (4291746603, 35550, 17573, (187, 0, 22, 76, 78, 114, 241, 58 ));
   
   ------------------------------------------------------------------------
   type ICachedFileUpdaterUI2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UpdateRequest
   (
      This       : access ICachedFileUpdaterUI2_Interface
      ; RetVal : access Windows.Storage.Provider.IFileUpdateRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICachedFileUpdaterUI2_Interface
      ; RetVal : access Windows.Storage.Provider.IFileUpdateRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_ICachedFileUpdaterUI2 : aliased constant Windows.IID := (2287378972, 34457, 17216, (159, 73, 247, 202, 215, 254, 137, 145 ));
   
   ------------------------------------------------------------------------
   type IFileUpdateRequest2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserInputNeededMessage
   (
      This       : access IFileUpdateRequest2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserInputNeededMessage
   (
      This       : access IFileUpdateRequest2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUpdateRequest2 : aliased constant Windows.IID := (2185774664, 48574, 17531, (162, 238, 122, 254, 106, 3, 42, 148 ));
   
   ------------------------------------------------------------------------
   type ICachedFileUpdaterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetUpdateInformation
   (
      This       : access ICachedFileUpdaterStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; contentId : Windows.String
      ; readMode : Windows.Storage.Provider.ReadActivationMode
      ; writeMode : Windows.Storage.Provider.WriteActivationMode
      ; options : Windows.Storage.Provider.CachedFileOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_ICachedFileUpdaterStatics : aliased constant Windows.IID := (2680752416, 31695, 18568, (168, 30, 16, 45, 112, 52, 215, 206 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderPropertyCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function IsPropertySupported
   (
      This       : access IStorageProviderPropertyCapabilities_Interface
      ; propertyCanonicalName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderPropertyCapabilities : aliased constant Windows.IID := (1703751438, 25527, 17767, (172, 249, 81, 171, 227, 1, 221, 165 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderItemProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Id
   (
      This       : access IStorageProviderItemProperty_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IStorageProviderItemProperty_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IconResource
   (
      This       : access IStorageProviderItemProperty_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IconResource
   (
      This       : access IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderItemProperty : aliased constant Windows.IID := (1198306648, 29451, 16776, (183, 181, 99, 183, 22, 237, 71, 109 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderItemPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetAsync
   (
      This       : access IStorageProviderItemPropertiesStatics_Interface
      ; item : Windows.Storage.IStorageItem
      ; itemProperties : Windows.Storage.Provider.IIterable_IStorageProviderItemProperty
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderItemPropertiesStatics : aliased constant Windows.IID := (757865623, 9988, 18217, (143, 169, 126, 107, 142, 21, 140, 47 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderItemPropertySource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemProperties
   (
      This       : access IStorageProviderItemPropertySource_Interface
      ; itemPath : Windows.String
      ; RetVal : access Windows.Storage.Provider.IIterable_IStorageProviderItemProperty -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderItemPropertySource : aliased constant Windows.IID := (2406456382, 63026, 19099, (141, 153, 210, 215, 161, 29, 245, 106 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderItemPropertyDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IStorageProviderItemPropertyDefinition_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayNameResource
   (
      This       : access IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayNameResource
   (
      This       : access IStorageProviderItemPropertyDefinition_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderItemPropertyDefinition : aliased constant Windows.IID := (3316876219, 65311, 17048, (131, 30, 255, 28, 8, 8, 150, 144 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderSyncRootInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Context
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Context
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function put_Path
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; folder : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayNameResource
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayNameResource
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IconResource
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IconResource
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HydrationPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderHydrationPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_HydrationPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderHydrationPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_HydrationPolicyModifier
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderHydrationPolicyModifier
   )
   return Windows.HRESULT is abstract;
   
   function put_HydrationPolicyModifier
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderHydrationPolicyModifier
   )
   return Windows.HRESULT is abstract;
   
   function get_PopulationPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderPopulationPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_PopulationPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderPopulationPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_InSyncPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderInSyncPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_InSyncPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderInSyncPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_HardlinkPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderHardlinkPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_HardlinkPolicy
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderHardlinkPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowSiblingsAsGroup
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowSiblingsAsGroup
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Version
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionMode
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.StorageProviderProtectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectionMode
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.StorageProviderProtectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowPinning
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowPinning
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageProviderItemPropertyDefinitions
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.IVector_IStorageProviderItemPropertyDefinition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RecycleBinUri
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_RecycleBinUri
   (
      This       : access IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderSyncRootInfo : aliased constant Windows.IID := (2081621444, 39417, 16812, (137, 4, 171, 5, 93, 101, 73, 38 ));
   
   ------------------------------------------------------------------------
   type IStorageProviderSyncRootManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Register
   (
      This       : access IStorageProviderSyncRootManagerStatics_Interface
      ; syncRootInformation : Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   function Unregister
   (
      This       : access IStorageProviderSyncRootManagerStatics_Interface
      ; id : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetSyncRootInformationForFolder
   (
      This       : access IStorageProviderSyncRootManagerStatics_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetSyncRootInformationForId
   (
      This       : access IStorageProviderSyncRootManagerStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentSyncRoots
   (
      This       : access IStorageProviderSyncRootManagerStatics_Interface
      ; RetVal : access Windows.Storage.Provider.IVectorView_IStorageProviderSyncRootInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageProviderSyncRootManagerStatics : aliased constant Windows.IID := (1050278847, 36835, 19264, (171, 199, 246, 252, 61, 116, 201, 142 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_FileUpdateStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_FileUpdateStatus_Interface
      ; handler : Windows.Storage.Provider.AsyncOperationCompletedHandler_FileUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_FileUpdateStatus_Interface
      ; RetVal : access Windows.Storage.Provider.AsyncOperationCompletedHandler_FileUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_FileUpdateStatus_Interface
      ; RetVal : access Windows.Storage.Provider.FileUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_FileUpdateStatus : aliased constant Windows.IID := (2400142238, 34768, 21279, (133, 177, 84, 244, 82, 143, 41, 195 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageProviderItemProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.Storage.Provider.IStorageProviderItemProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageProviderItemProperty_Interface
      ; items : Windows.Storage.Provider.IStorageProviderItemProperty_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageProviderItemProperty : aliased constant Windows.IID := (208526814, 6819, 21749, (177, 57, 228, 162, 55, 220, 28, 95 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageProviderItemProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageProviderItemProperty_Interface
      ; RetVal : access Windows.Storage.Provider.IIterator_IStorageProviderItemProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageProviderItemProperty : aliased constant Windows.IID := (1166330729, 60966, 23008, (176, 93, 201, 167, 133, 26, 115, 23 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageProviderItemPropertyDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageProviderItemPropertyDefinition_Interface
      ; items : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageProviderItemPropertyDefinition : aliased constant Windows.IID := (1441100189, 11226, 21023, (140, 96, 105, 33, 217, 11, 11, 177 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageProviderItemPropertyDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Storage.Provider.IIterator_IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageProviderItemPropertyDefinition : aliased constant Windows.IID := (1105693584, 6783, 23979, (161, 35, 125, 95, 80, 17, 223, 235 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStorageProviderItemPropertyDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorageProviderItemPropertyDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorageProviderItemPropertyDefinition_Interface
      ; value : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorageProviderItemPropertyDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStorageProviderItemPropertyDefinition : aliased constant Windows.IID := (846546122, 17884, 23683, (176, 84, 10, 145, 229, 250, 10, 41 ));
   
   ------------------------------------------------------------------------
   type IVector_IStorageProviderItemPropertyDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; RetVal : access Windows.Storage.Provider.IVectorView_IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; value : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; value : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IStorageProviderItemPropertyDefinition_Interface
      ; items : Windows.Storage.Provider.IStorageProviderItemPropertyDefinition_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IStorageProviderItemPropertyDefinition : aliased constant Windows.IID := (4164549887, 34783, 21415, (148, 212, 181, 7, 16, 30, 126, 99 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorageProviderSyncRootInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorageProviderSyncRootInfo_Interface
      ; items : Windows.Storage.Provider.IStorageProviderSyncRootInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorageProviderSyncRootInfo : aliased constant Windows.IID := (4148130505, 27641, 24356, (149, 175, 114, 100, 229, 81, 100, 35 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorageProviderSyncRootInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.Storage.Provider.IIterator_IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorageProviderSyncRootInfo : aliased constant Windows.IID := (1656383904, 63068, 20524, (151, 130, 180, 188, 37, 25, 77, 17 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStorageProviderSyncRootInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorageProviderSyncRootInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorageProviderSyncRootInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorageProviderSyncRootInfo_Interface
      ; value : Windows.Storage.Provider.IStorageProviderSyncRootInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorageProviderSyncRootInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Provider.IStorageProviderSyncRootInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStorageProviderSyncRootInfo : aliased constant Windows.IID := (555033061, 8572, 24563, (191, 158, 141, 196, 214, 117, 23, 127 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface(Callback : access procedure (sender : Windows.Storage.Provider.ICachedFileUpdaterUI ; args : Windows.Storage.Provider.IFileUpdateRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested_Interface
      ; sender : Windows.Storage.Provider.ICachedFileUpdaterUI
      ; args : Windows.Storage.Provider.IFileUpdateRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ICachedFileUpdaterUI_add_FileUpdateRequested : aliased constant Windows.IID := (3981880178, 60371, 21192, (176, 172, 152, 125, 48, 9, 3, 81 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface(Callback : access procedure (sender : Windows.Storage.Provider.ICachedFileUpdaterUI ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested_Interface
      ; sender : Windows.Storage.Provider.ICachedFileUpdaterUI
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ICachedFileUpdaterUI_add_UIRequested : aliased constant Windows.IID := (1174262851, 49337, 22448, (168, 79, 125, 135, 110, 220, 49, 73 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_FileUpdateStatus_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_FileUpdateStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_FileUpdateStatus_Interface
      ; asyncInfo : Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_FileUpdateStatus : aliased constant Windows.IID := (3138935303, 645, 24375, (156, 125, 47, 198, 163, 224, 230, 229 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CachedFileUpdaterUI is Windows.Storage.Provider.ICachedFileUpdaterUI;
   subtype FileUpdateRequestedEventArgs is Windows.Storage.Provider.IFileUpdateRequestedEventArgs;
   subtype FileUpdateRequest is Windows.Storage.Provider.IFileUpdateRequest;
   subtype FileUpdateRequestDeferral is Windows.Storage.Provider.IFileUpdateRequestDeferral;
   subtype StorageProviderItemProperty is Windows.Storage.Provider.IStorageProviderItemProperty;
   
   function CreateStorageProviderItemProperty return Windows.Storage.Provider.IStorageProviderItemProperty;
   
   subtype StorageProviderItemPropertyDefinition is Windows.Storage.Provider.IStorageProviderItemPropertyDefinition;
   
   function CreateStorageProviderItemPropertyDefinition return Windows.Storage.Provider.IStorageProviderItemPropertyDefinition;
   
   subtype StorageProviderSyncRootInfo is Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   
   function CreateStorageProviderSyncRootInfo return Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   procedure SetUpdateInformation
   (
      file : Windows.Storage.IStorageFile
      ; contentId : Windows.String
      ; readMode : Windows.Storage.Provider.ReadActivationMode
      ; writeMode : Windows.Storage.Provider.WriteActivationMode
      ; options : Windows.Storage.Provider.CachedFileOptions
   )
   ;
   
   function SetAsync
   (
      item : Windows.Storage.IStorageItem
      ; itemProperties : Windows.Storage.Provider.IIterable_IStorageProviderItemProperty
   )
   return Windows.Foundation.IAsyncAction;
   
   procedure Register
   (
      syncRootInformation : Windows.Storage.Provider.IStorageProviderSyncRootInfo
   )
   ;
   
   procedure Unregister
   (
      id : Windows.String
   )
   ;
   
   function GetSyncRootInformationForFolder
   (
      folder : Windows.Storage.IStorageFolder
   )
   return Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   
   function GetSyncRootInformationForId
   (
      id : Windows.String
   )
   return Windows.Storage.Provider.IStorageProviderSyncRootInfo;
   
   function GetCurrentSyncRoots
   return Windows.Storage.Provider.IVectorView_IStorageProviderSyncRootInfo;

end;
