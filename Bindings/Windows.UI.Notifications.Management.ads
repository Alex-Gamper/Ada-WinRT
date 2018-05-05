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
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.UI.Notifications.Management is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UserNotificationListenerAccessStatus is (
      Unspecified,
      Allowed,
      Denied
   );
   for UserNotificationListenerAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      Denied => 2
   );
   for UserNotificationListenerAccessStatus'Size use 32;
   
   type UserNotificationListenerAccessStatus_Ptr is access UserNotificationListenerAccessStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus_Interface;
   type AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus is access all AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus_Ptr is access all AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus;
   type TypedEventHandler_IUserNotificationListener_add_NotificationChanged_Interface;
   type TypedEventHandler_IUserNotificationListener_add_NotificationChanged is access all TypedEventHandler_IUserNotificationListener_add_NotificationChanged_Interface'Class;
   type TypedEventHandler_IUserNotificationListener_add_NotificationChanged_Ptr is access all TypedEventHandler_IUserNotificationListener_add_NotificationChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserNotificationListenerStatics_Interface;
   type IUserNotificationListenerStatics is access all IUserNotificationListenerStatics_Interface'Class;
   type IUserNotificationListenerStatics_Ptr is access all IUserNotificationListenerStatics;
   type IUserNotificationListener_Interface;
   type IUserNotificationListener is access all IUserNotificationListener_Interface'Class;
   type IUserNotificationListener_Ptr is access all IUserNotificationListener;
   type IAsyncOperation_UserNotificationListenerAccessStatus_Interface;
   type IAsyncOperation_UserNotificationListenerAccessStatus is access all IAsyncOperation_UserNotificationListenerAccessStatus_Interface'Class;
   type IAsyncOperation_UserNotificationListenerAccessStatus_Ptr is access all IAsyncOperation_UserNotificationListenerAccessStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IUserNotificationListenerStatics : aliased constant Windows.IID := (4284556239, 17286, 19107, (183, 61, 184, 4, 229, 182, 59, 35 ));
   
   type IUserNotificationListenerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IUserNotificationListenerStatics_Interface
      ; RetVal : access Windows.UI.Notifications.Management.IUserNotificationListener
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserNotificationListener : aliased constant Windows.IID := (1649753665, 35334, 19695, (130, 21, 96, 51, 165, 190, 75, 3 ));
   
   type IUserNotificationListener_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IUserNotificationListener_Interface
      ; RetVal : access Windows.UI.Notifications.Management.IAsyncOperation_UserNotificationListenerAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessStatus
   (
      This       : access IUserNotificationListener_Interface
      ; RetVal : access Windows.UI.Notifications.Management.UserNotificationListenerAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_NotificationChanged
   (
      This       : access IUserNotificationListener_Interface
      ; handler : TypedEventHandler_IUserNotificationListener_add_NotificationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NotificationChanged
   (
      This       : access IUserNotificationListener_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetNotificationsAsync
   (
      This       : access IUserNotificationListener_Interface
      ; kinds : Windows.UI.Notifications.NotificationKinds
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetNotification
   (
      This       : access IUserNotificationListener_Interface
      ; notificationId : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IUserNotification
   )
   return Windows.HRESULT is abstract;
   
   function ClearNotifications
   (
      This       : access IUserNotificationListener_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveNotification
   (
      This       : access IUserNotificationListener_Interface
      ; notificationId : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_UserNotificationListenerAccessStatus : aliased constant Windows.IID := (263903431, 2159, 23545, (129, 226, 141, 121, 231, 24, 72, 3 ));
   
   type IAsyncOperation_UserNotificationListenerAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UserNotificationListenerAccessStatus_Interface
      ; handler : Windows.UI.Notifications.Management.AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UserNotificationListenerAccessStatus_Interface
      ; RetVal : access Windows.UI.Notifications.Management.AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UserNotificationListenerAccessStatus_Interface
      ; RetVal : access Windows.UI.Notifications.Management.UserNotificationListenerAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus : aliased constant Windows.IID := (4036920378, 5067, 21915, (169, 252, 1, 87, 34, 194, 205, 87 ));
   
   type AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.UI.Notifications.Management.IAsyncOperation_UserNotificationListenerAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UserNotificationListenerAccessStatus_Interface
      ; asyncInfo : Windows.UI.Notifications.Management.IAsyncOperation_UserNotificationListenerAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserNotificationListener_add_NotificationChanged : aliased constant Windows.IID := (270805250, 47255, 21767, (153, 34, 44, 10, 125, 52, 70, 77 ));
   
   type TypedEventHandler_IUserNotificationListener_add_NotificationChanged_Interface(Callback : access procedure (sender : Windows.UI.Notifications.Management.IUserNotificationListener ; args : Windows.UI.Notifications.IUserNotificationChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserNotificationListener_add_NotificationChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserNotificationListener_add_NotificationChanged_Interface
      ; sender : Windows.UI.Notifications.Management.IUserNotificationListener
      ; args : Windows.UI.Notifications.IUserNotificationChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserNotificationListener is Windows.UI.Notifications.Management.IUserNotificationListener;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Current
   return Windows.UI.Notifications.Management.IUserNotificationListener;
   
end;
