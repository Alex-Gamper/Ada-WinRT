--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Management.Workplace is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsBrowserAllowed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.MdmPolicy");
      m_Factory     : IMdmAllowPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmAllowPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsBrowserAllowed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsCameraAllowed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.MdmPolicy");
      m_Factory     : IMdmAllowPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmAllowPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsCameraAllowed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsMicrosoftAccountAllowed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.MdmPolicy");
      m_Factory     : IMdmAllowPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmAllowPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsMicrosoftAccountAllowed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsStoreAllowed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.MdmPolicy");
      m_Factory     : IMdmAllowPolicyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmAllowPolicyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsStoreAllowed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetMessagingSyncPolicy
   return Windows.Management.Workplace.MessagingSyncPolicy is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.MdmPolicy");
      m_Factory     : IMdmPolicyStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.Workplace.MessagingSyncPolicy;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMdmPolicyStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetMessagingSyncPolicy(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsMicrosoftAccountOptional
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Workplace.WorkplaceSettings");
      m_Factory     : IWorkplaceSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWorkplaceSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsMicrosoftAccountOptional(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
