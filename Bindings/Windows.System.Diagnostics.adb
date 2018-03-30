--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.Data.Json;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Diagnostics is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForProcesses
   return Windows.System.Diagnostics.IVectorView_IProcessDiagnosticInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.ProcessDiagnosticInfo");
      m_Factory     : IProcessDiagnosticInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.IVectorView_IProcessDiagnosticInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProcessDiagnosticInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForProcesses(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentProcess
   return Windows.System.Diagnostics.IProcessDiagnosticInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.ProcessDiagnosticInfo");
      m_Factory     : IProcessDiagnosticInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.IProcessDiagnosticInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProcessDiagnosticInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentProcess(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryGetForProcessId
   (
      processId : Windows.UInt32
   )
   return Windows.System.Diagnostics.IProcessDiagnosticInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.ProcessDiagnosticInfo");
      m_Factory     : IProcessDiagnosticInfoStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.IProcessDiagnosticInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProcessDiagnosticInfoStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetForProcessId(processId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentSystem
   return Windows.System.Diagnostics.ISystemDiagnosticInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.SystemDiagnosticInfo");
      m_Factory     : ISystemDiagnosticInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.ISystemDiagnosticInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemDiagnosticInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentSystem(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.System.Diagnostics.IDiagnosticInvoker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.DiagnosticInvoker");
      m_Factory     : IDiagnosticInvokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.IDiagnosticInvoker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDiagnosticInvokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.Diagnostics.IDiagnosticInvoker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.DiagnosticInvoker");
      m_Factory     : IDiagnosticInvokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.IDiagnosticInvoker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDiagnosticInvokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.DiagnosticInvoker");
      m_Factory     : IDiagnosticInvokerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDiagnosticInvokerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
