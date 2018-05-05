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
with Windows.Foundation;
limited with Windows.Graphics.Printing.PrintTicket;
limited with Windows.Storage.Streams;
limited with Windows.System;
limited with Windows.ApplicationModel.Activation;
--------------------------------------------------------------------------------
package Windows.Graphics.Printing.Workflow is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PrintWorkflowSessionStatus is (
      Started,
      Completed,
      Aborted,
      Closed
   );
   for PrintWorkflowSessionStatus use (
      Started => 0,
      Completed => 1,
      Aborted => 2,
      Closed => 3
   );
   for PrintWorkflowSessionStatus'Size use 32;
   
   type PrintWorkflowSessionStatus_Ptr is access PrintWorkflowSessionStatus;
   
   type PrintWorkflowSubmittedStatus is (
      Succeeded,
      Canceled,
      Failed
   );
   for PrintWorkflowSubmittedStatus use (
      Succeeded => 0,
      Canceled => 1,
      Failed => 2
   );
   for PrintWorkflowSubmittedStatus'Size use 32;
   
   type PrintWorkflowSubmittedStatus_Ptr is access PrintWorkflowSubmittedStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Interface;
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested is access all TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Interface'Class;
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Ptr is access all TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested;
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Interface;
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted is access all TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Interface'Class;
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Ptr is access all TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Interface;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested is access all TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Interface'Class;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Ptr is access all TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Interface;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable is access all TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Interface'Class;
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Ptr is access all TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrintWorkflowBackgroundSession_Interface;
   type IPrintWorkflowBackgroundSession is access all IPrintWorkflowBackgroundSession_Interface'Class;
   type IPrintWorkflowBackgroundSession_Ptr is access all IPrintWorkflowBackgroundSession;
   type IPrintWorkflowConfiguration_Interface;
   type IPrintWorkflowConfiguration is access all IPrintWorkflowConfiguration_Interface'Class;
   type IPrintWorkflowConfiguration_Ptr is access all IPrintWorkflowConfiguration;
   type IPrintWorkflowForegroundSession_Interface;
   type IPrintWorkflowForegroundSession is access all IPrintWorkflowForegroundSession_Interface'Class;
   type IPrintWorkflowForegroundSession_Ptr is access all IPrintWorkflowForegroundSession;
   type IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface;
   type IPrintWorkflowBackgroundSetupRequestedEventArgs is access all IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface'Class;
   type IPrintWorkflowBackgroundSetupRequestedEventArgs_Ptr is access all IPrintWorkflowBackgroundSetupRequestedEventArgs;
   type IPrintWorkflowForegroundSetupRequestedEventArgs_Interface;
   type IPrintWorkflowForegroundSetupRequestedEventArgs is access all IPrintWorkflowForegroundSetupRequestedEventArgs_Interface'Class;
   type IPrintWorkflowForegroundSetupRequestedEventArgs_Ptr is access all IPrintWorkflowForegroundSetupRequestedEventArgs;
   type IPrintWorkflowSubmittedOperation_Interface;
   type IPrintWorkflowSubmittedOperation is access all IPrintWorkflowSubmittedOperation_Interface'Class;
   type IPrintWorkflowSubmittedOperation_Ptr is access all IPrintWorkflowSubmittedOperation;
   type IPrintWorkflowSubmittedEventArgs_Interface;
   type IPrintWorkflowSubmittedEventArgs is access all IPrintWorkflowSubmittedEventArgs_Interface'Class;
   type IPrintWorkflowSubmittedEventArgs_Ptr is access all IPrintWorkflowSubmittedEventArgs;
   type IPrintWorkflowTarget_Interface;
   type IPrintWorkflowTarget is access all IPrintWorkflowTarget_Interface'Class;
   type IPrintWorkflowTarget_Ptr is access all IPrintWorkflowTarget;
   type IPrintWorkflowUIActivatedEventArgs_Interface;
   type IPrintWorkflowUIActivatedEventArgs is access all IPrintWorkflowUIActivatedEventArgs_Interface'Class;
   type IPrintWorkflowUIActivatedEventArgs_Ptr is access all IPrintWorkflowUIActivatedEventArgs;
   type IPrintWorkflowXpsDataAvailableEventArgs_Interface;
   type IPrintWorkflowXpsDataAvailableEventArgs is access all IPrintWorkflowXpsDataAvailableEventArgs_Interface'Class;
   type IPrintWorkflowXpsDataAvailableEventArgs_Ptr is access all IPrintWorkflowXpsDataAvailableEventArgs;
   type IPrintWorkflowSourceContent_Interface;
   type IPrintWorkflowSourceContent is access all IPrintWorkflowSourceContent_Interface'Class;
   type IPrintWorkflowSourceContent_Ptr is access all IPrintWorkflowSourceContent;
   type IPrintWorkflowSpoolStreamContent_Interface;
   type IPrintWorkflowSpoolStreamContent is access all IPrintWorkflowSpoolStreamContent_Interface'Class;
   type IPrintWorkflowSpoolStreamContent_Ptr is access all IPrintWorkflowSpoolStreamContent;
   type IPrintWorkflowObjectModelSourceFileContent_Interface;
   type IPrintWorkflowObjectModelSourceFileContent is access all IPrintWorkflowObjectModelSourceFileContent_Interface'Class;
   type IPrintWorkflowObjectModelSourceFileContent_Ptr is access all IPrintWorkflowObjectModelSourceFileContent;
   type IPrintWorkflowStreamTarget_Interface;
   type IPrintWorkflowStreamTarget is access all IPrintWorkflowStreamTarget_Interface'Class;
   type IPrintWorkflowStreamTarget_Ptr is access all IPrintWorkflowStreamTarget;
   type IPrintWorkflowTriggerDetails_Interface;
   type IPrintWorkflowTriggerDetails is access all IPrintWorkflowTriggerDetails_Interface'Class;
   type IPrintWorkflowTriggerDetails_Ptr is access all IPrintWorkflowTriggerDetails;
   type IPrintWorkflowObjectModelTargetPackage_Interface;
   type IPrintWorkflowObjectModelTargetPackage is access all IPrintWorkflowObjectModelTargetPackage_Interface'Class;
   type IPrintWorkflowObjectModelTargetPackage_Ptr is access all IPrintWorkflowObjectModelTargetPackage;
   type IActivatedEventArgsWithUser_Imported_Interface;
   type IActivatedEventArgsWithUser_Imported is access all IActivatedEventArgsWithUser_Imported_Interface'Class;
   type IActivatedEventArgsWithUser_Imported_Ptr is access all IActivatedEventArgsWithUser_Imported;
   type IActivatedEventArgs_Imported_Interface;
   type IActivatedEventArgs_Imported is access all IActivatedEventArgs_Imported_Interface'Class;
   type IActivatedEventArgs_Imported_Ptr is access all IActivatedEventArgs_Imported;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowBackgroundSession : aliased constant Windows.IID := (1534661562, 3166, 21130, (116, 88, 134, 164, 108, 189, 220, 69 ));
   
   type IPrintWorkflowBackgroundSession_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SetupRequested
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
      ; setupEventHandler : TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SetupRequested
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Submitted
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
      ; submittedEventHandler : TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Submitted
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.PrintWorkflowSessionStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPrintWorkflowBackgroundSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowConfiguration : aliased constant Windows.IID := (3500852461, 64843, 24053, (75, 182, 141, 13, 21, 158, 190, 63 ));
   
   type IPrintWorkflowConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceAppDisplayName
   (
      This       : access IPrintWorkflowConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JobTitle
   (
      This       : access IPrintWorkflowConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionId
   (
      This       : access IPrintWorkflowConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowForegroundSession : aliased constant Windows.IID := (3348849616, 63724, 19691, (149, 58, 200, 135, 97, 87, 221, 51 ));
   
   type IPrintWorkflowForegroundSession_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SetupRequested
   (
      This       : access IPrintWorkflowForegroundSession_Interface
      ; setupEventHandler : TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SetupRequested
   (
      This       : access IPrintWorkflowForegroundSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_XpsDataAvailable
   (
      This       : access IPrintWorkflowForegroundSession_Interface
      ; xpsDataAvailableEventHandler : TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_XpsDataAvailable
   (
      This       : access IPrintWorkflowForegroundSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPrintWorkflowForegroundSession_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.PrintWorkflowSessionStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPrintWorkflowForegroundSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowBackgroundSetupRequestedEventArgs : aliased constant Windows.IID := (1139372866, 5968, 22985, (97, 251, 56, 55, 72, 162, 3, 98 ));
   
   type IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetUserPrintTicketAsync
   (
      This       : access IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicket -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function SetRequiresUI
   (
      This       : access IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintWorkflowBackgroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowForegroundSetupRequestedEventArgs : aliased constant Windows.IID := (3152249415, 39963, 19923, (155, 43, 200, 4, 104, 217, 65, 179 ));
   
   type IPrintWorkflowForegroundSetupRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetUserPrintTicketAsync
   (
      This       : access IPrintWorkflowForegroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicket -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IPrintWorkflowForegroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintWorkflowForegroundSetupRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowSubmittedOperation : aliased constant Windows.IID := (776888854, 15329, 24335, (92, 129, 165, 162, 189, 78, 171, 14 ));
   
   type IPrintWorkflowSubmittedOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPrintWorkflowSubmittedOperation_Interface
      ; status : Windows.Graphics.Printing.Workflow.PrintWorkflowSubmittedStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IPrintWorkflowSubmittedOperation_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_XpsContent
   (
      This       : access IPrintWorkflowSubmittedOperation_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowSourceContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowSubmittedEventArgs : aliased constant Windows.IID := (987564609, 14228, 21865, (92, 135, 64, 232, 255, 114, 15, 131 ));
   
   type IPrintWorkflowSubmittedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IPrintWorkflowSubmittedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetTarget
   (
      This       : access IPrintWorkflowSubmittedEventArgs_Interface
      ; jobPrintTicket : Windows.Graphics.Printing.PrintTicket.IWorkflowPrintTicket
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowTarget
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintWorkflowSubmittedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowTarget : aliased constant Windows.IID := (702162796, 2675, 23277, (79, 61, 151, 13, 50, 81, 240, 87 ));
   
   type IPrintWorkflowTarget_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetAsStream
   (
      This       : access IPrintWorkflowTarget_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowStreamTarget
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetAsXpsObjectModelPackage
   (
      This       : access IPrintWorkflowTarget_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowObjectModelTargetPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowUIActivatedEventArgs : aliased constant Windows.IID := (3163194445, 2539, 22342, (114, 166, 141, 200, 181, 237, 190, 155 ));
   
   type IPrintWorkflowUIActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrintWorkflowSession
   (
      This       : access IPrintWorkflowUIActivatedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowXpsDataAvailableEventArgs : aliased constant Windows.IID := (1293009713, 21713, 17230, (190, 14, 130, 197, 250, 88, 229, 178 ));
   
   type IPrintWorkflowXpsDataAvailableEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IPrintWorkflowXpsDataAvailableEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPrintWorkflowXpsDataAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowSourceContent : aliased constant Windows.IID := (438879809, 52913, 17715, (187, 115, 251, 230, 62, 239, 219, 24 ));
   
   type IPrintWorkflowSourceContent_Interface is interface and Windows.IInspectable_Interface;
   
   function GetJobPrintTicketAsync
   (
      This       : access IPrintWorkflowSourceContent_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintTicket.IAsyncOperation_IWorkflowPrintTicket -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSourceSpoolDataAsStreamContent
   (
      This       : access IPrintWorkflowSourceContent_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowSpoolStreamContent
   )
   return Windows.HRESULT is abstract;
   
   function GetSourceSpoolDataAsXpsObjectModel
   (
      This       : access IPrintWorkflowSourceContent_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowObjectModelSourceFileContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowSpoolStreamContent : aliased constant Windows.IID := (1927634638, 58374, 19316, (132, 225, 63, 243, 253, 205, 175, 112 ));
   
   type IPrintWorkflowSpoolStreamContent_Interface is interface and Windows.IInspectable_Interface;
   
   function GetInputStream
   (
      This       : access IPrintWorkflowSpoolStreamContent_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowObjectModelSourceFileContent : aliased constant Windows.IID := (3278670442, 35370, 16794, (179, 195, 32, 144, 230, 191, 171, 47 ));
   
   type IPrintWorkflowObjectModelSourceFileContent_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowStreamTarget : aliased constant Windows.IID := (2990258820, 34149, 18571, (152, 57, 28, 158, 124, 122, 169, 22 ));
   
   type IPrintWorkflowStreamTarget_Interface is interface and Windows.IInspectable_Interface;
   
   function GetOutputStream
   (
      This       : access IPrintWorkflowStreamTarget_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowTriggerDetails : aliased constant Windows.IID := (1463408744, 40326, 16466, (176, 203, 243, 16, 190, 205, 89, 187 ));
   
   type IPrintWorkflowTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrintWorkflowSession
   (
      This       : access IPrintWorkflowTriggerDetails_Interface
      ; RetVal : access Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintWorkflowObjectModelTargetPackage : aliased constant Windows.IID := (2107030644, 39764, 19617, (173, 58, 151, 156, 61, 68, 221, 172 ));
   
   type IPrintWorkflowObjectModelTargetPackage_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   type IActivatedEventArgsWithUser_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IActivatedEventArgsWithUser_Imported_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ActivationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousExecutionState
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ApplicationExecutionState
   )
   return Windows.HRESULT is abstract;
   
   function get_SplashScreen
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ISplashScreen
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested : aliased constant Windows.IID := (3143370129, 19217, 20764, (142, 243, 24, 34, 203, 113, 66, 124 ));
   
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSetupRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowBackgroundSession_add_SetupRequested_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSetupRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted : aliased constant Windows.IID := (2663888227, 20548, 24051, (152, 181, 58, 86, 67, 252, 89, 254 ));
   
   type TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowBackgroundSession_add_Submitted_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested : aliased constant Windows.IID := (3629861104, 38411, 24421, (152, 177, 95, 155, 9, 254, 178, 246 ));
   
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSetupRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowForegroundSession_add_SetupRequested_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSetupRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable : aliased constant Windows.IID := (1832430377, 11187, 22601, (128, 205, 236, 225, 58, 88, 157, 19 ));
   
   type TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Interface(Callback : access procedure (sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowXpsDataAvailableEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPrintWorkflowForegroundSession_add_XpsDataAvailable_Interface
      ; sender : Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession
      ; args : Windows.Graphics.Printing.Workflow.IPrintWorkflowXpsDataAvailableEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintWorkflowBackgroundSession is Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSession;
   subtype PrintWorkflowBackgroundSetupRequestedEventArgs is Windows.Graphics.Printing.Workflow.IPrintWorkflowBackgroundSetupRequestedEventArgs;
   subtype PrintWorkflowSubmittedEventArgs is Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedEventArgs;
   subtype PrintWorkflowForegroundSession is Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSession;
   subtype PrintWorkflowForegroundSetupRequestedEventArgs is Windows.Graphics.Printing.Workflow.IPrintWorkflowForegroundSetupRequestedEventArgs;
   subtype PrintWorkflowXpsDataAvailableEventArgs is Windows.Graphics.Printing.Workflow.IPrintWorkflowXpsDataAvailableEventArgs;
   subtype PrintWorkflowConfiguration is Windows.Graphics.Printing.Workflow.IPrintWorkflowConfiguration;
   subtype PrintWorkflowSourceContent is Windows.Graphics.Printing.Workflow.IPrintWorkflowSourceContent;
   subtype PrintWorkflowSubmittedOperation is Windows.Graphics.Printing.Workflow.IPrintWorkflowSubmittedOperation;
   subtype PrintWorkflowTarget is Windows.Graphics.Printing.Workflow.IPrintWorkflowTarget;
   subtype PrintWorkflowStreamTarget is Windows.Graphics.Printing.Workflow.IPrintWorkflowStreamTarget;
   subtype PrintWorkflowObjectModelTargetPackage is Windows.Graphics.Printing.Workflow.IPrintWorkflowObjectModelTargetPackage;
   subtype PrintWorkflowSpoolStreamContent is Windows.Graphics.Printing.Workflow.IPrintWorkflowSpoolStreamContent;
   subtype PrintWorkflowObjectModelSourceFileContent is Windows.Graphics.Printing.Workflow.IPrintWorkflowObjectModelSourceFileContent;
   subtype PrintWorkflowUIActivatedEventArgs is Windows.Graphics.Printing.Workflow.IPrintWorkflowUIActivatedEventArgs;
   subtype PrintWorkflowTriggerDetails is Windows.Graphics.Printing.Workflow.IPrintWorkflowTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
