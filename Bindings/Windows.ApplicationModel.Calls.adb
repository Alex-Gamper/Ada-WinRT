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
with Windows.ApplicationModel.Contacts;
with Windows.UI;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Calls is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLine_add_LineChanged_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLine
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLine(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneLine_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine
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
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLineWatcher(sender), Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLineWatcher(sender), Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLineWatcher(sender), Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLineWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IPhoneLineWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore
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
      This       : access AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities
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
      This       : access TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipPhoneCall(sender), Windows.ApplicationModel.Calls.ICallStateChangeEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipPhoneCall(sender), Windows.ApplicationModel.Calls.ICallStateChangeEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipPhoneCall(sender), Windows.ApplicationModel.Calls.ICallStateChangeEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallAnswerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipPhoneCall(sender), Windows.ApplicationModel.Calls.ICallAnswerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallRejectEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipPhoneCall(sender), Windows.ApplicationModel.Calls.ICallRejectEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_VoipPhoneCallResourceReservationStatus
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
      This       : access TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipCallCoordinator
      ; args : Windows.ApplicationModel.Calls.IMuteChangeEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.IVoipCallCoordinator(sender), Windows.ApplicationModel.Calls.IMuteChangeEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.ILockScreenCallUI
      ; args : Windows.ApplicationModel.Calls.ILockScreenCallEndRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.ILockScreenCallUI(sender), Windows.ApplicationModel.Calls.ILockScreenCallEndRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenCallUI_add_Closed_Interface
      ; sender : Windows.ApplicationModel.Calls.ILockScreenCallUI
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Calls.ILockScreenCallUI(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryEntry
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
      This       : access AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore
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
   
   function CreatePhoneDialOptions return Windows.ApplicationModel.Calls.IPhoneDialOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneDialOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Calls.IPhoneDialOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Calls.IID_IPhoneDialOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePhoneCallHistoryEntryAddress return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallHistoryEntryAddress");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Calls.IID_IPhoneCallHistoryEntryAddress'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePhoneCallHistoryEntry return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallHistoryEntry");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Calls.IID_IPhoneCallHistoryEntry'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePhoneCallHistoryEntryQueryOptions return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryQueryOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallHistoryEntryQueryOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryQueryOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Calls.IID_IPhoneCallHistoryEntryQueryOptions'Access, RetVal'access);
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
   
   function FromIdAsync
   (
      lineId : Windows.Guid
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneLine");
      m_Factory     : IPhoneLineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneLineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(lineId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_CallStateChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_CallStateChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_CallStateChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_CallStateChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsCallActive
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsCallActive(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsCallIncoming
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsCallIncoming(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowPhoneCallSettingsUI
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowPhoneCallSettingsUI;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowPhoneCallUI
   (
      phoneNumber : Windows.String
      ; displayName : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallManager");
      m_Factory     : IPhoneCallManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowPhoneCallUI(phoneNumber, displayName);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetCapabilitiesAsync
   (
      phoneNumber : Windows.String
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallVideoCapabilitiesManager");
      m_Factory     : IPhoneCallVideoCapabilitiesManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallVideoCapabilitiesManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCapabilitiesAsync(phoneNumber, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BlockUnknownNumbers
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallBlocking");
      m_Factory     : IPhoneCallBlockingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallBlockingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BlockUnknownNumbers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_BlockUnknownNumbers
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallBlocking");
      m_Factory     : IPhoneCallBlockingStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallBlockingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_BlockUnknownNumbers(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_BlockPrivateNumbers
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallBlocking");
      m_Factory     : IPhoneCallBlockingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallBlockingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BlockPrivateNumbers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_BlockPrivateNumbers
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallBlocking");
      m_Factory     : IPhoneCallBlockingStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallBlockingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_BlockPrivateNumbers(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function SetCallBlockingListAsync
   (
      phoneNumberList : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallBlocking");
      m_Factory     : IPhoneCallBlockingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallBlockingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetCallBlockingListAsync(phoneNumberList, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.ApplicationModel.Calls.IVoipCallCoordinator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.VoipCallCoordinator");
      m_Factory     : IVoipCallCoordinatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IVoipCallCoordinator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoipCallCoordinatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsync
   (
      accessType : Windows.ApplicationModel.Calls.PhoneCallHistoryStoreAccessType
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallHistoryManager");
      m_Factory     : IPhoneCallHistoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallHistoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(accessType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Calls.IPhoneCallHistoryManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Calls.PhoneCallHistoryManager");
      m_Factory     : IPhoneCallHistoryManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Calls.IPhoneCallHistoryManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneCallHistoryManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
