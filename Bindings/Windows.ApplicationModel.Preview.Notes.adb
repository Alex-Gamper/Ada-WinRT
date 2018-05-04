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
with Windows.Storage.Streams;
with Windows.Graphics.Imaging;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Preview.Notes is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_SystemLockStateChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_NotePlacementChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.ApplicationModel.Preview.Notes.INotePlacementChangedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview(sender), Windows.ApplicationModel.Preview.Notes.INotePlacementChangedPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_INotesWindowManagerPreview_add_NoteVisibilityChanged_Interface
      ; sender : Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview
      ; args : Windows.ApplicationModel.Preview.Notes.INoteVisibilityChangedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview(sender), Windows.ApplicationModel.Preview.Notes.INoteVisibilityChangedPreviewEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateNotesWindowManagerPreviewShowNoteOptions return Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Preview.Notes.NotesWindowManagerPreviewShowNoteOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreviewShowNoteOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Preview.Notes.IID_INotesWindowManagerPreviewShowNoteOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentApp
   return Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Preview.Notes.NotesWindowManagerPreview");
      m_Factory     : INotesWindowManagerPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Preview.Notes.INotesWindowManagerPreview;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INotesWindowManagerPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentApp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
