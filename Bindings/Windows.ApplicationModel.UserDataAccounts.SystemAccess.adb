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
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.UserDataAccounts.SystemAccess is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration
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
   
   function CreateDeviceAccountConfiguration return Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountConfiguration");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.UserDataAccounts.SystemAccess.IID_IDeviceAccountConfiguration'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function AddAndShowDeviceAccountsAsync
   (
      accounts : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IIterable_IDeviceAccountConfiguration
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager");
      m_Factory     : IUserDataAccountSystemAccessManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataAccountSystemAccessManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddAndShowDeviceAccountsAsync(accounts, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SuppressLocalAccountWithAccountAsync
   (
      userDataAccountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager");
      m_Factory     : IUserDataAccountSystemAccessManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataAccountSystemAccessManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SuppressLocalAccountWithAccountAsync(userDataAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDeviceAccountAsync
   (
      account : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager");
      m_Factory     : IUserDataAccountSystemAccessManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataAccountSystemAccessManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDeviceAccountAsync(account, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeleteDeviceAccountAsync
   (
      accountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager");
      m_Factory     : IUserDataAccountSystemAccessManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataAccountSystemAccessManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteDeviceAccountAsync(accountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceAccountConfigurationAsync
   (
      accountId : Windows.String
   )
   return Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager");
      m_Factory     : IUserDataAccountSystemAccessManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataAccountSystemAccessManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceAccountConfigurationAsync(accountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
