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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.LockScreen is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.LockScreen.ILockScreenInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.LockScreen.ILockScreenInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.LockScreen.ILockScreenInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.LockScreen.ILockScreenInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockApplicationHost_add_Unlocking_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockApplicationHost
      ; args : Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.LockScreen.ILockApplicationHost(sender), Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs(args));
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
   return Windows.ApplicationModel.LockScreen.ILockApplicationHost is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.LockScreen.LockApplicationHost");
      m_Factory     : ILockApplicationHostStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.LockScreen.ILockApplicationHost;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockApplicationHostStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
