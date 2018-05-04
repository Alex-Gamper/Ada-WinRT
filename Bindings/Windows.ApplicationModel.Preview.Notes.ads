--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
limited with Windows.Storage.Streams;
with Windows.Foundation;
limited with Windows.Graphics.Imaging;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Preview.Notes is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PreviewNotesContract is null record;
   pragma Convention (C_Pass_By_Copy , PreviewNotesContract);
   
   type PreviewNotesContract_Ptr is access PreviewNotesContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Interface;
   type TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged is access all TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Interface'Class;
   type TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Ptr is access all TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged;
   type TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Interface;
   type TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged is access all TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Interface'Class;
   type TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Ptr is access all TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged;
   type TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Interface;
   type TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged is access all TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Interface'Class;
   type TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Ptr is access all TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type INotePlacementChangedPreviewEventArgs_Interface;
   type INotePlacementChangedPreviewEventArgs is access all INotePlacementChangedPreviewEventArgs_Interface'Class;
   type INotePlacementChangedPreviewEventArgs_Ptr is access all INotePlacementChangedPreviewEventArgs;
   type INoteVisibilityChangedPreviewEventArgs_Interface;
   type INoteVisibilityChangedPreviewEventArgs is access all INoteVisibilityChangedPreviewEventArgs_Interface'Class;
   type INoteVisibilityChangedPreviewEventArgs_Ptr is access all INoteVisibilityChangedPreviewEventArgs;
   type INotesWindowManagerPreviewShowNoteOptions_Interface;
   type INotesWindowManagerPreviewShowNoteOptions is access all INotesWindowManagerPreviewShowNoteOptions_Interface'Class;
   type INotesWindowManagerPreviewShowNoteOptions_Ptr is access all INotesWindowManagerPreviewShowNoteOptions;
   type INotesWindowManagerPreview_Interface;
   type INotesWindowManagerPreview is access all INotesWindowManagerPreview_Interface'Class;
   type INotesWindowManagerPreview_Ptr is access all INotesWindowManagerPreview;
   type INotesWindowManagerPreview2_Interface;
   type INotesWindowManagerPreview2 is access all INotesWindowManagerPreview2_Interface'Class;
   type INotesWindowManagerPreview2_Ptr is access all INotesWindowManagerPreview2;
   type INotesWindowManagerPreviewStatics_Interface;
   type INotesWindowManagerPreviewStatics is access all INotesWindowManagerPreviewStatics_Interface'Class;
   type INotesWindowManagerPreviewStatics_Ptr is access all INotesWindowManagerPreviewStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_INotePlacementChangedPreviewEventArgs : aliased constant Windows.IID := (1226659767, 63360, 20095, (169, 57, 154, 76, 175, 150, 82, 20 ));
   
   type INotePlacementChangedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewId
   (
      This       : access INotePlacementChangedPreviewEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INoteVisibilityChangedPreviewEventArgs : aliased constant Windows.IID := (238314654, 14357, 20470, (131, 179, 161, 77, 23, 18, 14, 36 ));
   
   type INoteVisibilityChangedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewId
   (
      This       : access INoteVisibilityChangedPreviewEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVisible
   (
      This       : access INoteVisibilityChangedPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotesWindowManagerPreviewShowNoteOptions : aliased constant Windows.IID := (2288716246, 42670, 16391, (165, 109, 28, 167, 12, 132, 192, 210 ));
   
   type INotesWindowManagerPreviewShowNoteOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShowWithFocus
   (
      This       : access INotesWindowManagerPreviewShowNoteOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowWithFocus
   (
      This       : access INotesWindowManagerPreviewShowNoteOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotesWindowManagerPreview : aliased constant Windows.IID := (3693789758, 18512, 20243, (156, 199, 255, 72, 126, 253, 252, 222 ));
   
   type INotesWindowManagerPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsScreenLocked
   (
      This       : access INotesWindowManagerPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowNote
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ShowNoteRelativeTo
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
      ; anchorNoteViewId : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ShowNoteWithPlacement
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function HideNote
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetNotePlacement
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function TrySetNoteSize
   (
      This       : access INotesWindowManagerPreview_Interface
      ; noteViewId : Windows.Int32
      ; size : Windows.Foundation.Size
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetFocusToNextView
   (
      This       : access INotesWindowManagerPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetNotesThumbnailAsync
   (
      This       : access INotesWindowManagerPreview_Interface
      ; thumbnail : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_SystemLockStateChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; handler : TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SystemLockStateChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NotePlacementChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; handler : TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NotePlacementChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NoteVisibilityChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; handler : TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NoteVisibilityChanged
   (
      This       : access INotesWindowManagerPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotesWindowManagerPreview2 : aliased constant Windows.IID := (3992880714, 8020, 19209, (152, 35, 255, 71, 127, 111, 163, 188 ));
   
   type INotesWindowManagerPreview2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowNoteRelativeToWithOptions
   (
      This       : access INotesWindowManagerPreview2_Interface
      ; noteViewId : Windows.Int32
      ; anchorNoteViewId : Windows.Int32
      ; options : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions
   )
   return Windows.HRESULT is abstract;
   
   function ShowNoteWithPlacementWithOptions
   (
      This       : access INotesWindowManagerPreview2_Interface
      ; noteViewId : Windows.Int32
      ; data : Windows.Storage.Streams.IBuffer
      ; options : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions
   )
   return Windows.HRESULT is abstract;
   
   function SetFocusToPreviousView
   (
      This       : access INotesWindowManagerPreview2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetThumbnailImageForTaskSwitcherAsync
   (
      This       : access INotesWindowManagerPreview2_Interface
      ; bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotesWindowManagerPreviewStatics : aliased constant Windows.IID := (1718144136, 2702, 16679, (163, 142, 153, 84, 69, 134, 138, 120 ));
   
   type INotesWindowManagerPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentApp
   (
      This       : access INotesWindowManagerPreviewStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged : aliased constant Windows.IID := (1864848891, 27699, 21564, (154, 180, 222, 72, 107, 199, 191, 226 ));
   
   type TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged : aliased constant Windows.IID := (2727015111, 16402, 22937, (163, 34, 82, 54, 179, 13, 153, 95 ));
   
   type TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview ; args : Windows.ApplicationModel.Preview.Notes.INotePlacementChangedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.ApplicationModel.Preview.Notes.INotePlacementChangedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged : aliased constant Windows.IID := (383264200, 21105, 20936, (160, 15, 12, 251, 27, 2, 154, 182 ));
   
   type TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview ; args : Windows.ApplicationModel.Preview.Notes.INoteVisibilityChangedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.ApplicationModel.Preview.Notes.INoteVisibilityChangedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype NotePlacementChangedPreviewEventArgs is Windows.ApplicationModel.Preview.Notes.INotePlacementChangedPreviewEventArgs;
   subtype NoteVisibilityChangedPreviewEventArgs is Windows.ApplicationModel.Preview.Notes.INoteVisibilityChangedPreviewEventArgs;
   subtype NotesWindowManagerPreviewShowNoteOptions is Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions;
   function CreateNotesWindowManagerPreviewShowNoteOptions return Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions;
   
   subtype NotesWindowManagerPreview is Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentApp
   return Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview;
   
end;
