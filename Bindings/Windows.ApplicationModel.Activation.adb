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
with Windows.ApplicationModel.Calls;
with Windows.UI.ViewManagement;
with Windows.ApplicationModel.Contacts.Provider;
with Windows.ApplicationModel.Contacts;
with Windows.ApplicationModel.Wallet;
with Windows.ApplicationModel.Appointments.AppointmentsProvider;
with Windows.System;
with Windows.ApplicationModel.Background;
with Windows.ApplicationModel.UserDataAccounts.Provider;
with Windows.UI.Notifications;
with Windows.ApplicationModel.Search;
with Windows.ApplicationModel.DataTransfer.ShareTarget;
with Windows.Storage;
with Windows.Storage.Search;
with Windows.Storage.Pickers.Provider;
with Windows.Storage.Provider;
with Windows.Security.Authentication.Web;
with Windows.Security.Authentication.Web.Provider;
with Windows.Devices.Enumeration;
with Windows.Media.SpeechRecognition;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Activation is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ISplashScreen_add_Dismissed_Interface
      ; sender : Windows.ApplicationModel.Activation.ISplashScreen
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Activation.ISplashScreen(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_IBackgroundActivatedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
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
   
end;
