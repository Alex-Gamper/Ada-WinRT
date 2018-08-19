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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Devices.Geolocation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Services.Maps.OfflineMaps is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface
      ; sender : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.Maps.OfflineMaps.IOfflineMapPackage(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface
      ; asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageStartDownloadResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface
      ; asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
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
   
   function FindPackagesAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.OfflineMaps.OfflineMapPackage");
      m_Factory     : IOfflineMapPackageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOfflineMapPackageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindPackagesAsync(queryPoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindPackagesInBoundingBoxAsync
   (
      queryBoundingBox : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.OfflineMaps.OfflineMapPackage");
      m_Factory     : IOfflineMapPackageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOfflineMapPackageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindPackagesInBoundingBoxAsync(queryBoundingBox, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindPackagesInGeocircleAsync
   (
      queryCircle : Windows.Devices.Geolocation.IGeocircle
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.OfflineMaps.OfflineMapPackage");
      m_Factory     : IOfflineMapPackageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOfflineMapPackageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindPackagesInGeocircleAsync(queryCircle, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
