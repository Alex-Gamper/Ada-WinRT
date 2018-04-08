--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Globalization;
with Windows.Security.Cryptography.Certificates;
with Windows.Networking.Sockets;
with Windows.Devices.Enumeration;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.AllJoyn is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynAboutDataView_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView
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
      This       : access TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusAttachment(sender), Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_MemberAdded_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynSession(sender), Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_MemberRemoved_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynSession(sender), Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_Lost_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynSession(sender), Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynSession_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession
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
      This       : access TypedEventHandler_IAllJoynBusObject_add_Stopped_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusObject
      ; args : Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.AllJoyn.IAllJoynBusObject(sender), Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynServiceInfo_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo
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
   
   
   function CreateAllJoynBusAttachment return Windows.Devices.AllJoyn.IAllJoynBusAttachment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusAttachment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.AllJoyn.IAllJoynBusAttachment) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.AllJoyn.IID_IAllJoynBusAttachment'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      uniqueName : Windows.String
      ; objectPath : Windows.String
      ; sessionPort : Windows.UInt16
   )
   return Windows.Devices.AllJoyn.IAllJoynServiceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynServiceInfo");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynServiceInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynServiceInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynServiceInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(uniqueName, objectPath, sessionPort, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      uniqueName : Windows.String
      ; sessionPort : Windows.UInt16
      ; trafficType : Windows.Devices.AllJoyn.AllJoynTrafficType
      ; proximity : Windows.UInt8
      ; acceptSessionJoiner : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
   )
   return Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynAcceptSessionJoinerEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynAcceptSessionJoinerEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(uniqueName, sessionPort, trafficType, proximity, acceptSessionJoiner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      session : Windows.Devices.AllJoyn.IAllJoynSession
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSessionJoinedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionJoinedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(session, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSessionMemberAddedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionMemberAddedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(uniqueName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSessionMemberRemovedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionMemberRemovedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(uniqueName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      reason : Windows.Devices.AllJoyn.AllJoynSessionLostReason
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSessionLostEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionLostEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(reason, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      objectPath : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusObject");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynBusObjectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynBusObject := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynBusObjectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(objectPath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithBusAttachment
   (
      objectPath : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusObject");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynBusObjectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynBusObject := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynBusObjectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithBusAttachment(objectPath, busAttachment, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusObjectStoppedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynBusObjectStoppedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(status, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynProducerStoppedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynProducerStoppedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(status, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynWatcherStoppedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynWatcherStoppedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(status, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynServiceInfoRemovedEventArgs");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynServiceInfoRemovedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(uniqueName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      senderUniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynMessageInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynMessageInfo");
      m_Factory     : Windows.Devices.AllJoyn.IAllJoynMessageInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynMessageInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynMessageInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(senderUniqueName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Ok
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ok(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Fail
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Fail(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OperationTimedOut
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OperationTimedOut(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OtherEndClosed
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OtherEndClosed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ConnectionRefused
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ConnectionRefused(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AuthenticationFailed
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AuthenticationFailed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AuthenticationRejectedByUser
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AuthenticationRejectedByUser(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SslConnectFailed
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SslConnectFailed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SslIdentityVerificationFailed
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SslIdentityVerificationFailed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientSecurity
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientSecurity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument1
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument2
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument3
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument4
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument4(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument5
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument6
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument6(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument7
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidArgument8
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynStatus");
      m_Factory     : IAllJoynStatusStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynStatusStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidArgument8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.AllJoyn.IAllJoynBusAttachment is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusAttachment");
      m_Factory     : IAllJoynBusAttachmentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAllJoynBusAttachment;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynBusAttachmentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetWatcher
   (
      requiredInterfaces : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynBusAttachment");
      m_Factory     : IAllJoynBusAttachmentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynBusAttachmentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetWatcher(requiredInterfaces, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynServiceInfo");
      m_Factory     : IAllJoynServiceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynServiceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDataBySessionPortAsync
   (
      uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynAboutDataView");
      m_Factory     : IAllJoynAboutDataViewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynAboutDataViewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDataBySessionPortAsync(uniqueName, busAttachment, sessionPort, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDataBySessionPortWithLanguageAsync
   (
      uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
      ; language : Windows.Globalization.ILanguage
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynAboutDataView");
      m_Factory     : IAllJoynAboutDataViewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynAboutDataViewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDataBySessionPortWithLanguageAsync(uniqueName, busAttachment, sessionPort, language, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFromServiceInfoAsync
   (
      serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSession");
      m_Factory     : IAllJoynSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFromServiceInfoAsync(serviceInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFromServiceInfoAndBusAttachmentAsync
   (
      serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.AllJoyn.AllJoynSession");
      m_Factory     : IAllJoynSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAllJoynSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFromServiceInfoAndBusAttachmentAsync(serviceInfo, busAttachment, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
