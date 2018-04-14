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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.ApplicationModel.Activation;
--------------------------------------------------------------------------------
package Windows.Gaming.UI is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GameChatOverlayPosition is (
      BottomCenter,
      BottomLeft,
      BottomRight,
      MiddleRight,
      MiddleLeft,
      TopCenter,
      TopLeft,
      TopRight
   );
   for GameChatOverlayPosition use (
      BottomCenter => 0,
      BottomLeft => 1,
      BottomRight => 2,
      MiddleRight => 3,
      MiddleLeft => 4,
      TopCenter => 5,
      TopLeft => 6,
      TopRight => 7
   );
   for GameChatOverlayPosition'Size use 32;
   
   type GameChatOverlayPosition_Ptr is access GameChatOverlayPosition;
   
   type GameChatMessageOrigin is (
      Voice,
      Text
   );
   for GameChatMessageOrigin use (
      Voice => 0,
      Text => 1
   );
   for GameChatMessageOrigin'Size use 32;
   
   type GameChatMessageOrigin_Ptr is access GameChatMessageOrigin;
   
   type GameMonitoringPermission is (
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for GameMonitoringPermission use (
      Allowed => 0,
      DeniedByUser => 1,
      DeniedBySystem => 2
   );
   for GameMonitoringPermission'Size use 32;
   
   type GameMonitoringPermission_Ptr is access GameMonitoringPermission;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GameChatOverlayContract is null record;
   pragma Convention (C_Pass_By_Copy , GameChatOverlayContract);
   
   type GameChatOverlayContract_Ptr is access GameChatOverlayContract;
   
   type GamingUIProviderContract is null record;
   pragma Convention (C_Pass_By_Copy , GamingUIProviderContract);
   
   type GamingUIProviderContract_Ptr is access GamingUIProviderContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_GameMonitoringPermission_Interface;
   type AsyncOperationCompletedHandler_GameMonitoringPermission is access all AsyncOperationCompletedHandler_GameMonitoringPermission_Interface'Class;
   type AsyncOperationCompletedHandler_GameMonitoringPermission_Ptr is access all AsyncOperationCompletedHandler_GameMonitoringPermission;
   type TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived_Interface;
   type TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived is access all TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived_Interface'Class;
   type TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived_Ptr is access all TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameBarStatics_Interface;
   type IGameBarStatics is access all IGameBarStatics_Interface'Class;
   type IGameBarStatics_Ptr is access all IGameBarStatics;
   type IGameChatOverlayStatics_Interface;
   type IGameChatOverlayStatics is access all IGameChatOverlayStatics_Interface'Class;
   type IGameChatOverlayStatics_Ptr is access all IGameChatOverlayStatics;
   type IGameChatOverlay_Interface;
   type IGameChatOverlay is access all IGameChatOverlay_Interface'Class;
   type IGameChatOverlay_Ptr is access all IGameChatOverlay;
   type IGameMonitor_Interface;
   type IGameMonitor is access all IGameMonitor_Interface'Class;
   type IGameMonitor_Ptr is access all IGameMonitor;
   type IGameMonitorStatics_Interface;
   type IGameMonitorStatics is access all IGameMonitorStatics_Interface'Class;
   type IGameMonitorStatics_Ptr is access all IGameMonitorStatics;
   type IGameChatOverlayMessageSource_Interface;
   type IGameChatOverlayMessageSource is access all IGameChatOverlayMessageSource_Interface'Class;
   type IGameChatOverlayMessageSource_Ptr is access all IGameChatOverlayMessageSource;
   type IGameChatMessageReceivedEventArgs_Interface;
   type IGameChatMessageReceivedEventArgs is access all IGameChatMessageReceivedEventArgs_Interface'Class;
   type IGameChatMessageReceivedEventArgs_Ptr is access all IGameChatMessageReceivedEventArgs;
   type IGameUIProviderActivatedEventArgs_Interface;
   type IGameUIProviderActivatedEventArgs is access all IGameUIProviderActivatedEventArgs_Interface'Class;
   type IGameUIProviderActivatedEventArgs_Ptr is access all IGameUIProviderActivatedEventArgs;
   type IActivatedEventArgs_Imported_Interface;
   type IActivatedEventArgs_Imported is access all IActivatedEventArgs_Imported_Interface'Class;
   type IActivatedEventArgs_Imported_Ptr is access all IActivatedEventArgs_Imported;
   type IAsyncOperation_GameMonitoringPermission_Interface;
   type IAsyncOperation_GameMonitoringPermission is access all IAsyncOperation_GameMonitoringPermission_Interface'Class;
   type IAsyncOperation_GameMonitoringPermission_Ptr is access all IAsyncOperation_GameMonitoringPermission;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGameBarStatics : aliased constant Windows.IID := (498705042, 52344, 16755, (190, 69, 182, 30, 103, 40, 62, 167 ));
   
   type IGameBarStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VisibilityChanged
   (
      This       : access IGameBarStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisibilityChanged
   (
      This       : access IGameBarStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_IsInputRedirectedChanged
   (
      This       : access IGameBarStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsInputRedirectedChanged
   (
      This       : access IGameBarStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access IGameBarStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInputRedirected
   (
      This       : access IGameBarStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameChatOverlayStatics : aliased constant Windows.IID := (2309813780, 30823, 18935, (150, 135, 37, 217, 219, 244, 68, 209 ));
   
   type IGameChatOverlayStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGameChatOverlayStatics_Interface
      ; RetVal : access Windows.Gaming.UI.IGameChatOverlay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameChatOverlay : aliased constant Windows.IID := (4224075877, 63228, 19016, (174, 7, 3, 172, 110, 212, 55, 4 ));
   
   type IGameChatOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredPosition
   (
      This       : access IGameChatOverlay_Interface
      ; RetVal : access Windows.Gaming.UI.GameChatOverlayPosition
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredPosition
   (
      This       : access IGameChatOverlay_Interface
      ; value : Windows.Gaming.UI.GameChatOverlayPosition
   )
   return Windows.HRESULT is abstract;
   
   function AddMessage
   (
      This       : access IGameChatOverlay_Interface
      ; sender : Windows.String
      ; message : Windows.String
      ; origin : Windows.Gaming.UI.GameChatMessageOrigin
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameMonitor : aliased constant Windows.IID := (304300888, 56585, 17681, (173, 205, 141, 89, 117, 216, 16, 40 ));
   
   type IGameMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestPermissionAsync
   (
      This       : access IGameMonitor_Interface
      ; RetVal : access Windows.Gaming.UI.IAsyncOperation_GameMonitoringPermission -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameMonitorStatics : aliased constant Windows.IID := (291982132, 23264, 19380, (185, 31, 138, 203, 72, 21, 154, 113 ));
   
   type IGameMonitorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGameMonitorStatics_Interface
      ; RetVal : access Windows.Gaming.UI.IGameMonitor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameChatOverlayMessageSource : aliased constant Windows.IID := (504853399, 23035, 20303, (142, 154, 128, 172, 248, 23, 116, 60 ));
   
   type IGameChatOverlayMessageSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MessageReceived
   (
      This       : access IGameChatOverlayMessageSource_Interface
      ; handler : TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceived
   (
      This       : access IGameChatOverlayMessageSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetDelayBeforeClosingAfterMessageReceived
   (
      This       : access IGameChatOverlayMessageSource_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameChatMessageReceivedEventArgs : aliased constant Windows.IID := (2726429169, 16313, 20034, (164, 3, 122, 252, 226, 2, 59, 30 ));
   
   type IGameChatMessageReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppId
   (
      This       : access IGameChatMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppDisplayName
   (
      This       : access IGameChatMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SenderName
   (
      This       : access IGameChatMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IGameChatMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Origin
   (
      This       : access IGameChatMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Gaming.UI.GameChatMessageOrigin
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGameUIProviderActivatedEventArgs : aliased constant Windows.IID := (2813534270, 51959, 19949, (187, 210, 71, 222, 67, 187, 109, 213 ));
   
   type IGameUIProviderActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GameUIArgs
   (
      This       : access IGameUIProviderActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IGameUIProviderActivatedEventArgs_Interface
      ; results : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ActivationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousExecutionState
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ApplicationExecutionState
   )
   return Windows.HRESULT is abstract;
   
   function get_SplashScreen
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ISplashScreen
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_GameMonitoringPermission : aliased constant Windows.IID := (1513878687, 54671, 22723, (167, 225, 30, 208, 84, 112, 186, 166 ));
   
   type IAsyncOperation_GameMonitoringPermission_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_GameMonitoringPermission_Interface
      ; handler : Windows.Gaming.UI.AsyncOperationCompletedHandler_GameMonitoringPermission
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_GameMonitoringPermission_Interface
      ; RetVal : access Windows.Gaming.UI.AsyncOperationCompletedHandler_GameMonitoringPermission
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_GameMonitoringPermission_Interface
      ; RetVal : access Windows.Gaming.UI.GameMonitoringPermission
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_GameMonitoringPermission : aliased constant Windows.IID := (3004007428, 38119, 21095, (156, 122, 189, 121, 114, 123, 129, 90 ));
   
   type AsyncOperationCompletedHandler_GameMonitoringPermission_Interface(Callback : access procedure (asyncInfo : Windows.Gaming.UI.IAsyncOperation_GameMonitoringPermission ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_GameMonitoringPermission'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_GameMonitoringPermission_Interface
      ; asyncInfo : Windows.Gaming.UI.IAsyncOperation_GameMonitoringPermission
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived : aliased constant Windows.IID := (4266595263, 26780, 24547, (183, 173, 85, 188, 87, 249, 36, 102 ));
   
   type TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived_Interface(Callback : access procedure (sender : Windows.Gaming.UI.IGameChatOverlayMessageSource ; args : Windows.Gaming.UI.IGameChatMessageReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGameChatOverlayMessageSource_add_MessageReceived_Interface
      ; sender : Windows.Gaming.UI.IGameChatOverlayMessageSource
      ; args : Windows.Gaming.UI.IGameChatMessageReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GameChatOverlay is Windows.Gaming.UI.IGameChatOverlay;
   subtype GameMonitor is Windows.Gaming.UI.IGameMonitor;
   subtype GameChatOverlayMessageSource is Windows.Gaming.UI.IGameChatOverlayMessageSource;
   function CreateGameChatOverlayMessageSource return Windows.Gaming.UI.IGameChatOverlayMessageSource;
   
   subtype GameChatMessageReceivedEventArgs is Windows.Gaming.UI.IGameChatMessageReceivedEventArgs;
   subtype GameUIProviderActivatedEventArgs is Windows.Gaming.UI.IGameUIProviderActivatedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function add_VisibilityChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_VisibilityChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_IsInputRedirectedChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_IsInputRedirectedChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_Visible
   return Windows.Boolean;
   
   function get_IsInputRedirected
   return Windows.Boolean;
   
   function GetDefault
   return Windows.Gaming.UI.IGameChatOverlay;
   
   function GetDefault
   return Windows.Gaming.UI.IGameMonitor;
   
end;
