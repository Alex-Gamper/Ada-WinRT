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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows; use Windows;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Foundation.Diagnostics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CausalityTraceLevel is (
      Required,
      Important,
      Verbose
   );
   for CausalityTraceLevel use (
      Required => 0,
      Important => 1,
      Verbose => 2
   );
   for CausalityTraceLevel'Size use 32;
   
   type CausalityTraceLevel_Ptr is access CausalityTraceLevel;
   
   type CausalitySource is (
      Application,
      Library,
      System
   );
   for CausalitySource use (
      Application => 0,
      Library => 1,
      System => 2
   );
   for CausalitySource'Size use 32;
   
   type CausalitySource_Ptr is access CausalitySource;
   
   type CausalityRelation is (
      AssignDelegate,
      Join,
      Choice,
      Cancel,
      Error
   );
   for CausalityRelation use (
      AssignDelegate => 0,
      Join => 1,
      Choice => 2,
      Cancel => 3,
      Error => 4
   );
   for CausalityRelation'Size use 32;
   
   type CausalityRelation_Ptr is access CausalityRelation;
   
   type CausalitySynchronousWork is (
      CompletionNotification,
      ProgressNotification,
      Execution
   );
   for CausalitySynchronousWork use (
      CompletionNotification => 0,
      ProgressNotification => 1,
      Execution => 2
   );
   for CausalitySynchronousWork'Size use 32;
   
   type CausalitySynchronousWork_Ptr is access CausalitySynchronousWork;
   
   type ErrorOptions is (
      None,
      SuppressExceptions,
      ForceExceptions,
      UseSetErrorInfo,
      SuppressSetErrorInfo
   );
   for ErrorOptions use (
      None => 0,
      SuppressExceptions => 1,
      ForceExceptions => 2,
      UseSetErrorInfo => 4,
      SuppressSetErrorInfo => 8
   );
   for ErrorOptions'Size use 32;
   
   type ErrorOptions_Ptr is access ErrorOptions;
   
   type LoggingLevel is (
      Verbose,
      Information,
      Warning,
      Error,
      Critical
   );
   for LoggingLevel use (
      Verbose => 0,
      Information => 1,
      Warning => 2,
      Error => 3,
      Critical => 4
   );
   for LoggingLevel'Size use 32;
   
   type LoggingLevel_Ptr is access LoggingLevel;
   
   type LoggingOpcode is (
      Info,
      Start,
      Stop,
      Reply,
      Resume,
      Suspend,
      Send
   );
   for LoggingOpcode use (
      Info => 0,
      Start => 1,
      Stop => 2,
      Reply => 6,
      Resume => 7,
      Suspend => 8,
      Send => 9
   );
   for LoggingOpcode'Size use 32;
   
   type LoggingOpcode_Ptr is access LoggingOpcode;
   
   type LoggingFieldFormat is (
      Default,
      Hidden,
      String,
      Boolean,
      Hexadecimal,
      ProcessId,
      ThreadId,
      Port,
      Ipv4Address,
      Ipv6Address,
      SocketAddress,
      Xml,
      Json,
      Win32Error,
      NTStatus,
      HResult,
      FileTime,
      Signed,
      Unsigned
   );
   for LoggingFieldFormat use (
      Default => 0,
      Hidden => 1,
      String => 2,
      Boolean => 3,
      Hexadecimal => 4,
      ProcessId => 5,
      ThreadId => 6,
      Port => 7,
      Ipv4Address => 8,
      Ipv6Address => 9,
      SocketAddress => 10,
      Xml => 11,
      Json => 12,
      Win32Error => 13,
      NTStatus => 14,
      HResult => 15,
      FileTime => 16,
      Signed => 17,
      Unsigned => 18
   );
   for LoggingFieldFormat'Size use 32;
   
   type LoggingFieldFormat_Ptr is access LoggingFieldFormat;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type EventHandler_ITracingStatusChangedEventArgs_Interface;
   type EventHandler_ITracingStatusChangedEventArgs is access all EventHandler_ITracingStatusChangedEventArgs_Interface'Class;
   type EventHandler_ITracingStatusChangedEventArgs_Ptr is access all EventHandler_ITracingStatusChangedEventArgs;
   type AsyncOperationCompletedHandler_IErrorDetails_Interface;
   type AsyncOperationCompletedHandler_IErrorDetails is access all AsyncOperationCompletedHandler_IErrorDetails_Interface'Class;
   type AsyncOperationCompletedHandler_IErrorDetails_Ptr is access all AsyncOperationCompletedHandler_IErrorDetails;
   type TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface;
   type TypedEventHandler_ILoggingChannel_add_LoggingEnabled is access all TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface'Class;
   type TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Ptr is access all TypedEventHandler_ILoggingChannel_add_LoggingEnabled;
   type TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface;
   type TypedEventHandler_IFileLoggingSession_add_LogFileGenerated is access all TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface'Class;
   type TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Ptr is access all TypedEventHandler_IFileLoggingSession_add_LogFileGenerated;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ITracingStatusChangedEventArgs_Interface;
   type ITracingStatusChangedEventArgs is access all ITracingStatusChangedEventArgs_Interface'Class;
   type ITracingStatusChangedEventArgs_Ptr is access all ITracingStatusChangedEventArgs;
   type IAsyncCausalityTracerStatics_Interface;
   type IAsyncCausalityTracerStatics is access all IAsyncCausalityTracerStatics_Interface'Class;
   type IAsyncCausalityTracerStatics_Ptr is access all IAsyncCausalityTracerStatics;
   type IErrorReportingSettings_Interface;
   type IErrorReportingSettings is access all IErrorReportingSettings_Interface'Class;
   type IErrorReportingSettings_Ptr is access all IErrorReportingSettings;
   type IErrorDetailsStatics_Interface;
   type IErrorDetailsStatics is access all IErrorDetailsStatics_Interface'Class;
   type IErrorDetailsStatics_Ptr is access all IErrorDetailsStatics;
   type IErrorDetails_Interface;
   type IErrorDetails is access all IErrorDetails_Interface'Class;
   type IErrorDetails_Ptr is access all IErrorDetails;
   type ILoggingOptions_Interface;
   type ILoggingOptions is access all ILoggingOptions_Interface'Class;
   type ILoggingOptions_Ptr is access all ILoggingOptions;
   type ILoggingOptionsFactory_Interface;
   type ILoggingOptionsFactory is access all ILoggingOptionsFactory_Interface'Class;
   type ILoggingOptionsFactory_Ptr is access all ILoggingOptionsFactory;
   type ILoggingChannelOptions_Interface;
   type ILoggingChannelOptions is access all ILoggingChannelOptions_Interface'Class;
   type ILoggingChannelOptions_Ptr is access all ILoggingChannelOptions;
   type ILoggingChannelOptionsFactory_Interface;
   type ILoggingChannelOptionsFactory is access all ILoggingChannelOptionsFactory_Interface'Class;
   type ILoggingChannelOptionsFactory_Ptr is access all ILoggingChannelOptionsFactory;
   type ILoggingFields_Interface;
   type ILoggingFields is access all ILoggingFields_Interface'Class;
   type ILoggingFields_Ptr is access all ILoggingFields;
   type ILoggingTarget_Interface;
   type ILoggingTarget is access all ILoggingTarget_Interface'Class;
   type ILoggingTarget_Ptr is access all ILoggingTarget;
   type ILoggingChannel_Interface;
   type ILoggingChannel is access all ILoggingChannel_Interface'Class;
   type ILoggingChannel_Ptr is access all ILoggingChannel;
   type ILoggingChannel2_Interface;
   type ILoggingChannel2 is access all ILoggingChannel2_Interface'Class;
   type ILoggingChannel2_Ptr is access all ILoggingChannel2;
   type ILoggingChannelFactory_Interface;
   type ILoggingChannelFactory is access all ILoggingChannelFactory_Interface'Class;
   type ILoggingChannelFactory_Ptr is access all ILoggingChannelFactory;
   type ILoggingChannelFactory2_Interface;
   type ILoggingChannelFactory2 is access all ILoggingChannelFactory2_Interface'Class;
   type ILoggingChannelFactory2_Ptr is access all ILoggingChannelFactory2;
   type ILoggingActivity_Interface;
   type ILoggingActivity is access all ILoggingActivity_Interface'Class;
   type ILoggingActivity_Ptr is access all ILoggingActivity;
   type ILoggingActivity2_Interface;
   type ILoggingActivity2 is access all ILoggingActivity2_Interface'Class;
   type ILoggingActivity2_Ptr is access all ILoggingActivity2;
   type ILoggingActivityFactory_Interface;
   type ILoggingActivityFactory is access all ILoggingActivityFactory_Interface'Class;
   type ILoggingActivityFactory_Ptr is access all ILoggingActivityFactory;
   type ILoggingSession_Interface;
   type ILoggingSession is access all ILoggingSession_Interface'Class;
   type ILoggingSession_Ptr is access all ILoggingSession;
   type ILoggingSessionFactory_Interface;
   type ILoggingSessionFactory is access all ILoggingSessionFactory_Interface'Class;
   type ILoggingSessionFactory_Ptr is access all ILoggingSessionFactory;
   type ILogFileGeneratedEventArgs_Interface;
   type ILogFileGeneratedEventArgs is access all ILogFileGeneratedEventArgs_Interface'Class;
   type ILogFileGeneratedEventArgs_Ptr is access all ILogFileGeneratedEventArgs;
   type IFileLoggingSession_Interface;
   type IFileLoggingSession is access all IFileLoggingSession_Interface'Class;
   type IFileLoggingSession_Ptr is access all IFileLoggingSession;
   type IFileLoggingSessionFactory_Interface;
   type IFileLoggingSessionFactory is access all IFileLoggingSessionFactory_Interface'Class;
   type IFileLoggingSessionFactory_Ptr is access all IFileLoggingSessionFactory;
   type IAsyncOperation_IErrorDetails_Interface;
   type IAsyncOperation_IErrorDetails is access all IAsyncOperation_IErrorDetails_Interface'Class;
   type IAsyncOperation_IErrorDetails_Ptr is access all IAsyncOperation_IErrorDetails;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ITracingStatusChangedEventArgs : aliased constant Windows.IID := (1091270417, 65339, 18303, (156, 154, 210, 239, 218, 48, 45, 195 ));
   
   type ITracingStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Enabled
   (
      This       : access ITracingStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TraceLevel
   (
      This       : access ITracingStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.CausalityTraceLevel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncCausalityTracerStatics : aliased constant Windows.IID := (1350896422, 9854, 17691, (168, 144, 171, 106, 55, 2, 69, 238 ));
   
   type IAsyncCausalityTracerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TraceOperationCreation
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; operationName : Windows.String
      ; relatedContext : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function TraceOperationCompletion
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; status : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function TraceOperationRelation
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; relation : Windows.Foundation.Diagnostics.CausalityRelation
   )
   return Windows.HRESULT is abstract;
   
   function TraceSynchronousWorkStart
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   return Windows.HRESULT is abstract;
   
   function TraceSynchronousWorkCompletion
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   return Windows.HRESULT is abstract;
   
   function add_TracingStatusChanged
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; handler : Windows.Foundation.Diagnostics.EventHandler_ITracingStatusChangedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TracingStatusChanged
   (
      This       : access IAsyncCausalityTracerStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IErrorReportingSettings : aliased constant Windows.IID := (372676498, 45118, 19361, (139, 184, 210, 143, 74, 180, 210, 192 ));
   
   type IErrorReportingSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function SetErrorOptions
   (
      This       : access IErrorReportingSettings_Interface
      ; value : Windows.Foundation.Diagnostics.ErrorOptions
   )
   return Windows.HRESULT is abstract;
   
   function GetErrorOptions
   (
      This       : access IErrorReportingSettings_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.ErrorOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IErrorDetailsStatics : aliased constant Windows.IID := (3077584720, 2845, 18120, (170, 14, 75, 129, 120, 228, 252, 233 ));
   
   type IErrorDetailsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromHResultAsync
   (
      This       : access IErrorDetailsStatics_Interface
      ; errorCode : Windows.Int32
      ; RetVal : access Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IErrorDetails : aliased constant Windows.IID := (931969793, 11465, 17039, (140, 85, 44, 153, 13, 70, 62, 143 ));
   
   type IErrorDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Description
   (
      This       : access IErrorDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LongDescription
   (
      This       : access IErrorDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HelpUri
   (
      This       : access IErrorDetails_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingOptions : aliased constant Windows.IID := (2428270672, 402, 20317, (172, 38, 0, 106, 218, 202, 18, 216 ));
   
   type ILoggingOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Keywords
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function put_Keywords
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Tags
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Tags
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Task
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function put_Task
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_Opcode
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.LoggingOpcode
   )
   return Windows.HRESULT is abstract;
   
   function put_Opcode
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Foundation.Diagnostics.LoggingOpcode
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivityId
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_ActivityId
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RelatedActivityId
   (
      This       : access ILoggingOptions_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_RelatedActivityId
   (
      This       : access ILoggingOptions_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingOptionsFactory : aliased constant Windows.IID := (3608397515, 39083, 17995, (159, 34, 163, 38, 132, 120, 54, 138 ));
   
   type ILoggingOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithKeywords
   (
      This       : access ILoggingOptionsFactory_Interface
      ; keywords : Windows.Int64
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannelOptions : aliased constant Windows.IID := (3286779903, 3771, 19027, (140, 84, 222, 194, 73, 38, 203, 44 ));
   
   type ILoggingChannelOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Group
   (
      This       : access ILoggingChannelOptions_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_Group
   (
      This       : access ILoggingChannelOptions_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannelOptionsFactory : aliased constant Windows.IID := (2838581722, 32687, 16785, (135, 85, 94, 134, 220, 101, 216, 150 ));
   
   type ILoggingChannelOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILoggingChannelOptionsFactory_Interface
      ; group : Windows.Guid
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingChannelOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingFields : aliased constant Windows.IID := (3623270319, 30253, 17785, (131, 189, 82, 194, 59, 195, 51, 188 ));
   
   type ILoggingFields_Interface is interface and Windows.IInspectable_Interface;
   
   function Clear
   (
      This       : access ILoggingFields_Interface
   )
   return Windows.HRESULT is abstract;
   
   function BeginStruct
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function BeginStructWithTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function EndStruct
   (
      This       : access ILoggingFields_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AddEmpty
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddEmptyWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddEmptyWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt8ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt16ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int16_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt16ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt16_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int32_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt32ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt32_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddInt64ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Int64_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddUInt64ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt64_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddSingle
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function AddSingleWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddSingleWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddSingleArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddSingleArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddSingleArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Single_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddDouble
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Double_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16WithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16WithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16Array
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16ArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddChar16ArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.UInt8_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddBoolean
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AddBooleanWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddBooleanWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddBooleanArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddBooleanArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddBooleanArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Boolean_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddString
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddStringWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddStringWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddStringArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddStringArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddStringArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.String_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddGuid
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function AddGuidWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddGuidWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddGuidArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddGuidArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddGuidArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Guid_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTime
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTimeWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTimeWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTimeArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTimeArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddDateTimeArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.DateTime_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpan
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpanWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpanWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpanArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpanArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddTimeSpanArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.TimeSpan_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddPoint
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function AddPointWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddPointWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddPointArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddPointArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddPointArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Point_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddSize
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function AddSizeWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddSizeWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddSizeArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddSizeArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddSizeArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Size_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddRect
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function AddRectWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddRectWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddRectArray
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function AddRectArrayWithFormat
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
   )
   return Windows.HRESULT is abstract;
   
   function AddRectArrayWithFormatAndTags
   (
      This       : access ILoggingFields_Interface
      ; name : Windows.String
      ; value : Windows.Foundation.Rect_Ptr
      ; format : Windows.Foundation.Diagnostics.LoggingFieldFormat
      ; tags : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingTarget : aliased constant Windows.IID := (1710320693, 58248, 20006, (177, 122, 245, 28, 211, 168, 57, 22 ));
   
   type ILoggingTarget_Interface is interface and Windows.IInspectable_Interface;
   
   function IsEnabled
   (
      This       : access ILoggingTarget_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEnabledWithLevel
   (
      This       : access ILoggingTarget_Interface
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEnabledWithLevelAndKeywords
   (
      This       : access ILoggingTarget_Interface
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; keywords : Windows.Int64
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function LogEvent
   (
      This       : access ILoggingTarget_Interface
      ; eventName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LogEventWithFields
   (
      This       : access ILoggingTarget_Interface
      ; eventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
   )
   return Windows.HRESULT is abstract;
   
   function LogEventWithFieldsAndLevel
   (
      This       : access ILoggingTarget_Interface
      ; eventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function LogEventWithFieldsAndOptions
   (
      This       : access ILoggingTarget_Interface
      ; eventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; options : Windows.Foundation.Diagnostics.ILoggingOptions
   )
   return Windows.HRESULT is abstract;
   
   function StartActivity
   (
      This       : access ILoggingTarget_Interface
      ; startEventName : Windows.String
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   function StartActivityWithFields
   (
      This       : access ILoggingTarget_Interface
      ; startEventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   function StartActivityWithFieldsAndLevel
   (
      This       : access ILoggingTarget_Interface
      ; startEventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   function StartActivityWithFieldsAndOptions
   (
      This       : access ILoggingTarget_Interface
      ; startEventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; options : Windows.Foundation.Diagnostics.ILoggingOptions
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannel : aliased constant Windows.IID := (3919905603, 4567, 20225, (181, 202, 207, 73, 82, 120, 192, 168 ));
   
   type ILoggingChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ILoggingChannel_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access ILoggingChannel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Level
   (
      This       : access ILoggingChannel_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function LogMessage
   (
      This       : access ILoggingChannel_Interface
      ; eventString : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LogMessageWithLevel
   (
      This       : access ILoggingChannel_Interface
      ; eventString : Windows.String
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function LogValuePair
   (
      This       : access ILoggingChannel_Interface
      ; value1 : Windows.String
      ; value2 : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function LogValuePairWithLevel
   (
      This       : access ILoggingChannel_Interface
      ; value1 : Windows.String
      ; value2 : Windows.Int32
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function add_LoggingEnabled
   (
      This       : access ILoggingChannel_Interface
      ; handler : TypedEventHandler_ILoggingChannel_add_LoggingEnabled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LoggingEnabled
   (
      This       : access ILoggingChannel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannel2 : aliased constant Windows.IID := (2672573683, 2988, 17829, (158, 51, 186, 243, 243, 162, 70, 165 ));
   
   type ILoggingChannel2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ILoggingChannel2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannelFactory : aliased constant Windows.IID := (1323064220, 44928, 19099, (176, 220, 57, 143, 154, 229, 32, 123 ));
   
   type ILoggingChannelFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILoggingChannelFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingChannelFactory2 : aliased constant Windows.IID := (1282340317, 15143, 19913, (153, 240, 41, 156, 110, 70, 3, 161 ));
   
   type ILoggingChannelFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithOptions
   (
      This       : access ILoggingChannelFactory2_Interface
      ; name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithOptionsAndId
   (
      This       : access ILoggingChannelFactory2_Interface
      ; name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
      ; id : Windows.Guid
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingActivity : aliased constant Windows.IID := (3154323777, 46950, 19637, (152, 72, 151, 172, 107, 166, 214, 12 ));
   
   type ILoggingActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ILoggingActivity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ILoggingActivity_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingActivity2 : aliased constant Windows.IID := (650287112, 25378, 17770, (175, 130, 128, 200, 100, 47, 23, 139 ));
   
   type ILoggingActivity2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access ILoggingActivity2_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   function StopActivity
   (
      This       : access ILoggingActivity2_Interface
      ; stopEventName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function StopActivityWithFields
   (
      This       : access ILoggingActivity2_Interface
      ; stopEventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
   )
   return Windows.HRESULT is abstract;
   
   function StopActivityWithFieldsAndOptions
   (
      This       : access ILoggingActivity2_Interface
      ; stopEventName : Windows.String
      ; fields : Windows.Foundation.Diagnostics.ILoggingFields
      ; options : Windows.Foundation.Diagnostics.ILoggingOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingActivityFactory : aliased constant Windows.IID := (1798550659, 57610, 19544, (151, 213, 16, 251, 69, 16, 116, 251 ));
   
   type ILoggingActivityFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLoggingActivity
   (
      This       : access ILoggingActivityFactory_Interface
      ; activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   function CreateLoggingActivityWithLevel
   (
      This       : access ILoggingActivityFactory_Interface
      ; activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingSession : aliased constant Windows.IID := (1646392070, 37760, 19159, (186, 245, 65, 234, 147, 16, 215, 104 ));
   
   type ILoggingSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ILoggingSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SaveToFileAsync
   (
      This       : access ILoggingSession_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; fileName : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddLoggingChannel
   (
      This       : access ILoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   function AddLoggingChannelWithLevel
   (
      This       : access ILoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; maxLevel : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function RemoveLoggingChannel
   (
      This       : access ILoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILoggingSessionFactory : aliased constant Windows.IID := (1318289125, 22781, 17888, (140, 47, 161, 50, 239, 249, 92, 30 ));
   
   type ILoggingSessionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILoggingSessionFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Foundation.Diagnostics.ILoggingSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILogFileGeneratedEventArgs : aliased constant Windows.IID := (647927663, 3384, 19482, (181, 63, 179, 149, 216, 129, 223, 132 ));
   
   type ILogFileGeneratedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access ILogFileGeneratedEventArgs_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileLoggingSession : aliased constant Windows.IID := (617038358, 65234, 16460, (137, 95, 31, 150, 153, 203, 2, 247 ));
   
   type IFileLoggingSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IFileLoggingSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddLoggingChannel
   (
      This       : access IFileLoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   function AddLoggingChannelWithLevel
   (
      This       : access IFileLoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; maxLevel : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.HRESULT is abstract;
   
   function RemoveLoggingChannel
   (
      This       : access IFileLoggingSession_Interface
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.HRESULT is abstract;
   
   function CloseAndSaveToFileAsync
   (
      This       : access IFileLoggingSession_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_LogFileGenerated
   (
      This       : access IFileLoggingSession_Interface
      ; handler : TypedEventHandler_IFileLoggingSession_add_LogFileGenerated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LogFileGenerated
   (
      This       : access IFileLoggingSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileLoggingSessionFactory : aliased constant Windows.IID := (4003499470, 33863, 19882, (145, 51, 18, 235, 70, 246, 151, 212 ));
   
   type IFileLoggingSessionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IFileLoggingSessionFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Foundation.Diagnostics.IFileLoggingSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IErrorDetails : aliased constant Windows.IID := (2600800365, 30688, 23588, (130, 176, 155, 45, 200, 247, 150, 113 ));
   
   type IAsyncOperation_IErrorDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IErrorDetails_Interface
      ; handler : Windows.Foundation.Diagnostics.AsyncOperationCompletedHandler_IErrorDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IErrorDetails_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.AsyncOperationCompletedHandler_IErrorDetails
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IErrorDetails_Interface
      ; RetVal : access Windows.Foundation.Diagnostics.IErrorDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_ITracingStatusChangedEventArgs : aliased constant Windows.IID := (737308680, 11956, 22133, (177, 205, 233, 144, 108, 197, 206, 100 ));
   
   type EventHandler_ITracingStatusChangedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Foundation.Diagnostics.ITracingStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_ITracingStatusChangedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_ITracingStatusChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Foundation.Diagnostics.ITracingStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IErrorDetails : aliased constant Windows.IID := (2795077533, 29077, 22898, (142, 205, 28, 115, 170, 92, 179, 18 ));
   
   type AsyncOperationCompletedHandler_IErrorDetails_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IErrorDetails'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IErrorDetails_Interface
      ; asyncInfo : Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILoggingChannel_add_LoggingEnabled : aliased constant Windows.IID := (1388954273, 21667, 24313, (154, 255, 1, 78, 124, 69, 70, 85 ));
   
   type TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface(Callback : access procedure (sender : Windows.Foundation.Diagnostics.ILoggingChannel ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILoggingChannel_add_LoggingEnabled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILoggingChannel_add_LoggingEnabled_Interface
      ; sender : Windows.Foundation.Diagnostics.ILoggingChannel
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IFileLoggingSession_add_LogFileGenerated : aliased constant Windows.IID := (207971248, 40331, 23392, (153, 75, 222, 225, 23, 77, 30, 251 ));
   
   type TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface(Callback : access procedure (sender : Windows.Foundation.Diagnostics.IFileLoggingSession ; args : Windows.Foundation.Diagnostics.ILogFileGeneratedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IFileLoggingSession_add_LogFileGenerated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IFileLoggingSession_add_LogFileGenerated_Interface
      ; sender : Windows.Foundation.Diagnostics.IFileLoggingSession
      ; args : Windows.Foundation.Diagnostics.ILogFileGeneratedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype TracingStatusChangedEventArgs is Windows.Foundation.Diagnostics.ITracingStatusChangedEventArgs;
   subtype RuntimeBrokerErrorSettings is Windows.Foundation.Diagnostics.IErrorReportingSettings;
   function CreateRuntimeBrokerErrorSettings return Windows.Foundation.Diagnostics.IErrorReportingSettings;
   
   subtype ErrorDetails is Windows.Foundation.Diagnostics.IErrorDetails;
   subtype LoggingOptions is Windows.Foundation.Diagnostics.ILoggingOptions;
   function CreateLoggingOptions return Windows.Foundation.Diagnostics.ILoggingOptions;
   
   function CreateWithKeywords
   (
      keywords : Windows.Int64
   )
   return Windows.Foundation.Diagnostics.ILoggingOptions;
   
   subtype LoggingChannelOptions is Windows.Foundation.Diagnostics.ILoggingChannelOptions;
   function CreateLoggingChannelOptions return Windows.Foundation.Diagnostics.ILoggingChannelOptions;
   
   function Create
   (
      group : Windows.Guid
   )
   return Windows.Foundation.Diagnostics.ILoggingChannelOptions;
   
   subtype LoggingFields is Windows.Foundation.Diagnostics.ILoggingFields;
   function CreateLoggingFields return Windows.Foundation.Diagnostics.ILoggingFields;
   
   subtype LoggingActivity is Windows.Foundation.Diagnostics.ILoggingActivity;
   function CreateLoggingActivity
   (
      activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
   )
   return Windows.Foundation.Diagnostics.ILoggingActivity;
   
   function CreateLoggingActivityWithLevel
   (
      activityName : Windows.String
      ; loggingChannel : Windows.Foundation.Diagnostics.ILoggingChannel
      ; level : Windows.Foundation.Diagnostics.LoggingLevel
   )
   return Windows.Foundation.Diagnostics.ILoggingActivity;
   
   subtype LoggingChannel is Windows.Foundation.Diagnostics.ILoggingChannel;
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel;
   
   function CreateWithOptions
   (
      name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel;
   
   function CreateWithOptionsAndId
   (
      name : Windows.String
      ; options : Windows.Foundation.Diagnostics.ILoggingChannelOptions
      ; id : Windows.Guid
   )
   return Windows.Foundation.Diagnostics.ILoggingChannel;
   
   subtype LoggingSession is Windows.Foundation.Diagnostics.ILoggingSession;
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.ILoggingSession;
   
   subtype LogFileGeneratedEventArgs is Windows.Foundation.Diagnostics.ILogFileGeneratedEventArgs;
   subtype FileLoggingSession is Windows.Foundation.Diagnostics.IFileLoggingSession;
   function Create
   (
      name : Windows.String
   )
   return Windows.Foundation.Diagnostics.IFileLoggingSession;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
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
   ;
   
   procedure TraceOperationCompletion
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; status : Windows.Foundation.AsyncStatus
   )
   ;
   
   procedure TraceOperationRelation
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; relation : Windows.Foundation.Diagnostics.CausalityRelation
   )
   ;
   
   procedure TraceSynchronousWorkStart
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; platformId : Windows.Guid
      ; operationId : Windows.UInt64
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   ;
   
   procedure TraceSynchronousWorkCompletion
   (
      traceLevel : Windows.Foundation.Diagnostics.CausalityTraceLevel
      ; source : Windows.Foundation.Diagnostics.CausalitySource
      ; work : Windows.Foundation.Diagnostics.CausalitySynchronousWork
   )
   ;
   
   function add_TracingStatusChanged
   (
      handler : Windows.Foundation.Diagnostics.EventHandler_ITracingStatusChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_TracingStatusChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function CreateFromHResultAsync
   (
      errorCode : Windows.Int32
   )
   return Windows.Foundation.Diagnostics.IAsyncOperation_IErrorDetails;
   
end;
