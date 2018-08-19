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
with Windows.ApplicationModel.SocialInfo;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.SocialInfo.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface
      ; asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater
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
      This       : access AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface
      ; asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater
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
   
   function CreateSocialFeedUpdaterAsync
   (
      kind : Windows.ApplicationModel.SocialInfo.SocialFeedKind
      ; mode : Windows.ApplicationModel.SocialInfo.SocialFeedUpdateMode
      ; ownerRemoteId : Windows.String
   )
   return Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSocialFeedUpdaterAsync(kind, mode, ownerRemoteId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDashboardItemUpdaterAsync
   (
      ownerRemoteId : Windows.String
   )
   return Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDashboardItemUpdaterAsync(ownerRemoteId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure UpdateBadgeCountValue
   (
      itemRemoteId : Windows.String
      ; newCount : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UpdateBadgeCountValue(itemRemoteId, newCount);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ReportNewContentAvailable
   (
      contactRemoteId : Windows.String
      ; kind : Windows.ApplicationModel.SocialInfo.SocialFeedKind
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReportNewContentAvailable(contactRemoteId, kind);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function ProvisionAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ProvisionAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeprovisionAsync
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager");
      m_Factory     : ISocialInfoProviderManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocialInfoProviderManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeprovisionAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
