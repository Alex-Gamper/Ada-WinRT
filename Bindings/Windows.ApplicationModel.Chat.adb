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
with Windows.Media.MediaProperties;
with Windows.Storage.Streams;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Chat is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatMessage_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage
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
      This       : access TypedEventHandler_IChatMessageStore_add_MessageChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatMessageStore
      ; args : Windows.ApplicationModel.Chat.IChatMessageChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Chat.IChatMessageStore(sender), Windows.ApplicationModel.Chat.IChatMessageChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatConversation_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation
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
      This       : access TypedEventHandler_IChatMessageStore2_add_StoreChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatMessageStore
      ; args : Windows.ApplicationModel.Chat.IChatMessageStoreChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Chat.IChatMessageStore(sender), Windows.ApplicationModel.Chat.IChatMessageStoreChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatMessageStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore
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
      This       : access AsyncOperationCompletedHandler_IChatMessageTransport_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport
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
      This       : access AsyncOperationCompletedHandler_IChatSyncManager_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager
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
      This       : access AsyncOperationCompletedHandler_IChatCapabilities_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities
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
      This       : access TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatConversation
      ; args : Windows.ApplicationModel.Chat.IRemoteParticipantComposingChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Chat.IChatConversation(sender), Windows.ApplicationModel.Chat.IRemoteParticipantComposingChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRcsTransport_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport
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
      This       : access TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IRcsTransport
      ; args : Windows.ApplicationModel.Chat.IRcsServiceKindSupportedChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Chat.IRcsTransport(sender), Windows.ApplicationModel.Chat.IRcsServiceKindSupportedChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IRcsEndUserMessageManager
      ; args : Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Chat.IRcsEndUserMessageManager(sender), Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.ApplicationModel.Chat.IChatMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Chat.IChatMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Chat.IID_IChatMessage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateChatMessageAttachment
   (
      mimeType : Windows.String
      ; dataStreamReference : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Chat.IChatMessageAttachment is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageAttachment");
      m_Factory     : Windows.ApplicationModel.Chat.IChatMessageAttachmentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IChatMessageAttachment := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageAttachmentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateChatMessageAttachment(mimeType, dataStreamReference, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.ApplicationModel.Chat.IChatConversationThreadingInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatConversationThreadingInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Chat.IChatConversationThreadingInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Chat.IID_IChatConversationThreadingInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatRecipientDeliveryInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Chat.IID_IChatRecipientDeliveryInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.ApplicationModel.Chat.IChatQueryOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatQueryOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Chat.IChatQueryOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Chat.IID_IChatQueryOptions'Access, RetVal'access);
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
   
   function GetTransportsAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTransportsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowComposeSmsMessageAsync
   (
      message : Windows.ApplicationModel.Chat.IChatMessage
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowComposeSmsMessageAsync(message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowSmsSettings
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowSmsSettings;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RequestSyncManagerAsync
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestSyncManagerAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RegisterTransportAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManager2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManager2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterTransportAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTransportAsync
   (
      transportId : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageManager");
      m_Factory     : IChatMessageManager2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageManager2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTransportAsync(transportId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function MarkMessageAsBlockedAsync
   (
      localChatMessageId : Windows.String
      ; blocked : Windows.Boolean
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatMessageBlocking");
      m_Factory     : IChatMessageBlockingStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatMessageBlockingStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.MarkMessageAsBlockedAsync(localChatMessageId, blocked, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCachedCapabilitiesAsync
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatCapabilitiesManager");
      m_Factory     : IChatCapabilitiesManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatCapabilitiesManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCachedCapabilitiesAsync(address, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCapabilitiesFromNetworkAsync
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.ChatCapabilitiesManager");
      m_Factory     : IChatCapabilitiesManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IChatCapabilitiesManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCapabilitiesFromNetworkAsync(address, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEndUserMessageManager
   return Windows.ApplicationModel.Chat.IRcsEndUserMessageManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.RcsManager");
      m_Factory     : IRcsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IRcsEndUserMessageManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRcsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEndUserMessageManager(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTransportsAsync_RcsManager
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.RcsManager");
      m_Factory     : IRcsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRcsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTransportsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTransportAsync
   (
      transportId : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.RcsManager");
      m_Factory     : IRcsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRcsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTransportAsync(transportId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LeaveConversationAsync
   (
      conversation : Windows.ApplicationModel.Chat.IChatConversation
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Chat.RcsManager");
      m_Factory     : IRcsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRcsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LeaveConversationAsync(conversation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
