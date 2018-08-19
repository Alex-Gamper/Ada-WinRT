--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Foundation.Diagnostics is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
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
   
   function Create return Windows.Foundation.Diagnostics.IErrorReportingSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.RuntimeBrokerErrorSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Foundation.Diagnostics.IErrorReportingSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_IErrorReportingSettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Foundation.Diagnostics.ILoggingOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Foundation.Diagnostics.ILoggingOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_ILoggingOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
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
   
   function Create return Windows.Foundation.Diagnostics.ILoggingChannelOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannelOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Foundation.Diagnostics.ILoggingChannelOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_ILoggingChannelOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      group : Windows.Guid
   )
   return Windows.Foundation.Diagnostics.ILoggingChannelOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannelOptions");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingChannelOptionsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingChannelOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingChannelOptionsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(group, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Foundation.Diagnostics.ILoggingFields is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingFields");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Foundation.Diagnostics.ILoggingFields) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Diagnostics.IID_ILoggingFields'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
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
   
   function CreateWithOptions
   (
      name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannel");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingChannelFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingChannel := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingChannelFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithOptions(name, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithOptionsAndId
   (
      name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
      ; id : Windows.Guid
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Diagnostics.LoggingChannel");
      m_Factory     : Windows.Foundation.Diagnostics.ILoggingChannelFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Diagnostics.ILoggingChannel := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILoggingChannelFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithOptionsAndId(name, options, id, RetVal'Access);
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
