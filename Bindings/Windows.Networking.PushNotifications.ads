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
limited with Windows.System;
limited with Windows.Storage.Streams;
limited with Windows.UI.Notifications;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Networking.PushNotifications is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PushNotificationType is (
      Toast,
      Tile,
      Badge,
      Raw,
      TileFlyout
   );
   for PushNotificationType use (
      Toast => 0,
      Tile => 1,
      Badge => 2,
      Raw => 3,
      TileFlyout => 4
   );
   for PushNotificationType'Size use 32;
   
   type PushNotificationType_Ptr is access PushNotificationType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPushNotificationChannel_Interface;
   type AsyncOperationCompletedHandler_IPushNotificationChannel is access all AsyncOperationCompletedHandler_IPushNotificationChannel_Interface'Class;
   type AsyncOperationCompletedHandler_IPushNotificationChannel_Ptr is access all AsyncOperationCompletedHandler_IPushNotificationChannel;
   type TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Interface;
   type TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived is access all TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Interface'Class;
   type TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Ptr is access all TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPushNotificationChannelManagerStatics_Interface;
   type IPushNotificationChannelManagerStatics is access all IPushNotificationChannelManagerStatics_Interface'Class;
   type IPushNotificationChannelManagerStatics_Ptr is access all IPushNotificationChannelManagerStatics;
   type IPushNotificationChannelManagerStatics2_Interface;
   type IPushNotificationChannelManagerStatics2 is access all IPushNotificationChannelManagerStatics2_Interface'Class;
   type IPushNotificationChannelManagerStatics2_Ptr is access all IPushNotificationChannelManagerStatics2;
   type IPushNotificationChannelManagerStatics3_Interface;
   type IPushNotificationChannelManagerStatics3 is access all IPushNotificationChannelManagerStatics3_Interface'Class;
   type IPushNotificationChannelManagerStatics3_Ptr is access all IPushNotificationChannelManagerStatics3;
   type IPushNotificationChannelManagerForUser_Interface;
   type IPushNotificationChannelManagerForUser is access all IPushNotificationChannelManagerForUser_Interface'Class;
   type IPushNotificationChannelManagerForUser_Ptr is access all IPushNotificationChannelManagerForUser;
   type IPushNotificationChannelManagerForUser2_Interface;
   type IPushNotificationChannelManagerForUser2 is access all IPushNotificationChannelManagerForUser2_Interface'Class;
   type IPushNotificationChannelManagerForUser2_Ptr is access all IPushNotificationChannelManagerForUser2;
   type IPushNotificationChannel_Interface;
   type IPushNotificationChannel is access all IPushNotificationChannel_Interface'Class;
   type IPushNotificationChannel_Ptr is access all IPushNotificationChannel;
   type IPushNotificationReceivedEventArgs_Interface;
   type IPushNotificationReceivedEventArgs is access all IPushNotificationReceivedEventArgs_Interface'Class;
   type IPushNotificationReceivedEventArgs_Ptr is access all IPushNotificationReceivedEventArgs;
   type IRawNotification_Interface;
   type IRawNotification is access all IRawNotification_Interface'Class;
   type IRawNotification_Ptr is access all IRawNotification;
   type IRawNotification2_Interface;
   type IRawNotification2 is access all IRawNotification2_Interface'Class;
   type IRawNotification2_Ptr is access all IRawNotification2;
   type IAsyncOperation_IPushNotificationChannel_Interface;
   type IAsyncOperation_IPushNotificationChannel is access all IAsyncOperation_IPushNotificationChannel_Interface'Class;
   type IAsyncOperation_IPushNotificationChannel_Ptr is access all IAsyncOperation_IPushNotificationChannel;
   
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
   
   IID_IPushNotificationChannelManagerStatics : aliased constant Windows.IID := (2343541605, 30625, 17800, (189, 25, 134, 21, 41, 169, 220, 240 ));
   
   type IPushNotificationChannelManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePushNotificationChannelForApplicationAsync
   (
      This       : access IPushNotificationChannelManagerStatics_Interface
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreatePushNotificationChannelForApplicationAsyncWithId
   (
      This       : access IPushNotificationChannelManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreatePushNotificationChannelForSecondaryTileAsync
   (
      This       : access IPushNotificationChannelManagerStatics_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationChannelManagerStatics2 : aliased constant Windows.IID := (3024397917, 42985, 19240, (149, 14, 243, 117, 169, 7, 249, 223 ));
   
   type IPushNotificationChannelManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IPushNotificationChannelManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationChannelManagerStatics3 : aliased constant Windows.IID := (1191313150, 3806, 19007, (174, 120, 191, 164, 113, 73, 105, 37 ));
   
   type IPushNotificationChannelManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IPushNotificationChannelManagerStatics3_Interface
      ; RetVal : access Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationChannelManagerForUser : aliased constant Windows.IID := (2764330756, 4482, 17095, (136, 144, 245, 99, 196, 137, 13, 196 ));
   
   type IPushNotificationChannelManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePushNotificationChannelForApplicationAsync
   (
      This       : access IPushNotificationChannelManagerForUser_Interface
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreatePushNotificationChannelForApplicationAsyncWithId
   (
      This       : access IPushNotificationChannelManagerForUser_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreatePushNotificationChannelForSecondaryTileAsync
   (
      This       : access IPushNotificationChannelManagerForUser_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IPushNotificationChannelManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationChannelManagerForUser2 : aliased constant Windows.IID := (3280668266, 31937, 19884, (135, 253, 190, 110, 146, 4, 20, 164 ));
   
   type IPushNotificationChannelManagerForUser2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync
   (
      This       : access IPushNotificationChannelManagerForUser2_Interface
      ; appServerKey : Windows.Storage.Streams.IBuffer
      ; channelId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsyncWithId
   (
      This       : access IPushNotificationChannelManagerForUser2_Interface
      ; appServerKey : Windows.Storage.Streams.IBuffer
      ; channelId : Windows.String
      ; appId : Windows.String
      ; RetVal : access Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationChannel : aliased constant Windows.IID := (724045870, 61195, 20281, (155, 138, 163, 193, 148, 222, 112, 129 ));
   
   type IPushNotificationChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IPushNotificationChannel_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access IPushNotificationChannel_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IPushNotificationChannel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_PushNotificationReceived
   (
      This       : access IPushNotificationChannel_Interface
      ; handler : TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PushNotificationReceived
   (
      This       : access IPushNotificationChannel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationReceivedEventArgs : aliased constant Windows.IID := (3506855436, 14029, 18508, (185, 53, 10, 153, 183, 83, 207, 0 ));
   
   type IPushNotificationReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Cancel
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Cancel
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NotificationType
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.PushNotifications.PushNotificationType
   )
   return Windows.HRESULT is abstract;
   
   function get_ToastNotification
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_TileNotification
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_BadgeNotification
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.UI.Notifications.IBadgeNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_RawNotification
   (
      This       : access IPushNotificationReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.PushNotifications.IRawNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRawNotification : aliased constant Windows.IID := (438465153, 15225, 17068, (153, 99, 34, 171, 0, 212, 240, 183 ));
   
   type IRawNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IRawNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRawNotification2 : aliased constant Windows.IID := (3872444185, 3183, 19677, (148, 36, 238, 197, 190, 1, 77, 38 ));
   
   type IRawNotification2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Headers
   (
      This       : access IRawNotification2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelId
   (
      This       : access IRawNotification2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPushNotificationChannel : aliased constant Windows.IID := (1888770569, 13082, 24128, (184, 84, 102, 183, 163, 35, 59, 171 ));
   
   type IAsyncOperation_IPushNotificationChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPushNotificationChannel_Interface
      ; handler : Windows.Networking.PushNotifications.AsyncOperationCompletedHandler_IPushNotificationChannel
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPushNotificationChannel_Interface
      ; RetVal : access Windows.Networking.PushNotifications.AsyncOperationCompletedHandler_IPushNotificationChannel
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPushNotificationChannel_Interface
      ; RetVal : access Windows.Networking.PushNotifications.IPushNotificationChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPushNotificationChannel : aliased constant Windows.IID := (3481047087, 3853, 23330, (144, 177, 133, 20, 27, 88, 22, 205 ));
   
   type AsyncOperationCompletedHandler_IPushNotificationChannel_Interface(Callback : access procedure (asyncInfo : Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPushNotificationChannel'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPushNotificationChannel_Interface
      ; asyncInfo : Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived : aliased constant Windows.IID := (1442455933, 8131, 22627, (185, 128, 112, 148, 212, 55, 150, 148 ));
   
   type TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Interface(Callback : access procedure (sender : Windows.Networking.PushNotifications.IPushNotificationChannel ; args : Windows.Networking.PushNotifications.IPushNotificationReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Interface
      ; sender : Windows.Networking.PushNotifications.IPushNotificationChannel
      ; args : Windows.Networking.PushNotifications.IPushNotificationReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PushNotificationChannel is Windows.Networking.PushNotifications.IPushNotificationChannel;
   subtype PushNotificationChannelManagerForUser is Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser;
   subtype PushNotificationReceivedEventArgs is Windows.Networking.PushNotifications.IPushNotificationReceivedEventArgs;
   subtype RawNotification is Windows.Networking.PushNotifications.IRawNotification;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreatePushNotificationChannelForApplicationAsync
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   
   function CreatePushNotificationChannelForApplicationAsyncWithId
   (
      applicationId : Windows.String
   )
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   
   function CreatePushNotificationChannelForSecondaryTileAsync
   (
      tileId : Windows.String
   )
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser;
   
   function GetDefault
   return Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser;
   

end;
