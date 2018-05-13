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
with Windows.UI;
with Windows.Web.UI;
with Windows.Web;
with Windows.Web.Http;
with Windows.Storage.Streams;
with Windows.ApplicationModel.DataTransfer;
with Windows.UI.Core;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.UI.Interop is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.Interop.IWebViewControlMoveFocusRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.UI.IWebViewControl(sender), Windows.Web.UI.Interop.IWebViewControlMoveFocusRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.Interop.IWebViewControlAcceleratorKeyPressedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.UI.IWebViewControl(sender), Windows.Web.UI.Interop.IWebViewControlAcceleratorKeyPressedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Interface
      ; sender : Windows.Web.UI.Interop.IWebViewControlProcess
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.UI.Interop.IWebViewControlProcess(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWebViewControlProcess return Windows.Web.UI.Interop.IWebViewControlProcess is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.UI.Interop.WebViewControlProcess");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Web.UI.Interop.IWebViewControlProcess) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.UI.Interop.IID_IWebViewControlProcess'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithOptions
   (
      processOptions : Windows.Web.UI.Interop.IWebViewControlProcessOptions
   )
   return Windows.Web.UI.Interop.IWebViewControlProcess is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.UI.Interop.WebViewControlProcess");
      m_Factory     : Windows.Web.UI.Interop.IWebViewControlProcessFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.UI.Interop.IWebViewControlProcess := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebViewControlProcessFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithOptions(processOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebViewControlProcessOptions return Windows.Web.UI.Interop.IWebViewControlProcessOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.UI.Interop.WebViewControlProcessOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Web.UI.Interop.IWebViewControlProcessOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.UI.Interop.IID_IWebViewControlProcessOptions'Access, RetVal'access);
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
