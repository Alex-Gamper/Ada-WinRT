--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Embedded.DeviceLockdown is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetSupportedLockdownProfiles
   return Windows.Foundation.Collections.IVectorView_Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Embedded.DeviceLockdown.DeviceLockdownProfile");
      m_Factory     : IDeviceLockdownProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceLockdownProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSupportedLockdownProfiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentLockdownProfile
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Embedded.DeviceLockdown.DeviceLockdownProfile");
      m_Factory     : IDeviceLockdownProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceLockdownProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentLockdownProfile(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ApplyLockdownProfileAsync
   (
      profileID : Windows.Guid
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Embedded.DeviceLockdown.DeviceLockdownProfile");
      m_Factory     : IDeviceLockdownProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceLockdownProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ApplyLockdownProfileAsync(profileID, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLockdownProfileInformation
   (
      profileID : Windows.Guid
   )
   return Windows.Embedded.DeviceLockdown.IDeviceLockdownProfileInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Embedded.DeviceLockdown.DeviceLockdownProfile");
      m_Factory     : IDeviceLockdownProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Embedded.DeviceLockdown.IDeviceLockdownProfileInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceLockdownProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLockdownProfileInformation(profileID, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
