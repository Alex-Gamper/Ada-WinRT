--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Storage.Pickers.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AddFileResult is (
      Added,
      AlreadyAdded,
      NotAllowed,
      Unavailable
   );
   for AddFileResult use (
      Added => 0,
      AlreadyAdded => 1,
      NotAllowed => 2,
      Unavailable => 3
   );
   for AddFileResult'Size use 32;
   
   type AddFileResult_Ptr is access AddFileResult;
   
   type FileSelectionMode is (
      Single,
      Multiple
   );
   for FileSelectionMode use (
      Single => 0,
      Multiple => 1
   );
   for FileSelectionMode'Size use 32;
   
   type FileSelectionMode_Ptr is access FileSelectionMode;
   
   type SetFileNameResult is (
      Succeeded,
      NotAllowed,
      Unavailable
   );
   for SetFileNameResult use (
      Succeeded => 0,
      NotAllowed => 1,
      Unavailable => 2
   );
   for SetFileNameResult'Size use 32;
   
   type SetFileNameResult_Ptr is access SetFileNameResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Interface;
   type TypedEventHandler_IFileOpenPickerUI_add_FileRemoved is access all TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Interface'Class;
   type TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Ptr is access all TypedEventHandler_IFileOpenPickerUI_add_FileRemoved;
   type TypedEventHandler_IFileOpenPickerUI_add_Closing_Interface;
   type TypedEventHandler_IFileOpenPickerUI_add_Closing is access all TypedEventHandler_IFileOpenPickerUI_add_Closing_Interface'Class;
   type TypedEventHandler_IFileOpenPickerUI_add_Closing_Ptr is access all TypedEventHandler_IFileOpenPickerUI_add_Closing;
   type TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Interface;
   type TypedEventHandler_IFileSavePickerUI_add_FileNameChanged is access all TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Interface'Class;
   type TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Ptr is access all TypedEventHandler_IFileSavePickerUI_add_FileNameChanged;
   type TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Interface;
   type TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested is access all TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Interface'Class;
   type TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Ptr is access all TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IFileRemovedEventArgs_Interface;
   type IFileRemovedEventArgs is access all IFileRemovedEventArgs_Interface'Class;
   type IFileRemovedEventArgs_Ptr is access all IFileRemovedEventArgs;
   type IFileOpenPickerUI_Interface;
   type IFileOpenPickerUI is access all IFileOpenPickerUI_Interface'Class;
   type IFileOpenPickerUI_Ptr is access all IFileOpenPickerUI;
   type IPickerClosingEventArgs_Interface;
   type IPickerClosingEventArgs is access all IPickerClosingEventArgs_Interface'Class;
   type IPickerClosingEventArgs_Ptr is access all IPickerClosingEventArgs;
   type IPickerClosingOperation_Interface;
   type IPickerClosingOperation is access all IPickerClosingOperation_Interface'Class;
   type IPickerClosingOperation_Ptr is access all IPickerClosingOperation;
   type IPickerClosingDeferral_Interface;
   type IPickerClosingDeferral is access all IPickerClosingDeferral_Interface'Class;
   type IPickerClosingDeferral_Ptr is access all IPickerClosingDeferral;
   type IFileSavePickerUI_Interface;
   type IFileSavePickerUI is access all IFileSavePickerUI_Interface'Class;
   type IFileSavePickerUI_Ptr is access all IFileSavePickerUI;
   type ITargetFileRequestedEventArgs_Interface;
   type ITargetFileRequestedEventArgs is access all ITargetFileRequestedEventArgs_Interface'Class;
   type ITargetFileRequestedEventArgs_Ptr is access all ITargetFileRequestedEventArgs;
   type ITargetFileRequest_Interface;
   type ITargetFileRequest is access all ITargetFileRequest_Interface'Class;
   type ITargetFileRequest_Ptr is access all ITargetFileRequest;
   type ITargetFileRequestDeferral_Interface;
   type ITargetFileRequestDeferral is access all ITargetFileRequestDeferral_Interface'Class;
   type ITargetFileRequestDeferral_Ptr is access all ITargetFileRequestDeferral;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IFileRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IFileRemovedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileRemovedEventArgs : aliased constant Windows.IID := (319045031, 32714, 19499, (158, 202, 104, 144, 249, 240, 1, 133 ));
   
   ------------------------------------------------------------------------
   type IFileOpenPickerUI_Interface is interface and Windows.IInspectable_Interface;
   
   function AddFile
   (
      This       : access IFileOpenPickerUI_Interface
      ; id : Windows.String
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Storage.Pickers.Provider.AddFileResult
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFile
   (
      This       : access IFileOpenPickerUI_Interface
      ; id : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ContainsFile
   (
      This       : access IFileOpenPickerUI_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CanAddFile
   (
      This       : access IFileOpenPickerUI_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowedFileTypes
   (
      This       : access IFileOpenPickerUI_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionMode
   (
      This       : access IFileOpenPickerUI_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.FileSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SettingsIdentifier
   (
      This       : access IFileOpenPickerUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IFileOpenPickerUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IFileOpenPickerUI_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_FileRemoved
   (
      This       : access IFileOpenPickerUI_Interface
      ; handler : TypedEventHandler_IFileOpenPickerUI_add_FileRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FileRemoved
   (
      This       : access IFileOpenPickerUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closing
   (
      This       : access IFileOpenPickerUI_Interface
      ; handler : TypedEventHandler_IFileOpenPickerUI_add_Closing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closing
   (
      This       : access IFileOpenPickerUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileOpenPickerUI : aliased constant Windows.IID := (3718535696, 63956, 16580, (138, 245, 197, 182, 181, 166, 29, 29 ));
   
   ------------------------------------------------------------------------
   type IPickerClosingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClosingOperation
   (
      This       : access IPickerClosingEventArgs_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IPickerClosingOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access IPickerClosingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerClosingEventArgs : aliased constant Windows.IID := (2119823908, 45874, 20242, (139, 159, 168, 194, 240, 107, 50, 205 ));
   
   ------------------------------------------------------------------------
   type IPickerClosingOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IPickerClosingOperation_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IPickerClosingDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IPickerClosingOperation_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerClosingOperation : aliased constant Windows.IID := (1290402692, 48878, 20025, (167, 115, 252, 95, 14, 174, 50, 141 ));
   
   ------------------------------------------------------------------------
   type IPickerClosingDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPickerClosingDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IPickerClosingDeferral : aliased constant Windows.IID := (2063071006, 6759, 18993, (174, 128, 233, 7, 112, 138, 97, 155 ));
   
   ------------------------------------------------------------------------
   type IFileSavePickerUI_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IFileSavePickerUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IFileSavePickerUI_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowedFileTypes
   (
      This       : access IFileSavePickerUI_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SettingsIdentifier
   (
      This       : access IFileSavePickerUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileName
   (
      This       : access IFileSavePickerUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TrySetFileName
   (
      This       : access IFileSavePickerUI_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Storage.Pickers.Provider.SetFileNameResult
   )
   return Windows.HRESULT is abstract;
   
   function add_FileNameChanged
   (
      This       : access IFileSavePickerUI_Interface
      ; handler : TypedEventHandler_IFileSavePickerUI_add_FileNameChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FileNameChanged
   (
      This       : access IFileSavePickerUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TargetFileRequested
   (
      This       : access IFileSavePickerUI_Interface
      ; handler : TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TargetFileRequested
   (
      This       : access IFileSavePickerUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileSavePickerUI : aliased constant Windows.IID := (2522268135, 15958, 17356, (138, 57, 51, 199, 61, 157, 84, 43 ));
   
   ------------------------------------------------------------------------
   type ITargetFileRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ITargetFileRequestedEventArgs_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.ITargetFileRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_ITargetFileRequestedEventArgs : aliased constant Windows.IID := (2976111553, 6993, 19593, (165, 145, 15, 212, 11, 60, 87, 201 ));
   
   ------------------------------------------------------------------------
   type ITargetFileRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetFile
   (
      This       : access ITargetFileRequest_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetFile
   (
      This       : access ITargetFileRequest_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ITargetFileRequest_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.ITargetFileRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_ITargetFileRequest : aliased constant Windows.IID := (1119695701, 32648, 18315, (142, 129, 105, 11, 32, 52, 6, 120 ));
   
   ------------------------------------------------------------------------
   type ITargetFileRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ITargetFileRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ITargetFileRequestDeferral : aliased constant Windows.IID := (1257151889, 48917, 19881, (149, 246, 246, 183, 213, 88, 34, 91 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Interface(Callback : access procedure (sender : Windows.Storage.Pickers.Provider.IFileOpenPickerUI ; args : Windows.Storage.Pickers.Provider.IFileRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFileOpenPickerUI_add_FileRemoved_Interface
      ; sender : Windows.Storage.Pickers.Provider.IFileOpenPickerUI
      ; args : Windows.Storage.Pickers.Provider.IFileRemovedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFileOpenPickerUI_add_FileRemoved : aliased constant Windows.IID := (4059769145, 26971, 24406, (132, 26, 165, 42, 125, 20, 133, 114 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFileOpenPickerUI_add_Closing_Interface(Callback : access procedure (sender : Windows.Storage.Pickers.Provider.IFileOpenPickerUI ; args : Windows.Storage.Pickers.Provider.IPickerClosingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFileOpenPickerUI_add_Closing_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFileOpenPickerUI_add_Closing_Interface
      ; sender : Windows.Storage.Pickers.Provider.IFileOpenPickerUI
      ; args : Windows.Storage.Pickers.Provider.IPickerClosingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFileOpenPickerUI_add_Closing : aliased constant Windows.IID := (721862060, 38971, 21842, (181, 201, 176, 153, 10, 45, 179, 161 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Interface(Callback : access procedure (sender : Windows.Storage.Pickers.Provider.IFileSavePickerUI ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFileSavePickerUI_add_FileNameChanged_Interface
      ; sender : Windows.Storage.Pickers.Provider.IFileSavePickerUI
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFileSavePickerUI_add_FileNameChanged : aliased constant Windows.IID := (4058424882, 63871, 21721, (158, 27, 167, 20, 237, 195, 255, 6 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Interface(Callback : access procedure (sender : Windows.Storage.Pickers.Provider.IFileSavePickerUI ; args : Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested_Interface
      ; sender : Windows.Storage.Pickers.Provider.IFileSavePickerUI
      ; args : Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFileSavePickerUI_add_TargetFileRequested : aliased constant Windows.IID := (3554801863, 17861, 21065, (179, 54, 161, 17, 191, 170, 152, 91 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype FileRemovedEventArgs is Windows.Storage.Pickers.Provider.IFileRemovedEventArgs;
   subtype FileOpenPickerUI is Windows.Storage.Pickers.Provider.IFileOpenPickerUI;
   subtype PickerClosingEventArgs is Windows.Storage.Pickers.Provider.IPickerClosingEventArgs;
   subtype PickerClosingOperation is Windows.Storage.Pickers.Provider.IPickerClosingOperation;
   subtype PickerClosingDeferral is Windows.Storage.Pickers.Provider.IPickerClosingDeferral;
   subtype FileSavePickerUI is Windows.Storage.Pickers.Provider.IFileSavePickerUI;
   subtype TargetFileRequestedEventArgs is Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs;
   subtype TargetFileRequest is Windows.Storage.Pickers.Provider.ITargetFileRequest;
   subtype TargetFileRequestDeferral is Windows.Storage.Pickers.Provider.ITargetFileRequestDeferral;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
