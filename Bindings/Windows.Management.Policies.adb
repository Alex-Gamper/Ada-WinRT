--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Management.Policies is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_INamedPolicyData_add_Changed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_INamedPolicyData_add_Changed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_INamedPolicyData_add_Changed_Interface
      ; sender : Windows.Management.Policies.INamedPolicyData
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Management.Policies.INamedPolicyData(sender), args);
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
   
   
   function GetPolicyFromPath
   (
      area : Windows.String
      ; name : Windows.String
   )
   return Windows.Management.Policies.INamedPolicyData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Policies.NamedPolicy");
      m_Factory     : INamedPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.Policies.INamedPolicyData;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INamedPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPolicyFromPath(area, name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPolicyFromPathForUser
   (
      user : Windows.System.IUser
      ; area : Windows.String
      ; name : Windows.String
   )
   return Windows.Management.Policies.INamedPolicyData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Policies.NamedPolicy");
      m_Factory     : INamedPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.Policies.INamedPolicyData;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INamedPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPolicyFromPathForUser(user, area, name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
