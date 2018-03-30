--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Foundation.Diagnostics is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access EventHandler_ITracingStatusChangedEventArgs_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_ITracingStatusChangedEventArgs or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_ITracingStatusChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Foundation.Diagnostics.ITracingStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IErrorDetails_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IErrorDetails or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IErrorDetails_Interface
      ; asyncInfo : Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ILoggingChannel_add_LoggingEnabled or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface
      ; sender : Windows.Foundation.Diagnostics.ILoggingChannel
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IFileLoggingSession_add_LogFileGenerated or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface
      ; sender : Windows.Foundation.Diagnostics.IFileLoggingSession
      ; args : Windows.Foundation.Diagnostics.ILogFileGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Foundation.Diagnostics.ILogFileGeneratedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateRuntimeBrokerErrorSettings return Windows.Foundation.Diagnostics.IErrorReportingSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.RuntimeBrokerErrorSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.IErrorReportingSettings := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_IErrorReportingSettings'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithKeywords
   (
      keywords : Windows.Int64
   )
   return Windows.Foundation.Diagnostics.ILoggingOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingOptions");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingOptionsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingOptionsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithKeywords(keywords, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLoggingChannelOptions return Windows.Foundation.Diagnostics.ILoggingChannelOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannelOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingChannelOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_ILoggingChannelOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLoggingFields return Windows.Foundation.Diagnostics.ILoggingFields is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingFields");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingFields := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_ILoggingFields'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLoggingActivity
   (
      activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.Foundation.Diagnostics.ILoggingActivity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingActivity");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingActivityFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingActivity := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingActivityFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLoggingActivity(activityName, loggingChannel, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLoggingActivityWithLevel
   (
      activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.Foundation.Diagnostics.ILoggingActivity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingActivity");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingActivityFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingActivity := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingActivityFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLoggingActivityWithLevel(activityName, loggingChannel, level, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannel");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingChannelFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingChannel := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingChannelFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.ILoggingSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingSession");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingSessionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingSession := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingSessionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.IFileLoggingSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.FileLoggingSession");
      m_Factory     : Windows.Foundation.Diagnostics.IFileLoggingSessionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.IFileLoggingSession := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileLoggingSessionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(name, RetVal'Access);
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
   
   
   procedure TraceOperationCreation
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; operationName : Windows.String
      ; relatedContext : Windows.UInt64
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TraceOperationCreation(traceLevel, source, platformId, operationId, operationName, relatedContext);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure TraceOperationCompletion
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; status : Windows.Foundation.AsyncStatus
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TraceOperationCompletion(traceLevel, source, platformId, operationId, status);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure TraceOperationRelation
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; relation : Windows.Foundation.Diagnostics.CausalityRelation
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TraceOperationRelation(traceLevel, source, platformId, operationId, relation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure TraceSynchronousWorkStart
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TraceSynchronousWorkStart(traceLevel, source, platformId, operationId, work);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure TraceSynchronousWorkCompletion
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TraceSynchronousWorkCompletion(traceLevel, source, work);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_TracingStatusChanged
   (
      handler : Windows.Foundation.Diagnostics.EventHandler_ITracingStatusChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_TracingStatusChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_TracingStatusChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.AsyncCausalityTracer");
      m_Factory     : IAsyncCausalityTracerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsyncCausalityTracerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_TracingStatusChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateFromHResultAsync
   (
      errorCode : Windows.Int32
   )
   return Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.ErrorDetails");
      m_Factory     : IErrorDetailsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IErrorDetailsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromHResultAsync(errorCode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
