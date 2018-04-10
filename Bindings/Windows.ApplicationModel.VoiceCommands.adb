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
with Windows.Storage;
with Windows.Media.SpeechRecognition;
with Windows.Globalization;
with Windows.ApplicationModel.AppService;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.VoiceCommands is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommand_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommand
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
      This       : access AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandConfirmationResult
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
      This       : access AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandDisambiguationResult
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
      This       : access TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface
      ; sender : Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection
      ; args : Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection(sender), Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateVoiceCommandContentTile return Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTile");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.VoiceCommands.IID_IVoiceCommandContentTile'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateVoiceCommandUserMessage return Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandUserMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.VoiceCommands.IID_IVoiceCommandUserMessage'Access, RetVal'access);
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
   
   function InstallCommandDefinitionsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager");
      m_Factory     : IVoiceCommandDefinitionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandDefinitionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InstallCommandDefinitionsFromStorageFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InstalledCommandDefinitions
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager");
      m_Factory     : IVoiceCommandDefinitionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandDefinitionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InstalledCommandDefinitions(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxSupportedVoiceCommandContentTiles
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSupportedVoiceCommandContentTiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponse
   (
      userMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponse(userMessage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseWithTiles(message, contentTiles, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseForPrompt
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseForPrompt(message, repeatMessage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseForPromptWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseForPromptWithTiles(message, repeatMessage, contentTiles, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromAppServiceTriggerDetails
   (
      triggerDetails : Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandServiceConnection");
      m_Factory     : IVoiceCommandServiceConnectionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandServiceConnectionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromAppServiceTriggerDetails(triggerDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
