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
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
with Windows; use Windows;
limited with Windows.Security.Cryptography.Core;
--------------------------------------------------------------------------------
package Windows.Devices.SmartCards is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SmartCardTriggerType is (
      EmulatorTransaction,
      EmulatorNearFieldEntry,
      EmulatorNearFieldExit,
      EmulatorHostApplicationActivated,
      EmulatorAppletIdGroupRegistrationChanged,
      ReaderCardAdded
   );
   for SmartCardTriggerType use (
      EmulatorTransaction => 0,
      EmulatorNearFieldEntry => 1,
      EmulatorNearFieldExit => 2,
      EmulatorHostApplicationActivated => 3,
      EmulatorAppletIdGroupRegistrationChanged => 4,
      ReaderCardAdded => 5
   );
   for SmartCardTriggerType'Size use 32;
   
   type SmartCardTriggerType_Ptr is access SmartCardTriggerType;
   
   type SmartCardLaunchBehavior is (
      Default,
      AboveLock
   );
   for SmartCardLaunchBehavior use (
      Default => 0,
      AboveLock => 1
   );
   for SmartCardLaunchBehavior'Size use 32;
   
   type SmartCardLaunchBehavior_Ptr is access SmartCardLaunchBehavior;
   
   type SmartCardEmulatorEnablementPolicy is (
      Never,
      Always,
      ScreenOn,
      ScreenUnlocked
   );
   for SmartCardEmulatorEnablementPolicy use (
      Never => 0,
      Always => 1,
      ScreenOn => 2,
      ScreenUnlocked => 3
   );
   for SmartCardEmulatorEnablementPolicy'Size use 32;
   
   type SmartCardEmulatorEnablementPolicy_Ptr is access SmartCardEmulatorEnablementPolicy;
   
   type SmartCardEmulationCategory is (
      Other,
      Payment
   );
   for SmartCardEmulationCategory use (
      Other => 0,
      Payment => 1
   );
   for SmartCardEmulationCategory'Size use 32;
   
   type SmartCardEmulationCategory_Ptr is access SmartCardEmulationCategory;
   
   type SmartCardEmulationType is (
      Host,
      Uicc,
      EmbeddedSE
   );
   for SmartCardEmulationType use (
      Host => 0,
      Uicc => 1,
      EmbeddedSE => 2
   );
   for SmartCardEmulationType'Size use 32;
   
   type SmartCardEmulationType_Ptr is access SmartCardEmulationType;
   
   type SmartCardAppletIdGroupActivationPolicy is (
      Disabled,
      ForegroundOverride,
      Enabled
   );
   for SmartCardAppletIdGroupActivationPolicy use (
      Disabled => 0,
      ForegroundOverride => 1,
      Enabled => 2
   );
   for SmartCardAppletIdGroupActivationPolicy'Size use 32;
   
   type SmartCardAppletIdGroupActivationPolicy_Ptr is access SmartCardAppletIdGroupActivationPolicy;
   
   type SmartCardActivationPolicyChangeResult is (
      Denied,
      Allowed
   );
   for SmartCardActivationPolicyChangeResult use (
      Denied => 0,
      Allowed => 1
   );
   for SmartCardActivationPolicyChangeResult'Size use 32;
   
   type SmartCardActivationPolicyChangeResult_Ptr is access SmartCardActivationPolicyChangeResult;
   
   type SmartCardEmulatorConnectionDeactivatedReason is (
      ConnectionLost,
      ConnectionRedirected
   );
   for SmartCardEmulatorConnectionDeactivatedReason use (
      ConnectionLost => 0,
      ConnectionRedirected => 1
   );
   for SmartCardEmulatorConnectionDeactivatedReason'Size use 32;
   
   type SmartCardEmulatorConnectionDeactivatedReason_Ptr is access SmartCardEmulatorConnectionDeactivatedReason;
   
   type SmartCardEmulatorConnectionSource is (
      Unknown,
      NfcReader
   );
   for SmartCardEmulatorConnectionSource use (
      Unknown => 0,
      NfcReader => 1
   );
   for SmartCardEmulatorConnectionSource'Size use 32;
   
   type SmartCardEmulatorConnectionSource_Ptr is access SmartCardEmulatorConnectionSource;
   
   type SmartCardAutomaticResponseStatus is (
      None,
      Success,
      UnknownError
   );
   for SmartCardAutomaticResponseStatus use (
      None => 0,
      Success => 1,
      UnknownError => 2
   );
   for SmartCardAutomaticResponseStatus'Size use 32;
   
   type SmartCardAutomaticResponseStatus_Ptr is access SmartCardAutomaticResponseStatus;
   
   type SmartCardUnlockPromptingBehavior is (
      AllowUnlockPrompt,
      RequireUnlockPrompt,
      PreventUnlockPrompt
   );
   for SmartCardUnlockPromptingBehavior use (
      AllowUnlockPrompt => 0,
      RequireUnlockPrompt => 1,
      PreventUnlockPrompt => 2
   );
   for SmartCardUnlockPromptingBehavior'Size use 32;
   
   type SmartCardUnlockPromptingBehavior_Ptr is access SmartCardUnlockPromptingBehavior;
   
   type SmartCardCryptogramStorageKeyAlgorithm is (
      None,
      Rsa2048
   );
   for SmartCardCryptogramStorageKeyAlgorithm use (
      None => 0,
      Rsa2048 => 1
   );
   for SmartCardCryptogramStorageKeyAlgorithm'Size use 32;
   
   type SmartCardCryptogramStorageKeyAlgorithm_Ptr is access SmartCardCryptogramStorageKeyAlgorithm;
   
   type SmartCardCryptogramMaterialType is (
      None,
      StaticDataAuthentication,
      TripleDes112,
      Aes,
      RsaPkcs1
   );
   for SmartCardCryptogramMaterialType use (
      None => 0,
      StaticDataAuthentication => 1,
      TripleDes112 => 2,
      Aes => 3,
      RsaPkcs1 => 4
   );
   for SmartCardCryptogramMaterialType'Size use 32;
   
   type SmartCardCryptogramMaterialType_Ptr is access SmartCardCryptogramMaterialType;
   
   type SmartCardCryptogramMaterialProtectionMethod is (
      None,
      WhiteBoxing
   );
   for SmartCardCryptogramMaterialProtectionMethod use (
      None => 0,
      WhiteBoxing => 1
   );
   for SmartCardCryptogramMaterialProtectionMethod'Size use 32;
   
   type SmartCardCryptogramMaterialProtectionMethod_Ptr is access SmartCardCryptogramMaterialProtectionMethod;
   
   type SmartCardCryptogramAlgorithm is (
      None,
      CbcMac,
      Cvc3Umd,
      DecimalizedMsd,
      Cvc3MD,
      Sha1,
      SignedDynamicApplicationData,
      RsaPkcs1,
      Sha256Hmac
   );
   for SmartCardCryptogramAlgorithm use (
      None => 0,
      CbcMac => 1,
      Cvc3Umd => 2,
      DecimalizedMsd => 3,
      Cvc3MD => 4,
      Sha1 => 5,
      SignedDynamicApplicationData => 6,
      RsaPkcs1 => 7,
      Sha256Hmac => 8
   );
   for SmartCardCryptogramAlgorithm'Size use 32;
   
   type SmartCardCryptogramAlgorithm_Ptr is access SmartCardCryptogramAlgorithm;
   
   type SmartCardCryptogramMaterialPackageFormat is (
      None,
      JweRsaPki
   );
   for SmartCardCryptogramMaterialPackageFormat use (
      None => 0,
      JweRsaPki => 1
   );
   for SmartCardCryptogramMaterialPackageFormat'Size use 32;
   
   type SmartCardCryptogramMaterialPackageFormat_Ptr is access SmartCardCryptogramMaterialPackageFormat;
   
   type SmartCardCryptogramStorageKeyCapabilities is (
      None,
      HardwareProtection,
      UnlockPrompt
   );
   for SmartCardCryptogramStorageKeyCapabilities use (
      None => 0,
      HardwareProtection => 1,
      UnlockPrompt => 2
   );
   for SmartCardCryptogramStorageKeyCapabilities'Size use 32;
   
   type SmartCardCryptogramStorageKeyCapabilities_Ptr is access SmartCardCryptogramStorageKeyCapabilities;
   
   type SmartCardCryptogramMaterialPackageConfirmationResponseFormat is (
      None,
      VisaHmac
   );
   for SmartCardCryptogramMaterialPackageConfirmationResponseFormat use (
      None => 0,
      VisaHmac => 1
   );
   for SmartCardCryptogramMaterialPackageConfirmationResponseFormat'Size use 32;
   
   type SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr is access SmartCardCryptogramMaterialPackageConfirmationResponseFormat;
   
   type SmartCardCryptogramPlacementOptions is (
      None,
      UnitsAreInNibbles,
      ChainOutput
   );
   for SmartCardCryptogramPlacementOptions use (
      None => 0,
      UnitsAreInNibbles => 1,
      ChainOutput => 2
   );
   for SmartCardCryptogramPlacementOptions'Size use 32;
   
   type SmartCardCryptogramPlacementOptions_Ptr is access SmartCardCryptogramPlacementOptions;
   
   type SmartCardCryptogramGeneratorOperationStatus is (
      Success,
      AuthorizationFailed,
      AuthorizationCanceled,
      AuthorizationRequired,
      CryptogramMaterialPackageStorageKeyExists,
      NoCryptogramMaterialPackageStorageKey,
      NoCryptogramMaterialPackage,
      UnsupportedCryptogramMaterialPackage,
      UnknownCryptogramMaterialName,
      InvalidCryptogramMaterialUsage,
      ApduResponseNotSent,
      OtherError,
      ValidationFailed,
      NotSupported
   );
   for SmartCardCryptogramGeneratorOperationStatus use (
      Success => 0,
      AuthorizationFailed => 1,
      AuthorizationCanceled => 2,
      AuthorizationRequired => 3,
      CryptogramMaterialPackageStorageKeyExists => 4,
      NoCryptogramMaterialPackageStorageKey => 5,
      NoCryptogramMaterialPackage => 6,
      UnsupportedCryptogramMaterialPackage => 7,
      UnknownCryptogramMaterialName => 8,
      InvalidCryptogramMaterialUsage => 9,
      ApduResponseNotSent => 10,
      OtherError => 11,
      ValidationFailed => 12,
      NotSupported => 13
   );
   for SmartCardCryptogramGeneratorOperationStatus'Size use 32;
   
   type SmartCardCryptogramGeneratorOperationStatus_Ptr is access SmartCardCryptogramGeneratorOperationStatus;
   
   type SmartCardCryptographicKeyAttestationStatus is (
      NoAttestation,
      SoftwareKeyWithoutTpm,
      SoftwareKeyWithTpm,
      TpmKeyUnknownAttestationStatus,
      TpmKeyWithoutAttestationCapability,
      TpmKeyWithTemporaryAttestationFailure,
      TpmKeyWithLongTermAttestationFailure,
      TpmKeyWithAttestation
   );
   for SmartCardCryptographicKeyAttestationStatus use (
      NoAttestation => 0,
      SoftwareKeyWithoutTpm => 1,
      SoftwareKeyWithTpm => 2,
      TpmKeyUnknownAttestationStatus => 3,
      TpmKeyWithoutAttestationCapability => 4,
      TpmKeyWithTemporaryAttestationFailure => 5,
      TpmKeyWithLongTermAttestationFailure => 6,
      TpmKeyWithAttestation => 7
   );
   for SmartCardCryptographicKeyAttestationStatus'Size use 32;
   
   type SmartCardCryptographicKeyAttestationStatus_Ptr is access SmartCardCryptographicKeyAttestationStatus;
   
   type SmartCardReaderKind is (
      Any,
      Generic_x,
      Tpm,
      Nfc,
      Uicc,
      EmbeddedSE
   );
   for SmartCardReaderKind use (
      Any => 0,
      Generic_x => 1,
      Tpm => 2,
      Nfc => 3,
      Uicc => 4,
      EmbeddedSE => 5
   );
   for SmartCardReaderKind'Size use 32;
   
   type SmartCardReaderKind_Ptr is access SmartCardReaderKind;
   
   type SmartCardReaderStatus is (
      Disconnected,
      Ready,
      Exclusive
   );
   for SmartCardReaderStatus use (
      Disconnected => 0,
      Ready => 1,
      Exclusive => 2
   );
   for SmartCardReaderStatus'Size use 32;
   
   type SmartCardReaderStatus_Ptr is access SmartCardReaderStatus;
   
   type SmartCardStatus is (
      Disconnected,
      Ready,
      Shared,
      Exclusive,
      Unresponsive
   );
   for SmartCardStatus use (
      Disconnected => 0,
      Ready => 1,
      Shared => 2,
      Exclusive => 3,
      Unresponsive => 4
   );
   for SmartCardStatus'Size use 32;
   
   type SmartCardStatus_Ptr is access SmartCardStatus;
   
   type SmartCardPinCharacterPolicyOption is (
      Allow,
      RequireAtLeastOne,
      Disallow
   );
   for SmartCardPinCharacterPolicyOption use (
      Allow => 0,
      RequireAtLeastOne => 1,
      Disallow => 2
   );
   for SmartCardPinCharacterPolicyOption'Size use 32;
   
   type SmartCardPinCharacterPolicyOption_Ptr is access SmartCardPinCharacterPolicyOption;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SmartCardBackgroundTriggerContract is null record;
   pragma Convention (C_Pass_By_Copy , SmartCardBackgroundTriggerContract);
   
   type SmartCardBackgroundTriggerContract_Ptr is access SmartCardBackgroundTriggerContract;
   
   type SmartCardEmulatorContract is null record;
   pragma Convention (C_Pass_By_Copy , SmartCardEmulatorContract);
   
   type SmartCardEmulatorContract_Ptr is access SmartCardEmulatorContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type SmartCardPinResetHandler_Interface;
   type SmartCardPinResetHandler is access all SmartCardPinResetHandler_Interface'Class;
   type SmartCardPinResetHandler_Ptr is access all SmartCardPinResetHandler;
   type AsyncOperationCompletedHandler_ISmartCardEmulator_Interface;
   type AsyncOperationCompletedHandler_ISmartCardEmulator is access all AsyncOperationCompletedHandler_ISmartCardEmulator_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardEmulator_Ptr is access all AsyncOperationCompletedHandler_ISmartCardEmulator;
   type AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface;
   type AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration is access all AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Ptr is access all AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration;
   type TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface;
   type TypedEventHandler_ISmartCardEmulator2_add_ApduReceived is access all TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface'Class;
   type TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Ptr is access all TypedEventHandler_ISmartCardEmulator2_add_ApduReceived;
   type TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface;
   type TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated is access all TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface'Class;
   type TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Ptr is access all TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated;
   type AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface;
   type AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult is access all AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface'Class;
   type AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Ptr is access all AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult;
   type AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface;
   type AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus is access all AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Ptr is access all AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo is access all AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof is access all AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Ptr is access all AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult;
   type AsyncOperationCompletedHandler_ISmartCardReader_Interface;
   type AsyncOperationCompletedHandler_ISmartCardReader is access all AsyncOperationCompletedHandler_ISmartCardReader_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardReader_Ptr is access all AsyncOperationCompletedHandler_ISmartCardReader;
   type AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface;
   type AsyncOperationCompletedHandler_SmartCardReaderStatus is access all AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SmartCardReaderStatus_Ptr is access all AsyncOperationCompletedHandler_SmartCardReaderStatus;
   type TypedEventHandler_ISmartCardReader_add_CardAdded_Interface;
   type TypedEventHandler_ISmartCardReader_add_CardAdded is access all TypedEventHandler_ISmartCardReader_add_CardAdded_Interface'Class;
   type TypedEventHandler_ISmartCardReader_add_CardAdded_Ptr is access all TypedEventHandler_ISmartCardReader_add_CardAdded;
   type TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface;
   type TypedEventHandler_ISmartCardReader_add_CardRemoved is access all TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface'Class;
   type TypedEventHandler_ISmartCardReader_add_CardRemoved_Ptr is access all TypedEventHandler_ISmartCardReader_add_CardRemoved;
   type AsyncOperationCompletedHandler_SmartCardStatus_Interface;
   type AsyncOperationCompletedHandler_SmartCardStatus is access all AsyncOperationCompletedHandler_SmartCardStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SmartCardStatus_Ptr is access all AsyncOperationCompletedHandler_SmartCardStatus;
   type AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface;
   type AsyncOperationCompletedHandler_ISmartCardProvisioning is access all AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardProvisioning_Ptr is access all AsyncOperationCompletedHandler_ISmartCardProvisioning;
   type AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface;
   type AsyncOperationCompletedHandler_ISmartCardChallengeContext is access all AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardChallengeContext_Ptr is access all AsyncOperationCompletedHandler_ISmartCardChallengeContext;
   type AsyncOperationCompletedHandler_ISmartCardConnection_Interface;
   type AsyncOperationCompletedHandler_ISmartCardConnection is access all AsyncOperationCompletedHandler_ISmartCardConnection_Interface'Class;
   type AsyncOperationCompletedHandler_ISmartCardConnection_Ptr is access all AsyncOperationCompletedHandler_ISmartCardConnection;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISmartCardTriggerDetails_Interface;
   type ISmartCardTriggerDetails is access all ISmartCardTriggerDetails_Interface'Class;
   type ISmartCardTriggerDetails_Ptr is access all ISmartCardTriggerDetails;
   type ISmartCardTriggerDetails2_Interface;
   type ISmartCardTriggerDetails2 is access all ISmartCardTriggerDetails2_Interface'Class;
   type ISmartCardTriggerDetails2_Ptr is access all ISmartCardTriggerDetails2;
   type ISmartCardTriggerDetails3_Interface;
   type ISmartCardTriggerDetails3 is access all ISmartCardTriggerDetails3_Interface'Class;
   type ISmartCardTriggerDetails3_Ptr is access all ISmartCardTriggerDetails3;
   type ISmartCardEmulatorStatics_Interface;
   type ISmartCardEmulatorStatics is access all ISmartCardEmulatorStatics_Interface'Class;
   type ISmartCardEmulatorStatics_Ptr is access all ISmartCardEmulatorStatics;
   type ISmartCardEmulatorStatics2_Interface;
   type ISmartCardEmulatorStatics2 is access all ISmartCardEmulatorStatics2_Interface'Class;
   type ISmartCardEmulatorStatics2_Ptr is access all ISmartCardEmulatorStatics2;
   type ISmartCardEmulatorStatics3_Interface;
   type ISmartCardEmulatorStatics3 is access all ISmartCardEmulatorStatics3_Interface'Class;
   type ISmartCardEmulatorStatics3_Ptr is access all ISmartCardEmulatorStatics3;
   type ISmartCardEmulator_Interface;
   type ISmartCardEmulator is access all ISmartCardEmulator_Interface'Class;
   type ISmartCardEmulator_Ptr is access all ISmartCardEmulator;
   type ISmartCardEmulator2_Interface;
   type ISmartCardEmulator2 is access all ISmartCardEmulator2_Interface'Class;
   type ISmartCardEmulator2_Ptr is access all ISmartCardEmulator2;
   type ISmartCardEmulatorApduReceivedEventArgs_Interface;
   type ISmartCardEmulatorApduReceivedEventArgs is access all ISmartCardEmulatorApduReceivedEventArgs_Interface'Class;
   type ISmartCardEmulatorApduReceivedEventArgs_Ptr is access all ISmartCardEmulatorApduReceivedEventArgs;
   type ISmartCardEmulatorApduReceivedEventArgs2_Interface;
   type ISmartCardEmulatorApduReceivedEventArgs2 is access all ISmartCardEmulatorApduReceivedEventArgs2_Interface'Class;
   type ISmartCardEmulatorApduReceivedEventArgs2_Ptr is access all ISmartCardEmulatorApduReceivedEventArgs2;
   type ISmartCardEmulatorConnectionProperties_Interface;
   type ISmartCardEmulatorConnectionProperties is access all ISmartCardEmulatorConnectionProperties_Interface'Class;
   type ISmartCardEmulatorConnectionProperties_Ptr is access all ISmartCardEmulatorConnectionProperties;
   type ISmartCardEmulatorConnectionDeactivatedEventArgs_Interface;
   type ISmartCardEmulatorConnectionDeactivatedEventArgs is access all ISmartCardEmulatorConnectionDeactivatedEventArgs_Interface'Class;
   type ISmartCardEmulatorConnectionDeactivatedEventArgs_Ptr is access all ISmartCardEmulatorConnectionDeactivatedEventArgs;
   type ISmartCardAppletIdGroup_Interface;
   type ISmartCardAppletIdGroup is access all ISmartCardAppletIdGroup_Interface'Class;
   type ISmartCardAppletIdGroup_Ptr is access all ISmartCardAppletIdGroup;
   type ISmartCardAppletIdGroupFactory_Interface;
   type ISmartCardAppletIdGroupFactory is access all ISmartCardAppletIdGroupFactory_Interface'Class;
   type ISmartCardAppletIdGroupFactory_Ptr is access all ISmartCardAppletIdGroupFactory;
   type ISmartCardAppletIdGroupStatics_Interface;
   type ISmartCardAppletIdGroupStatics is access all ISmartCardAppletIdGroupStatics_Interface'Class;
   type ISmartCardAppletIdGroupStatics_Ptr is access all ISmartCardAppletIdGroupStatics;
   type ISmartCardAppletIdGroupRegistration_Interface;
   type ISmartCardAppletIdGroupRegistration is access all ISmartCardAppletIdGroupRegistration_Interface'Class;
   type ISmartCardAppletIdGroupRegistration_Ptr is access all ISmartCardAppletIdGroupRegistration;
   type ISmartCardAutomaticResponseApdu_Interface;
   type ISmartCardAutomaticResponseApdu is access all ISmartCardAutomaticResponseApdu_Interface'Class;
   type ISmartCardAutomaticResponseApdu_Ptr is access all ISmartCardAutomaticResponseApdu;
   type ISmartCardAutomaticResponseApdu2_Interface;
   type ISmartCardAutomaticResponseApdu2 is access all ISmartCardAutomaticResponseApdu2_Interface'Class;
   type ISmartCardAutomaticResponseApdu2_Ptr is access all ISmartCardAutomaticResponseApdu2;
   type ISmartCardAutomaticResponseApdu3_Interface;
   type ISmartCardAutomaticResponseApdu3 is access all ISmartCardAutomaticResponseApdu3_Interface'Class;
   type ISmartCardAutomaticResponseApdu3_Ptr is access all ISmartCardAutomaticResponseApdu3;
   type ISmartCardAutomaticResponseApduFactory_Interface;
   type ISmartCardAutomaticResponseApduFactory is access all ISmartCardAutomaticResponseApduFactory_Interface'Class;
   type ISmartCardAutomaticResponseApduFactory_Ptr is access all ISmartCardAutomaticResponseApduFactory;
   type ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Interface;
   type ISmartCardEmulatorApduReceivedEventArgsWithCryptograms is access all ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Interface'Class;
   type ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Ptr is access all ISmartCardEmulatorApduReceivedEventArgsWithCryptograms;
   type ISmartCardCryptogramStorageKeyInfo_Interface;
   type ISmartCardCryptogramStorageKeyInfo is access all ISmartCardCryptogramStorageKeyInfo_Interface'Class;
   type ISmartCardCryptogramStorageKeyInfo_Ptr is access all ISmartCardCryptogramStorageKeyInfo;
   type ISmartCardCryptogramStorageKeyInfo2_Interface;
   type ISmartCardCryptogramStorageKeyInfo2 is access all ISmartCardCryptogramStorageKeyInfo2_Interface'Class;
   type ISmartCardCryptogramStorageKeyInfo2_Ptr is access all ISmartCardCryptogramStorageKeyInfo2;
   type ISmartCardCryptogramMaterialPossessionProof_Interface;
   type ISmartCardCryptogramMaterialPossessionProof is access all ISmartCardCryptogramMaterialPossessionProof_Interface'Class;
   type ISmartCardCryptogramMaterialPossessionProof_Ptr is access all ISmartCardCryptogramMaterialPossessionProof;
   type ISmartCardCryptogramPlacementStep_Interface;
   type ISmartCardCryptogramPlacementStep is access all ISmartCardCryptogramPlacementStep_Interface'Class;
   type ISmartCardCryptogramPlacementStep_Ptr is access all ISmartCardCryptogramPlacementStep;
   type ISmartCardCryptogramStorageKeyCharacteristics_Interface;
   type ISmartCardCryptogramStorageKeyCharacteristics is access all ISmartCardCryptogramStorageKeyCharacteristics_Interface'Class;
   type ISmartCardCryptogramStorageKeyCharacteristics_Ptr is access all ISmartCardCryptogramStorageKeyCharacteristics;
   type ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface;
   type ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult is access all ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface'Class;
   type ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Ptr is access all ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult;
   type ISmartCardCryptogramMaterialPackageCharacteristics_Interface;
   type ISmartCardCryptogramMaterialPackageCharacteristics is access all ISmartCardCryptogramMaterialPackageCharacteristics_Interface'Class;
   type ISmartCardCryptogramMaterialPackageCharacteristics_Ptr is access all ISmartCardCryptogramMaterialPackageCharacteristics;
   type ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface;
   type ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult is access all ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface'Class;
   type ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Ptr is access all ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult;
   type ISmartCardCryptogramMaterialCharacteristics_Interface;
   type ISmartCardCryptogramMaterialCharacteristics is access all ISmartCardCryptogramMaterialCharacteristics_Interface'Class;
   type ISmartCardCryptogramMaterialCharacteristics_Ptr is access all ISmartCardCryptogramMaterialCharacteristics;
   type ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface;
   type ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult is access all ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface'Class;
   type ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Ptr is access all ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult;
   type ISmartCardCryptogramGeneratorStatics_Interface;
   type ISmartCardCryptogramGeneratorStatics is access all ISmartCardCryptogramGeneratorStatics_Interface'Class;
   type ISmartCardCryptogramGeneratorStatics_Ptr is access all ISmartCardCryptogramGeneratorStatics;
   type ISmartCardCryptogramGeneratorStatics2_Interface;
   type ISmartCardCryptogramGeneratorStatics2 is access all ISmartCardCryptogramGeneratorStatics2_Interface'Class;
   type ISmartCardCryptogramGeneratorStatics2_Ptr is access all ISmartCardCryptogramGeneratorStatics2;
   type ISmartCardCryptogramGenerator_Interface;
   type ISmartCardCryptogramGenerator is access all ISmartCardCryptogramGenerator_Interface'Class;
   type ISmartCardCryptogramGenerator_Ptr is access all ISmartCardCryptogramGenerator;
   type ISmartCardCryptogramGenerator2_Interface;
   type ISmartCardCryptogramGenerator2 is access all ISmartCardCryptogramGenerator2_Interface'Class;
   type ISmartCardCryptogramGenerator2_Ptr is access all ISmartCardCryptogramGenerator2;
   type ISmartCardReaderStatics_Interface;
   type ISmartCardReaderStatics is access all ISmartCardReaderStatics_Interface'Class;
   type ISmartCardReaderStatics_Ptr is access all ISmartCardReaderStatics;
   type ISmartCardReader_Interface;
   type ISmartCardReader is access all ISmartCardReader_Interface'Class;
   type ISmartCardReader_Ptr is access all ISmartCardReader;
   type ICardAddedEventArgs_Interface;
   type ICardAddedEventArgs is access all ICardAddedEventArgs_Interface'Class;
   type ICardAddedEventArgs_Ptr is access all ICardAddedEventArgs;
   type ICardRemovedEventArgs_Interface;
   type ICardRemovedEventArgs is access all ICardRemovedEventArgs_Interface'Class;
   type ICardRemovedEventArgs_Ptr is access all ICardRemovedEventArgs;
   type ISmartCard_Interface;
   type ISmartCard is access all ISmartCard_Interface'Class;
   type ISmartCard_Ptr is access all ISmartCard;
   type ISmartCardProvisioningStatics_Interface;
   type ISmartCardProvisioningStatics is access all ISmartCardProvisioningStatics_Interface'Class;
   type ISmartCardProvisioningStatics_Ptr is access all ISmartCardProvisioningStatics;
   type ISmartCardProvisioningStatics2_Interface;
   type ISmartCardProvisioningStatics2 is access all ISmartCardProvisioningStatics2_Interface'Class;
   type ISmartCardProvisioningStatics2_Ptr is access all ISmartCardProvisioningStatics2;
   type ISmartCardProvisioning_Interface;
   type ISmartCardProvisioning is access all ISmartCardProvisioning_Interface'Class;
   type ISmartCardProvisioning_Ptr is access all ISmartCardProvisioning;
   type ISmartCardProvisioning2_Interface;
   type ISmartCardProvisioning2 is access all ISmartCardProvisioning2_Interface'Class;
   type ISmartCardProvisioning2_Ptr is access all ISmartCardProvisioning2;
   type ISmartCardPinResetRequest_Interface;
   type ISmartCardPinResetRequest is access all ISmartCardPinResetRequest_Interface'Class;
   type ISmartCardPinResetRequest_Ptr is access all ISmartCardPinResetRequest;
   type ISmartCardPinResetDeferral_Interface;
   type ISmartCardPinResetDeferral is access all ISmartCardPinResetDeferral_Interface'Class;
   type ISmartCardPinResetDeferral_Ptr is access all ISmartCardPinResetDeferral;
   type ISmartCardPinPolicy_Interface;
   type ISmartCardPinPolicy is access all ISmartCardPinPolicy_Interface'Class;
   type ISmartCardPinPolicy_Ptr is access all ISmartCardPinPolicy;
   type ISmartCardConnect_Interface;
   type ISmartCardConnect is access all ISmartCardConnect_Interface'Class;
   type ISmartCardConnect_Ptr is access all ISmartCardConnect;
   type ISmartCardChallengeContext_Interface;
   type ISmartCardChallengeContext is access all ISmartCardChallengeContext_Interface'Class;
   type ISmartCardChallengeContext_Ptr is access all ISmartCardChallengeContext;
   type ISmartCardConnection_Interface;
   type ISmartCardConnection is access all ISmartCardConnection_Interface'Class;
   type ISmartCardConnection_Ptr is access all ISmartCardConnection;
   type IAsyncOperation_ISmartCardEmulator_Interface;
   type IAsyncOperation_ISmartCardEmulator is access all IAsyncOperation_ISmartCardEmulator_Interface'Class;
   type IAsyncOperation_ISmartCardEmulator_Ptr is access all IAsyncOperation_ISmartCardEmulator;
   type IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface;
   type IAsyncOperation_ISmartCardAppletIdGroupRegistration is access all IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface'Class;
   type IAsyncOperation_ISmartCardAppletIdGroupRegistration_Ptr is access all IAsyncOperation_ISmartCardAppletIdGroupRegistration;
   type IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface;
   type IAsyncOperation_SmartCardActivationPolicyChangeResult is access all IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface'Class;
   type IAsyncOperation_SmartCardActivationPolicyChangeResult_Ptr is access all IAsyncOperation_SmartCardActivationPolicyChangeResult;
   type IIterator_ISmartCardAutomaticResponseApdu_Interface;
   type IIterator_ISmartCardAutomaticResponseApdu is access all IIterator_ISmartCardAutomaticResponseApdu_Interface'Class;
   type IIterator_ISmartCardAutomaticResponseApdu_Ptr is access all IIterator_ISmartCardAutomaticResponseApdu;
   type IIterable_ISmartCardAutomaticResponseApdu_Interface;
   type IIterable_ISmartCardAutomaticResponseApdu is access all IIterable_ISmartCardAutomaticResponseApdu_Interface'Class;
   type IIterable_ISmartCardAutomaticResponseApdu_Ptr is access all IIterable_ISmartCardAutomaticResponseApdu;
   type IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface;
   type IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus is access all IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface'Class;
   type IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Ptr is access all IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus;
   type IIterator_ISmartCardCryptogramPlacementStep_Interface;
   type IIterator_ISmartCardCryptogramPlacementStep is access all IIterator_ISmartCardCryptogramPlacementStep_Interface'Class;
   type IIterator_ISmartCardCryptogramPlacementStep_Ptr is access all IIterator_ISmartCardCryptogramPlacementStep;
   type IIterable_ISmartCardCryptogramPlacementStep_Interface;
   type IIterable_ISmartCardCryptogramPlacementStep is access all IIterable_ISmartCardCryptogramPlacementStep_Interface'Class;
   type IIterable_ISmartCardCryptogramPlacementStep_Ptr is access all IIterable_ISmartCardCryptogramPlacementStep;
   type IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface;
   type IIterator_ISmartCardCryptogramStorageKeyCharacteristics is access all IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface'Class;
   type IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Ptr is access all IIterator_ISmartCardCryptogramStorageKeyCharacteristics;
   type IIterable_ISmartCardCryptogramStorageKeyCharacteristics_Interface;
   type IIterable_ISmartCardCryptogramStorageKeyCharacteristics is access all IIterable_ISmartCardCryptogramStorageKeyCharacteristics_Interface'Class;
   type IIterable_ISmartCardCryptogramStorageKeyCharacteristics_Ptr is access all IIterable_ISmartCardCryptogramStorageKeyCharacteristics;
   type IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface;
   type IVectorView_ISmartCardCryptogramStorageKeyCharacteristics is access all IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface'Class;
   type IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Ptr is access all IVectorView_ISmartCardCryptogramStorageKeyCharacteristics;
   type IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface;
   type IIterator_ISmartCardCryptogramMaterialPackageCharacteristics is access all IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface'Class;
   type IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Ptr is access all IIterator_ISmartCardCryptogramMaterialPackageCharacteristics;
   type IIterable_ISmartCardCryptogramMaterialPackageCharacteristics_Interface;
   type IIterable_ISmartCardCryptogramMaterialPackageCharacteristics is access all IIterable_ISmartCardCryptogramMaterialPackageCharacteristics_Interface'Class;
   type IIterable_ISmartCardCryptogramMaterialPackageCharacteristics_Ptr is access all IIterable_ISmartCardCryptogramMaterialPackageCharacteristics;
   type IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface;
   type IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics is access all IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface'Class;
   type IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Ptr is access all IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics;
   type IIterator_SmartCardCryptogramAlgorithm_Interface;
   type IIterator_SmartCardCryptogramAlgorithm is access all IIterator_SmartCardCryptogramAlgorithm_Interface'Class;
   type IIterator_SmartCardCryptogramAlgorithm_Ptr is access all IIterator_SmartCardCryptogramAlgorithm;
   type IIterable_SmartCardCryptogramAlgorithm_Interface;
   type IIterable_SmartCardCryptogramAlgorithm is access all IIterable_SmartCardCryptogramAlgorithm_Interface'Class;
   type IIterable_SmartCardCryptogramAlgorithm_Ptr is access all IIterable_SmartCardCryptogramAlgorithm;
   type IVectorView_SmartCardCryptogramAlgorithm_Interface;
   type IVectorView_SmartCardCryptogramAlgorithm is access all IVectorView_SmartCardCryptogramAlgorithm_Interface'Class;
   type IVectorView_SmartCardCryptogramAlgorithm_Ptr is access all IVectorView_SmartCardCryptogramAlgorithm;
   type IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface;
   type IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat is access all IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface'Class;
   type IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr is access all IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;
   type IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface;
   type IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat is access all IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface'Class;
   type IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr is access all IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;
   type IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface;
   type IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat is access all IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface'Class;
   type IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr is access all IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;
   type IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface;
   type IIterator_ISmartCardCryptogramMaterialCharacteristics is access all IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface'Class;
   type IIterator_ISmartCardCryptogramMaterialCharacteristics_Ptr is access all IIterator_ISmartCardCryptogramMaterialCharacteristics;
   type IIterable_ISmartCardCryptogramMaterialCharacteristics_Interface;
   type IIterable_ISmartCardCryptogramMaterialCharacteristics is access all IIterable_ISmartCardCryptogramMaterialCharacteristics_Interface'Class;
   type IIterable_ISmartCardCryptogramMaterialCharacteristics_Ptr is access all IIterable_ISmartCardCryptogramMaterialCharacteristics;
   type IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface;
   type IVectorView_ISmartCardCryptogramMaterialCharacteristics is access all IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface'Class;
   type IVectorView_ISmartCardCryptogramMaterialCharacteristics_Ptr is access all IVectorView_ISmartCardCryptogramMaterialCharacteristics;
   type IAsyncOperation_ISmartCardCryptogramGenerator_Interface;
   type IAsyncOperation_ISmartCardCryptogramGenerator is access all IAsyncOperation_ISmartCardCryptogramGenerator_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramGenerator_Ptr is access all IAsyncOperation_ISmartCardCryptogramGenerator;
   type IIterator_SmartCardCryptogramMaterialType_Interface;
   type IIterator_SmartCardCryptogramMaterialType is access all IIterator_SmartCardCryptogramMaterialType_Interface'Class;
   type IIterator_SmartCardCryptogramMaterialType_Ptr is access all IIterator_SmartCardCryptogramMaterialType;
   type IIterable_SmartCardCryptogramMaterialType_Interface;
   type IIterable_SmartCardCryptogramMaterialType is access all IIterable_SmartCardCryptogramMaterialType_Interface'Class;
   type IIterable_SmartCardCryptogramMaterialType_Ptr is access all IIterable_SmartCardCryptogramMaterialType;
   type IVectorView_SmartCardCryptogramMaterialType_Interface;
   type IVectorView_SmartCardCryptogramMaterialType is access all IVectorView_SmartCardCryptogramMaterialType_Interface'Class;
   type IVectorView_SmartCardCryptogramMaterialType_Ptr is access all IVectorView_SmartCardCryptogramMaterialType;
   type IIterator_SmartCardCryptogramMaterialPackageFormat_Interface;
   type IIterator_SmartCardCryptogramMaterialPackageFormat is access all IIterator_SmartCardCryptogramMaterialPackageFormat_Interface'Class;
   type IIterator_SmartCardCryptogramMaterialPackageFormat_Ptr is access all IIterator_SmartCardCryptogramMaterialPackageFormat;
   type IIterable_SmartCardCryptogramMaterialPackageFormat_Interface;
   type IIterable_SmartCardCryptogramMaterialPackageFormat is access all IIterable_SmartCardCryptogramMaterialPackageFormat_Interface'Class;
   type IIterable_SmartCardCryptogramMaterialPackageFormat_Ptr is access all IIterable_SmartCardCryptogramMaterialPackageFormat;
   type IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface;
   type IVectorView_SmartCardCryptogramMaterialPackageFormat is access all IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface'Class;
   type IVectorView_SmartCardCryptogramMaterialPackageFormat_Ptr is access all IVectorView_SmartCardCryptogramMaterialPackageFormat;
   type IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface;
   type IIterator_SmartCardCryptogramStorageKeyCapabilities is access all IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface'Class;
   type IIterator_SmartCardCryptogramStorageKeyCapabilities_Ptr is access all IIterator_SmartCardCryptogramStorageKeyCapabilities;
   type IIterable_SmartCardCryptogramStorageKeyCapabilities_Interface;
   type IIterable_SmartCardCryptogramStorageKeyCapabilities is access all IIterable_SmartCardCryptogramStorageKeyCapabilities_Interface'Class;
   type IIterable_SmartCardCryptogramStorageKeyCapabilities_Ptr is access all IIterable_SmartCardCryptogramStorageKeyCapabilities;
   type IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface;
   type IVectorView_SmartCardCryptogramStorageKeyCapabilities is access all IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface'Class;
   type IVectorView_SmartCardCryptogramStorageKeyCapabilities_Ptr is access all IVectorView_SmartCardCryptogramStorageKeyCapabilities;
   type IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface;
   type IAsyncOperation_ISmartCardCryptogramStorageKeyInfo is access all IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Ptr is access all IAsyncOperation_ISmartCardCryptogramStorageKeyInfo;
   type IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface;
   type IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof is access all IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Ptr is access all IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Ptr is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Ptr is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface'Class;
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Ptr is access all IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult;
   type IAsyncOperation_ISmartCardReader_Interface;
   type IAsyncOperation_ISmartCardReader is access all IAsyncOperation_ISmartCardReader_Interface'Class;
   type IAsyncOperation_ISmartCardReader_Ptr is access all IAsyncOperation_ISmartCardReader;
   type IAsyncOperation_SmartCardReaderStatus_Interface;
   type IAsyncOperation_SmartCardReaderStatus is access all IAsyncOperation_SmartCardReaderStatus_Interface'Class;
   type IAsyncOperation_SmartCardReaderStatus_Ptr is access all IAsyncOperation_SmartCardReaderStatus;
   type IAsyncOperation_SmartCardStatus_Interface;
   type IAsyncOperation_SmartCardStatus is access all IAsyncOperation_SmartCardStatus_Interface'Class;
   type IAsyncOperation_SmartCardStatus_Ptr is access all IAsyncOperation_SmartCardStatus;
   type IAsyncOperation_ISmartCardProvisioning_Interface;
   type IAsyncOperation_ISmartCardProvisioning is access all IAsyncOperation_ISmartCardProvisioning_Interface'Class;
   type IAsyncOperation_ISmartCardProvisioning_Ptr is access all IAsyncOperation_ISmartCardProvisioning;
   type IAsyncOperation_ISmartCardChallengeContext_Interface;
   type IAsyncOperation_ISmartCardChallengeContext is access all IAsyncOperation_ISmartCardChallengeContext_Interface'Class;
   type IAsyncOperation_ISmartCardChallengeContext_Ptr is access all IAsyncOperation_ISmartCardChallengeContext;
   type IAsyncOperation_ISmartCardConnection_Interface;
   type IAsyncOperation_ISmartCardConnection is access all IAsyncOperation_ISmartCardConnection_Interface'Class;
   type IAsyncOperation_ISmartCardConnection_Ptr is access all IAsyncOperation_ISmartCardConnection;
   
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
   type ISmartCardTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerType
   (
      This       : access ISmartCardTriggerDetails_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardTriggerType
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceAppletId
   (
      This       : access ISmartCardTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_TriggerData
   (
      This       : access ISmartCardTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardTriggerDetails : aliased constant Windows.IID := (1604055326, 14831, 20267, (180, 79, 10, 145, 85, 177, 119, 188 ));
   
   ------------------------------------------------------------------------
   type ISmartCardTriggerDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Emulator
   (
      This       : access ISmartCardTriggerDetails2_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardEmulator
   )
   return Windows.HRESULT is abstract;
   
   function TryLaunchCurrentAppAsync
   (
      This       : access ISmartCardTriggerDetails2_Interface
      ; arguments : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryLaunchCurrentAppWithBehaviorAsync
   (
      This       : access ISmartCardTriggerDetails2_Interface
      ; arguments : Windows.String
      ; behavior : Windows.Devices.SmartCards.SmartCardLaunchBehavior
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardTriggerDetails2 : aliased constant Windows.IID := (692438377, 35189, 19025, (158, 26, 95, 138, 118, 238, 81, 175 ));
   
   ------------------------------------------------------------------------
   type ISmartCardTriggerDetails3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmartCard
   (
      This       : access ISmartCardTriggerDetails3_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardTriggerDetails3 : aliased constant Windows.IID := (3017982589, 6342, 19368, (131, 118, 239, 3, 212, 145, 38, 102 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access ISmartCardEmulatorStatics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorStatics : aliased constant Windows.IID := (2057043019, 50387, 18767, (184, 162, 98, 21, 216, 30, 133, 178 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAppletIdGroupRegistrationsAsync
   (
      This       : access ISmartCardEmulatorStatics2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAppletIdGroupAsync
   (
      This       : access ISmartCardEmulatorStatics2_Interface
      ; appletIdGroup : Windows.Devices.SmartCards.ISmartCardAppletIdGroup
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterAppletIdGroupAsync
   (
      This       : access ISmartCardEmulatorStatics2_Interface
      ; registration : Windows.Devices.SmartCards.ISmartCardAppletIdGroupRegistration
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAppletIdGroupRegistrations
   (
      This       : access ISmartCardEmulatorStatics2_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorStatics2 : aliased constant Windows.IID := (1773051786, 46965, 18571, (132, 54, 108, 30, 40, 237, 115, 31 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access ISmartCardEmulatorStatics3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorStatics3 : aliased constant Windows.IID := (1508512810, 40713, 17397, (133, 101, 207, 168, 20, 142, 76, 178 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnablementPolicy
   (
      This       : access ISmartCardEmulator_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardEmulatorEnablementPolicy
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulator : aliased constant Windows.IID := (3753445042, 34654, 18405, (128, 119, 232, 191, 241, 177, 198, 251 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulator2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ApduReceived
   (
      This       : access ISmartCardEmulator2_Interface
      ; value : TypedEventHandler_ISmartCardEmulator2_add_ApduReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ApduReceived
   (
      This       : access ISmartCardEmulator2_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionDeactivated
   (
      This       : access ISmartCardEmulator2_Interface
      ; value : TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionDeactivated
   (
      This       : access ISmartCardEmulator2_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access ISmartCardEmulator2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function IsHostCardEmulationSupported
   (
      This       : access ISmartCardEmulator2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulator2 : aliased constant Windows.IID := (4265590968, 34089, 16666, (128, 123, 72, 237, 194, 160, 171, 68 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorApduReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommandApdu
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionProperties
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardEmulatorConnectionProperties
   )
   return Windows.HRESULT is abstract;
   
   function TryRespondAsync
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs_Interface
      ; responseApdu : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomaticResponseStatus
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardAutomaticResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorApduReceivedEventArgs : aliased constant Windows.IID := (3579647350, 27090, 21299, (91, 95, 248, 192, 214, 233, 240, 159 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorApduReceivedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function TryRespondWithStateAsync
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgs2_Interface
      ; responseApdu : Windows.Storage.Streams.IBuffer
      ; nextState : Windows.Foundation.IReference_UInt32
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorApduReceivedEventArgs2 : aliased constant Windows.IID := (2348367344, 8929, 16952, (134, 16, 148, 206, 74, 150, 84, 37 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorConnectionProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISmartCardEmulatorConnectionProperties_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ISmartCardEmulatorConnectionProperties_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardEmulatorConnectionSource
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorConnectionProperties : aliased constant Windows.IID := (1311548910, 63849, 20605, (108, 249, 52, 226, 209, 141, 243, 17 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorConnectionDeactivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionProperties
   (
      This       : access ISmartCardEmulatorConnectionDeactivatedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardEmulatorConnectionProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Reason
   (
      This       : access ISmartCardEmulatorConnectionDeactivatedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardEmulatorConnectionDeactivatedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorConnectionDeactivatedEventArgs : aliased constant Windows.IID := (562485459, 50667, 21090, (67, 223, 98, 160, 161, 181, 85, 87 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAppletIdGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppletIds
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; RetVal : access Windows.Storage.Streams.IVector_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SmartCardEmulationCategory
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardEmulationCategory
   )
   return Windows.HRESULT is abstract;
   
   function put_SmartCardEmulationCategory
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; value : Windows.Devices.SmartCards.SmartCardEmulationCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_SmartCardEmulationType
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardEmulationType
   )
   return Windows.HRESULT is abstract;
   
   function put_SmartCardEmulationType
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; value : Windows.Devices.SmartCards.SmartCardEmulationType
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomaticEnablement
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutomaticEnablement
   (
      This       : access ISmartCardAppletIdGroup_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAppletIdGroup : aliased constant Windows.IID := (2108777958, 25188, 22260, (94, 3, 200, 99, 133, 57, 94, 177 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAppletIdGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISmartCardAppletIdGroupFactory_Interface
      ; displayName : Windows.String
      ; appletIds : Windows.Storage.Streams.IVector_IBuffer
      ; emulationCategory : Windows.Devices.SmartCards.SmartCardEmulationCategory
      ; emulationType : Windows.Devices.SmartCards.SmartCardEmulationType
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardAppletIdGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAppletIdGroupFactory : aliased constant Windows.IID := (2433084237, 19045, 20033, (128, 97, 203, 232, 63, 54, 149, 229 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAppletIdGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxAppletIds
   (
      This       : access ISmartCardAppletIdGroupStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAppletIdGroupStatics : aliased constant Windows.IID := (2871564713, 59244, 17871, (191, 29, 144, 234, 166, 32, 89, 39 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAppletIdGroupRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivationPolicy
   (
      This       : access ISmartCardAppletIdGroupRegistration_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardAppletIdGroupActivationPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_AppletIdGroup
   (
      This       : access ISmartCardAppletIdGroupRegistration_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardAppletIdGroup
   )
   return Windows.HRESULT is abstract;
   
   function RequestActivationPolicyChangeAsync
   (
      This       : access ISmartCardAppletIdGroupRegistration_Interface
      ; policy : Windows.Devices.SmartCards.SmartCardAppletIdGroupActivationPolicy
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardActivationPolicyChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ISmartCardAppletIdGroupRegistration_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function SetAutomaticResponseApdusAsync
   (
      This       : access ISmartCardAppletIdGroupRegistration_Interface
      ; apdus : Windows.Devices.SmartCards.IIterable_ISmartCardAutomaticResponseApdu
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAppletIdGroupRegistration : aliased constant Windows.IID := (3742501073, 12731, 21910, (67, 177, 109, 105, 160, 37, 123, 58 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAutomaticResponseApdu_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommandApdu
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_CommandApdu
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_CommandApduBitMask
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_CommandApduBitMask
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldMatchLength
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldMatchLength
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AppletId
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_AppletId
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseApdu
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_ResponseApdu
   (
      This       : access ISmartCardAutomaticResponseApdu_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAutomaticResponseApdu : aliased constant Windows.IID := (1377119147, 50750, 17713, (168, 87, 215, 86, 217, 155, 152, 106 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAutomaticResponseApdu2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputState
   (
      This       : access ISmartCardAutomaticResponseApdu2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InputState
   (
      This       : access ISmartCardAutomaticResponseApdu2_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputState
   (
      This       : access ISmartCardAutomaticResponseApdu2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_OutputState
   (
      This       : access ISmartCardAutomaticResponseApdu2_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAutomaticResponseApdu2 : aliased constant Windows.IID := (1152301844, 21917, 17713, (78, 81, 137, 219, 111, 168, 165, 122 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAutomaticResponseApdu3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowWhenCryptogramGeneratorNotPrepared
   (
      This       : access ISmartCardAutomaticResponseApdu3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowWhenCryptogramGeneratorNotPrepared
   (
      This       : access ISmartCardAutomaticResponseApdu3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAutomaticResponseApdu3 : aliased constant Windows.IID := (3208895092, 25974, 17298, (147, 103, 254, 59, 201, 226, 212, 150 ));
   
   ------------------------------------------------------------------------
   type ISmartCardAutomaticResponseApduFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISmartCardAutomaticResponseApduFactory_Interface
      ; commandApdu : Windows.Storage.Streams.IBuffer
      ; responseApdu : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardAutomaticResponseApduFactory : aliased constant Windows.IID := (3917390586, 53292, 19541, (176, 42, 140, 255, 127, 169, 240, 91 ));
   
   ------------------------------------------------------------------------
   type ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Interface is interface and Windows.IInspectable_Interface;
   
   function TryRespondWithCryptogramsAsync
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Interface
      ; responseTemplate : Windows.Storage.Streams.IBuffer
      ; cryptogramPlacementSteps : Windows.Devices.SmartCards.IIterable_ISmartCardCryptogramPlacementStep
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryRespondWithCryptogramsAndStateAsync
   (
      This       : access ISmartCardEmulatorApduReceivedEventArgsWithCryptograms_Interface
      ; responseTemplate : Windows.Storage.Streams.IBuffer
      ; cryptogramPlacementSteps : Windows.Devices.SmartCards.IIterable_ISmartCardCryptogramPlacementStep
      ; nextState : Windows.Foundation.IReference_UInt32
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardEmulatorApduReceivedEventArgsWithCryptograms : aliased constant Windows.IID := (3578837703, 47039, 20009, (146, 148, 12, 74, 195, 201, 65, 189 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramStorageKeyInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationStatus
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicKeyBlobType
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicKey
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AttestationStatus
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptographicKeyAttestationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Attestation
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AttestationCertificateChain
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramStorageKeyInfo : aliased constant Windows.IID := (2008084493, 45207, 20321, (162, 106, 149, 97, 99, 156, 156, 58 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramStorageKeyInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationalRequirements
   (
      This       : access ISmartCardCryptogramStorageKeyInfo2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramStorageKeyInfo2 : aliased constant Windows.IID := (278777, 63485, 16765, (137, 225, 251, 176, 56, 42, 220, 77 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramMaterialPossessionProof_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationStatus
   (
      This       : access ISmartCardCryptogramMaterialPossessionProof_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Proof
   (
      This       : access ISmartCardCryptogramMaterialPossessionProof_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramMaterialPossessionProof : aliased constant Windows.IID := (3854150540, 41281, 16693, (154, 221, 176, 210, 227, 170, 31, 201 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramPlacementStep_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Algorithm
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_Algorithm
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceData
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceData
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_CryptogramMaterialPackageName
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CryptogramMaterialPackageName
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CryptogramMaterialName
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CryptogramMaterialName
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TemplateOffset
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TemplateOffset
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_CryptogramOffset
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_CryptogramOffset
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_CryptogramLength
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_CryptogramLength
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_CryptogramPlacementOptions
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramPlacementOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_CryptogramPlacementOptions
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramPlacementOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_ChainedOutputStep
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep
   )
   return Windows.HRESULT is abstract;
   
   function put_ChainedOutputStep
   (
      This       : access ISmartCardCryptogramPlacementStep_Interface
      ; value : Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramPlacementStep : aliased constant Windows.IID := (2491089899, 33602, 18322, (162, 229, 146, 86, 54, 55, 138, 83 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramStorageKeyCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StorageKeyName
   (
      This       : access ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DateCreated
   (
      This       : access ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Algorithm
   (
      This       : access ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_Capabilities
   (
      This       : access ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramStorageKeyCharacteristics : aliased constant Windows.IID := (2236765294, 17495, 18469, (180, 100, 99, 84, 113, 163, 159, 92 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationStatus
   (
      This       : access ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Characteristics
   (
      This       : access ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_ISmartCardCryptogramStorageKeyCharacteristics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult : aliased constant Windows.IID := (2356996183, 42983, 18589, (185, 214, 54, 128, 97, 81, 80, 18 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramMaterialPackageCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PackageName
   (
      This       : access ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageKeyName
   (
      This       : access ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DateImported
   (
      This       : access ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFormat
   (
      This       : access ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramMaterialPackageCharacteristics : aliased constant Windows.IID := (4290088479, 1682, 19527, (147, 207, 52, 217, 31, 157, 205, 0 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationStatus
   (
      This       : access ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Characteristics
   (
      This       : access ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult : aliased constant Windows.IID := (1315605084, 38771, 18116, (163, 47, 177, 229, 67, 21, 158, 4 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramMaterialCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaterialName
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowedAlgorithms
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramAlgorithm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowedProofOfPossessionAlgorithms
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowedValidations
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramAlgorithm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialType
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionMethod
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialProtectionMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionVersion
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaterialLength
   (
      This       : access ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramMaterialCharacteristics : aliased constant Windows.IID := (4238001612, 49623, 16723, (146, 59, 162, 212, 60, 108, 141, 73 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OperationStatus
   (
      This       : access ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Characteristics
   (
      This       : access ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_ISmartCardCryptogramMaterialCharacteristics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult : aliased constant Windows.IID := (664330281, 54919, 19602, (134, 198, 57, 158, 154, 14, 203, 9 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGeneratorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSmartCardCryptogramGeneratorAsync
   (
      This       : access ISmartCardCryptogramGeneratorStatics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGeneratorStatics : aliased constant Windows.IID := (160643344, 52124, 16405, (150, 125, 82, 52, 243, 176, 41, 0 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGeneratorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access ISmartCardCryptogramGeneratorStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGeneratorStatics2 : aliased constant Windows.IID := (163444197, 46269, 20003, (165, 136, 116, 70, 146, 4, 193, 40 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedCryptogramMaterialTypes
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramMaterialType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCryptogramAlgorithms
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramAlgorithm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCryptogramMaterialPackageFormats
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramMaterialPackageFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCryptogramMaterialPackageConfirmationResponseFormats
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedSmartCardCryptogramStorageKeyCapabilities
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.IVectorView_SmartCardCryptogramStorageKeyCapabilities -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteCryptogramMaterialStorageKeyAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; storageKeyName : Windows.String
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateCryptogramMaterialStorageKeyAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; storageKeyName : Windows.String
      ; algorithm : Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyAlgorithm
      ; capabilities : Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCryptogramMaterialStorageKeyInfoAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; storageKeyName : Windows.String
      ; format : Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramStorageKeyInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ImportCryptogramMaterialPackageAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; format : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
      ; storageKeyName : Windows.String
      ; materialPackageName : Windows.String
      ; cryptogramMaterialPackage : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryProvePossessionOfCryptogramMaterialPackageAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; responseFormat : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
      ; materialPackageName : Windows.String
      ; materialName : Windows.String
      ; challenge : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestUnlockCryptogramMaterialForUseAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteCryptogramMaterialPackageAsync
   (
      This       : access ISmartCardCryptogramGenerator_Interface
      ; materialPackageName : Windows.String
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGenerator : aliased constant Windows.IID := (3818870907, 60883, 20041, (181, 148, 15, 245, 228, 208, 199, 111 ));
   
   ------------------------------------------------------------------------
   type ISmartCardCryptogramGenerator2_Interface is interface and Windows.IInspectable_Interface;
   
   function ValidateRequestApduAsync
   (
      This       : access ISmartCardCryptogramGenerator2_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; apduToValidate : Windows.Storage.Streams.IBuffer
      ; cryptogramPlacementSteps : Windows.Devices.SmartCards.IIterable_ISmartCardCryptogramPlacementStep
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllCryptogramStorageKeyCharacteristicsAsync
   (
      This       : access ISmartCardCryptogramGenerator2_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllCryptogramMaterialPackageCharacteristicsAsync
   (
      This       : access ISmartCardCryptogramGenerator2_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllCryptogramMaterialPackageCharacteristicsWithStorageKeyAsync
   (
      This       : access ISmartCardCryptogramGenerator2_Interface
      ; storageKeyName : Windows.String
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllCryptogramMaterialCharacteristicsAsync
   (
      This       : access ISmartCardCryptogramGenerator2_Interface
      ; promptingBehavior : Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
      ; materialPackageName : Windows.String
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardCryptogramGenerator2 : aliased constant Windows.IID := (1897310772, 23917, 19274, (150, 163, 239, 164, 125, 42, 126, 37 ));
   
   ------------------------------------------------------------------------
   type ISmartCardReaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ISmartCardReaderStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorWithKind
   (
      This       : access ISmartCardReaderStatics_Interface
      ; kind : Windows.Devices.SmartCards.SmartCardReaderKind
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ISmartCardReaderStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardReaderStatics : aliased constant Windows.IID := (272368865, 41418, 18674, (162, 129, 91, 111, 102, 154, 241, 7 ));
   
   ------------------------------------------------------------------------
   type ISmartCardReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISmartCardReader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ISmartCardReader_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access ISmartCardReader_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardReaderKind
   )
   return Windows.HRESULT is abstract;
   
   function GetStatusAsync
   (
      This       : access ISmartCardReader_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardReaderStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllCardsAsync
   (
      This       : access ISmartCardReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_CardAdded
   (
      This       : access ISmartCardReader_Interface
      ; handler : TypedEventHandler_ISmartCardReader_add_CardAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CardAdded
   (
      This       : access ISmartCardReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CardRemoved
   (
      This       : access ISmartCardReader_Interface
      ; handler : TypedEventHandler_ISmartCardReader_add_CardRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CardRemoved
   (
      This       : access ISmartCardReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardReader : aliased constant Windows.IID := (276083936, 21698, 19952, (129, 122, 20, 193, 67, 120, 240, 108 ));
   
   ------------------------------------------------------------------------
   type ICardAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmartCard
   (
      This       : access ICardAddedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.HRESULT is abstract;
   
   IID_ICardAddedEventArgs : aliased constant Windows.IID := (414969752, 61835, 19923, (177, 24, 223, 178, 200, 226, 60, 198 ));
   
   ------------------------------------------------------------------------
   type ICardRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmartCard
   (
      This       : access ICardRemovedEventArgs_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.HRESULT is abstract;
   
   IID_ICardRemovedEventArgs : aliased constant Windows.IID := (355670703, 8919, 18757, (175, 201, 3, 180, 111, 66, 166, 205 ));
   
   ------------------------------------------------------------------------
   type ISmartCard_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reader
   (
      This       : access ISmartCard_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardReader
   )
   return Windows.HRESULT is abstract;
   
   function GetStatusAsync
   (
      This       : access ISmartCard_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_SmartCardStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAnswerToResetAsync
   (
      This       : access ISmartCard_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCard : aliased constant Windows.IID := (460425329, 25652, 17396, (181, 90, 106, 41, 98, 56, 112, 170 ));
   
   ------------------------------------------------------------------------
   type ISmartCardProvisioningStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromSmartCardAsync
   (
      This       : access ISmartCardProvisioningStatics_Interface
      ; card : Windows.Devices.SmartCards.ISmartCard
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestVirtualSmartCardCreationAsync
   (
      This       : access ISmartCardProvisioningStatics_Interface
      ; friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestVirtualSmartCardCreationAsyncWithCardId
   (
      This       : access ISmartCardProvisioningStatics_Interface
      ; friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestVirtualSmartCardDeletionAsync
   (
      This       : access ISmartCardProvisioningStatics_Interface
      ; card : Windows.Devices.SmartCards.ISmartCard
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardProvisioningStatics : aliased constant Windows.IID := (327690312, 3347, 20080, (151, 53, 81, 218, 236, 165, 37, 79 ));
   
   ------------------------------------------------------------------------
   type ISmartCardProvisioningStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAttestedVirtualSmartCardCreationAsync
   (
      This       : access ISmartCardProvisioningStatics2_Interface
      ; friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAttestedVirtualSmartCardCreationAsyncWithCardId
   (
      This       : access ISmartCardProvisioningStatics2_Interface
      ; friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardProvisioningStatics2 : aliased constant Windows.IID := (877119144, 51616, 19414, (181, 13, 37, 31, 78, 141, 58, 98 ));
   
   ------------------------------------------------------------------------
   type ISmartCardProvisioning_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmartCard
   (
      This       : access ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.HRESULT is abstract;
   
   function GetIdAsync
   (
      This       : access ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetNameAsync
   (
      This       : access ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetChallengeContextAsync
   (
      This       : access ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardChallengeContext -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinChangeAsync
   (
      This       : access ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinResetAsync
   (
      This       : access ISmartCardProvisioning_Interface
      ; handler : Windows.Devices.SmartCards.SmartCardPinResetHandler
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardProvisioning : aliased constant Windows.IID := (435088829, 8107, 18300, (183, 18, 26, 44, 90, 241, 253, 110 ));
   
   ------------------------------------------------------------------------
   type ISmartCardProvisioning2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAuthorityKeyContainerNameAsync
   (
      This       : access ISmartCardProvisioning2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardProvisioning2 : aliased constant Windows.IID := (285026539, 16249, 19302, (155, 124, 17, 193, 73, 183, 208, 188 ));
   
   ------------------------------------------------------------------------
   type ISmartCardPinResetRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Challenge
   (
      This       : access ISmartCardPinResetRequest_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access ISmartCardPinResetRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISmartCardPinResetRequest_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardPinResetDeferral
   )
   return Windows.HRESULT is abstract;
   
   function SetResponse
   (
      This       : access ISmartCardPinResetRequest_Interface
      ; response : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardPinResetRequest : aliased constant Windows.IID := (318651469, 24505, 20110, (159, 246, 97, 244, 117, 18, 79, 239 ));
   
   ------------------------------------------------------------------------
   type ISmartCardPinResetDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISmartCardPinResetDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardPinResetDeferral : aliased constant Windows.IID := (415845036, 30725, 16388, (133, 228, 187, 239, 172, 143, 104, 132 ));
   
   ------------------------------------------------------------------------
   type ISmartCardPinPolicy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinLength
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MinLength
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLength
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxLength
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UppercaseLetters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function put_UppercaseLetters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function get_LowercaseLetters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function put_LowercaseLetters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function get_Digits
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function put_Digits
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function get_SpecialCharacters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   function put_SpecialCharacters
   (
      This       : access ISmartCardPinPolicy_Interface
      ; value : Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardPinPolicy : aliased constant Windows.IID := (406643076, 19894, 18497, (172, 158, 42, 193, 243, 155, 115, 4 ));
   
   ------------------------------------------------------------------------
   type ISmartCardConnect_Interface is interface and Windows.IInspectable_Interface;
   
   function ConnectAsync
   (
      This       : access ISmartCardConnect_Interface
      ; RetVal : access Windows.Devices.SmartCards.IAsyncOperation_ISmartCardConnection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardConnect : aliased constant Windows.IID := (803178469, 653, 18718, (160, 88, 51, 130, 195, 152, 111, 64 ));
   
   ------------------------------------------------------------------------
   type ISmartCardChallengeContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Challenge
   (
      This       : access ISmartCardChallengeContext_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function VerifyResponseAsync
   (
      This       : access ISmartCardChallengeContext_Interface
      ; response : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ProvisionAsync
   (
      This       : access ISmartCardChallengeContext_Interface
      ; response : Windows.Storage.Streams.IBuffer
      ; formatCard : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ProvisionAsyncWithNewCardId
   (
      This       : access ISmartCardChallengeContext_Interface
      ; response : Windows.Storage.Streams.IBuffer
      ; formatCard : Windows.Boolean
      ; newCardId : Windows.Guid
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ChangeAdministrativeKeyAsync
   (
      This       : access ISmartCardChallengeContext_Interface
      ; response : Windows.Storage.Streams.IBuffer
      ; newAdministrativeKey : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardChallengeContext : aliased constant Windows.IID := (422204185, 51652, 18759, (129, 204, 68, 121, 74, 97, 239, 145 ));
   
   ------------------------------------------------------------------------
   type ISmartCardConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function TransmitAsync
   (
      This       : access ISmartCardConnection_Interface
      ; command : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISmartCardConnection : aliased constant Windows.IID := (2128320794, 43034, 18364, (166, 73, 21, 107, 230, 183, 242, 49 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardEmulator_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardEmulator_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardEmulator
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardEmulator_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardEmulator
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardEmulator_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardEmulator
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardEmulator : aliased constant Windows.IID := (500734192, 51237, 23539, (149, 100, 71, 8, 147, 47, 149, 95 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardAppletIdGroupRegistration_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardAppletIdGroupRegistration
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardAppletIdGroupRegistration : aliased constant Windows.IID := (3624075314, 24380, 20712, (145, 184, 105, 28, 69, 70, 9, 232 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SmartCardActivationPolicyChangeResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SmartCardActivationPolicyChangeResult : aliased constant Windows.IID := (3102825781, 12093, 21418, (181, 198, 250, 202, 76, 127, 241, 110 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISmartCardAutomaticResponseApdu_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmartCardAutomaticResponseApdu_Interface
      ; items : Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISmartCardAutomaticResponseApdu : aliased constant Windows.IID := (2028690514, 40402, 24117, (168, 104, 246, 73, 25, 235, 166, 182 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISmartCardAutomaticResponseApdu_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmartCardAutomaticResponseApdu_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_ISmartCardAutomaticResponseApdu
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISmartCardAutomaticResponseApdu : aliased constant Windows.IID := (3679638390, 638, 21104, (164, 87, 251, 139, 74, 232, 149, 140 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus : aliased constant Windows.IID := (4122010032, 22439, 23219, (174, 170, 214, 182, 53, 37, 120, 102 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISmartCardCryptogramPlacementStep_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmartCardCryptogramPlacementStep_Interface
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISmartCardCryptogramPlacementStep : aliased constant Windows.IID := (2175150704, 35533, 22924, (141, 10, 162, 125, 35, 230, 203, 30 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISmartCardCryptogramPlacementStep_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmartCardCryptogramPlacementStep_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_ISmartCardCryptogramPlacementStep
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISmartCardCryptogramPlacementStep : aliased constant Windows.IID := (592098865, 60767, 20924, (138, 138, 213, 243, 73, 95, 50, 222 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISmartCardCryptogramStorageKeyCharacteristics : aliased constant Windows.IID := (3328117015, 14124, 20823, (128, 226, 44, 251, 214, 94, 143, 234 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISmartCardCryptogramStorageKeyCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_ISmartCardCryptogramStorageKeyCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISmartCardCryptogramStorageKeyCharacteristics : aliased constant Windows.IID := (383110281, 12138, 22393, (142, 248, 45, 90, 32, 7, 129, 80 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; value : Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmartCardCryptogramStorageKeyCharacteristics_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISmartCardCryptogramStorageKeyCharacteristics : aliased constant Windows.IID := (4048057017, 32588, 22776, (139, 250, 175, 118, 127, 88, 151, 26 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISmartCardCryptogramMaterialPackageCharacteristics : aliased constant Windows.IID := (3079553202, 28912, 24116, (170, 140, 202, 117, 161, 179, 177, 191 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISmartCardCryptogramMaterialPackageCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_ISmartCardCryptogramMaterialPackageCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISmartCardCryptogramMaterialPackageCharacteristics : aliased constant Windows.IID := (2870848609, 7129, 21670, (180, 7, 29, 196, 229, 177, 161, 151 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; value : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISmartCardCryptogramMaterialPackageCharacteristics : aliased constant Windows.IID := (2497263593, 3804, 23981, (163, 173, 178, 235, 90, 184, 134, 113 ));
   
   ------------------------------------------------------------------------
   type IIterator_SmartCardCryptogramAlgorithm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmartCardCryptogramAlgorithm_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmartCardCryptogramAlgorithm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmartCardCryptogramAlgorithm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmartCardCryptogramAlgorithm_Interface
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SmartCardCryptogramAlgorithm : aliased constant Windows.IID := (1327367314, 55986, 21443, (181, 251, 196, 180, 55, 59, 30, 194 ));
   
   ------------------------------------------------------------------------
   type IIterable_SmartCardCryptogramAlgorithm_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmartCardCryptogramAlgorithm_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_SmartCardCryptogramAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SmartCardCryptogramAlgorithm : aliased constant Windows.IID := (2383274217, 1858, 21918, (155, 27, 70, 2, 104, 98, 44, 31 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SmartCardCryptogramAlgorithm_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmartCardCryptogramAlgorithm_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmartCardCryptogramAlgorithm_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmartCardCryptogramAlgorithm_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmartCardCryptogramAlgorithm_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SmartCardCryptogramAlgorithm : aliased constant Windows.IID := (2849997596, 49707, 23856, (168, 108, 90, 49, 254, 25, 36, 51 ));
   
   ------------------------------------------------------------------------
   type IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat : aliased constant Windows.IID := (2635108782, 48695, 23527, (142, 223, 96, 197, 22, 72, 128, 182 ));
   
   ------------------------------------------------------------------------
   type IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_SmartCardCryptogramMaterialPackageConfirmationResponseFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SmartCardCryptogramMaterialPackageConfirmationResponseFormat : aliased constant Windows.IID := (3289138257, 20155, 22069, (156, 125, 51, 200, 197, 211, 122, 9 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SmartCardCryptogramMaterialPackageConfirmationResponseFormat : aliased constant Windows.IID := (977368738, 53793, 23199, (164, 194, 165, 184, 115, 109, 162, 216 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISmartCardCryptogramMaterialCharacteristics : aliased constant Windows.IID := (3802731169, 24883, 22300, (176, 169, 42, 170, 178, 131, 160, 122 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISmartCardCryptogramMaterialCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_ISmartCardCryptogramMaterialCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISmartCardCryptogramMaterialCharacteristics : aliased constant Windows.IID := (2449834825, 46147, 21208, (142, 70, 156, 243, 129, 93, 209, 90 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; value : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISmartCardCryptogramMaterialCharacteristics_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISmartCardCryptogramMaterialCharacteristics : aliased constant Windows.IID := (1851671623, 5458, 22811, (175, 160, 56, 123, 38, 183, 172, 147 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramGenerator_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGenerator_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGenerator_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramGenerator
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramGenerator : aliased constant Windows.IID := (1576920189, 38768, 24388, (169, 131, 242, 254, 228, 48, 118, 142 ));
   
   ------------------------------------------------------------------------
   type IIterator_SmartCardCryptogramMaterialType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmartCardCryptogramMaterialType_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmartCardCryptogramMaterialType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmartCardCryptogramMaterialType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmartCardCryptogramMaterialType_Interface
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SmartCardCryptogramMaterialType : aliased constant Windows.IID := (2548121933, 17306, 24002, (129, 252, 217, 136, 227, 44, 141, 171 ));
   
   ------------------------------------------------------------------------
   type IIterable_SmartCardCryptogramMaterialType_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmartCardCryptogramMaterialType_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_SmartCardCryptogramMaterialType
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SmartCardCryptogramMaterialType : aliased constant Windows.IID := (758620036, 14492, 22537, (162, 198, 145, 155, 71, 202, 171, 136 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SmartCardCryptogramMaterialType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmartCardCryptogramMaterialType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmartCardCryptogramMaterialType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmartCardCryptogramMaterialType_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmartCardCryptogramMaterialType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SmartCardCryptogramMaterialType : aliased constant Windows.IID := (961265868, 50721, 23459, (180, 240, 113, 47, 207, 89, 19, 146 ));
   
   ------------------------------------------------------------------------
   type IIterator_SmartCardCryptogramMaterialPackageFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageFormat_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmartCardCryptogramMaterialPackageFormat_Interface
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SmartCardCryptogramMaterialPackageFormat : aliased constant Windows.IID := (2079808002, 61054, 20794, (128, 248, 247, 216, 240, 4, 201, 7 ));
   
   ------------------------------------------------------------------------
   type IIterable_SmartCardCryptogramMaterialPackageFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmartCardCryptogramMaterialPackageFormat_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_SmartCardCryptogramMaterialPackageFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SmartCardCryptogramMaterialPackageFormat : aliased constant Windows.IID := (1042553548, 5957, 22478, (147, 104, 33, 186, 33, 48, 195, 193 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmartCardCryptogramMaterialPackageFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SmartCardCryptogramMaterialPackageFormat : aliased constant Windows.IID := (3083658226, 39049, 22636, (190, 177, 104, 254, 221, 183, 203, 21 ));
   
   ------------------------------------------------------------------------
   type IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SmartCardCryptogramStorageKeyCapabilities : aliased constant Windows.IID := (3361265568, 50510, 20796, (160, 151, 164, 47, 211, 213, 105, 175 ));
   
   ------------------------------------------------------------------------
   type IIterable_SmartCardCryptogramStorageKeyCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; RetVal : access Windows.Devices.SmartCards.IIterator_SmartCardCryptogramStorageKeyCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SmartCardCryptogramStorageKeyCapabilities : aliased constant Windows.IID := (2553682417, 17849, 21847, (152, 0, 234, 162, 188, 166, 218, 87 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; value : Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SmartCardCryptogramStorageKeyCapabilities_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SmartCardCryptogramStorageKeyCapabilities : aliased constant Windows.IID := (2618162336, 19298, 22184, (138, 243, 131, 118, 137, 138, 21, 188 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramStorageKeyInfo_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramStorageKeyInfo : aliased constant Windows.IID := (562558372, 26908, 20705, (191, 79, 221, 237, 195, 230, 132, 184 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPossessionProof
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof : aliased constant Windows.IID := (1865345590, 56896, 21940, (144, 195, 37, 86, 115, 247, 27, 46 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult : aliased constant Windows.IID := (2165372641, 13600, 23762, (186, 181, 8, 49, 24, 93, 44, 46 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult : aliased constant Windows.IID := (749437352, 15401, 20689, (151, 97, 95, 57, 39, 201, 109, 202 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult : aliased constant Windows.IID := (1704085, 10972, 21698, (133, 148, 58, 54, 186, 22, 253, 134 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardReader_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardReader_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardReader
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardReader_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardReader
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardReader_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardReader
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardReader : aliased constant Windows.IID := (57312013, 48074, 23737, (151, 127, 178, 158, 163, 4, 33, 73 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SmartCardReaderStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SmartCardReaderStatus_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardReaderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SmartCardReaderStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardReaderStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SmartCardReaderStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardReaderStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SmartCardReaderStatus : aliased constant Windows.IID := (1524892410, 7970, 21872, (160, 200, 178, 50, 10, 222, 219, 129 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SmartCardStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SmartCardStatus_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SmartCardStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_SmartCardStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SmartCardStatus_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SmartCardStatus : aliased constant Windows.IID := (3793892214, 36086, 20925, (153, 7, 19, 68, 170, 102, 94, 93 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardProvisioning_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardProvisioning_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardProvisioning
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardProvisioning
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardProvisioning_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardProvisioning
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardProvisioning : aliased constant Windows.IID := (1636105344, 46930, 23784, (161, 54, 245, 113, 116, 187, 147, 9 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardChallengeContext_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardChallengeContext_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardChallengeContext
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardChallengeContext_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardChallengeContext
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardChallengeContext_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardChallengeContext
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardChallengeContext : aliased constant Windows.IID := (476382819, 16232, 22939, (185, 212, 195, 80, 241, 62, 228, 228 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISmartCardConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISmartCardConnection_Interface
      ; handler : Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardConnection
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISmartCardConnection_Interface
      ; RetVal : access Windows.Devices.SmartCards.AsyncOperationCompletedHandler_ISmartCardConnection
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISmartCardConnection_Interface
      ; RetVal : access Windows.Devices.SmartCards.ISmartCardConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISmartCardConnection : aliased constant Windows.IID := (2006695003, 42844, 22920, (151, 143, 52, 219, 198, 41, 213, 118 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type SmartCardPinResetHandler_Interface(Callback : access procedure (sender : Windows.Devices.SmartCards.ISmartCardProvisioning ; request : Windows.Devices.SmartCards.ISmartCardPinResetRequest)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access SmartCardPinResetHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access SmartCardPinResetHandler_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardProvisioning
      ; request : Windows.Devices.SmartCards.ISmartCardPinResetRequest
   )
   return Windows.HRESULT;
   
   IID_SmartCardPinResetHandler : aliased constant Windows.IID := (328031808, 62396, 19036, (180, 29, 75, 78, 246, 132, 226, 55 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardEmulator_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardEmulator_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardEmulator_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardEmulator : aliased constant Windows.IID := (1233314822, 1324, 22402, (165, 125, 84, 249, 244, 79, 132, 18 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration : aliased constant Windows.IID := (923813371, 18836, 21523, (137, 190, 186, 78, 151, 173, 130, 160 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface(Callback : access procedure (sender : Windows.Devices.SmartCards.ISmartCardEmulator ; args : Windows.Devices.SmartCards.ISmartCardEmulatorApduReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardEmulator
      ; args : Windows.Devices.SmartCards.ISmartCardEmulatorApduReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISmartCardEmulator2_add_ApduReceived : aliased constant Windows.IID := (342856707, 17140, 22946, (168, 90, 130, 148, 175, 62, 62, 120 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface(Callback : access procedure (sender : Windows.Devices.SmartCards.ISmartCardEmulator ; args : Windows.Devices.SmartCards.ISmartCardEmulatorConnectionDeactivatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardEmulator
      ; args : Windows.Devices.SmartCards.ISmartCardEmulatorConnectionDeactivatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated : aliased constant Windows.IID := (3415752907, 52294, 23607, (171, 0, 221, 35, 215, 123, 38, 59 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardActivationPolicyChangeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardActivationPolicyChangeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult : aliased constant Windows.IID := (2502490443, 1147, 24106, (143, 192, 112, 23, 245, 218, 221, 255 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus : aliased constant Windows.IID := (3334752199, 42509, 20490, (155, 254, 89, 242, 92, 51, 233, 121 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator : aliased constant Windows.IID := (634164322, 18081, 20646, (173, 20, 154, 151, 24, 55, 32, 5 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramStorageKeyInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramStorageKeyInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo : aliased constant Windows.IID := (1060431463, 2614, 21524, (136, 171, 99, 113, 209, 179, 176, 126 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof : aliased constant Windows.IID := (3404875598, 34832, 23319, (149, 214, 129, 117, 138, 229, 25, 133 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult : aliased constant Windows.IID := (3378551101, 45864, 24198, (176, 163, 37, 240, 159, 126, 69, 223 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult : aliased constant Windows.IID := (3444616196, 59446, 21797, (158, 219, 6, 109, 98, 5, 162, 167 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult : aliased constant Windows.IID := (1171257866, 45908, 20675, (143, 36, 61, 212, 241, 103, 127, 190 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardReader_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardReader_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardReader_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardReader : aliased constant Windows.IID := (550708301, 14170, 24445, (137, 68, 22, 79, 223, 237, 66, 57 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardReaderStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardReaderStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SmartCardReaderStatus : aliased constant Windows.IID := (1031696041, 59193, 21852, (156, 2, 7, 57, 108, 83, 33, 245 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISmartCardReader_add_CardAdded_Interface(Callback : access procedure (sender : Windows.Devices.SmartCards.ISmartCardReader ; args : Windows.Devices.SmartCards.ICardAddedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISmartCardReader_add_CardAdded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardReader_add_CardAdded_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardReader
      ; args : Windows.Devices.SmartCards.ICardAddedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISmartCardReader_add_CardAdded : aliased constant Windows.IID := (3547278777, 22132, 24436, (159, 105, 60, 220, 69, 89, 153, 159 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface(Callback : access procedure (sender : Windows.Devices.SmartCards.ISmartCardReader ; args : Windows.Devices.SmartCards.ICardRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardReader
      ; args : Windows.Devices.SmartCards.ICardRemovedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISmartCardReader_add_CardRemoved : aliased constant Windows.IID := (1775896518, 45670, 23068, (147, 124, 216, 43, 74, 130, 50, 198 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SmartCardStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SmartCardStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SmartCardStatus : aliased constant Windows.IID := (3182381633, 15178, 22192, (174, 236, 254, 231, 28, 199, 243, 40 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardProvisioning : aliased constant Windows.IID := (2049857756, 8942, 23736, (131, 204, 167, 166, 27, 157, 205, 44 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardChallengeContext ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardChallengeContext
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardChallengeContext : aliased constant Windows.IID := (2528211702, 57051, 24382, (175, 144, 123, 15, 16, 33, 147, 82 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISmartCardConnection_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardConnection ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISmartCardConnection_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardConnection_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardConnection
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISmartCardConnection : aliased constant Windows.IID := (3340697830, 44838, 24156, (145, 61, 14, 254, 183, 208, 142, 247 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SmartCardTriggerDetails is Windows.Devices.SmartCards.ISmartCardTriggerDetails;
   subtype SmartCardEmulator is Windows.Devices.SmartCards.ISmartCardEmulator;
   subtype SmartCardAppletIdGroupRegistration is Windows.Devices.SmartCards.ISmartCardAppletIdGroupRegistration;
   subtype SmartCardAppletIdGroup is Windows.Devices.SmartCards.ISmartCardAppletIdGroup;
   
   function CreateSmartCardAppletIdGroup return Windows.Devices.SmartCards.ISmartCardAppletIdGroup;
   
   subtype SmartCardEmulatorApduReceivedEventArgs is Windows.Devices.SmartCards.ISmartCardEmulatorApduReceivedEventArgs;
   subtype SmartCardEmulatorConnectionDeactivatedEventArgs is Windows.Devices.SmartCards.ISmartCardEmulatorConnectionDeactivatedEventArgs;
   subtype SmartCardEmulatorConnectionProperties is Windows.Devices.SmartCards.ISmartCardEmulatorConnectionProperties;
   subtype SmartCardAutomaticResponseApdu is Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu;
   
   function Create
   (
      commandApdu : Windows.Storage.Streams.IBuffer
      ; responseApdu : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu;
   
   subtype SmartCardCryptogramPlacementStep is Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep;
   
   function CreateSmartCardCryptogramPlacementStep return Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep;
   
   subtype SmartCardCryptogramStorageKeyCharacteristics is Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics;
   
   function CreateSmartCardCryptogramStorageKeyCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics;
   
   subtype SmartCardCryptogramMaterialPackageCharacteristics is Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics;
   
   function CreateSmartCardCryptogramMaterialPackageCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics;
   
   subtype SmartCardCryptogramMaterialCharacteristics is Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics;
   
   function CreateSmartCardCryptogramMaterialCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics;
   
   subtype SmartCardCryptogramGenerator is Windows.Devices.SmartCards.ISmartCardCryptogramGenerator;
   subtype SmartCardCryptogramStorageKeyInfo is Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyInfo;
   subtype SmartCardCryptogramMaterialPossessionProof is Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPossessionProof;
   subtype SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult is Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult;
   
   function CreateSmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult;
   
   subtype SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult is Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult;
   
   function CreateSmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult;
   
   subtype SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult is Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult;
   
   function CreateSmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult;
   
   subtype SmartCardReader is Windows.Devices.SmartCards.ISmartCardReader;
   subtype SmartCard is Windows.Devices.SmartCards.ISmartCard;
   subtype CardAddedEventArgs is Windows.Devices.SmartCards.ICardAddedEventArgs;
   subtype CardRemovedEventArgs is Windows.Devices.SmartCards.ICardRemovedEventArgs;
   subtype SmartCardProvisioning is Windows.Devices.SmartCards.ISmartCardProvisioning;
   subtype SmartCardPinPolicy is Windows.Devices.SmartCards.ISmartCardPinPolicy;
   
   function CreateSmartCardPinPolicy return Windows.Devices.SmartCards.ISmartCardPinPolicy;
   
   subtype SmartCardChallengeContext is Windows.Devices.SmartCards.ISmartCardChallengeContext;
   subtype SmartCardPinResetRequest is Windows.Devices.SmartCards.ISmartCardPinResetRequest;
   subtype SmartCardPinResetDeferral is Windows.Devices.SmartCards.ISmartCardPinResetDeferral;
   subtype SmartCardConnection is Windows.Devices.SmartCards.ISmartCardConnection;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetAppletIdGroupRegistrationsAsync
   return Windows.Address;
   
   function RegisterAppletIdGroupAsync
   (
      appletIdGroup : Windows.Devices.SmartCards.ISmartCardAppletIdGroup
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration;
   
   function UnregisterAppletIdGroupAsync
   (
      registration : Windows.Devices.SmartCards.ISmartCardAppletIdGroupRegistration
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_MaxAppletIdGroupRegistrations
   return Windows.UInt16;
   
   function GetDefaultAsync
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator;
   
   function IsSupported
   return Windows.Boolean;
   
   function get_MaxAppletIds
   return Windows.UInt16;
   
   function GetSmartCardCryptogramGeneratorAsync
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator;
   
   function IsSupported_ISmartCardCryptogramGenerator
   return Windows.Boolean;
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelectorWithKind
   (
      kind : Windows.Devices.SmartCards.SmartCardReaderKind
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader;
   
   function RequestAttestedVirtualSmartCardCreationAsync
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   
   function RequestAttestedVirtualSmartCardCreationAsyncWithCardId
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   
   function FromSmartCardAsync
   (
      card : Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   
   function RequestVirtualSmartCardCreationAsync
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   
   function RequestVirtualSmartCardCreationAsyncWithCardId
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   
   function RequestVirtualSmartCardDeletionAsync
   (
      card : Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.Foundation.IAsyncOperation_Boolean;

end;
