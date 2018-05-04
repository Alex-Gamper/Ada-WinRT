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
with Windows.Storage.Streams;
with Windows.Security.Cryptography.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.SmartCards is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access SmartCardPinResetHandler_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardProvisioning
      ; request : Windows.Devices.SmartCards.ISmartCardPinResetRequest
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.SmartCards.ISmartCardProvisioning(sender), Windows.Devices.SmartCards.ISmartCardPinResetRequest(request));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmartCardEmulator_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator
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
      This       : access AsyncOperationCompletedHandler_ISmartCardAppletIdGroupRegistration_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration
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
      This       : access TypedEventHandler_ISmartCardEmulator2_add_ApduReceived_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardEmulator
      ; args : Windows.Devices.SmartCards.ISmartCardEmulatorApduReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.SmartCards.ISmartCardEmulator(sender), Windows.Devices.SmartCards.ISmartCardEmulatorApduReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardEmulator2_add_ConnectionDeactivated_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardEmulator
      ; args : Windows.Devices.SmartCards.ISmartCardEmulatorConnectionDeactivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.SmartCards.ISmartCardEmulator(sender), Windows.Devices.SmartCards.ISmartCardEmulatorConnectionDeactivatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardActivationPolicyChangeResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardActivationPolicyChangeResult
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
      This       : access AsyncOperationCompletedHandler_SmartCardCryptogramGeneratorOperationStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardCryptogramGeneratorOperationStatus
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGenerator_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramStorageKeyInfo_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramStorageKeyInfo
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramMaterialPossessionProof_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramMaterialPossessionProof
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult
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
      This       : access AsyncOperationCompletedHandler_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult
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
      This       : access AsyncOperationCompletedHandler_ISmartCardReader_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader
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
      This       : access AsyncOperationCompletedHandler_SmartCardReaderStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardReaderStatus
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
      This       : access TypedEventHandler_ISmartCardReader_add_CardAdded_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardReader
      ; args : Windows.Devices.SmartCards.ICardAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.SmartCards.ISmartCardReader(sender), Windows.Devices.SmartCards.ICardAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmartCardReader_add_CardRemoved_Interface
      ; sender : Windows.Devices.SmartCards.ISmartCardReader
      ; args : Windows.Devices.SmartCards.ICardRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.SmartCards.ISmartCardReader(sender), Windows.Devices.SmartCards.ICardRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SmartCardStatus_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_SmartCardStatus
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
      This       : access AsyncOperationCompletedHandler_ISmartCardProvisioning_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning
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
      This       : access AsyncOperationCompletedHandler_ISmartCardChallengeContext_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardChallengeContext
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
      This       : access AsyncOperationCompletedHandler_ISmartCardConnection_Interface
      ; asyncInfo : Windows.Devices.SmartCards.IAsyncOperation_ISmartCardConnection
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
   
   function CreateSmartCardAppletIdGroup return Windows.Devices.SmartCards.ISmartCardAppletIdGroup is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardAppletIdGroup");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardAppletIdGroup) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardAppletIdGroup'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      commandApdu : Windows.Storage.Streams.IBuffer
      ; responseApdu : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardAutomaticResponseApdu");
      m_Factory     : Windows.Devices.SmartCards.ISmartCardAutomaticResponseApduFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.ISmartCardAutomaticResponseApdu := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardAutomaticResponseApduFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(commandApdu, responseApdu, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSmartCardCryptogramPlacementStep return Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramPlacementStep");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramPlacementStep) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramPlacementStep'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramStorageKeyCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCharacteristics");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramStorageKeyCharacteristics) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramStorageKeyCharacteristics'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramMaterialPackageCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageCharacteristics");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramMaterialPackageCharacteristics) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramMaterialPackageCharacteristics'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramMaterialCharacteristics return Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramMaterialCharacteristics");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramMaterialCharacteristics) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramMaterialCharacteristics'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult return Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmartCardPinPolicy return Windows.Devices.SmartCards.ISmartCardPinPolicy is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardPinPolicy");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.SmartCards.ISmartCardPinPolicy) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.SmartCards.IID_ISmartCardPinPolicy'Access, RetVal'access);
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
   
   function GetAppletIdGroupRegistrationsAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAppletIdGroupRegistrationsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RegisterAppletIdGroupAsync
   (
      appletIdGroup : Windows.Devices.SmartCards.ISmartCardAppletIdGroup
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardAppletIdGroupRegistration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterAppletIdGroupAsync(appletIdGroup, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnregisterAppletIdGroupAsync
   (
      registration : Windows.Devices.SmartCards.ISmartCardAppletIdGroupRegistration
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterAppletIdGroupAsync(registration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxAppletIdGroupRegistrations
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxAppletIdGroupRegistrations(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardEmulator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardEmulator");
      m_Factory     : ISmartCardEmulatorStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardEmulatorStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxAppletIds
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardAppletIdGroup");
      m_Factory     : ISmartCardAppletIdGroupStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardAppletIdGroupStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxAppletIds(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSmartCardCryptogramGeneratorAsync
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramGenerator");
      m_Factory     : ISmartCardCryptogramGeneratorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardCryptogramGenerator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardCryptogramGeneratorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSmartCardCryptogramGeneratorAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported_ISmartCardCryptogramGenerator
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardCryptogramGenerator");
      m_Factory     : ISmartCardCryptogramGeneratorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardCryptogramGeneratorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardReader");
      m_Factory     : ISmartCardReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorWithKind
   (
      kind : Windows.Devices.SmartCards.SmartCardReaderKind
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardReader");
      m_Factory     : ISmartCardReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorWithKind(kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardReader");
      m_Factory     : ISmartCardReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardReader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAttestedVirtualSmartCardCreationAsync
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAttestedVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAttestedVirtualSmartCardCreationAsyncWithCardId
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAttestedVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromSmartCardAsync
   (
      card : Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromSmartCardAsync(card, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestVirtualSmartCardCreationAsync
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestVirtualSmartCardCreationAsyncWithCardId
   (
      friendlyName : Windows.String
      ; administrativeKey : Windows.Storage.Streams.IBuffer
      ; pinPolicy : Windows.Devices.SmartCards.ISmartCardPinPolicy
      ; cardId : Windows.Guid
   )
   return Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.SmartCards.IAsyncOperation_ISmartCardProvisioning;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestVirtualSmartCardDeletionAsync
   (
      card : Windows.Devices.SmartCards.ISmartCard
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.SmartCards.SmartCardProvisioning");
      m_Factory     : ISmartCardProvisioningStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardProvisioningStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestVirtualSmartCardDeletionAsync(card, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
