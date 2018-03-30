--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Management.Deployment.Preview is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindInstalledApp
   (
      appUninstallKey : Windows.String
   )
   return Windows.Management.Deployment.Preview.IInstalledClassicAppInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Management.Deployment.Preview.ClassicAppManager");
      m_Factory     : IClassicAppManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Management.Deployment.Preview.IInstalledClassicAppInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClassicAppManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindInstalledApp(appUninstallKey, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
