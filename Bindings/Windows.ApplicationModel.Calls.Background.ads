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
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Calls.Background is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PhoneCallBlockedReason is (
      InCallBlockingList,
      PrivateNumber,
      UnknownNumber
   );
   for PhoneCallBlockedReason use (
      InCallBlockingList => 0,
      PrivateNumber => 1,
      UnknownNumber => 2
   );
   for PhoneCallBlockedReason'Size use 32;
   
   type PhoneCallBlockedReason_Ptr is access PhoneCallBlockedReason;
   
   type PhoneTriggerType is (
      NewVoicemailMessage,
      CallHistoryChanged,
      LineChanged,
      AirplaneModeDisabledForEmergencyCall,
      CallOriginDataRequest,
      CallBlocked
   );
   for PhoneTriggerType use (
      NewVoicemailMessage => 0,
      CallHistoryChanged => 1,
      LineChanged => 2,
      AirplaneModeDisabledForEmergencyCall => 3,
      CallOriginDataRequest => 4,
      CallBlocked => 5
   );
   for PhoneTriggerType'Size use 32;
   
   type PhoneTriggerType_Ptr is access PhoneTriggerType;
   
   type PhoneLineChangeKind is (
      Added,
      Removed,
      PropertiesChanged
   );
   for PhoneLineChangeKind use (
      Added => 0,
      Removed => 1,
      PropertiesChanged => 2
   );
   for PhoneLineChangeKind'Size use 32;
   
   type PhoneLineChangeKind_Ptr is access PhoneLineChangeKind;
   
   type PhoneLineProperties is (
      None,
      BrandingOptions,
      CanDial,
      CellularDetails,
      DisplayColor,
      DisplayName,
      NetworkName,
      NetworkState,
      Transport,
      Voicemail
   );
   for PhoneLineProperties use (
      None => 0,
      BrandingOptions => 1,
      CanDial => 2,
      CellularDetails => 4,
      DisplayColor => 8,
      DisplayName => 16,
      NetworkName => 32,
      NetworkState => 64,
      Transport => 128,
      Voicemail => 256
   );
   for PhoneLineProperties'Size use 32;
   
   type PhoneLineProperties_Ptr is access PhoneLineProperties;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CallsBackgroundContract is null record;
   pragma Convention (C_Pass_By_Copy , CallsBackgroundContract);
   
   type CallsBackgroundContract_Ptr is access CallsBackgroundContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPhoneCallBlockedTriggerDetails_Interface;
   type IPhoneCallBlockedTriggerDetails is access all IPhoneCallBlockedTriggerDetails_Interface'Class;
   type IPhoneCallBlockedTriggerDetails_Ptr is access all IPhoneCallBlockedTriggerDetails;
   type IPhoneCallOriginDataRequestTriggerDetails_Interface;
   type IPhoneCallOriginDataRequestTriggerDetails is access all IPhoneCallOriginDataRequestTriggerDetails_Interface'Class;
   type IPhoneCallOriginDataRequestTriggerDetails_Ptr is access all IPhoneCallOriginDataRequestTriggerDetails;
   type IPhoneNewVoicemailMessageTriggerDetails_Interface;
   type IPhoneNewVoicemailMessageTriggerDetails is access all IPhoneNewVoicemailMessageTriggerDetails_Interface'Class;
   type IPhoneNewVoicemailMessageTriggerDetails_Ptr is access all IPhoneNewVoicemailMessageTriggerDetails;
   type IPhoneLineChangedTriggerDetails_Interface;
   type IPhoneLineChangedTriggerDetails is access all IPhoneLineChangedTriggerDetails_Interface'Class;
   type IPhoneLineChangedTriggerDetails_Ptr is access all IPhoneLineChangedTriggerDetails;
   
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
   type IPhoneCallBlockedTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PhoneNumber
   (
      This       : access IPhoneCallBlockedTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LineId
   (
      This       : access IPhoneCallBlockedTriggerDetails_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CallBlockedReason
   (
      This       : access IPhoneCallBlockedTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.Background.PhoneCallBlockedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallBlockedTriggerDetails : aliased constant Windows.IID := (2762379426, 58561, 17023, (134, 78, 228, 112, 71, 125, 219, 103 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallOriginDataRequestTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IPhoneCallOriginDataRequestTriggerDetails_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumber
   (
      This       : access IPhoneCallOriginDataRequestTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOriginDataRequestTriggerDetails : aliased constant Windows.IID := (1855675199, 50507, 20098, (76, 201, 227, 41, 164, 24, 69, 146 ));
   
   ------------------------------------------------------------------------
   type IPhoneNewVoicemailMessageTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LineId
   (
      This       : access IPhoneNewVoicemailMessageTriggerDetails_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_VoicemailCount
   (
      This       : access IPhoneNewVoicemailMessageTriggerDetails_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_OperatorMessage
   (
      This       : access IPhoneNewVoicemailMessageTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNewVoicemailMessageTriggerDetails : aliased constant Windows.IID := (329826331, 47153, 18643, (139, 169, 141, 34, 166, 88, 13, 207 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineChangedTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LineId
   (
      This       : access IPhoneLineChangedTriggerDetails_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeType
   (
      This       : access IPhoneLineChangedTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.Background.PhoneLineChangeKind
   )
   return Windows.HRESULT is abstract;
   
   function HasLinePropertyChanged
   (
      This       : access IPhoneLineChangedTriggerDetails_Interface
      ; lineProperty : Windows.ApplicationModel.Calls.Background.PhoneLineProperties
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineChangedTriggerDetails : aliased constant Windows.IID := (3335725543, 53533, 16600, (178, 183, 228, 10, 1, 214, 98, 73 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhoneCallBlockedTriggerDetails is Windows.ApplicationModel.Calls.Background.IPhoneCallBlockedTriggerDetails;
   subtype PhoneCallOriginDataRequestTriggerDetails is Windows.ApplicationModel.Calls.Background.IPhoneCallOriginDataRequestTriggerDetails;
   subtype PhoneNewVoicemailMessageTriggerDetails is Windows.ApplicationModel.Calls.Background.IPhoneNewVoicemailMessageTriggerDetails;
   subtype PhoneLineChangedTriggerDetails is Windows.ApplicationModel.Calls.Background.IPhoneLineChangedTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
