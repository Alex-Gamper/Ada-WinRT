--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Windows.ApplicationModel;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.AppExtensions is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageInstalled_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog(sender), Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdating_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog(sender), Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUpdated_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog(sender), Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageUninstalling_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog(sender), Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppExtensionCatalog_add_PackageStatusChanged_Interface
      ; sender : Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog
      ; args : Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog(sender), Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function Open
   (
      appExtensionName : Windows.String
   )
   return Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.AppExtensions.AppExtensionCatalog");
      m_Factory     : IAppExtensionCatalogStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.AppExtensions.IAppExtensionCatalog;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppExtensionCatalogStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Open(appExtensionName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
