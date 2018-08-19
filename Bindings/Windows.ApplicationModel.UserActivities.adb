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
with Windows.UI;
with Windows.UI.Shell;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.UserActivities is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserActivity_Interface
      ; asyncInfo : Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity
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
      This       : access TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Interface
      ; sender : Windows.ApplicationModel.UserActivities.IUserActivityRequestManager
      ; args : Windows.ApplicationModel.UserActivities.IUserActivityRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.UserActivities.IUserActivityRequestManager(sender), Windows.ApplicationModel.UserActivities.IUserActivityRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.ApplicationModel.UserActivities.IUserActivityAttribution is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityAttribution");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.UserActivities.IUserActivityAttribution) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.UserActivities.IID_IUserActivityAttribution'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithUri
   (
      iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityAttribution is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityAttribution");
      m_Factory     : Windows.ApplicationModel.UserActivities.IUserActivityAttributionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivityAttribution := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityAttributionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithUri(iconUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithActivityId
   (
      activityId : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivity");
      m_Factory     : Windows.ApplicationModel.UserActivities.IUserActivityFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivity := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithActivityId(activityId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function FromJson
   (
      value : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityContentInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityContentInfo");
      m_Factory     : IUserActivityContentInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivityContentInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityContentInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromJson(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParseFromJson
   (
      json : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivity");
      m_Factory     : IUserActivityStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivity;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParseFromJson(json, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParseFromJsonArray
   (
      json : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IVector_IUserActivity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivity");
      m_Factory     : IUserActivityStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IVector_IUserActivity;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParseFromJsonArray(json, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ToJsonArray
   (
      activities : Windows.ApplicationModel.UserActivities.IIterable_IUserActivity
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivity");
      m_Factory     : IUserActivityStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ToJsonArray(activities, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DisableAutoSessionCreation
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityChannel");
      m_Factory     : IUserActivityChannelStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityChannelStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DisableAutoSessionCreation;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TryGetForWebAccount
   (
      account : Windows.Security.Credentials.IWebAccount
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityChannel");
      m_Factory     : IUserActivityChannelStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityChannelStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetForWebAccount(account, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.ApplicationModel.UserActivities.IUserActivityChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityChannel");
      m_Factory     : IUserActivityChannelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityChannelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.UserActivities.IUserActivityRequestManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserActivities.UserActivityRequestManager");
      m_Factory     : IUserActivityRequestManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserActivities.IUserActivityRequestManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserActivityRequestManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
