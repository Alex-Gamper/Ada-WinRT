--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Resources is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateResourceLoaderByName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : Windows.ApplicationModel.Resources.IResourceLoaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResourceLoaderByName(name, RetVal'Access);
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
   
   
   function GetStringForReference
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStringForReference(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentViewWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentViewWithName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForViewIndependentUse
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForViewIndependentUse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForViewIndependentUseWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForViewIndependentUseWithName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
