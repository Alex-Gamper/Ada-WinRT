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
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.AppExtensions is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled is access all TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface'Class;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Ptr is access all TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface'Class;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Ptr is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface'Class;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Ptr is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface'Class;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Ptr is access all TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged is access all TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface'Class;
   type TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Ptr is access all TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppExtensionCatalogStatics_Interface;
   type IAppExtensionCatalogStatics is access all IAppExtensionCatalogStatics_Interface'Class;
   type IAppExtensionCatalogStatics_Ptr is access all IAppExtensionCatalogStatics;
   type IAppExtensionCatalog_Interface;
   type IAppExtensionCatalog is access all IAppExtensionCatalog_Interface'Class;
   type IAppExtensionCatalog_Ptr is access all IAppExtensionCatalog;
   type IAppExtension_Interface;
   type IAppExtension is access all IAppExtension_Interface'Class;
   type IAppExtension_Ptr is access all IAppExtension;
   type IAppExtensionPackageInstalledEventArgs_Interface;
   type IAppExtensionPackageInstalledEventArgs is access all IAppExtensionPackageInstalledEventArgs_Interface'Class;
   type IAppExtensionPackageInstalledEventArgs_Ptr is access all IAppExtensionPackageInstalledEventArgs;
   type IAppExtensionPackageUpdatingEventArgs_Interface;
   type IAppExtensionPackageUpdatingEventArgs is access all IAppExtensionPackageUpdatingEventArgs_Interface'Class;
   type IAppExtensionPackageUpdatingEventArgs_Ptr is access all IAppExtensionPackageUpdatingEventArgs;
   type IAppExtensionPackageUpdatedEventArgs_Interface;
   type IAppExtensionPackageUpdatedEventArgs is access all IAppExtensionPackageUpdatedEventArgs_Interface'Class;
   type IAppExtensionPackageUpdatedEventArgs_Ptr is access all IAppExtensionPackageUpdatedEventArgs;
   type IAppExtensionPackageUninstallingEventArgs_Interface;
   type IAppExtensionPackageUninstallingEventArgs is access all IAppExtensionPackageUninstallingEventArgs_Interface'Class;
   type IAppExtensionPackageUninstallingEventArgs_Ptr is access all IAppExtensionPackageUninstallingEventArgs;
   type IAppExtensionPackageStatusChangedEventArgs_Interface;
   type IAppExtensionPackageStatusChangedEventArgs is access all IAppExtensionPackageStatusChangedEventArgs_Interface'Class;
   type IAppExtensionPackageStatusChangedEventArgs_Ptr is access all IAppExtensionPackageStatusChangedEventArgs;
   type IIterator_IAppExtension_Interface;
   type IIterator_IAppExtension is access all IIterator_IAppExtension_Interface'Class;
   type IIterator_IAppExtension_Ptr is access all IIterator_IAppExtension;
   type IIterable_IAppExtension_Interface;
   type IIterable_IAppExtension is access all IIterable_IAppExtension_Interface'Class;
   type IIterable_IAppExtension_Ptr is access all IIterable_IAppExtension;
   type IVectorView_IAppExtension_Interface;
   type IVectorView_IAppExtension is access all IVectorView_IAppExtension_Interface'Class;
   type IVectorView_IAppExtension_Ptr is access all IVectorView_IAppExtension;
   
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
   type IAppExtensionCatalogStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Open
   (
      This       : access IAppExtensionCatalogStatics_Interface
      ; appExtensionName : Windows.String
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionCatalogStatics : aliased constant Windows.IID := (1010198154, 24344, 20235, (156, 229, 202, 182, 29, 25, 111, 17 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionCatalog_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAsync
   (
      This       : access IAppExtensionCatalog_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestRemovePackageAsync
   (
      This       : access IAppExtensionCatalog_Interface
      ; packageFullName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageInstalled
   (
      This       : access IAppExtensionCatalog_Interface
      ; handler : TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageInstalled
   (
      This       : access IAppExtensionCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageUpdating
   (
      This       : access IAppExtensionCatalog_Interface
      ; handler : TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageUpdating
   (
      This       : access IAppExtensionCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageUpdated
   (
      This       : access IAppExtensionCatalog_Interface
      ; handler : TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageUpdated
   (
      This       : access IAppExtensionCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageUninstalling
   (
      This       : access IAppExtensionCatalog_Interface
      ; handler : TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageUninstalling
   (
      This       : access IAppExtensionCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageStatusChanged
   (
      This       : access IAppExtensionCatalog_Interface
      ; handler : TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageStatusChanged
   (
      This       : access IAppExtensionCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionCatalog : aliased constant Windows.IID := (2542215218, 33830, 19153, (144, 132, 146, 232, 140, 45, 162, 0 ));
   
   ------------------------------------------------------------------------
   type IAppExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_AppInfo
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.ApplicationModel.IAppInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetExtensionPropertiesAsync
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.Foundation.Collections.IAsyncOperation_IPropertySet -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPublicFolderAsync
   (
      This       : access IAppExtension_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtension : aliased constant Windows.IID := (2219872300, 5613, 20399, (147, 234, 34, 55, 187, 248, 203, 214 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionPackageInstalledEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppExtensionName
   (
      This       : access IAppExtensionPackageInstalledEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtensionPackageInstalledEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Extensions
   (
      This       : access IAppExtensionPackageInstalledEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IVectorView_IAppExtension -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionPackageInstalledEventArgs : aliased constant Windows.IID := (971346484, 13137, 19085, (151, 69, 231, 211, 221, 69, 188, 72 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionPackageUpdatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppExtensionName
   (
      This       : access IAppExtensionPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtensionPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionPackageUpdatingEventArgs : aliased constant Windows.IID := (2127926057, 6757, 18432, (167, 0, 179, 33, 0, 158, 48, 106 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionPackageUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppExtensionName
   (
      This       : access IAppExtensionPackageUpdatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtensionPackageUpdatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Extensions
   (
      This       : access IAppExtensionPackageUpdatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IVectorView_IAppExtension -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionPackageUpdatedEventArgs : aliased constant Windows.IID := (981713983, 31102, 17589, (186, 36, 164, 200, 181, 165, 67, 215 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionPackageUninstallingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppExtensionName
   (
      This       : access IAppExtensionPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtensionPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionPackageUninstallingEventArgs : aliased constant Windows.IID := (1626431685, 5918, 16639, (174, 152, 171, 44, 32, 221, 77, 117 ));
   
   ------------------------------------------------------------------------
   type IAppExtensionPackageStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppExtensionName
   (
      This       : access IAppExtensionPackageStatusChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IAppExtensionPackageStatusChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppExtensionPackageStatusChangedEventArgs : aliased constant Windows.IID := (484537395, 4435, 17661, (135, 177, 138, 225, 5, 3, 3, 223 ));
   
   ------------------------------------------------------------------------
   type IIterator_IAppExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppExtension_Interface
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IAppExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppExtension_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppExtension_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppExtension_Interface
      ; items : Windows.ApplicationModel.AppExtensions.IAppExtension_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IAppExtension : aliased constant Windows.IID := (2390805123, 15571, 24476, (131, 228, 132, 52, 124, 165, 73, 140 ));
   
   ------------------------------------------------------------------------
   type IIterable_IAppExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppExtension_Interface
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IIterator_IAppExtension
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IAppExtension : aliased constant Windows.IID := (995091286, 6931, 22987, (171, 31, 196, 102, 122, 116, 117, 107 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IAppExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppExtension_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.AppExtensions.IAppExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppExtension_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppExtension_Interface
      ; value : Windows.ApplicationModel.AppExtensions.IAppExtension
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppExtension_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.AppExtensions.IAppExtension_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IAppExtension : aliased constant Windows.IID := (2488403984, 32411, 24317, (183, 77, 233, 212, 23, 95, 217, 74 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled : aliased constant Windows.IID := (642123094, 40714, 22062, (145, 101, 158, 185, 225, 137, 139, 30 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating : aliased constant Windows.IID := (2448689424, 27343, 20749, (141, 123, 11, 208, 91, 131, 88, 131 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated : aliased constant Windows.IID := (2816531467, 21086, 21169, (177, 217, 45, 91, 75, 82, 148, 165 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling : aliased constant Windows.IID := (1625835496, 11978, 21694, (139, 19, 158, 98, 219, 213, 185, 93 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged : aliased constant Windows.IID := (1638050240, 54203, 22867, (141, 247, 89, 31, 221, 91, 215, 74 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppExtensionCatalog is Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog;
   subtype AppExtension is Windows.ApplicationModel.AppExtensions.IAppExtension;
   subtype AppExtensionPackageInstalledEventArgs is Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs;
   subtype AppExtensionPackageUpdatingEventArgs is Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs;
   subtype AppExtensionPackageUpdatedEventArgs is Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs;
   subtype AppExtensionPackageUninstallingEventArgs is Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs;
   subtype AppExtensionPackageStatusChangedEventArgs is Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function Open
   (
      appExtensionName : Windows.String
   )
   return Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog;

end;
