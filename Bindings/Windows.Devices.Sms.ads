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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Sms is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SmsMessageFilter is (
      All_x,
      Unread,
      Read,
      Sent,
      Draft
   );
   for SmsMessageFilter use (
      All_x => 0,
      Unread => 1,
      Read => 2,
      Sent => 3,
      Draft => 4
   );
   for SmsMessageFilter'Size use 32;
   
   type SmsMessageFilter_Ptr is access SmsMessageFilter;
   
   type SmsMessageClass is (
      None,
      Class0,
      Class1,
      Class2,
      Class3
   );
   for SmsMessageClass use (
      None => 0,
      Class0 => 1,
      Class1 => 2,
      Class2 => 3,
      Class3 => 4
   );
   for SmsMessageClass'Size use 32;
   
   type SmsMessageClass_Ptr is access SmsMessageClass;
   
   type SmsMessageType is (
      Binary,
      Text,
      Wap,
      App,
      Broadcast,
      Voicemail,
      Status
   );
   for SmsMessageType use (
      Binary => 0,
      Text => 1,
      Wap => 2,
      App => 3,
      Broadcast => 4,
      Voicemail => 5,
      Status => 6
   );
   for SmsMessageType'Size use 32;
   
   type SmsMessageType_Ptr is access SmsMessageType;
   
   type CellularClass is (
      None,
      Gsm,
      Cdma
   );
   for CellularClass use (
      None => 0,
      Gsm => 1,
      Cdma => 2
   );
   for CellularClass'Size use 32;
   
   type CellularClass_Ptr is access CellularClass;
   
   type SmsDataFormat is (
      Unknown,
      CdmaSubmit,
      GsmSubmit,
      CdmaDeliver,
      GsmDeliver
   );
   for SmsDataFormat use (
      Unknown => 0,
      CdmaSubmit => 1,
      GsmSubmit => 2,
      CdmaDeliver => 3,
      GsmDeliver => 4
   );
   for SmsDataFormat'Size use 32;
   
   type SmsDataFormat_Ptr is access SmsDataFormat;
   
   type SmsEncoding is (
      Unknown,
      Optimal,
      SevenBitAscii,
      Unicode,
      GsmSevenBit,
      EightBit,
      Latin,
      Korean,
      IA5,
      ShiftJis,
      LatinHebrew
   );
   for SmsEncoding use (
      Unknown => 0,
      Optimal => 1,
      SevenBitAscii => 2,
      Unicode => 3,
      GsmSevenBit => 4,
      EightBit => 5,
      Latin => 6,
      Korean => 7,
      IA5 => 8,
      ShiftJis => 9,
      LatinHebrew => 10
   );
   for SmsEncoding'Size use 32;
   
   type SmsEncoding_Ptr is access SmsEncoding;
   
   type SmsGeographicalScope is (
      None,
      CellWithImmediateDisplay,
      LocationArea,
      Plmn,
      Cell
   );
   for SmsGeographicalScope use (
      None => 0,
      CellWithImmediateDisplay => 1,
      LocationArea => 2,
      Plmn => 3,
      Cell => 4
   );
   for SmsGeographicalScope'Size use 32;
   
   type SmsGeographicalScope_Ptr is access SmsGeographicalScope;
   
   type SmsBroadcastType is (
      Other,
      CmasPresidential,
      CmasExtreme,
      CmasSevere,
      CmasAmber,
      CmasTest,
      EUAlert1,
      EUAlert2,
      EUAlert3,
      EUAlertAmber,
      EUAlertInfo,
      EtwsEarthquake,
      EtwsTsunami,
      EtwsTsunamiAndEarthquake,
      LatAlertLocal
   );
   for SmsBroadcastType use (
      Other => 0,
      CmasPresidential => 1,
      CmasExtreme => 2,
      CmasSevere => 3,
      CmasAmber => 4,
      CmasTest => 5,
      EUAlert1 => 6,
      EUAlert2 => 7,
      EUAlert3 => 8,
      EUAlertAmber => 9,
      EUAlertInfo => 10,
      EtwsEarthquake => 11,
      EtwsTsunami => 12,
      EtwsTsunamiAndEarthquake => 13,
      LatAlertLocal => 14
   );
   for SmsBroadcastType'Size use 32;
   
   type SmsBroadcastType_Ptr is access SmsBroadcastType;
   
   type SmsDeviceStatus is (
      Off,
      Ready,
      SimNotInserted,
      BadSim,
      DeviceFailure,
      SubscriptionNotActivated,
      DeviceLocked,
      DeviceBlocked
   );
   for SmsDeviceStatus use (
      Off => 0,
      Ready => 1,
      SimNotInserted => 2,
      BadSim => 3,
      DeviceFailure => 4,
      SubscriptionNotActivated => 5,
      DeviceLocked => 6,
      DeviceBlocked => 7
   );
   for SmsDeviceStatus'Size use 32;
   
   type SmsDeviceStatus_Ptr is access SmsDeviceStatus;
   
   type SmsModemErrorCode is (
      Other,
      MessagingNetworkError,
      SmsOperationNotSupportedByDevice,
      SmsServiceNotSupportedByNetwork,
      DeviceFailure,
      MessageNotEncodedProperly,
      MessageTooLarge,
      DeviceNotReady,
      NetworkNotReady,
      InvalidSmscAddress,
      NetworkFailure,
      FixedDialingNumberRestricted
   );
   for SmsModemErrorCode use (
      Other => 0,
      MessagingNetworkError => 1,
      SmsOperationNotSupportedByDevice => 2,
      SmsServiceNotSupportedByNetwork => 3,
      DeviceFailure => 4,
      MessageNotEncodedProperly => 5,
      MessageTooLarge => 6,
      DeviceNotReady => 7,
      NetworkNotReady => 8,
      InvalidSmscAddress => 9,
      NetworkFailure => 10,
      FixedDialingNumberRestricted => 11
   );
   for SmsModemErrorCode'Size use 32;
   
   type SmsModemErrorCode_Ptr is access SmsModemErrorCode;
   
   type SmsFilterActionType is (
      AcceptImmediately,
      Drop,
      Peek,
      Accept_x
   );
   for SmsFilterActionType use (
      AcceptImmediately => 0,
      Drop => 1,
      Peek => 2,
      Accept_x => 3
   );
   for SmsFilterActionType'Size use 32;
   
   type SmsFilterActionType_Ptr is access SmsFilterActionType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type LegacySmsApiContract is null record;
   pragma Convention (C_Pass_By_Copy , LegacySmsApiContract);
   
   type LegacySmsApiContract_Ptr is access LegacySmsApiContract;
   
   type SmsEncodedLength is record
      SegmentCount : Windows.UInt32;
      CharacterCountLastSegment : Windows.UInt32;
      CharactersPerSegment : Windows.UInt32;
      ByteCountLastSegment : Windows.UInt32;
      BytesPerSegment : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , SmsEncodedLength);
   
   type SmsEncodedLength_Ptr is access SmsEncodedLength;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type SmsMessageReceivedEventHandler_Interface;
   type SmsMessageReceivedEventHandler is access all SmsMessageReceivedEventHandler_Interface'Class;
   type SmsMessageReceivedEventHandler_Ptr is access all SmsMessageReceivedEventHandler;
   type SmsDeviceStatusChangedEventHandler_Interface;
   type SmsDeviceStatusChangedEventHandler is access all SmsDeviceStatusChangedEventHandler_Interface'Class;
   type SmsDeviceStatusChangedEventHandler_Ptr is access all SmsDeviceStatusChangedEventHandler;
   type AsyncOperationCompletedHandler_ISmsMessage_Interface;
   type AsyncOperationCompletedHandler_ISmsMessage is access all AsyncOperationCompletedHandler_ISmsMessage_Interface'Class;
   type AsyncOperationCompletedHandler_ISmsMessage_Ptr is access all AsyncOperationCompletedHandler_ISmsMessage;
   type AsyncOperationCompletedHandler_ISmsDevice_Interface;
   type AsyncOperationCompletedHandler_ISmsDevice is access all AsyncOperationCompletedHandler_ISmsDevice_Interface'Class;
   type AsyncOperationCompletedHandler_ISmsDevice_Ptr is access all AsyncOperationCompletedHandler_ISmsDevice;
   type AsyncOperationCompletedHandler_ISmsSendMessageResult_Interface;
   type AsyncOperationCompletedHandler_ISmsSendMessageResult is access all AsyncOperationCompletedHandler_ISmsSendMessageResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISmsSendMessageResult_Ptr is access all AsyncOperationCompletedHandler_ISmsSendMessageResult;
   type TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Interface;
   type TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged is access all TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Interface'Class;
   type TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Ptr is access all TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged;
   type TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Interface;
   type TypedEventHandler_ISmsMessageRegistration_add_MessageReceived is access all TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Interface'Class;
   type TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Ptr is access all TypedEventHandler_ISmsMessageRegistration_add_MessageReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISmsMessage_Interface;
   type ISmsMessage is access all ISmsMessage_Interface'Class;
   type ISmsMessage_Ptr is access all ISmsMessage;
   type ISmsBinaryMessage_Interface;
   type ISmsBinaryMessage is access all ISmsBinaryMessage_Interface'Class;
   type ISmsBinaryMessage_Ptr is access all ISmsBinaryMessage;
   type ISmsTextMessage_Interface;
   type ISmsTextMessage is access all ISmsTextMessage_Interface'Class;
   type ISmsTextMessage_Ptr is access all ISmsTextMessage;
   type ISmsTextMessageStatics_Interface;
   type ISmsTextMessageStatics is access all ISmsTextMessageStatics_Interface'Class;
   type ISmsTextMessageStatics_Ptr is access all ISmsTextMessageStatics;
   type IAsyncOperation_ISmsMessage_Interface;
   type IAsyncOperation_ISmsMessage is access all IAsyncOperation_ISmsMessage_Interface'Class;
   type IAsyncOperation_ISmsMessage_Ptr is access all IAsyncOperation_ISmsMessage;
   type IAsyncOperationWithProgress_ISmsMessage_Int32_Interface;
   type IAsyncOperationWithProgress_ISmsMessage_Int32 is access all IAsyncOperationWithProgress_ISmsMessage_Int32_Interface'Class;
   type IAsyncOperationWithProgress_ISmsMessage_Int32_Ptr is access all IAsyncOperationWithProgress_ISmsMessage_Int32;
   type ISmsDeviceMessageStore_Interface;
   type ISmsDeviceMessageStore is access all ISmsDeviceMessageStore_Interface'Class;
   type ISmsDeviceMessageStore_Ptr is access all ISmsDeviceMessageStore;
   type ISmsMessageReceivedEventArgs_Interface;
   type ISmsMessageReceivedEventArgs is access all ISmsMessageReceivedEventArgs_Interface'Class;
   type ISmsMessageReceivedEventArgs_Ptr is access all ISmsMessageReceivedEventArgs;
   type IAsyncOperation_SmsDevice_Interface;
   type IAsyncOperation_SmsDevice is access all IAsyncOperation_SmsDevice_Interface'Class;
   type IAsyncOperation_SmsDevice_Ptr is access all IAsyncOperation_SmsDevice;
   type ISmsDeviceStatics_Interface;
   type ISmsDeviceStatics is access all ISmsDeviceStatics_Interface'Class;
   type ISmsDeviceStatics_Ptr is access all ISmsDeviceStatics;
   type ISmsDeviceStatics2_Interface;
   type ISmsDeviceStatics2 is access all ISmsDeviceStatics2_Interface'Class;
   type ISmsDeviceStatics2_Ptr is access all ISmsDeviceStatics2;
   type ISmsDevice_Interface;
   type ISmsDevice is access all ISmsDevice_Interface'Class;
   type ISmsDevice_Ptr is access all ISmsDevice;
   type ISmsReceivedEventDetails_Interface;
   type ISmsReceivedEventDetails is access all ISmsReceivedEventDetails_Interface'Class;
   type ISmsReceivedEventDetails_Ptr is access all ISmsReceivedEventDetails;
   type ISmsReceivedEventDetails2_Interface;
   type ISmsReceivedEventDetails2 is access all ISmsReceivedEventDetails2_Interface'Class;
   type ISmsReceivedEventDetails2_Ptr is access all ISmsReceivedEventDetails2;
   type ISmsMessageBase_Interface;
   type ISmsMessageBase is access all ISmsMessageBase_Interface'Class;
   type ISmsMessageBase_Ptr is access all ISmsMessageBase;
   type ISmsTextMessage2_Interface;
   type ISmsTextMessage2 is access all ISmsTextMessage2_Interface'Class;
   type ISmsTextMessage2_Ptr is access all ISmsTextMessage2;
   type ISmsWapMessage_Interface;
   type ISmsWapMessage is access all ISmsWapMessage_Interface'Class;
   type ISmsWapMessage_Ptr is access all ISmsWapMessage;
   type ISmsAppMessage_Interface;
   type ISmsAppMessage is access all ISmsAppMessage_Interface'Class;
   type ISmsAppMessage_Ptr is access all ISmsAppMessage;
   type ISmsBroadcastMessage_Interface;
   type ISmsBroadcastMessage is access all ISmsBroadcastMessage_Interface'Class;
   type ISmsBroadcastMessage_Ptr is access all ISmsBroadcastMessage;
   type ISmsVoicemailMessage_Interface;
   type ISmsVoicemailMessage is access all ISmsVoicemailMessage_Interface'Class;
   type ISmsVoicemailMessage_Ptr is access all ISmsVoicemailMessage;
   type ISmsStatusMessage_Interface;
   type ISmsStatusMessage is access all ISmsStatusMessage_Interface'Class;
   type ISmsStatusMessage_Ptr is access all ISmsStatusMessage;
   type ISmsSendMessageResult_Interface;
   type ISmsSendMessageResult is access all ISmsSendMessageResult_Interface'Class;
   type ISmsSendMessageResult_Ptr is access all ISmsSendMessageResult;
   type ISmsDevice2Statics_Interface;
   type ISmsDevice2Statics is access all ISmsDevice2Statics_Interface'Class;
   type ISmsDevice2Statics_Ptr is access all ISmsDevice2Statics;
   type ISmsDevice2_Interface;
   type ISmsDevice2 is access all ISmsDevice2_Interface'Class;
   type ISmsDevice2_Ptr is access all ISmsDevice2;
   type ISmsMessageReceivedTriggerDetails_Interface;
   type ISmsMessageReceivedTriggerDetails is access all ISmsMessageReceivedTriggerDetails_Interface'Class;
   type ISmsMessageReceivedTriggerDetails_Ptr is access all ISmsMessageReceivedTriggerDetails;
   type ISmsFilterRule_Interface;
   type ISmsFilterRule is access all ISmsFilterRule_Interface'Class;
   type ISmsFilterRule_Ptr is access all ISmsFilterRule;
   type ISmsFilterRuleFactory_Interface;
   type ISmsFilterRuleFactory is access all ISmsFilterRuleFactory_Interface'Class;
   type ISmsFilterRuleFactory_Ptr is access all ISmsFilterRuleFactory;
   type ISmsFilterRules_Interface;
   type ISmsFilterRules is access all ISmsFilterRules_Interface'Class;
   type ISmsFilterRules_Ptr is access all ISmsFilterRules;
   type ISmsFilterRulesFactory_Interface;
   type ISmsFilterRulesFactory is access all ISmsFilterRulesFactory_Interface'Class;
   type ISmsFilterRulesFactory_Ptr is access all ISmsFilterRulesFactory;
   type ISmsMessageRegistrationStatics_Interface;
   type ISmsMessageRegistrationStatics is access all ISmsMessageRegistrationStatics_Interface'Class;
   type ISmsMessageRegistrationStatics_Ptr is access all ISmsMessageRegistrationStatics;
   type ISmsMessageRegistration_Interface;
   type ISmsMessageRegistration is access all ISmsMessageRegistration_Interface'Class;
   type ISmsMessageRegistration_Ptr is access all ISmsMessageRegistration;
   type IIterator_ISmsBinaryMessage_Interface;
   type IIterator_ISmsBinaryMessage is access all IIterator_ISmsBinaryMessage_Interface'Class;
   type IIterator_ISmsBinaryMessage_Ptr is access all IIterator_ISmsBinaryMessage;
   type IIterable_ISmsBinaryMessage_Interface;
   type IIterable_ISmsBinaryMessage is access all IIterable_ISmsBinaryMessage_Interface'Class;
   type IIterable_ISmsBinaryMessage_Ptr is access all IIterable_ISmsBinaryMessage;
   type IVectorView_ISmsBinaryMessage_Interface;
   type IVectorView_ISmsBinaryMessage is access all IVectorView_ISmsBinaryMessage_Interface'Class;
   type IVectorView_ISmsBinaryMessage_Ptr is access all IVectorView_ISmsBinaryMessage;
   type IAsyncOperation_ISmsDevice_Interface;
   type IAsyncOperation_ISmsDevice is access all IAsyncOperation_ISmsDevice_Interface'Class;
   type IAsyncOperation_ISmsDevice_Ptr is access all IAsyncOperation_ISmsDevice;
   type IAsyncOperation_ISmsSendMessageResult_Interface;
   type IAsyncOperation_ISmsSendMessageResult is access all IAsyncOperation_ISmsSendMessageResult_Interface'Class;
   type IAsyncOperation_ISmsSendMessageResult_Ptr is access all IAsyncOperation_ISmsSendMessageResult;
   type IIterator_SmsBroadcastType_Interface;
   type IIterator_SmsBroadcastType is access all IIterator_SmsBroadcastType_Interface'Class;
   type IIterator_SmsBroadcastType_Ptr is access all IIterator_SmsBroadcastType;
   type IIterable_SmsBroadcastType_Interface;
   type IIterable_SmsBroadcastType is access all IIterable_SmsBroadcastType_Interface'Class;
   type IIterable_SmsBroadcastType_Ptr is access all IIterable_SmsBroadcastType;
   type IVectorView_SmsBroadcastType_Interface;
   type IVectorView_SmsBroadcastType is access all IVectorView_SmsBroadcastType_Interface'Class;
   type IVectorView_SmsBroadcastType_Ptr is access all IVectorView_SmsBroadcastType;
   type IVector_SmsBroadcastType_Interface;
   type IVector_SmsBroadcastType is access all IVector_SmsBroadcastType_Interface'Class;
   type IVector_SmsBroadcastType_Ptr is access all IVector_SmsBroadcastType;
   type IIterator_ISmsFilterRule_Interface;
   type IIterator_ISmsFilterRule is access all IIterator_ISmsFilterRule_Interface'Class;
   type IIterator_ISmsFilterRule_Ptr is access all IIterator_ISmsFilterRule;
   type IIterable_ISmsFilterRule_Interface;
   type IIterable_ISmsFilterRule is access all IIterable_ISmsFilterRule_Interface'Class;
   type IIterable_ISmsFilterRule_Ptr is access all IIterable_ISmsFilterRule;
   type IVectorView_ISmsFilterRule_Interface;
   type IVectorView_ISmsFilterRule is access all IVectorView_ISmsFilterRule_Interface'Class;
   type IVectorView_ISmsFilterRule_Ptr is access all IVectorView_ISmsFilterRule;
   type IVector_ISmsFilterRule_Interface;
   type IVector_ISmsFilterRule is access all IVector_ISmsFilterRule_Interface'Class;
   type IVector_ISmsFilterRule_Ptr is access all IVector_ISmsFilterRule;
   type IIterator_ISmsMessageRegistration_Interface;
   type IIterator_ISmsMessageRegistration is access all IIterator_ISmsMessageRegistration_Interface'Class;
   type IIterator_ISmsMessageRegistration_Ptr is access all IIterator_ISmsMessageRegistration;
   type IIterable_ISmsMessageRegistration_Interface;
   type IIterable_ISmsMessageRegistration is access all IIterable_ISmsMessageRegistration_Interface'Class;
   type IIterable_ISmsMessageRegistration_Ptr is access all IIterable_ISmsMessageRegistration;
   type IVectorView_ISmsMessageRegistration_Interface;
   type IVectorView_ISmsMessageRegistration is access all IVectorView_ISmsMessageRegistration_Interface'Class;
   type IVectorView_ISmsMessageRegistration_Ptr is access all IVectorView_ISmsMessageRegistration;
   type IVectorView_ISmsMessage_Interface;
   type IVectorView_ISmsMessage is access all IVectorView_ISmsMessage_Interface'Class;
   type IVectorView_ISmsMessage_Ptr is access all IVectorView_ISmsMessage;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISmsMessage : aliased constant Windows.IID := (3980156456, 27012, 19207, (129, 29, 141, 89, 6, 237, 60, 234 ));
   
   type ISmsMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISmsMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageClass
   (
      This       : access ISmsMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageClass
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsBinaryMessage : aliased constant Windows.IID := (1542776851, 15187, 19566, (182, 26, 216, 106, 99, 117, 86, 80 ));
   
   type ISmsBinaryMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Format
   (
      This       : access ISmsBinaryMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsDataFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access ISmsBinaryMessage_Interface
      ; value : Windows.Devices.Sms.SmsDataFormat
   )
   return Windows.HRESULT is abstract;
   
   function GetData
   (
      This       : access ISmsBinaryMessage_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function SetData
   (
      This       : access ISmsBinaryMessage_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsTextMessage : aliased constant Windows.IID := (3592196172, 42133, 18559, (154, 111, 151, 21, 72, 197, 188, 159 ));
   
   type ISmsTextMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_PartReferenceId
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PartNumber
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PartCount
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access ISmsTextMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access ISmsTextMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Body
   (
      This       : access ISmsTextMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Encoding
   (
      This       : access ISmsTextMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function put_Encoding
   (
      This       : access ISmsTextMessage_Interface
      ; value : Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function ToBinaryMessages
   (
      This       : access ISmsTextMessage_Interface
      ; format : Windows.Devices.Sms.SmsDataFormat
      ; RetVal : access Windows.Devices.Sms.IVectorView_ISmsBinaryMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsTextMessageStatics : aliased constant Windows.IID := (2137572845, 15564, 18339, (140, 85, 56, 13, 59, 1, 8, 146 ));
   
   type ISmsTextMessageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromBinaryMessage
   (
      This       : access ISmsTextMessageStatics_Interface
      ; binaryMessage : Windows.Devices.Sms.ISmsBinaryMessage
      ; RetVal : access Windows.Devices.Sms.ISmsTextMessage
   )
   return Windows.HRESULT is abstract;
   
   function FromBinaryData
   (
      This       : access ISmsTextMessageStatics_Interface
      ; format : Windows.Devices.Sms.SmsDataFormat
      ; value : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.Sms.ISmsTextMessage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISmsMessage : aliased constant Windows.IID := (2885268569, 18627, 24236, (151, 73, 76, 109, 180, 213, 7, 230 ));
   
   type IAsyncOperation_ISmsMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmsMessage_Interface
      ; handler : Windows.Devices.Sms.ISmsMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmsMessage_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsMessage
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmsMessage_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsMessage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperationWithProgress_ISmsMessage_Int32 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IAsyncOperationWithProgress_ISmsMessage_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Progress
   (
      This       : access IAsyncOperationWithProgress_ISmsMessage_Int32_Interface
      ; handler : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IAsyncOperationWithProgress_ISmsMessage_Int32_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Completed
   (
      This       : access IAsyncOperationWithProgress_ISmsMessage_Int32_Interface
      ; handler : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperationWithProgress_ISmsMessage_Int32_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperationWithProgress_ISmsMessage_Int32_Interface
      ; RetVal : access Windows.Devices.Sms.IVectorView_ISmsMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDeviceMessageStore : aliased constant Windows.IID := (2559177299, 61832, 17447, (141, 84, 206, 12, 36, 35, 197, 193 ));
   
   type ISmsDeviceMessageStore_Interface is interface and Windows.IInspectable_Interface;
   
   function DeleteMessageAsync
   (
      This       : access ISmsDeviceMessageStore_Interface
      ; messageId : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteMessagesAsync
   (
      This       : access ISmsDeviceMessageStore_Interface
      ; messageFilter : Windows.Devices.Sms.SmsMessageFilter
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageAsync
   (
      This       : access ISmsDeviceMessageStore_Interface
      ; messageId : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.IAsyncOperation_ISmsMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMessagesAsync
   (
      This       : access ISmsDeviceMessageStore_Interface
      ; messageFilter : Windows.Devices.Sms.SmsMessageFilter
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxMessages
   (
      This       : access ISmsDeviceMessageStore_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsMessageReceivedEventArgs : aliased constant Windows.IID := (149424792, 47333, 16833, (163, 216, 211, 171, 250, 226, 38, 117 ));
   
   type ISmsMessageReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextMessage
   (
      This       : access ISmsMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsTextMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_BinaryMessage
   (
      This       : access ISmsMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsBinaryMessage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SmsDevice : aliased constant Windows.IID := (2876313057, 64699, 23510, (159, 47, 40, 95, 169, 251, 68, 232 ));
   
   type IAsyncOperation_SmsDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SmsDevice_Interface
      ; handler : Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDeviceStatics : aliased constant Windows.IID := (4169992170, 55317, 19921, (162, 52, 69, 32, 206, 70, 4, 164 ));
   
   type ISmsDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ISmsDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ISmsDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sms.IAsyncOperation_ISmsDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access ISmsDeviceStatics_Interface
      ; RetVal : access Windows.Devices.Sms.IAsyncOperation_ISmsDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDeviceStatics2 : aliased constant Windows.IID := (748756103, 2163, 19631, (138, 125, 189, 71, 30, 133, 134, 209 ));
   
   type ISmsDeviceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromNetworkAccountIdAsync
   (
      This       : access ISmsDeviceStatics2_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Devices.Sms.IAsyncOperation_ISmsDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDevice : aliased constant Windows.IID := (152539629, 34603, 20204, (156, 114, 171, 17, 98, 123, 52, 236 ));
   
   type ISmsDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function SendMessageAsync
   (
      This       : access ISmsDevice_Interface
      ; message : Windows.Devices.Sms.ISmsMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CalculateLength
   (
      This       : access ISmsDevice_Interface
      ; message : Windows.Devices.Sms.ISmsTextMessage
      ; RetVal : access Windows.Devices.Sms.SmsEncodedLength
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountPhoneNumber
   (
      This       : access ISmsDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access ISmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageStore
   (
      This       : access ISmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsDeviceMessageStore
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceStatus
   (
      This       : access ISmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.SmsDeviceStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_SmsMessageReceived
   (
      This       : access ISmsDevice_Interface
      ; eventHandler : Windows.Devices.Sms.SmsMessageReceivedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SmsMessageReceived
   (
      This       : access ISmsDevice_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SmsDeviceStatusChanged
   (
      This       : access ISmsDevice_Interface
      ; eventHandler : Windows.Devices.Sms.SmsDeviceStatusChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SmsDeviceStatusChanged
   (
      This       : access ISmsDevice_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsReceivedEventDetails : aliased constant Windows.IID := (1538592533, 58477, 19586, (132, 125, 90, 3, 4, 193, 213, 61 ));
   
   type ISmsReceivedEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISmsReceivedEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageIndex
   (
      This       : access ISmsReceivedEventDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsReceivedEventDetails2 : aliased constant Windows.IID := (1088445574, 42932, 18289, (154, 231, 11, 95, 251, 18, 192, 58 ));
   
   type ISmsReceivedEventDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageClass
   (
      This       : access ISmsReceivedEventDetails2_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageClass
   )
   return Windows.HRESULT is abstract;
   
   function get_BinaryMessage
   (
      This       : access ISmsReceivedEventDetails2_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsBinaryMessage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsMessageBase : aliased constant Windows.IID := (753991216, 65104, 20422, (170, 136, 76, 207, 226, 122, 41, 234 ));
   
   type ISmsMessageBase_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageType
   (
      This       : access ISmsMessageBase_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageType
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access ISmsMessageBase_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access ISmsMessageBase_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageClass
   (
      This       : access ISmsMessageBase_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageClass
   )
   return Windows.HRESULT is abstract;
   
   function get_SimIccId
   (
      This       : access ISmsMessageBase_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsTextMessage2 : aliased constant Windows.IID := (580966547, 17749, 18261, (181, 161, 231, 253, 132, 149, 95, 141 ));
   
   type ISmsTextMessage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Body
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Encoding
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function put_Encoding
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function get_CallbackNumber
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CallbackNumber
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDeliveryNotificationEnabled
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDeliveryNotificationEnabled
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RetryAttemptCount
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_RetryAttemptCount
   (
      This       : access ISmsTextMessage2_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TeleserviceId
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolId
   (
      This       : access ISmsTextMessage2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsWapMessage : aliased constant Windows.IID := (3448993603, 31317, 19771, (144, 33, 242, 46, 2, 45, 9, 197 ));
   
   type ISmsWapMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationId
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BinaryBody
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Headers
   (
      This       : access ISmsWapMessage_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsAppMessage : aliased constant Windows.IID := (3904603284, 54176, 18954, (134, 215, 41, 16, 51, 168, 207, 84 ));
   
   type ISmsAppMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_To
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Body
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CallbackNumber
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CallbackNumber
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDeliveryNotificationEnabled
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDeliveryNotificationEnabled
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RetryAttemptCount
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_RetryAttemptCount
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Encoding
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function put_Encoding
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Devices.Sms.SmsEncoding
   )
   return Windows.HRESULT is abstract;
   
   function get_PortNumber
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_PortNumber
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TeleserviceId
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TeleserviceId
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolId
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtocolId
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BinaryBody
   (
      This       : access ISmsAppMessage_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_BinaryBody
   (
      This       : access ISmsAppMessage_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsBroadcastMessage : aliased constant Windows.IID := (1974385649, 58551, 18548, (160, 156, 41, 86, 229, 146, 249, 87 ));
   
   type ISmsBroadcastMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Channel
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_GeographicalScope
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsGeographicalScope
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageCode
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateNumber
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastType
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEmergencyAlert
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUserPopupRequested
   (
      This       : access ISmsBroadcastMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsVoicemailMessage : aliased constant Windows.IID := (656056486, 38321, 17663, (188, 184, 184, 253, 215, 224, 139, 195 ));
   
   type ISmsVoicemailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISmsVoicemailMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access ISmsVoicemailMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsVoicemailMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageCount
   (
      This       : access ISmsVoicemailMessage_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsStatusMessage : aliased constant Windows.IID := (3872555842, 46859, 18039, (147, 121, 201, 120, 63, 223, 248, 244 ));
   
   type ISmsStatusMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_To
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageReferenceNumber
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceCenterTimestamp
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_DischargeTime
   (
      This       : access ISmsStatusMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsSendMessageResult : aliased constant Windows.IID := (3675495154, 30921, 20459, (150, 34, 69, 35, 40, 8, 141, 98 ));
   
   type ISmsSendMessageResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSuccessful
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageReferenceNumbers
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ModemErrorCode
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Devices.Sms.SmsModemErrorCode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsErrorTransient
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkCauseCode
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportFailureCause
   (
      This       : access ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDevice2Statics : aliased constant Windows.IID := (1707574053, 4145, 18718, (143, 182, 239, 153, 145, 175, 227, 99 ));
   
   type ISmsDevice2Statics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ISmsDevice2Statics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromId
   (
      This       : access ISmsDevice2Statics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sms.ISmsDevice2
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access ISmsDevice2Statics_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsDevice2
   )
   return Windows.HRESULT is abstract;
   
   function FromParentId
   (
      This       : access ISmsDevice2Statics_Interface
      ; parentDeviceId : Windows.String
      ; RetVal : access Windows.Devices.Sms.ISmsDevice2
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsDevice2 : aliased constant Windows.IID := (3179961363, 58658, 18123, (184, 213, 158, 173, 48, 251, 108, 71 ));
   
   type ISmsDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmscAddress
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SmscAddress
   (
      This       : access ISmsDevice2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentDeviceId
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountPhoneNumber
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceStatus
   (
      This       : access ISmsDevice2_Interface
      ; RetVal : access Windows.Devices.Sms.SmsDeviceStatus
   )
   return Windows.HRESULT is abstract;
   
   function CalculateLength
   (
      This       : access ISmsDevice2_Interface
      ; message : Windows.Devices.Sms.ISmsMessageBase
      ; RetVal : access Windows.Devices.Sms.SmsEncodedLength
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageAndGetResultAsync
   (
      This       : access ISmsDevice2_Interface
      ; message : Windows.Devices.Sms.ISmsMessageBase
      ; RetVal : access Windows.Devices.Sms.IAsyncOperation_ISmsSendMessageResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_DeviceStatusChanged
   (
      This       : access ISmsDevice2_Interface
      ; eventHandler : TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeviceStatusChanged
   (
      This       : access ISmsDevice2_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsMessageReceivedTriggerDetails : aliased constant Windows.IID := (735038420, 9815, 16680, (173, 95, 227, 135, 113, 50, 189, 177 ));
   
   type ISmsMessageReceivedTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageType
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageType
   )
   return Windows.HRESULT is abstract;
   
   function get_TextMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsTextMessage2
   )
   return Windows.HRESULT is abstract;
   
   function get_WapMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsWapMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_AppMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsAppMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsBroadcastMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_VoicemailMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsVoicemailMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_StatusMessage
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsStatusMessage
   )
   return Windows.HRESULT is abstract;
   
   function Drop
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Accept_x
   (
      This       : access ISmsMessageReceivedTriggerDetails_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsFilterRule : aliased constant Windows.IID := (1088630702, 45129, 20412, (175, 233, 226, 166, 16, 239, 245, 92 ));
   
   type ISmsFilterRule_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageType
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.SmsMessageType
   )
   return Windows.HRESULT is abstract;
   
   function get_ImsiPrefixes
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceIds
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SenderNumbers
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TextMessagePrefixes
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PortNumbers
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function put_CellularClass
   (
      This       : access ISmsFilterRule_Interface
      ; value : Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolIds
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TeleserviceIds
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WapApplicationIds
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WapContentTypes
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastTypes
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.IVector_SmsBroadcastType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastChannels
   (
      This       : access ISmsFilterRule_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsFilterRuleFactory : aliased constant Windows.IID := (12805384, 25238, 20265, (154, 173, 137, 32, 206, 186, 60, 232 ));
   
   type ISmsFilterRuleFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFilterRule
   (
      This       : access ISmsFilterRuleFactory_Interface
      ; messageType : Windows.Devices.Sms.SmsMessageType
      ; RetVal : access Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsFilterRules : aliased constant Windows.IID := (1313336059, 31181, 18561, (152, 148, 85, 164, 19, 91, 35, 250 ));
   
   type ISmsFilterRules_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActionType
   (
      This       : access ISmsFilterRules_Interface
      ; RetVal : access Windows.Devices.Sms.SmsFilterActionType
   )
   return Windows.HRESULT is abstract;
   
   function get_Rules
   (
      This       : access ISmsFilterRules_Interface
      ; RetVal : access Windows.Devices.Sms.IVector_ISmsFilterRule -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsFilterRulesFactory : aliased constant Windows.IID := (2694391021, 28206, 17712, (159, 222, 70, 93, 2, 238, 208, 14 ));
   
   type ISmsFilterRulesFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFilterRules
   (
      This       : access ISmsFilterRulesFactory_Interface
      ; actionType : Windows.Devices.Sms.SmsFilterActionType
      ; RetVal : access Windows.Devices.Sms.ISmsFilterRules
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsMessageRegistrationStatics : aliased constant Windows.IID := (1671451748, 10392, 18296, (160, 60, 111, 153, 73, 7, 214, 58 ));
   
   type ISmsMessageRegistrationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllRegistrations
   (
      This       : access ISmsMessageRegistrationStatics_Interface
      ; RetVal : access Windows.Devices.Sms.IVectorView_ISmsMessageRegistration -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Register
   (
      This       : access ISmsMessageRegistrationStatics_Interface
      ; id : Windows.String
      ; filterRules : Windows.Devices.Sms.ISmsFilterRules
      ; RetVal : access Windows.Devices.Sms.ISmsMessageRegistration
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISmsMessageRegistration : aliased constant Windows.IID := (387993662, 62287, 17515, (131, 179, 15, 241, 153, 35, 180, 9 ));
   
   type ISmsMessageRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISmsMessageRegistration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Unregister
   (
      This       : access ISmsMessageRegistration_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageReceived
   (
      This       : access ISmsMessageRegistration_Interface
      ; eventHandler : TypedEventHandler_ISmsMessageRegistration_add_MessageReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceived
   (
      This       : access ISmsMessageRegistration_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ISmsBinaryMessage : aliased constant Windows.IID := (333843849, 59914, 23297, (156, 47, 14, 91, 67, 80, 88, 224 ));
   
   type IIterator_ISmsBinaryMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmsBinaryMessage_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsBinaryMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmsBinaryMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmsBinaryMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmsBinaryMessage_Interface
      ; items : Windows.Devices.Sms.ISmsBinaryMessage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ISmsBinaryMessage : aliased constant Windows.IID := (1450747557, 19802, 20930, (161, 51, 75, 131, 191, 37, 217, 135 ));
   
   type IIterable_ISmsBinaryMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmsBinaryMessage_Interface
      ; RetVal : access Windows.Devices.Sms.IIterator_ISmsBinaryMessage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISmsBinaryMessage : aliased constant Windows.IID := (1856075498, 39402, 23673, (135, 106, 244, 196, 55, 184, 61, 246 ));
   
   type IVectorView_ISmsBinaryMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmsBinaryMessage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.ISmsBinaryMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmsBinaryMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmsBinaryMessage_Interface
      ; value : Windows.Devices.Sms.ISmsBinaryMessage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmsBinaryMessage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.ISmsBinaryMessage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISmsDevice : aliased constant Windows.IID := (2876313057, 64699, 23510, (159, 47, 40, 95, 169, 251, 68, 232 ));
   
   type IAsyncOperation_ISmsDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmsDevice_Interface
      ; handler : Windows.Devices.Sms.AsyncOperationCompletedHandler_ISmsDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.AsyncOperationCompletedHandler_ISmsDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmsDevice_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISmsSendMessageResult : aliased constant Windows.IID := (4228516623, 19916, 21079, (188, 97, 52, 53, 227, 2, 206, 31 ));
   
   type IAsyncOperation_ISmsSendMessageResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmsSendMessageResult_Interface
      ; handler : Windows.Devices.Sms.AsyncOperationCompletedHandler_ISmsSendMessageResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Devices.Sms.AsyncOperationCompletedHandler_ISmsSendMessageResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmsSendMessageResult_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsSendMessageResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_SmsBroadcastType : aliased constant Windows.IID := (1682497002, 49613, 20803, (164, 34, 95, 228, 240, 8, 204, 146 ));
   
   type IIterator_SmsBroadcastType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmsBroadcastType_Interface
      ; RetVal : access Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmsBroadcastType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmsBroadcastType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmsBroadcastType_Interface
      ; items : Windows.Devices.Sms.SmsBroadcastType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_SmsBroadcastType : aliased constant Windows.IID := (304573301, 5950, 20811, (152, 240, 138, 121, 39, 169, 32, 108 ));
   
   type IIterable_SmsBroadcastType_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmsBroadcastType_Interface
      ; RetVal : access Windows.Devices.Sms.IIterator_SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_SmsBroadcastType : aliased constant Windows.IID := (1080289169, 55853, 24140, (145, 19, 91, 107, 160, 167, 197, 149 ));
   
   type IVectorView_SmsBroadcastType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmsBroadcastType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmsBroadcastType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmsBroadcastType_Interface
      ; value : Windows.Devices.Sms.SmsBroadcastType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmsBroadcastType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.SmsBroadcastType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVector_SmsBroadcastType : aliased constant Windows.IID := (3614174987, 4952, 22677, (189, 66, 241, 127, 111, 51, 238, 209 ));
   
   type IVector_SmsBroadcastType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; RetVal : access Windows.Devices.Sms.IVectorView_SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; value : Windows.Devices.Sms.SmsBroadcastType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; value : Windows.Devices.Sms.SmsBroadcastType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_SmsBroadcastType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_SmsBroadcastType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.SmsBroadcastType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_SmsBroadcastType_Interface
      ; items : Windows.Devices.Sms.SmsBroadcastType_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ISmsFilterRule : aliased constant Windows.IID := (4274506470, 38901, 23065, (179, 42, 216, 240, 186, 39, 111, 52 ));
   
   type IIterator_ISmsFilterRule_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmsFilterRule_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmsFilterRule_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmsFilterRule_Interface
      ; items : Windows.Devices.Sms.ISmsFilterRule_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ISmsFilterRule : aliased constant Windows.IID := (65897063, 40080, 21088, (139, 192, 108, 62, 51, 6, 201, 100 ));
   
   type IIterable_ISmsFilterRule_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.IIterator_ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISmsFilterRule : aliased constant Windows.IID := (4092412569, 56886, 23938, (153, 63, 53, 252, 103, 125, 139, 114 ));
   
   type IVectorView_ISmsFilterRule_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmsFilterRule_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmsFilterRule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmsFilterRule_Interface
      ; value : Windows.Devices.Sms.ISmsFilterRule
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmsFilterRule_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.ISmsFilterRule_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVector_ISmsFilterRule : aliased constant Windows.IID := (2389899858, 18535, 22166, (180, 217, 76, 162, 63, 25, 225, 119 ));
   
   type IVector_ISmsFilterRule_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; RetVal : access Windows.Devices.Sms.IVectorView_ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; value : Windows.Devices.Sms.ISmsFilterRule
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; value : Windows.Devices.Sms.ISmsFilterRule
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISmsFilterRule_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISmsFilterRule_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.ISmsFilterRule_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISmsFilterRule_Interface
      ; items : Windows.Devices.Sms.ISmsFilterRule_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ISmsMessageRegistration : aliased constant Windows.IID := (3994682997, 62409, 23570, (147, 224, 242, 176, 27, 220, 230, 17 ));
   
   type IIterator_ISmsMessageRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmsMessageRegistration_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsMessageRegistration
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmsMessageRegistration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmsMessageRegistration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmsMessageRegistration_Interface
      ; items : Windows.Devices.Sms.ISmsMessageRegistration_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ISmsMessageRegistration : aliased constant Windows.IID := (4164352522, 30477, 24207, (134, 100, 1, 196, 63, 149, 158, 234 ));
   
   type IIterable_ISmsMessageRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmsMessageRegistration_Interface
      ; RetVal : access Windows.Devices.Sms.IIterator_ISmsMessageRegistration
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISmsMessageRegistration : aliased constant Windows.IID := (598386709, 9455, 22468, (177, 188, 148, 214, 44, 10, 89, 163 ));
   
   type IVectorView_ISmsMessageRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmsMessageRegistration_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.ISmsMessageRegistration
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmsMessageRegistration_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmsMessageRegistration_Interface
      ; value : Windows.Devices.Sms.ISmsMessageRegistration
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmsMessageRegistration_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.ISmsMessageRegistration_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVectorView_ISmsMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmsMessage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sms.ISmsMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmsMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmsMessage_Interface
      ; value : Windows.Devices.Sms.ISmsMessage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmsMessage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sms.ISmsMessage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_SmsMessageReceivedEventHandler : aliased constant Windows.IID := (192599049, 60461, 18382, (162, 83, 115, 43, 238, 235, 202, 205 ));
   
   type SmsMessageReceivedEventHandler_Interface(Callback : access procedure (sender : Windows.Devices.Sms.ISmsDevice ; e : Windows.Devices.Sms.ISmsMessageReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_SmsMessageReceivedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access SmsMessageReceivedEventHandler_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice
      ; e : Windows.Devices.Sms.ISmsMessageReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_SmsDeviceStatusChangedEventHandler : aliased constant Windows.IID := (2552959330, 15831, 17944, (175, 137, 12, 39, 45, 93, 6, 216 ));
   
   type SmsDeviceStatusChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Devices.Sms.ISmsDevice)) is new Windows.IMulticastDelegate_Interface(IID_SmsDeviceStatusChangedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access SmsDeviceStatusChangedEventHandler_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISmsMessage : aliased constant Windows.IID := (1315720326, 60390, 21977, (173, 192, 254, 204, 56, 200, 42, 162 ));
   
   type AsyncOperationCompletedHandler_ISmsMessage_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsMessage ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISmsMessage'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmsMessage_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsMessage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISmsDevice : aliased constant Windows.IID := (1152013444, 17360, 22675, (164, 238, 125, 176, 1, 19, 174, 96 ));
   
   type AsyncOperationCompletedHandler_ISmsDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISmsDevice'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmsDevice_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISmsSendMessageResult : aliased constant Windows.IID := (3352676094, 37382, 24241, (171, 193, 193, 188, 33, 128, 78, 235 ));
   
   type AsyncOperationCompletedHandler_ISmsSendMessageResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsSendMessageResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISmsSendMessageResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmsSendMessageResult_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsSendMessageResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged : aliased constant Windows.IID := (1060636902, 15854, 22438, (168, 141, 186, 207, 176, 102, 199, 251 ));
   
   type TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sms.ISmsDevice2 ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice2
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISmsMessageRegistration_add_MessageReceived : aliased constant Windows.IID := (871990727, 56570, 21279, (156, 206, 238, 94, 108, 38, 177, 230 ));
   
   type TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Interface(Callback : access procedure (sender : Windows.Devices.Sms.ISmsMessageRegistration ; args : Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISmsMessageRegistration_add_MessageReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Interface
      ; sender : Windows.Devices.Sms.ISmsMessageRegistration
      ; args : Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SmsBinaryMessage is Windows.Devices.Sms.ISmsBinaryMessage;
   
   function CreateSmsBinaryMessage return Windows.Devices.Sms.ISmsBinaryMessage;
   
   subtype SmsTextMessage is Windows.Devices.Sms.ISmsTextMessage;
   
   function CreateSmsTextMessage return Windows.Devices.Sms.ISmsTextMessage;
   
   subtype DeleteSmsMessageOperation is Windows.Foundation.IAsyncAction;
   subtype DeleteSmsMessagesOperation is Windows.Foundation.IAsyncAction;
   subtype GetSmsMessageOperation is Windows.Devices.Sms.IAsyncOperation_ISmsMessage;
   subtype GetSmsMessagesOperation is Windows.Devices.Sms.IAsyncOperationWithProgress_ISmsMessage_Int32;
   subtype SmsDeviceMessageStore is Windows.Devices.Sms.ISmsDeviceMessageStore;
   subtype SendSmsMessageOperation is Windows.Foundation.IAsyncAction;
   subtype SmsMessageReceivedEventArgs is Windows.Devices.Sms.ISmsMessageReceivedEventArgs;
   subtype SmsDevice is Windows.Devices.Sms.ISmsDevice;
   subtype GetSmsDeviceOperation is Windows.Devices.Sms.IAsyncOperation_SmsDevice;
   subtype SmsReceivedEventDetails is Windows.Devices.Sms.ISmsReceivedEventDetails;
   subtype SmsTextMessage2 is Windows.Devices.Sms.ISmsTextMessage2;
   
   function CreateSmsTextMessage2 return Windows.Devices.Sms.ISmsTextMessage2;
   
   subtype SmsWapMessage is Windows.Devices.Sms.ISmsWapMessage;
   subtype SmsAppMessage is Windows.Devices.Sms.ISmsAppMessage;
   
   function CreateSmsAppMessage return Windows.Devices.Sms.ISmsAppMessage;
   
   subtype SmsBroadcastMessage is Windows.Devices.Sms.ISmsBroadcastMessage;
   subtype SmsVoicemailMessage is Windows.Devices.Sms.ISmsVoicemailMessage;
   subtype SmsStatusMessage is Windows.Devices.Sms.ISmsStatusMessage;
   subtype SmsSendMessageResult is Windows.Devices.Sms.ISmsSendMessageResult;
   subtype SmsDevice2 is Windows.Devices.Sms.ISmsDevice2;
   subtype SmsMessageReceivedTriggerDetails is Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails;
   subtype SmsFilterRule is Windows.Devices.Sms.ISmsFilterRule;
   
   function CreateFilterRule
   (
      messageType : Windows.Devices.Sms.SmsMessageType
   )
   return Windows.Devices.Sms.ISmsFilterRule;
   
   subtype SmsFilterRules is Windows.Devices.Sms.ISmsFilterRules;
   
   function CreateFilterRules
   (
      actionType : Windows.Devices.Sms.SmsFilterActionType
   )
   return Windows.Devices.Sms.ISmsFilterRules;
   
   subtype SmsMessageRegistration is Windows.Devices.Sms.ISmsMessageRegistration;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sms.ISmsDevice2;
   
   function GetDefault
   return Windows.Devices.Sms.ISmsDevice2;
   
   function FromParentId
   (
      parentDeviceId : Windows.String
   )
   return Windows.Devices.Sms.ISmsDevice2;
   
   function get_AllRegistrations
   return Windows.Devices.Sms.IVectorView_ISmsMessageRegistration;
   
   function Register
   (
      id : Windows.String
      ; filterRules : Windows.Devices.Sms.ISmsFilterRules
   )
   return Windows.Devices.Sms.ISmsMessageRegistration;

end;
