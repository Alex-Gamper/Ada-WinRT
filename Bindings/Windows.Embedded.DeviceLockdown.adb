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
