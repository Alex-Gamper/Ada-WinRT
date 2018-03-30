--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.UserDataAccounts.SystemAccess is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDeviceAccountConfiguration or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
      RetVal        : aliased Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.UserDataAccounts.SystemAccess.IID_IDeviceAccountConfiguration'Access, RetVal'Address);
         RefCount := Instance.Release;
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
