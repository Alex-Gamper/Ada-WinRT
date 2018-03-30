--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Resources.Management is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateResourceIndexer
   (
      projectRoot : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.Resources.Management.IResourceIndexer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Management.ResourceIndexer");
      m_Factory     : Windows.ApplicationModel.Resources.Management.IResourceIndexerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Management.IResourceIndexer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceIndexerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResourceIndexer(projectRoot, RetVal'Access);
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
   

end;
