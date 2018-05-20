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
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.AppBroadcasting is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface
      ; sender : Windows.Media.AppBroadcasting.IAppBroadcastingMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.AppBroadcasting.IAppBroadcastingMonitor(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Media.AppBroadcasting.IAppBroadcastingMonitor is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingMonitor");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.AppBroadcasting.IAppBroadcastingMonitor) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.AppBroadcasting.IID_IAppBroadcastingMonitor'Access, RetVal'access);
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
   
   function GetDefault
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingUI");
      m_Factory     : IAppBroadcastingUIStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastingUIStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingUI");
      m_Factory     : IAppBroadcastingUIStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastingUIStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
