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
limited with Windows.UI.Popups;
limited with Windows.Security.Credentials;
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.UI.ApplicationSettings is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebAccountAction is (
      Reconnect,
      Remove,
      ViewDetails,
      Manage,
      More
   );
   for WebAccountAction use (
      Reconnect => 0,
      Remove => 1,
      ViewDetails => 2,
      Manage => 3,
      More => 4
   );
   for WebAccountAction'Size use 32;
   
   type WebAccountAction_Ptr is access WebAccountAction;
   
   type SupportedWebAccountActions is (
      None,
      Reconnect,
      Remove,
      ViewDetails,
      Manage,
      More
   );
   for SupportedWebAccountActions use (
      None => 0,
      Reconnect => 1,
      Remove => 2,
      ViewDetails => 4,
      Manage => 8,
      More => 16
   );
   for SupportedWebAccountActions'Size use 32;
   
   type SupportedWebAccountActions_Ptr is access SupportedWebAccountActions;
   
   type SettingsEdgeLocation is (
      Right,
      Left
   );
   for SettingsEdgeLocation use (
      Right => 0,
      Left => 1
   );
   for SettingsEdgeLocation'Size use 32;
   
   type SettingsEdgeLocation_Ptr is access SettingsEdgeLocation;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ApplicationsSettingsContract is null record;
   pragma Convention (C_Pass_By_Copy , ApplicationsSettingsContract);
   
   type ApplicationsSettingsContract_Ptr is access ApplicationsSettingsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type WebAccountProviderCommandInvokedHandler_Interface;
   type WebAccountProviderCommandInvokedHandler is access all WebAccountProviderCommandInvokedHandler_Interface'Class;
   type WebAccountProviderCommandInvokedHandler_Ptr is access all WebAccountProviderCommandInvokedHandler;
   type WebAccountCommandInvokedHandler_Interface;
   type WebAccountCommandInvokedHandler is access all WebAccountCommandInvokedHandler_Interface'Class;
   type WebAccountCommandInvokedHandler_Ptr is access all WebAccountCommandInvokedHandler;
   type CredentialCommandCredentialDeletedHandler_Interface;
   type CredentialCommandCredentialDeletedHandler is access all CredentialCommandCredentialDeletedHandler_Interface'Class;
   type CredentialCommandCredentialDeletedHandler_Ptr is access all CredentialCommandCredentialDeletedHandler;
   type TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Interface;
   type TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested is access all TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Interface'Class;
   type TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Ptr is access all TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested;
   type TypedEventHandler_ISettingsPane_add_CommandsRequested_Interface;
   type TypedEventHandler_ISettingsPane_add_CommandsRequested is access all TypedEventHandler_ISettingsPane_add_CommandsRequested_Interface'Class;
   type TypedEventHandler_ISettingsPane_add_CommandsRequested_Ptr is access all TypedEventHandler_ISettingsPane_add_CommandsRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISettingsCommandFactory_Interface;
   type ISettingsCommandFactory is access all ISettingsCommandFactory_Interface'Class;
   type ISettingsCommandFactory_Ptr is access all ISettingsCommandFactory;
   type ISettingsCommandStatics_Interface;
   type ISettingsCommandStatics is access all ISettingsCommandStatics_Interface'Class;
   type ISettingsCommandStatics_Ptr is access all ISettingsCommandStatics;
   type IWebAccountProviderCommandFactory_Interface;
   type IWebAccountProviderCommandFactory is access all IWebAccountProviderCommandFactory_Interface'Class;
   type IWebAccountProviderCommandFactory_Ptr is access all IWebAccountProviderCommandFactory;
   type IWebAccountProviderCommand_Interface;
   type IWebAccountProviderCommand is access all IWebAccountProviderCommand_Interface'Class;
   type IWebAccountProviderCommand_Ptr is access all IWebAccountProviderCommand;
   type IWebAccountInvokedArgs_Interface;
   type IWebAccountInvokedArgs is access all IWebAccountInvokedArgs_Interface'Class;
   type IWebAccountInvokedArgs_Ptr is access all IWebAccountInvokedArgs;
   type IWebAccountCommandFactory_Interface;
   type IWebAccountCommandFactory is access all IWebAccountCommandFactory_Interface'Class;
   type IWebAccountCommandFactory_Ptr is access all IWebAccountCommandFactory;
   type IWebAccountCommand_Interface;
   type IWebAccountCommand is access all IWebAccountCommand_Interface'Class;
   type IWebAccountCommand_Ptr is access all IWebAccountCommand;
   type ICredentialCommandFactory_Interface;
   type ICredentialCommandFactory is access all ICredentialCommandFactory_Interface'Class;
   type ICredentialCommandFactory_Ptr is access all ICredentialCommandFactory;
   type ICredentialCommand_Interface;
   type ICredentialCommand is access all ICredentialCommand_Interface'Class;
   type ICredentialCommand_Ptr is access all ICredentialCommand;
   type IAccountsSettingsPaneEventDeferral_Interface;
   type IAccountsSettingsPaneEventDeferral is access all IAccountsSettingsPaneEventDeferral_Interface'Class;
   type IAccountsSettingsPaneEventDeferral_Ptr is access all IAccountsSettingsPaneEventDeferral;
   type IAccountsSettingsPaneCommandsRequestedEventArgs_Interface;
   type IAccountsSettingsPaneCommandsRequestedEventArgs is access all IAccountsSettingsPaneCommandsRequestedEventArgs_Interface'Class;
   type IAccountsSettingsPaneCommandsRequestedEventArgs_Ptr is access all IAccountsSettingsPaneCommandsRequestedEventArgs;
   type IAccountsSettingsPaneStatics_Interface;
   type IAccountsSettingsPaneStatics is access all IAccountsSettingsPaneStatics_Interface'Class;
   type IAccountsSettingsPaneStatics_Ptr is access all IAccountsSettingsPaneStatics;
   type IAccountsSettingsPaneStatics2_Interface;
   type IAccountsSettingsPaneStatics2 is access all IAccountsSettingsPaneStatics2_Interface'Class;
   type IAccountsSettingsPaneStatics2_Ptr is access all IAccountsSettingsPaneStatics2;
   type IAccountsSettingsPane_Interface;
   type IAccountsSettingsPane is access all IAccountsSettingsPane_Interface'Class;
   type IAccountsSettingsPane_Ptr is access all IAccountsSettingsPane;
   type ISettingsPaneCommandsRequest_Interface;
   type ISettingsPaneCommandsRequest is access all ISettingsPaneCommandsRequest_Interface'Class;
   type ISettingsPaneCommandsRequest_Ptr is access all ISettingsPaneCommandsRequest;
   type ISettingsPaneCommandsRequestedEventArgs_Interface;
   type ISettingsPaneCommandsRequestedEventArgs is access all ISettingsPaneCommandsRequestedEventArgs_Interface'Class;
   type ISettingsPaneCommandsRequestedEventArgs_Ptr is access all ISettingsPaneCommandsRequestedEventArgs;
   type ISettingsPaneStatics_Interface;
   type ISettingsPaneStatics is access all ISettingsPaneStatics_Interface'Class;
   type ISettingsPaneStatics_Ptr is access all ISettingsPaneStatics;
   type ISettingsPane_Interface;
   type ISettingsPane is access all ISettingsPane_Interface'Class;
   type ISettingsPane_Ptr is access all ISettingsPane;
   type IUICommand_Imported_Interface;
   type IUICommand_Imported is access all IUICommand_Imported_Interface'Class;
   type IUICommand_Imported_Ptr is access all IUICommand_Imported;
   type IIterator_IWebAccountProviderCommand_Interface;
   type IIterator_IWebAccountProviderCommand is access all IIterator_IWebAccountProviderCommand_Interface'Class;
   type IIterator_IWebAccountProviderCommand_Ptr is access all IIterator_IWebAccountProviderCommand;
   type IIterable_IWebAccountProviderCommand_Interface;
   type IIterable_IWebAccountProviderCommand is access all IIterable_IWebAccountProviderCommand_Interface'Class;
   type IIterable_IWebAccountProviderCommand_Ptr is access all IIterable_IWebAccountProviderCommand;
   type IVectorView_IWebAccountProviderCommand_Interface;
   type IVectorView_IWebAccountProviderCommand is access all IVectorView_IWebAccountProviderCommand_Interface'Class;
   type IVectorView_IWebAccountProviderCommand_Ptr is access all IVectorView_IWebAccountProviderCommand;
   type IVector_IWebAccountProviderCommand_Interface;
   type IVector_IWebAccountProviderCommand is access all IVector_IWebAccountProviderCommand_Interface'Class;
   type IVector_IWebAccountProviderCommand_Ptr is access all IVector_IWebAccountProviderCommand;
   type IIterator_IWebAccountCommand_Interface;
   type IIterator_IWebAccountCommand is access all IIterator_IWebAccountCommand_Interface'Class;
   type IIterator_IWebAccountCommand_Ptr is access all IIterator_IWebAccountCommand;
   type IIterable_IWebAccountCommand_Interface;
   type IIterable_IWebAccountCommand is access all IIterable_IWebAccountCommand_Interface'Class;
   type IIterable_IWebAccountCommand_Ptr is access all IIterable_IWebAccountCommand;
   type IVectorView_IWebAccountCommand_Interface;
   type IVectorView_IWebAccountCommand is access all IVectorView_IWebAccountCommand_Interface'Class;
   type IVectorView_IWebAccountCommand_Ptr is access all IVectorView_IWebAccountCommand;
   type IVector_IWebAccountCommand_Interface;
   type IVector_IWebAccountCommand is access all IVector_IWebAccountCommand_Interface'Class;
   type IVector_IWebAccountCommand_Ptr is access all IVector_IWebAccountCommand;
   type IIterator_ICredentialCommand_Interface;
   type IIterator_ICredentialCommand is access all IIterator_ICredentialCommand_Interface'Class;
   type IIterator_ICredentialCommand_Ptr is access all IIterator_ICredentialCommand;
   type IIterable_ICredentialCommand_Interface;
   type IIterable_ICredentialCommand is access all IIterable_ICredentialCommand_Interface'Class;
   type IIterable_ICredentialCommand_Ptr is access all IIterable_ICredentialCommand;
   type IVectorView_ICredentialCommand_Interface;
   type IVectorView_ICredentialCommand is access all IVectorView_ICredentialCommand_Interface'Class;
   type IVectorView_ICredentialCommand_Ptr is access all IVectorView_ICredentialCommand;
   type IVector_ICredentialCommand_Interface;
   type IVector_ICredentialCommand is access all IVector_ICredentialCommand_Interface'Class;
   type IVector_ICredentialCommand_Ptr is access all IVector_ICredentialCommand;
   
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
   
   IID_ISettingsCommandFactory : aliased constant Windows.IID := (1759599411, 7299, 17210, (170, 90, 206, 238, 165, 189, 71, 100 ));
   
   type ISettingsCommandFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSettingsCommand
   (
      This       : access ISettingsCommandFactory_Interface
      ; settingsCommandId : Windows.Object
      ; label : Windows.String
      ; handler : Windows.UI.Popups.UICommandInvokedHandler
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsCommandStatics : aliased constant Windows.IID := (1956309332, 12137, 19223, (138, 186, 208, 92, 229, 119, 142, 70 ));
   
   type ISettingsCommandStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccountsCommand
   (
      This       : access ISettingsCommandStatics_Interface
      ; RetVal : access Windows.UI.Popups.IUICommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderCommandFactory : aliased constant Windows.IID := (3580201499, 45430, 18294, (132, 105, 169, 211, 255, 11, 63, 89 ));
   
   type IWebAccountProviderCommandFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWebAccountProviderCommand
   (
      This       : access IWebAccountProviderCommandFactory_Interface
      ; webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; invoked : Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderCommand : aliased constant Windows.IID := (3600539034, 41126, 20123, (136, 220, 199, 30, 117, 122, 53, 1 ));
   
   type IWebAccountProviderCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccountProvider
   (
      This       : access IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Invoked
   (
      This       : access IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountInvokedArgs : aliased constant Windows.IID := (3886795840, 41432, 19549, (154, 127, 29, 52, 178, 249, 10, 210 ));
   
   type IWebAccountInvokedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Action
   (
      This       : access IWebAccountInvokedArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.WebAccountAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountCommandFactory : aliased constant Windows.IID := (3215379967, 12077, 17141, (129, 222, 29, 86, 186, 252, 73, 109 ));
   
   type IWebAccountCommandFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWebAccountCommand
   (
      This       : access IWebAccountCommandFactory_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; invoked : Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
      ; actions : Windows.UI.ApplicationSettings.SupportedWebAccountActions
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountCommand : aliased constant Windows.IID := (3399717784, 40186, 16966, (176, 196, 169, 19, 163, 137, 101, 65 ));
   
   type IWebAccountCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccount
   (
      This       : access IWebAccountCommand_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Invoked
   (
      This       : access IWebAccountCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function get_Actions
   (
      This       : access IWebAccountCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.SupportedWebAccountActions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICredentialCommandFactory : aliased constant Windows.IID := (669551639, 48190, 19328, (148, 149, 78, 215, 32, 228, 138, 145 ));
   
   type ICredentialCommandFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCredentialCommand
   (
      This       : access ICredentialCommandFactory_Interface
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; RetVal : access Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function CreateCredentialCommandWithHandler
   (
      This       : access ICredentialCommandFactory_Interface
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; deleted : Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
      ; RetVal : access Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICredentialCommand : aliased constant Windows.IID := (2784388582, 24899, 19066, (169, 113, 176, 23, 186, 151, 140, 226 ));
   
   type ICredentialCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PasswordCredential
   (
      This       : access ICredentialCommand_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialDeleted
   (
      This       : access ICredentialCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccountsSettingsPaneEventDeferral : aliased constant Windows.IID := (3421658431, 58810, 16623, (147, 218, 101, 224, 150, 229, 251, 4 ));
   
   type IAccountsSettingsPaneEventDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IAccountsSettingsPaneEventDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccountsSettingsPaneCommandsRequestedEventArgs : aliased constant Windows.IID := (996720793, 56089, 17872, (154, 191, 149, 211, 119, 60, 147, 48 ));
   
   type IAccountsSettingsPaneCommandsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccountProviderCommands
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVector_IWebAccountProviderCommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WebAccountCommands
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVector_IWebAccountCommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialCommands
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVector_ICredentialCommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Commands
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderText
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderText
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAccountsSettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccountsSettingsPaneStatics : aliased constant Windows.IID := (1444907872, 45292, 16720, (168, 220, 32, 142, 228, 75, 6, 138 ));
   
   type IAccountsSettingsPaneStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IAccountsSettingsPaneStatics_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IAccountsSettingsPane
   )
   return Windows.HRESULT is abstract;
   
   function Show
   (
      This       : access IAccountsSettingsPaneStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccountsSettingsPaneStatics2 : aliased constant Windows.IID := (3525179330, 52749, 18511, (184, 232, 232, 35, 194, 21, 118, 94 ));
   
   type IAccountsSettingsPaneStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowManageAccountsAsync
   (
      This       : access IAccountsSettingsPaneStatics2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAddAccountAsync
   (
      This       : access IAccountsSettingsPaneStatics2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccountsSettingsPane : aliased constant Windows.IID := (2179634220, 20233, 17414, (165, 56, 131, 141, 155, 20, 183, 230 ));
   
   type IAccountsSettingsPane_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AccountCommandsRequested
   (
      This       : access IAccountsSettingsPane_Interface
      ; handler : TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccountCommandsRequested
   (
      This       : access IAccountsSettingsPane_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsPaneCommandsRequest : aliased constant Windows.IID := (1155474350, 23918, 16488, (161, 104, 244, 118, 67, 24, 33, 20 ));
   
   type ISettingsPaneCommandsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ApplicationCommands
   (
      This       : access ISettingsPaneCommandsRequest_Interface
      ; RetVal : access Windows.UI.Popups.IVector_IUICommand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsPaneCommandsRequestedEventArgs : aliased constant Windows.IID := (543120676, 6984, 17961, (166, 202, 47, 223, 237, 175, 183, 93 ));
   
   type ISettingsPaneCommandsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ISettingsPaneCommandsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsPaneStatics : aliased constant Windows.IID := (476730053, 65305, 18203, (186, 107, 248, 243, 86, 148, 173, 154 ));
   
   type ISettingsPaneStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISettingsPaneStatics_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.ISettingsPane
   )
   return Windows.HRESULT is abstract;
   
   function Show
   (
      This       : access ISettingsPaneStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Edge
   (
      This       : access ISettingsPaneStatics_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.SettingsEdgeLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISettingsPane : aliased constant Windows.IID := (2983004466, 17776, 19561, (141, 56, 137, 68, 101, 97, 172, 224 ));
   
   type ISettingsPane_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CommandsRequested
   (
      This       : access ISettingsPane_Interface
      ; handler : TypedEventHandler_ISettingsPane_add_CommandsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CommandsRequested
   (
      This       : access ISettingsPane_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IUICommand_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access IUICommand_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IUICommand_Imported_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Invoked
   (
      This       : access IUICommand_Imported_Interface
      ; RetVal : access Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function put_Invoked
   (
      This       : access IUICommand_Imported_Interface
      ; value : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IUICommand_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IUICommand_Imported_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebAccountProviderCommand : aliased constant Windows.IID := (2195180916, 36403, 24326, (146, 252, 145, 81, 56, 170, 203, 222 ));
   
   type IIterator_IWebAccountProviderCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebAccountProviderCommand_Interface
      ; items : Windows.UI.ApplicationSettings.IWebAccountProviderCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountProviderCommand : aliased constant Windows.IID := (353784679, 11923, 22950, (181, 199, 22, 211, 181, 143, 210, 231 ));
   
   type IIterable_IWebAccountProviderCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IIterator_IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebAccountProviderCommand : aliased constant Windows.IID := (3000078944, 6183, 23944, (185, 72, 150, 136, 207, 205, 99, 174 ));
   
   type IVectorView_IWebAccountProviderCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebAccountProviderCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebAccountProviderCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebAccountProviderCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.IWebAccountProviderCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IWebAccountProviderCommand : aliased constant Windows.IID := (3547769843, 61633, 21043, (159, 66, 222, 83, 24, 132, 150, 62 ));
   
   type IVector_IWebAccountProviderCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVectorView_IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.IWebAccountProviderCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IWebAccountProviderCommand_Interface
      ; items : Windows.UI.ApplicationSettings.IWebAccountProviderCommand_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebAccountCommand : aliased constant Windows.IID := (2361090742, 48540, 21638, (157, 20, 156, 196, 98, 123, 50, 212 ));
   
   type IIterator_IWebAccountCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebAccountCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebAccountCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebAccountCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebAccountCommand_Interface
      ; items : Windows.UI.ApplicationSettings.IWebAccountCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountCommand : aliased constant Windows.IID := (3171785116, 45754, 20914, (188, 192, 212, 165, 205, 130, 21, 85 ));
   
   type IIterable_IWebAccountCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IIterator_IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebAccountCommand : aliased constant Windows.IID := (545172030, 24265, 23508, (161, 210, 115, 23, 154, 129, 40, 168 ));
   
   type IVectorView_IWebAccountCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebAccountCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebAccountCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebAccountCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebAccountCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.IWebAccountCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IWebAccountCommand : aliased constant Windows.IID := (1692951752, 32751, 24053, (166, 36, 80, 181, 119, 244, 133, 84 ));
   
   type IVector_IWebAccountCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVectorView_IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; value : Windows.UI.ApplicationSettings.IWebAccountCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IWebAccountCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IWebAccountCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.IWebAccountCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IWebAccountCommand_Interface
      ; items : Windows.UI.ApplicationSettings.IWebAccountCommand_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICredentialCommand : aliased constant Windows.IID := (2668722161, 34235, 23760, (155, 8, 160, 180, 122, 118, 76, 117 ));
   
   type IIterator_ICredentialCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICredentialCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICredentialCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICredentialCommand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICredentialCommand_Interface
      ; items : Windows.UI.ApplicationSettings.ICredentialCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICredentialCommand : aliased constant Windows.IID := (2285818253, 19899, 22770, (143, 210, 228, 176, 24, 80, 149, 83 ));
   
   type IIterable_ICredentialCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICredentialCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IIterator_ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICredentialCommand : aliased constant Windows.IID := (2513181626, 49785, 24293, (165, 36, 120, 1, 43, 127, 225, 126 ));
   
   type IVectorView_ICredentialCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICredentialCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICredentialCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICredentialCommand_Interface
      ; value : Windows.UI.ApplicationSettings.ICredentialCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICredentialCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.ICredentialCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ICredentialCommand : aliased constant Windows.IID := (3064929461, 62990, 23304, (179, 18, 46, 181, 17, 53, 207, 198 ));
   
   type IVector_ICredentialCommand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ICredentialCommand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ICredentialCommand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ICredentialCommand_Interface
      ; RetVal : access Windows.UI.ApplicationSettings.IVectorView_ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ICredentialCommand_Interface
      ; value : Windows.UI.ApplicationSettings.ICredentialCommand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ICredentialCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ICredentialCommand_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ICredentialCommand_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ICredentialCommand_Interface
      ; value : Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ICredentialCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ICredentialCommand_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ICredentialCommand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.ApplicationSettings.ICredentialCommand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ICredentialCommand_Interface
      ; items : Windows.UI.ApplicationSettings.ICredentialCommand_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_WebAccountProviderCommandInvokedHandler : aliased constant Windows.IID := (3084801319, 19599, 17117, (132, 218, 94, 196, 147, 171, 219, 154 ));
   
   type WebAccountProviderCommandInvokedHandler_Interface(Callback : access procedure (command : Windows.UI.ApplicationSettings.IWebAccountProviderCommand)) is new Windows.IMulticastDelegate_Interface(IID_WebAccountProviderCommandInvokedHandler'access) with null record;
   function Invoke
   (
      This       : access WebAccountProviderCommandInvokedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_WebAccountCommandInvokedHandler : aliased constant Windows.IID := (518448217, 5893, 19098, (181, 153, 160, 195, 214, 146, 25, 115 ));
   
   type WebAccountCommandInvokedHandler_Interface(Callback : access procedure (command : Windows.UI.ApplicationSettings.IWebAccountCommand ; args : Windows.UI.ApplicationSettings.IWebAccountInvokedArgs)) is new Windows.IMulticastDelegate_Interface(IID_WebAccountCommandInvokedHandler'access) with null record;
   function Invoke
   (
      This       : access WebAccountCommandInvokedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.IWebAccountCommand
      ; args : Windows.UI.ApplicationSettings.IWebAccountInvokedArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_CredentialCommandCredentialDeletedHandler : aliased constant Windows.IID := (1640030597, 2423, 18040, (180, 226, 152, 114, 122, 251, 238, 217 ));
   
   type CredentialCommandCredentialDeletedHandler_Interface(Callback : access procedure (command : Windows.UI.ApplicationSettings.ICredentialCommand)) is new Windows.IMulticastDelegate_Interface(IID_CredentialCommandCredentialDeletedHandler'access) with null record;
   function Invoke
   (
      This       : access CredentialCommandCredentialDeletedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested : aliased constant Windows.IID := (1773700222, 32114, 23061, (188, 28, 76, 163, 156, 147, 177, 98 ));
   
   type TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Interface(Callback : access procedure (sender : Windows.UI.ApplicationSettings.IAccountsSettingsPane ; args : Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Interface
      ; sender : Windows.UI.ApplicationSettings.IAccountsSettingsPane
      ; args : Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISettingsPane_add_CommandsRequested : aliased constant Windows.IID := (4086978210, 32177, 23624, (158, 19, 125, 196, 133, 164, 169, 158 ));
   
   type TypedEventHandler_ISettingsPane_add_CommandsRequested_Interface(Callback : access procedure (sender : Windows.UI.ApplicationSettings.ISettingsPane ; args : Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISettingsPane_add_CommandsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISettingsPane_add_CommandsRequested_Interface
      ; sender : Windows.UI.ApplicationSettings.ISettingsPane
      ; args : Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SettingsCommand is Windows.UI.Popups.IUICommand;
   function CreateSettingsCommand
   (
      settingsCommandId : Windows.Object
      ; label : Windows.String
      ; handler : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.UI.Popups.IUICommand;
   
   
   subtype WebAccountProviderCommand is Windows.UI.ApplicationSettings.IWebAccountProviderCommand;
   function CreateWebAccountProviderCommand
   (
      webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; invoked : Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
   )
   return Windows.UI.ApplicationSettings.IWebAccountProviderCommand;
   
   
   subtype WebAccountCommand is Windows.UI.ApplicationSettings.IWebAccountCommand;
   function CreateWebAccountCommand
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; invoked : Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
      ; actions : Windows.UI.ApplicationSettings.SupportedWebAccountActions
   )
   return Windows.UI.ApplicationSettings.IWebAccountCommand;
   
   
   subtype WebAccountInvokedArgs is Windows.UI.ApplicationSettings.IWebAccountInvokedArgs;
   subtype CredentialCommand is Windows.UI.ApplicationSettings.ICredentialCommand;
   function CreateCredentialCommand
   (
      passwordCredential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.UI.ApplicationSettings.ICredentialCommand;
   
   function CreateCredentialCommandWithHandler
   (
      passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; deleted : Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
   )
   return Windows.UI.ApplicationSettings.ICredentialCommand;
   
   
   subtype AccountsSettingsPaneEventDeferral is Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral;
   subtype AccountsSettingsPaneCommandsRequestedEventArgs is Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs;
   subtype AccountsSettingsPane is Windows.UI.ApplicationSettings.IAccountsSettingsPane;
   subtype SettingsPaneCommandsRequest is Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequest;
   subtype SettingsPaneCommandsRequestedEventArgs is Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequestedEventArgs;
   subtype SettingsPane is Windows.UI.ApplicationSettings.ISettingsPane;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_AccountsCommand
   return Windows.UI.Popups.IUICommand;
   
   function ShowManageAccountsAsync
   return Windows.Foundation.IAsyncAction;
   
   function ShowAddAccountAsync
   return Windows.Foundation.IAsyncAction;
   
   function GetForCurrentView
   return Windows.UI.ApplicationSettings.IAccountsSettingsPane;
   
   procedure Show
   ;
   

end;
