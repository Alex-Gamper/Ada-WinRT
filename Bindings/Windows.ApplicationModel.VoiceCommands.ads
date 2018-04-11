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
limited with Windows.Storage;
with Windows.Foundation.Collections;
limited with Windows.Media.SpeechRecognition;
limited with Windows.Globalization;
limited with Windows.ApplicationModel.AppService;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.VoiceCommands is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type VoiceCommandContentTileType is (
      TitleOnly,
      TitleWithText,
      TitleWith68x68Icon,
      TitleWith68x68IconAndText,
      TitleWith68x92Icon,
      TitleWith68x92IconAndText,
      TitleWith280x140Icon,
      TitleWith280x140IconAndText
   );
   for VoiceCommandContentTileType use (
      TitleOnly => 0,
      TitleWithText => 1,
      TitleWith68x68Icon => 2,
      TitleWith68x68IconAndText => 3,
      TitleWith68x92Icon => 4,
      TitleWith68x92IconAndText => 5,
      TitleWith280x140Icon => 6,
      TitleWith280x140IconAndText => 7
   );
   for VoiceCommandContentTileType'Size use 32;
   
   type VoiceCommandContentTileType_Ptr is access VoiceCommandContentTileType;
   
   type VoiceCommandCompletionReason is (
      Unknown,
      CommunicationFailed,
      ResourceLimitsExceeded,
      Canceled,
      TimeoutExceeded,
      AppLaunched,
      Completed
   );
   for VoiceCommandCompletionReason use (
      Unknown => 0,
      CommunicationFailed => 1,
      ResourceLimitsExceeded => 2,
      Canceled => 3,
      TimeoutExceeded => 4,
      AppLaunched => 5,
      Completed => 6
   );
   for VoiceCommandCompletionReason'Size use 32;
   
   type VoiceCommandCompletionReason_Ptr is access VoiceCommandCompletionReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IVoiceCommand_Interface;
   type AsyncOperationCompletedHandler_IVoiceCommand is access all AsyncOperationCompletedHandler_IVoiceCommand_Interface'Class;
   type AsyncOperationCompletedHandler_IVoiceCommand_Ptr is access all AsyncOperationCompletedHandler_IVoiceCommand;
   type AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface;
   type AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult is access all AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Ptr is access all AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult;
   type AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface;
   type AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult is access all AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Ptr is access all AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult;
   type TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface;
   type TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted is access all TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface'Class;
   type TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Ptr is access all TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVoiceCommandDefinitionManagerStatics_Interface;
   type IVoiceCommandDefinitionManagerStatics is access all IVoiceCommandDefinitionManagerStatics_Interface'Class;
   type IVoiceCommandDefinitionManagerStatics_Ptr is access all IVoiceCommandDefinitionManagerStatics;
   type IVoiceCommandDefinition_Interface;
   type IVoiceCommandDefinition is access all IVoiceCommandDefinition_Interface'Class;
   type IVoiceCommandDefinition_Ptr is access all IVoiceCommandDefinition;
   type IVoiceCommandContentTile_Interface;
   type IVoiceCommandContentTile is access all IVoiceCommandContentTile_Interface'Class;
   type IVoiceCommandContentTile_Ptr is access all IVoiceCommandContentTile;
   type IVoiceCommandUserMessage_Interface;
   type IVoiceCommandUserMessage is access all IVoiceCommandUserMessage_Interface'Class;
   type IVoiceCommandUserMessage_Ptr is access all IVoiceCommandUserMessage;
   type IVoiceCommand_Interface;
   type IVoiceCommand is access all IVoiceCommand_Interface'Class;
   type IVoiceCommand_Ptr is access all IVoiceCommand;
   type IVoiceCommandCompletedEventArgs_Interface;
   type IVoiceCommandCompletedEventArgs is access all IVoiceCommandCompletedEventArgs_Interface'Class;
   type IVoiceCommandCompletedEventArgs_Ptr is access all IVoiceCommandCompletedEventArgs;
   type IVoiceCommandDisambiguationResult_Interface;
   type IVoiceCommandDisambiguationResult is access all IVoiceCommandDisambiguationResult_Interface'Class;
   type IVoiceCommandDisambiguationResult_Ptr is access all IVoiceCommandDisambiguationResult;
   type IVoiceCommandConfirmationResult_Interface;
   type IVoiceCommandConfirmationResult is access all IVoiceCommandConfirmationResult_Interface'Class;
   type IVoiceCommandConfirmationResult_Ptr is access all IVoiceCommandConfirmationResult;
   type IVoiceCommandServiceConnection_Interface;
   type IVoiceCommandServiceConnection is access all IVoiceCommandServiceConnection_Interface'Class;
   type IVoiceCommandServiceConnection_Ptr is access all IVoiceCommandServiceConnection;
   type IVoiceCommandServiceConnectionStatics_Interface;
   type IVoiceCommandServiceConnectionStatics is access all IVoiceCommandServiceConnectionStatics_Interface'Class;
   type IVoiceCommandServiceConnectionStatics_Ptr is access all IVoiceCommandServiceConnectionStatics;
   type IVoiceCommandResponseStatics_Interface;
   type IVoiceCommandResponseStatics is access all IVoiceCommandResponseStatics_Interface'Class;
   type IVoiceCommandResponseStatics_Ptr is access all IVoiceCommandResponseStatics;
   type IVoiceCommandResponse_Interface;
   type IVoiceCommandResponse is access all IVoiceCommandResponse_Interface'Class;
   type IVoiceCommandResponse_Ptr is access all IVoiceCommandResponse;
   type IAsyncOperation_IVoiceCommand_Interface;
   type IAsyncOperation_IVoiceCommand is access all IAsyncOperation_IVoiceCommand_Interface'Class;
   type IAsyncOperation_IVoiceCommand_Ptr is access all IAsyncOperation_IVoiceCommand;
   type IAsyncOperation_IVoiceCommandConfirmationResult_Interface;
   type IAsyncOperation_IVoiceCommandConfirmationResult is access all IAsyncOperation_IVoiceCommandConfirmationResult_Interface'Class;
   type IAsyncOperation_IVoiceCommandConfirmationResult_Ptr is access all IAsyncOperation_IVoiceCommandConfirmationResult;
   type IAsyncOperation_IVoiceCommandDisambiguationResult_Interface;
   type IAsyncOperation_IVoiceCommandDisambiguationResult is access all IAsyncOperation_IVoiceCommandDisambiguationResult_Interface'Class;
   type IAsyncOperation_IVoiceCommandDisambiguationResult_Ptr is access all IAsyncOperation_IVoiceCommandDisambiguationResult;
   type IIterator_IVoiceCommandContentTile_Interface;
   type IIterator_IVoiceCommandContentTile is access all IIterator_IVoiceCommandContentTile_Interface'Class;
   type IIterator_IVoiceCommandContentTile_Ptr is access all IIterator_IVoiceCommandContentTile;
   type IIterable_IVoiceCommandContentTile_Interface;
   type IIterable_IVoiceCommandContentTile is access all IIterable_IVoiceCommandContentTile_Interface'Class;
   type IIterable_IVoiceCommandContentTile_Ptr is access all IIterable_IVoiceCommandContentTile;
   type IVectorView_IVoiceCommandContentTile_Interface;
   type IVectorView_IVoiceCommandContentTile is access all IVectorView_IVoiceCommandContentTile_Interface'Class;
   type IVectorView_IVoiceCommandContentTile_Ptr is access all IVectorView_IVoiceCommandContentTile;
   type IVector_IVoiceCommandContentTile_Interface;
   type IVector_IVoiceCommandContentTile is access all IVector_IVoiceCommandContentTile_Interface'Class;
   type IVector_IVoiceCommandContentTile_Ptr is access all IVector_IVoiceCommandContentTile;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandDefinitionManagerStatics : aliased constant Windows.IID := (2414323358, 1662, 20246, (161, 140, 91, 23, 233, 73, 153, 64 ));
   
   type IVoiceCommandDefinitionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function InstallCommandDefinitionsFromStorageFileAsync
   (
      This       : access IVoiceCommandDefinitionManagerStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_InstalledCommandDefinitions
   (
      This       : access IVoiceCommandDefinitionManagerStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandDefinition : aliased constant Windows.IID := (2037557968, 2420, 18809, (152, 75, 203, 137, 89, 205, 97, 174 ));
   
   type IVoiceCommandDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Language
   (
      This       : access IVoiceCommandDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IVoiceCommandDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetPhraseListAsync
   (
      This       : access IVoiceCommandDefinition_Interface
      ; phraseListName : Windows.String
      ; phraseList : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandContentTile : aliased constant Windows.IID := (1055910384, 47303, 19574, (160, 222, 22, 7, 137, 94, 227, 39 ));
   
   type IVoiceCommandContentTile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TextLine1
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TextLine1
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TextLine2
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TextLine2
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TextLine3
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TextLine3
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function put_Image
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_AppContext
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_AppContext
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_AppLaunchArgument
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AppLaunchArgument
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentTileType
   (
      This       : access IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTileType
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentTileType
   (
      This       : access IVoiceCommandContentTile_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTileType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandUserMessage : aliased constant Windows.IID := (1733211072, 17654, 20231, (185, 121, 76, 114, 63, 192, 133, 151 ));
   
   type IVoiceCommandUserMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayMessage
   (
      This       : access IVoiceCommandUserMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayMessage
   (
      This       : access IVoiceCommandUserMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SpokenMessage
   (
      This       : access IVoiceCommandUserMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SpokenMessage
   (
      This       : access IVoiceCommandUserMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommand : aliased constant Windows.IID := (2473546355, 60546, 17062, (165, 92, 210, 215, 158, 198, 249, 32 ));
   
   type IVoiceCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommandName
   (
      This       : access IVoiceCommand_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IVoiceCommand_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeechRecognitionResult
   (
      This       : access IVoiceCommand_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandCompletedEventArgs : aliased constant Windows.IID := (3361630045, 65090, 17196, (153, 7, 9, 223, 159, 207, 100, 232 ));
   
   type IVoiceCommandCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IVoiceCommandCompletedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.VoiceCommandCompletionReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandDisambiguationResult : aliased constant Windows.IID := (3972435198, 51628, 17887, (168, 234, 254, 234, 8, 239, 156, 94 ));
   
   type IVoiceCommandDisambiguationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedItem
   (
      This       : access IVoiceCommandDisambiguationResult_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandConfirmationResult : aliased constant Windows.IID := (2686605630, 33313, 17702, (176, 131, 132, 9, 114, 38, 34, 71 ));
   
   type IVoiceCommandConfirmationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Confirmed
   (
      This       : access IVoiceCommandConfirmationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandServiceConnection : aliased constant Windows.IID := (3633626015, 8666, 17572, (152, 162, 251, 19, 25, 32, 169, 204 ));
   
   type IVoiceCommandServiceConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetVoiceCommandAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestConfirmationAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandConfirmationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDisambiguationAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandDisambiguationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportProgressAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportSuccessAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailureAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestAppLaunchAsync
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; response : Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function add_VoiceCommandCompleted
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; handler : TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VoiceCommandCompleted
   (
      This       : access IVoiceCommandServiceConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandServiceConnectionStatics : aliased constant Windows.IID := (923713531, 11572, 17119, (135, 112, 7, 77, 15, 51, 70, 151 ));
   
   type IVoiceCommandServiceConnectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromAppServiceTriggerDetails
   (
      This       : access IVoiceCommandServiceConnectionStatics_Interface
      ; triggerDetails : Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandResponseStatics : aliased constant Windows.IID := (691206163, 3387, 18930, (150, 221, 98, 80, 25, 189, 59, 93 ));
   
   type IVoiceCommandResponseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxSupportedVoiceCommandContentTiles
   (
      This       : access IVoiceCommandResponseStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function CreateResponse
   (
      This       : access IVoiceCommandResponseStatics_Interface
      ; userMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
   )
   return Windows.HRESULT is abstract;
   
   function CreateResponseWithTiles
   (
      This       : access IVoiceCommandResponseStatics_Interface
      ; message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
   )
   return Windows.HRESULT is abstract;
   
   function CreateResponseForPrompt
   (
      This       : access IVoiceCommandResponseStatics_Interface
      ; message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
   )
   return Windows.HRESULT is abstract;
   
   function CreateResponseForPromptWithTiles
   (
      This       : access IVoiceCommandResponseStatics_Interface
      ; message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandResponse : aliased constant Windows.IID := (42251022, 35387, 19652, (166, 161, 202, 213, 190, 39, 22, 181 ));
   
   type IVoiceCommandResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IVoiceCommandResponse_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.HRESULT is abstract;
   
   function put_Message
   (
      This       : access IVoiceCommandResponse_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_RepeatMessage
   (
      This       : access IVoiceCommandResponse_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.HRESULT is abstract;
   
   function put_RepeatMessage
   (
      This       : access IVoiceCommandResponse_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_AppLaunchArgument
   (
      This       : access IVoiceCommandResponse_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AppLaunchArgument
   (
      This       : access IVoiceCommandResponse_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VoiceCommandContentTiles
   (
      This       : access IVoiceCommandResponse_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVector_IVoiceCommandContentTile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVoiceCommand : aliased constant Windows.IID := (2170493012, 19833, 22285, (155, 87, 91, 71, 226, 130, 205, 102 ));
   
   type IAsyncOperation_IVoiceCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVoiceCommand_Interface
      ; handler : Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVoiceCommand_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommand
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVoiceCommand_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVoiceCommandConfirmationResult : aliased constant Windows.IID := (993647455, 53924, 23944, (133, 31, 233, 160, 234, 13, 148, 126 ));
   
   type IAsyncOperation_IVoiceCommandConfirmationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVoiceCommandConfirmationResult_Interface
      ; handler : Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVoiceCommandConfirmationResult_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVoiceCommandConfirmationResult_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandConfirmationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVoiceCommandDisambiguationResult : aliased constant Windows.IID := (2956805320, 1551, 23448, (149, 58, 253, 30, 177, 212, 106, 188 ));
   
   type IAsyncOperation_IVoiceCommandDisambiguationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVoiceCommandDisambiguationResult_Interface
      ; handler : Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVoiceCommandDisambiguationResult_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVoiceCommandDisambiguationResult_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandDisambiguationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVoiceCommandContentTile : aliased constant Windows.IID := (2525845660, 1808, 21232, (133, 237, 17, 47, 172, 76, 255, 53 ));
   
   type IIterator_IVoiceCommandContentTile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVoiceCommandContentTile_Interface
      ; items : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVoiceCommandContentTile : aliased constant Windows.IID := (3172148379, 32921, 21875, (191, 116, 116, 87, 121, 110, 146, 229 ));
   
   type IIterable_IVoiceCommandContentTile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IIterator_IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVoiceCommandContentTile : aliased constant Windows.IID := (3408684691, 8137, 23445, (153, 181, 114, 57, 103, 150, 25, 185 ));
   
   type IVectorView_IVoiceCommandContentTile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVoiceCommandContentTile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVoiceCommandContentTile_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVoiceCommandContentTile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVoiceCommandContentTile : aliased constant Windows.IID := (3831490304, 59912, 20850, (184, 140, 196, 179, 224, 72, 195, 232 ));
   
   type IVector_IVoiceCommandContentTile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; RetVal : access Windows.ApplicationModel.VoiceCommands.IVectorView_IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; value : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVoiceCommandContentTile_Interface
      ; items : Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVoiceCommand : aliased constant Windows.IID := (270858313, 46241, 21222, (183, 113, 109, 47, 8, 195, 14, 99 ));
   
   type AsyncOperationCompletedHandler_IVoiceCommand_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommand ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVoiceCommand'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommand_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommand
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult : aliased constant Windows.IID := (4112796856, 63762, 20681, (178, 24, 215, 160, 64, 57, 113, 170 ));
   
   type AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandConfirmationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandConfirmationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult : aliased constant Windows.IID := (1186556048, 10562, 21860, (130, 216, 49, 164, 133, 27, 215, 184 ));
   
   type AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandDisambiguationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandDisambiguationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted : aliased constant Windows.IID := (2013946706, 46080, 22375, (153, 59, 144, 135, 87, 16, 217, 55 ));
   
   type TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection ; args : Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface
      ; sender : Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection
      ; args : Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VoiceCommandDefinition is Windows.ApplicationModel.VoiceCommands.IVoiceCommandDefinition;
   subtype VoiceCommandContentTile is Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile;
   
   function CreateVoiceCommandContentTile return Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile;
   
   subtype VoiceCommandUserMessage is Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage;
   
   function CreateVoiceCommandUserMessage return Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage;
   
   subtype VoiceCommand is Windows.ApplicationModel.VoiceCommands.IVoiceCommand;
   subtype VoiceCommandResponse is Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   subtype VoiceCommandConfirmationResult is Windows.ApplicationModel.VoiceCommands.IVoiceCommandConfirmationResult;
   subtype VoiceCommandDisambiguationResult is Windows.ApplicationModel.VoiceCommands.IVoiceCommandDisambiguationResult;
   subtype VoiceCommandServiceConnection is Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection;
   subtype VoiceCommandCompletedEventArgs is Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function InstallCommandDefinitionsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_InstalledCommandDefinitions
   return Windows.Address;
   
   function get_MaxSupportedVoiceCommandContentTiles
   return Windows.UInt32;
   
   function CreateResponse
   (
      userMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   
   function CreateResponseWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   
   function CreateResponseForPrompt
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   
   function CreateResponseForPromptWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   
   function FromAppServiceTriggerDetails
   (
      triggerDetails : Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection;
   
end;
