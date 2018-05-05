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
limited with Windows.Storage;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Media.AppRecording is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppRecordingSaveScreenshotOption is (
      None,
      HdrContentVisible
   );
   for AppRecordingSaveScreenshotOption use (
      None => 0,
      HdrContentVisible => 1
   );
   for AppRecordingSaveScreenshotOption'Size use 32;
   
   type AppRecordingSaveScreenshotOption_Ptr is access AppRecordingSaveScreenshotOption;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type AppRecordingContract is null record;
   pragma Convention (C_Pass_By_Copy , AppRecordingContract);
   
   type AppRecordingContract_Ptr is access AppRecordingContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IAppRecordingResult_Interface;
   type AsyncOperationCompletedHandler_IAppRecordingResult is access all AsyncOperationCompletedHandler_IAppRecordingResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAppRecordingResult_Ptr is access all AsyncOperationCompletedHandler_IAppRecordingResult;
   type AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult_Interface;
   type AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult is access all AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult_Ptr is access all AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppRecordingManager_Interface;
   type IAppRecordingManager is access all IAppRecordingManager_Interface'Class;
   type IAppRecordingManager_Ptr is access all IAppRecordingManager;
   type IAppRecordingManagerStatics_Interface;
   type IAppRecordingManagerStatics is access all IAppRecordingManagerStatics_Interface'Class;
   type IAppRecordingManagerStatics_Ptr is access all IAppRecordingManagerStatics;
   type IAppRecordingStatus_Interface;
   type IAppRecordingStatus is access all IAppRecordingStatus_Interface'Class;
   type IAppRecordingStatus_Ptr is access all IAppRecordingStatus;
   type IAppRecordingStatusDetails_Interface;
   type IAppRecordingStatusDetails is access all IAppRecordingStatusDetails_Interface'Class;
   type IAppRecordingStatusDetails_Ptr is access all IAppRecordingStatusDetails;
   type IAppRecordingResult_Interface;
   type IAppRecordingResult is access all IAppRecordingResult_Interface'Class;
   type IAppRecordingResult_Ptr is access all IAppRecordingResult;
   type IAppRecordingSaveScreenshotResult_Interface;
   type IAppRecordingSaveScreenshotResult is access all IAppRecordingSaveScreenshotResult_Interface'Class;
   type IAppRecordingSaveScreenshotResult_Ptr is access all IAppRecordingSaveScreenshotResult;
   type IAppRecordingSavedScreenshotInfo_Interface;
   type IAppRecordingSavedScreenshotInfo is access all IAppRecordingSavedScreenshotInfo_Interface'Class;
   type IAppRecordingSavedScreenshotInfo_Ptr is access all IAppRecordingSavedScreenshotInfo;
   type IAsyncOperation_IAppRecordingResult_Interface;
   type IAsyncOperation_IAppRecordingResult is access all IAsyncOperation_IAppRecordingResult_Interface'Class;
   type IAsyncOperation_IAppRecordingResult_Ptr is access all IAsyncOperation_IAppRecordingResult;
   type IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface;
   type IAsyncOperation_IAppRecordingSaveScreenshotResult is access all IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface'Class;
   type IAsyncOperation_IAppRecordingSaveScreenshotResult_Ptr is access all IAsyncOperation_IAppRecordingSaveScreenshotResult;
   type IIterator_IAppRecordingSavedScreenshotInfo_Interface;
   type IIterator_IAppRecordingSavedScreenshotInfo is access all IIterator_IAppRecordingSavedScreenshotInfo_Interface'Class;
   type IIterator_IAppRecordingSavedScreenshotInfo_Ptr is access all IIterator_IAppRecordingSavedScreenshotInfo;
   type IIterable_IAppRecordingSavedScreenshotInfo_Interface;
   type IIterable_IAppRecordingSavedScreenshotInfo is access all IIterable_IAppRecordingSavedScreenshotInfo_Interface'Class;
   type IIterable_IAppRecordingSavedScreenshotInfo_Ptr is access all IIterable_IAppRecordingSavedScreenshotInfo;
   type IVectorView_IAppRecordingSavedScreenshotInfo_Interface;
   type IVectorView_IAppRecordingSavedScreenshotInfo is access all IVectorView_IAppRecordingSavedScreenshotInfo_Interface'Class;
   type IVectorView_IAppRecordingSavedScreenshotInfo_Ptr is access all IVectorView_IAppRecordingSavedScreenshotInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingManager : aliased constant Windows.IID := (3890372726, 41028, 18658, (165, 18, 48, 148, 213, 116, 199, 204 ));
   
   type IAppRecordingManager_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access IAppRecordingManager_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingStatus
   )
   return Windows.HRESULT is abstract;
   
   function StartRecordingToFileAsync
   (
      This       : access IAppRecordingManager_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.AppRecording.IAsyncOperation_IAppRecordingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RecordTimeSpanToFileAsync
   (
      This       : access IAppRecordingManager_Interface
      ; startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.AppRecording.IAsyncOperation_IAppRecordingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedScreenshotMediaEncodingSubtypes
   (
      This       : access IAppRecordingManager_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveScreenshotToFilesAsync
   (
      This       : access IAppRecordingManager_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; filenamePrefix : Windows.String
      ; option : Windows.Media.AppRecording.AppRecordingSaveScreenshotOption
      ; requestedFormats : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Media.AppRecording.IAsyncOperation_IAppRecordingSaveScreenshotResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingManagerStatics : aliased constant Windows.IID := (1357318647, 14542, 19411, (157, 178, 231, 43, 190, 157, 225, 29 ));
   
   type IAppRecordingManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAppRecordingManagerStatics_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingStatus : aliased constant Windows.IID := (487376940, 48152, 19338, (166, 239, 18, 126, 250, 179, 181, 217 ));
   
   type IAppRecordingStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanRecord
   (
      This       : access IAppRecordingStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRecordTimeSpan
   (
      This       : access IAppRecordingStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HistoricalBufferDuration
   (
      This       : access IAppRecordingStatus_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IAppRecordingStatus_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingStatusDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingStatusDetails : aliased constant Windows.IID := (3040389552, 5357, 17426, (172, 69, 109, 103, 44, 156, 153, 73 ));
   
   type IAppRecordingStatusDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAnyAppBroadcasting
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCaptureResourceUnavailable
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGameStreamInProgress
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTimeSpanRecordingDisabled
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGpuConstrained
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAppInactive
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBlockedForApp
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledByUser
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledBySystem
   (
      This       : access IAppRecordingStatusDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingResult : aliased constant Windows.IID := (982517860, 50797, 18169, (178, 217, 91, 194, 218, 208, 112, 215 ));
   
   type IAppRecordingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Succeeded
   (
      This       : access IAppRecordingResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IAppRecordingResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppRecordingResult_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFileTruncated
   (
      This       : access IAppRecordingResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingSaveScreenshotResult : aliased constant Windows.IID := (2623245578, 2747, 17495, (170, 238, 36, 249, 193, 46, 199, 120 ));
   
   type IAppRecordingSaveScreenshotResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Succeeded
   (
      This       : access IAppRecordingSaveScreenshotResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IAppRecordingSaveScreenshotResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_SavedScreenshotInfos
   (
      This       : access IAppRecordingSaveScreenshotResult_Interface
      ; RetVal : access Windows.Media.AppRecording.IVectorView_IAppRecordingSavedScreenshotInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppRecordingSavedScreenshotInfo : aliased constant Windows.IID := (2607033610, 6298, 19712, (191, 37, 225, 187, 18, 73, 213, 148 ));
   
   type IAppRecordingSavedScreenshotInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaEncodingSubtype
   (
      This       : access IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppRecordingResult : aliased constant Windows.IID := (745719574, 12522, 21804, (170, 202, 81, 209, 35, 35, 78, 227 ));
   
   type IAsyncOperation_IAppRecordingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppRecordingResult_Interface
      ; handler : Windows.Media.AppRecording.AsyncOperationCompletedHandler_IAppRecordingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppRecordingResult_Interface
      ; RetVal : access Windows.Media.AppRecording.AsyncOperationCompletedHandler_IAppRecordingResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppRecordingResult_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppRecordingSaveScreenshotResult : aliased constant Windows.IID := (2689123646, 58916, 20779, (142, 7, 172, 78, 100, 57, 27, 42 ));
   
   type IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface
      ; handler : Windows.Media.AppRecording.AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface
      ; RetVal : access Windows.Media.AppRecording.AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppRecordingSaveScreenshotResult_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingSaveScreenshotResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppRecordingSavedScreenshotInfo : aliased constant Windows.IID := (1010855958, 6464, 24107, (136, 48, 197, 75, 236, 187, 224, 218 ));
   
   type IIterator_IAppRecordingSavedScreenshotInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppRecordingSavedScreenshotInfo_Interface
      ; items : Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppRecordingSavedScreenshotInfo : aliased constant Windows.IID := (3709273124, 31053, 20824, (169, 175, 104, 36, 53, 63, 145, 178 ));
   
   type IIterable_IAppRecordingSavedScreenshotInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.Media.AppRecording.IIterator_IAppRecordingSavedScreenshotInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppRecordingSavedScreenshotInfo : aliased constant Windows.IID := (1137194883, 45933, 23182, (185, 147, 225, 156, 130, 62, 108, 26 ));
   
   type IVectorView_IAppRecordingSavedScreenshotInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppRecordingSavedScreenshotInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppRecordingSavedScreenshotInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppRecordingSavedScreenshotInfo_Interface
      ; value : Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppRecordingSavedScreenshotInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppRecordingResult : aliased constant Windows.IID := (527386511, 27819, 22757, (129, 148, 152, 8, 60, 114, 221, 252 ));
   
   type AsyncOperationCompletedHandler_IAppRecordingResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.AppRecording.IAsyncOperation_IAppRecordingResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppRecordingResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppRecordingResult_Interface
      ; asyncInfo : Windows.Media.AppRecording.IAsyncOperation_IAppRecordingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult : aliased constant Windows.IID := (2384480195, 19677, 21508, (159, 104, 82, 157, 10, 53, 190, 101 ));
   
   type AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.AppRecording.IAsyncOperation_IAppRecordingSaveScreenshotResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppRecordingSaveScreenshotResult_Interface
      ; asyncInfo : Windows.Media.AppRecording.IAsyncOperation_IAppRecordingSaveScreenshotResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppRecordingStatus is Windows.Media.AppRecording.IAppRecordingStatus;
   subtype AppRecordingResult is Windows.Media.AppRecording.IAppRecordingResult;
   subtype AppRecordingSaveScreenshotResult is Windows.Media.AppRecording.IAppRecordingSaveScreenshotResult;
   subtype AppRecordingManager is Windows.Media.AppRecording.IAppRecordingManager;
   subtype AppRecordingStatusDetails is Windows.Media.AppRecording.IAppRecordingStatusDetails;
   subtype AppRecordingSavedScreenshotInfo is Windows.Media.AppRecording.IAppRecordingSavedScreenshotInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefault
   return Windows.Media.AppRecording.IAppRecordingManager;
   
end;
