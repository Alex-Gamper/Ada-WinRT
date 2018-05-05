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
with Windows.Globalization;
with Windows.UI.ViewManagement;
with Windows.UI.Text;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Text.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext2_add_NotifyFocusLeaveCompleted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_TextRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextTextRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextTextRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_SelectionRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextSelectionRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextSelectionRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_LayoutRequested_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextLayoutRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextLayoutRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_TextUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextTextUpdatingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextTextUpdatingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_SelectionUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextSelectionUpdatingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextSelectionUpdatingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_FormatUpdating_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextFormatUpdatingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextFormatUpdatingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_CompositionStarted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextCompositionStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextCompositionStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_CompositionCompleted_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.UI.Text.Core.ICoreTextCompositionCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), Windows.UI.Text.Core.ICoreTextCompositionCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextEditContext_add_FocusRemoved_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextEditContext
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextEditContext(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreTextServicesManager_add_InputLanguageChanged_Interface
      ; sender : Windows.UI.Text.Core.ICoreTextServicesManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Text.Core.ICoreTextServicesManager(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.UI.Text.Core.ICoreTextServicesManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.Core.CoreTextServicesManager");
      m_Factory     : ICoreTextServicesManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.Core.ICoreTextServicesManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreTextServicesManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HiddenCharacter
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.Core.CoreTextServicesConstants");
      m_Factory     : ICoreTextServicesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreTextServicesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HiddenCharacter(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
