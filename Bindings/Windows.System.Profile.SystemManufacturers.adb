--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Profile.SystemManufacturers is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_LocalSystemEdition
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SystemManufacturers.SystemSupportInfo");
      m_Factory     : ISystemSupportInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemSupportInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalSystemEdition(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OemSupportInfo
   return Windows.System.Profile.SystemManufacturers.IOemSupportInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SystemManufacturers.SystemSupportInfo");
      m_Factory     : ISystemSupportInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.SystemManufacturers.IOemSupportInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemSupportInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OemSupportInfo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SerialNumber
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SystemManufacturers.SmbiosInformation");
      m_Factory     : ISmbiosInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmbiosInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SerialNumber(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
