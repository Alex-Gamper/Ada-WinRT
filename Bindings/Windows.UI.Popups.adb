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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Popups is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access UICommandInvokedHandler_Interface
      ; command : Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(command);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUICommand_Interface
      ; asyncInfo : Windows.UI.Popups.IAsyncOperation_IUICommand
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      content : Windows.String
   )
   return Windows.UI.Popups.IMessageDialog is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.MessageDialog");
      m_Factory     : Windows.UI.Popups.IMessageDialogFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IMessageDialog := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMessageDialogFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTitle
   (
      content : Windows.String
      ; title : Windows.String
   )
   return Windows.UI.Popups.IMessageDialog is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.MessageDialog");
      m_Factory     : Windows.UI.Popups.IMessageDialogFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IMessageDialog := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMessageDialogFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTitle(content, title, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUICommand return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.UICommand");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Popups.IUICommand) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Popups.IID_IUICommand'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      label : Windows.String
   )
   return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.UICommand");
      m_Factory     : Windows.UI.Popups.IUICommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IUICommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUICommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(label, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithHandler
   (
      label : Windows.String
      ; action : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.UICommand");
      m_Factory     : Windows.UI.Popups.IUICommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IUICommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUICommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithHandler(label, action, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithHandlerAndId
   (
      label : Windows.String
      ; action : Windows.UI.Popups.UICommandInvokedHandler
      ; commandId : Windows.Object
   )
   return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.UICommand");
      m_Factory     : Windows.UI.Popups.IUICommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IUICommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUICommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithHandlerAndId(label, action, commandId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUICommandSeparator return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.UICommandSeparator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Popups.IUICommand) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Popups.IID_IUICommand'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePopupMenu return Windows.UI.Popups.IPopupMenu is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Popups.PopupMenu");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Popups.IPopupMenu) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Popups.IID_IPopupMenu'Access, RetVal'access);
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
   
end;
