--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Networking.Connectivity;
with Windows.Foundation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateHostName
   (
      hostName : Windows.String
   )
   return Windows.Networking.IHostName is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.HostName");
      m_Factory     : Windows.Networking.IHostNameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.IHostName := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHostNameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateHostName(hostName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEndpointPair
   (
      localHostName : Windows.Networking.IHostName
      ; localServiceName : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Networking.IEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.EndpointPair");
      m_Factory     : Windows.Networking.IEndpointPairFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.IEndpointPair := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEndpointPairFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateEndpointPair(localHostName, localServiceName, remoteHostName, remoteServiceName, RetVal'Access);
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
   
   
   function Compare
   (
      value1 : Windows.String
      ; value2 : Windows.String
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.HostName");
      m_Factory     : IHostNameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHostNameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Compare(value1, value2, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
