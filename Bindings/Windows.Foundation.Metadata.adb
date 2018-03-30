--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Foundation.Metadata is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsTypePresent
   (
      typeName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsTypePresent(typeName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsMethodPresent
   (
      typeName : Windows.String
      ; methodName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsMethodPresent(typeName, methodName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsMethodPresentWithArity
   (
      typeName : Windows.String
      ; methodName : Windows.String
      ; inputParameterCount : Windows.UInt32
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsMethodPresentWithArity(typeName, methodName, inputParameterCount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsEventPresent
   (
      typeName : Windows.String
      ; eventName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsEventPresent(typeName, eventName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsPropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsPropertyPresent(typeName, propertyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsReadOnlyPropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsReadOnlyPropertyPresent(typeName, propertyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsWriteablePropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsWriteablePropertyPresent(typeName, propertyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsEnumNamedValuePresent
   (
      enumTypeName : Windows.String
      ; valueName : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsEnumNamedValuePresent(enumTypeName, valueName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsApiContractPresentByMajor
   (
      contractName : Windows.String
      ; majorVersion : Windows.UInt16
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsApiContractPresentByMajor(contractName, majorVersion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsApiContractPresentByMajorAndMinor
   (
      contractName : Windows.String
      ; majorVersion : Windows.UInt16
      ; minorVersion : Windows.UInt16
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Metadata.ApiInformation");
      m_Factory     : IApiInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApiInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsApiContractPresentByMajorAndMinor(contractName, majorVersion, minorVersion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
