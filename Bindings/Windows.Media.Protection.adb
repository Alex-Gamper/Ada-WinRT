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
with Windows.Media.Playback;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Protection is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access ServiceRequestedEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
      ; e : Windows.Media.Protection.IServiceRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.IMediaProtectionManager(sender), Windows.Media.Protection.IServiceRequestedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access RebootNeededEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.IMediaProtectionManager(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ComponentLoadFailedEventHandler_Interface
      ; sender : Windows.Media.Protection.IMediaProtectionManager
      ; e : Windows.Media.Protection.IComponentLoadFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.IMediaProtectionManager(sender), Windows.Media.Protection.IComponentLoadFailedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_HdcpSetProtectionResult_Interface
      ; asyncInfo : Windows.Media.Protection.IAsyncOperation_HdcpSetProtectionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHdcpSession_add_ProtectionChanged_Interface
      ; sender : Windows.Media.Protection.IHdcpSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Protection.IHdcpSession(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Media.Protection.IMediaProtectionManager is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.MediaProtectionManager");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.IMediaProtectionManager) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.IID_IMediaProtectionManager'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePMPServer
   (
      pProperties : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Protection.IMediaProtectionPMPServer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.MediaProtectionPMPServer");
      m_Factory     : Windows.Media.Protection.IMediaProtectionPMPServerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Protection.IMediaProtectionPMPServer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaProtectionPMPServerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePMPServer(pProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Media.Protection.IProtectionCapabilities is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.ProtectionCapabilities");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.IProtectionCapabilities) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.IID_IProtectionCapabilities'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Media.Protection.IHdcpSession is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.HdcpSession");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Protection.IHdcpSession) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Protection.IID_IHdcpSession'Access, RetVal'access);
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
   
   function RenewSystemComponentsAsync
   (
      information : Windows.Media.Protection.IRevocationAndRenewalInformation
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Protection.ComponentRenewal");
      m_Factory     : IComponentRenewalStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IComponentRenewalStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RenewSystemComponentsAsync(information, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
