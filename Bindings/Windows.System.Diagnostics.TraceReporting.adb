--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Diagnostics.TraceReporting is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsScenarioEnabled
   (
      scenarioId : Windows.Guid
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsScenarioEnabled(scenarioId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryEscalateScenario
   (
      scenarioId : Windows.Guid
      ; escalationType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEscalationType
      ; outputDirectory : Windows.String
      ; timestampOutputDirectory : Windows.Boolean
      ; forceEscalationUpload : Windows.Boolean
      ; triggers : IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryEscalateScenario(scenarioId, escalationType, outputDirectory, timestampOutputDirectory, forceEscalationUpload, triggers, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DownloadLatestSettingsForNamespace
   (
      partner : Windows.String
      ; feature : Windows.String
      ; isScenarioNamespace : Windows.Boolean
      ; downloadOverCostedNetwork : Windows.Boolean
      ; downloadOverBattery : Windows.Boolean
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DownloadLatestSettingsForNamespace(partner, feature, isScenarioNamespace, downloadOverCostedNetwork, downloadOverBattery, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetActiveScenarioList
   return Windows.Foundation.Collections.IVectorView_Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetActiveScenarioList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ForceUpload
   (
      latency : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEventBufferLatencies
      ; uploadOverCostedNetwork : Windows.Boolean
      ; uploadOverBattery : Windows.Boolean
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ForceUpload(latency, uploadOverCostedNetwork, uploadOverBattery, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsTraceRunning
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
      ; scenarioId : Windows.Guid
      ; traceProfileHash : Windows.UInt64
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsTraceRunning(slotType, scenarioId, traceProfileHash, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetActiveTraceRuntime
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
   )
   return Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetActiveTraceRuntime(slotType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetKnownTraceList
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
   )
   return Windows.System.Diagnostics.TraceReporting.IVectorView_IPlatformDiagnosticTraceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions");
      m_Factory     : IPlatformDiagnosticActionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.TraceReporting.IVectorView_IPlatformDiagnosticTraceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticActionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetKnownTraceList(slotType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
