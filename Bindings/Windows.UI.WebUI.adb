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
with Windows.Devices.Printers.Extensions;
with Windows.ApplicationModel.Activation;
with Windows.ApplicationModel.Calls;
with Windows.ApplicationModel.Contacts.Provider;
with Windows.ApplicationModel.Contacts;
with Windows.ApplicationModel.Search;
with Windows.ApplicationModel.Wallet;
with Windows.ApplicationModel.Appointments.AppointmentsProvider;
with Windows.System;
with Windows.ApplicationModel.UserDataAccounts.Provider;
with Windows.Devices.Enumeration;
with Windows.Media.SpeechRecognition;
with Windows.ApplicationModel.DataTransfer.ShareTarget;
with Windows.Storage;
with Windows.Storage.Search;
with Windows.Storage.Pickers.Provider;
with Windows.Storage.Provider;
with Windows.Security.Authentication.Web;
with Windows.Security.Authentication.Web.Provider;
with Windows.ApplicationModel;
with Windows.ApplicationModel.Background;
with Windows.ApplicationModel.Core;
with Windows.Graphics.Printing;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.WebUI is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access ActivatedEventHandler_Interface
      ; sender : Windows.Object
      ; eventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, eventArgs);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ResumingEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SuspendingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ISuspendingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, e);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access LeavingBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, e);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EnteredBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, e);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access NavigatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.WebUI.IWebUINavigatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, e);
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
   
   function get_Current
   return Windows.UI.WebUI.IWebUIBackgroundTaskInstance is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIBackgroundTaskInstance");
      m_Factory     : IWebUIBackgroundTaskInstanceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.WebUI.IWebUIBackgroundTaskInstance;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIBackgroundTaskInstanceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestRestartAsync
   (
      launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestRestartAsync(launchArguments, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestRestartForUserAsync
   (
      user : Windows.System.IUser
      ; launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestRestartForUserAsync(user, launchArguments, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_LeavingBackground
   (
      handler : Windows.UI.WebUI.LeavingBackgroundEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_LeavingBackground(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_LeavingBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_LeavingBackground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_EnteredBackground
   (
      handler : Windows.UI.WebUI.EnteredBackgroundEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_EnteredBackground(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_EnteredBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_EnteredBackground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure EnablePrelaunch
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EnablePrelaunch(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Activated
   (
      handler : Windows.UI.WebUI.ActivatedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Activated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Activated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Activated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Suspending
   (
      handler : Windows.UI.WebUI.SuspendingEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Suspending(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Suspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Suspending(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Resuming
   (
      handler : Windows.UI.WebUI.ResumingEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Resuming(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Resuming
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Resuming(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_Navigated
   (
      handler : Windows.UI.WebUI.NavigatedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_Navigated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_Navigated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.WebUIApplication");
      m_Factory     : IWebUIActivationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUIActivationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_Navigated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;
