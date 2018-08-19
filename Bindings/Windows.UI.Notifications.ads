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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
limited with Windows.ApplicationModel;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Data.Xml.Dom;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.UI.Notifications is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NotificationSetting is (
      Enabled,
      DisabledForApplication,
      DisabledForUser,
      DisabledByGroupPolicy,
      DisabledByManifest
   );
   for NotificationSetting use (
      Enabled => 0,
      DisabledForApplication => 1,
      DisabledForUser => 2,
      DisabledByGroupPolicy => 3,
      DisabledByManifest => 4
   );
   for NotificationSetting'Size use 32;
   
   type NotificationSetting_Ptr is access NotificationSetting;
   
   type ToastDismissalReason is (
      UserCanceled,
      ApplicationHidden,
      TimedOut
   );
   for ToastDismissalReason use (
      UserCanceled => 0,
      ApplicationHidden => 1,
      TimedOut => 2
   );
   for ToastDismissalReason'Size use 32;
   
   type ToastDismissalReason_Ptr is access ToastDismissalReason;
   
   type BadgeTemplateType is (
      BadgeGlyph,
      BadgeNumber
   );
   for BadgeTemplateType use (
      BadgeGlyph => 0,
      BadgeNumber => 1
   );
   for BadgeTemplateType'Size use 32;
   
   type BadgeTemplateType_Ptr is access BadgeTemplateType;
   
   type TileFlyoutTemplateType is (
      TileFlyoutTemplate01
   );
   for TileFlyoutTemplateType use (
      TileFlyoutTemplate01 => 0
   );
   for TileFlyoutTemplateType'Size use 32;
   
   type TileFlyoutTemplateType_Ptr is access TileFlyoutTemplateType;
   
   type TileTemplateType is (
      TileSquare150x150Image,
      TileSquare150x150Block,
      TileSquare150x150Text01,
      TileSquare150x150Text02,
      TileSquare150x150Text03,
      TileSquare150x150Text04,
      TileSquare150x150PeekImageAndText01,
      TileSquare150x150PeekImageAndText02,
      TileSquare150x150PeekImageAndText03,
      TileSquare150x150PeekImageAndText04,
      TileWide310x150Image,
      TileWide310x150ImageCollection,
      TileWide310x150ImageAndText01,
      TileWide310x150ImageAndText02,
      TileWide310x150BlockAndText01,
      TileWide310x150BlockAndText02,
      TileWide310x150PeekImageCollection01,
      TileWide310x150PeekImageCollection02,
      TileWide310x150PeekImageCollection03,
      TileWide310x150PeekImageCollection04,
      TileWide310x150PeekImageCollection05,
      TileWide310x150PeekImageCollection06,
      TileWide310x150PeekImageAndText01,
      TileWide310x150PeekImageAndText02,
      TileWide310x150PeekImage01,
      TileWide310x150PeekImage02,
      TileWide310x150PeekImage03,
      TileWide310x150PeekImage04,
      TileWide310x150PeekImage05,
      TileWide310x150PeekImage06,
      TileWide310x150SmallImageAndText01,
      TileWide310x150SmallImageAndText02,
      TileWide310x150SmallImageAndText03,
      TileWide310x150SmallImageAndText04,
      TileWide310x150SmallImageAndText05,
      TileWide310x150Text01,
      TileWide310x150Text02,
      TileWide310x150Text03,
      TileWide310x150Text04,
      TileWide310x150Text05,
      TileWide310x150Text06,
      TileWide310x150Text07,
      TileWide310x150Text08,
      TileWide310x150Text09,
      TileWide310x150Text10,
      TileWide310x150Text11,
      TileSquare310x310BlockAndText01,
      TileSquare310x310BlockAndText02,
      TileSquare310x310Image,
      TileSquare310x310ImageAndText01,
      TileSquare310x310ImageAndText02,
      TileSquare310x310ImageAndTextOverlay01,
      TileSquare310x310ImageAndTextOverlay02,
      TileSquare310x310ImageAndTextOverlay03,
      TileSquare310x310ImageCollectionAndText01,
      TileSquare310x310ImageCollectionAndText02,
      TileSquare310x310ImageCollection,
      TileSquare310x310SmallImagesAndTextList01,
      TileSquare310x310SmallImagesAndTextList02,
      TileSquare310x310SmallImagesAndTextList03,
      TileSquare310x310SmallImagesAndTextList04,
      TileSquare310x310Text01,
      TileSquare310x310Text02,
      TileSquare310x310Text03,
      TileSquare310x310Text04,
      TileSquare310x310Text05,
      TileSquare310x310Text06,
      TileSquare310x310Text07,
      TileSquare310x310Text08,
      TileSquare310x310TextList01,
      TileSquare310x310TextList02,
      TileSquare310x310TextList03,
      TileSquare310x310SmallImageAndText01,
      TileSquare310x310SmallImagesAndTextList05,
      TileSquare310x310Text09,
      TileSquare71x71IconWithBadge,
      TileSquare150x150IconWithBadge,
      TileWide310x150IconWithBadgeAndText,
      TileSquare71x71Image,
      TileTall150x310Image
   );
   for TileTemplateType use (
      TileSquare150x150Image => 0,
      TileSquare150x150Block => 1,
      TileSquare150x150Text01 => 2,
      TileSquare150x150Text02 => 3,
      TileSquare150x150Text03 => 4,
      TileSquare150x150Text04 => 5,
      TileSquare150x150PeekImageAndText01 => 6,
      TileSquare150x150PeekImageAndText02 => 7,
      TileSquare150x150PeekImageAndText03 => 8,
      TileSquare150x150PeekImageAndText04 => 9,
      TileWide310x150Image => 10,
      TileWide310x150ImageCollection => 11,
      TileWide310x150ImageAndText01 => 12,
      TileWide310x150ImageAndText02 => 13,
      TileWide310x150BlockAndText01 => 14,
      TileWide310x150BlockAndText02 => 15,
      TileWide310x150PeekImageCollection01 => 16,
      TileWide310x150PeekImageCollection02 => 17,
      TileWide310x150PeekImageCollection03 => 18,
      TileWide310x150PeekImageCollection04 => 19,
      TileWide310x150PeekImageCollection05 => 20,
      TileWide310x150PeekImageCollection06 => 21,
      TileWide310x150PeekImageAndText01 => 22,
      TileWide310x150PeekImageAndText02 => 23,
      TileWide310x150PeekImage01 => 24,
      TileWide310x150PeekImage02 => 25,
      TileWide310x150PeekImage03 => 26,
      TileWide310x150PeekImage04 => 27,
      TileWide310x150PeekImage05 => 28,
      TileWide310x150PeekImage06 => 29,
      TileWide310x150SmallImageAndText01 => 30,
      TileWide310x150SmallImageAndText02 => 31,
      TileWide310x150SmallImageAndText03 => 32,
      TileWide310x150SmallImageAndText04 => 33,
      TileWide310x150SmallImageAndText05 => 34,
      TileWide310x150Text01 => 35,
      TileWide310x150Text02 => 36,
      TileWide310x150Text03 => 37,
      TileWide310x150Text04 => 38,
      TileWide310x150Text05 => 39,
      TileWide310x150Text06 => 40,
      TileWide310x150Text07 => 41,
      TileWide310x150Text08 => 42,
      TileWide310x150Text09 => 43,
      TileWide310x150Text10 => 44,
      TileWide310x150Text11 => 45,
      TileSquare310x310BlockAndText01 => 46,
      TileSquare310x310BlockAndText02 => 47,
      TileSquare310x310Image => 48,
      TileSquare310x310ImageAndText01 => 49,
      TileSquare310x310ImageAndText02 => 50,
      TileSquare310x310ImageAndTextOverlay01 => 51,
      TileSquare310x310ImageAndTextOverlay02 => 52,
      TileSquare310x310ImageAndTextOverlay03 => 53,
      TileSquare310x310ImageCollectionAndText01 => 54,
      TileSquare310x310ImageCollectionAndText02 => 55,
      TileSquare310x310ImageCollection => 56,
      TileSquare310x310SmallImagesAndTextList01 => 57,
      TileSquare310x310SmallImagesAndTextList02 => 58,
      TileSquare310x310SmallImagesAndTextList03 => 59,
      TileSquare310x310SmallImagesAndTextList04 => 60,
      TileSquare310x310Text01 => 61,
      TileSquare310x310Text02 => 62,
      TileSquare310x310Text03 => 63,
      TileSquare310x310Text04 => 64,
      TileSquare310x310Text05 => 65,
      TileSquare310x310Text06 => 66,
      TileSquare310x310Text07 => 67,
      TileSquare310x310Text08 => 68,
      TileSquare310x310TextList01 => 69,
      TileSquare310x310TextList02 => 70,
      TileSquare310x310TextList03 => 71,
      TileSquare310x310SmallImageAndText01 => 72,
      TileSquare310x310SmallImagesAndTextList05 => 73,
      TileSquare310x310Text09 => 74,
      TileSquare71x71IconWithBadge => 75,
      TileSquare150x150IconWithBadge => 76,
      TileWide310x150IconWithBadgeAndText => 77,
      TileSquare71x71Image => 78,
      TileTall150x310Image => 79
   );
   for TileTemplateType'Size use 32;
   
   type TileTemplateType_Ptr is access TileTemplateType;
   
   type ToastTemplateType is (
      ToastImageAndText01,
      ToastImageAndText02,
      ToastImageAndText03,
      ToastImageAndText04,
      ToastText01,
      ToastText02,
      ToastText03,
      ToastText04
   );
   for ToastTemplateType use (
      ToastImageAndText01 => 0,
      ToastImageAndText02 => 1,
      ToastImageAndText03 => 2,
      ToastImageAndText04 => 3,
      ToastText01 => 4,
      ToastText02 => 5,
      ToastText03 => 6,
      ToastText04 => 7
   );
   for ToastTemplateType'Size use 32;
   
   type ToastTemplateType_Ptr is access ToastTemplateType;
   
   type PeriodicUpdateRecurrence is (
      HalfHour,
      Hour,
      SixHours,
      TwelveHours,
      Daily
   );
   for PeriodicUpdateRecurrence use (
      HalfHour => 0,
      Hour => 1,
      SixHours => 2,
      TwelveHours => 3,
      Daily => 4
   );
   for PeriodicUpdateRecurrence'Size use 32;
   
   type PeriodicUpdateRecurrence_Ptr is access PeriodicUpdateRecurrence;
   
   type ToastHistoryChangedType is (
      Cleared,
      Removed,
      Expired,
      Added
   );
   for ToastHistoryChangedType use (
      Cleared => 0,
      Removed => 1,
      Expired => 2,
      Added => 3
   );
   for ToastHistoryChangedType'Size use 32;
   
   type ToastHistoryChangedType_Ptr is access ToastHistoryChangedType;
   
   type AdaptiveNotificationContentKind is (
      Text
   );
   for AdaptiveNotificationContentKind use (
      Text => 0
   );
   for AdaptiveNotificationContentKind'Size use 32;
   
   type AdaptiveNotificationContentKind_Ptr is access AdaptiveNotificationContentKind;
   
   type NotificationMirroring is (
      Allowed,
      Disabled
   );
   for NotificationMirroring use (
      Allowed => 0,
      Disabled => 1
   );
   for NotificationMirroring'Size use 32;
   
   type NotificationMirroring_Ptr is access NotificationMirroring;
   
   type NotificationKinds is (
      Unknown,
      Toast
   );
   for NotificationKinds use (
      Unknown => 0,
      Toast => 1
   );
   for NotificationKinds'Size use 32;
   
   type NotificationKinds_Ptr is access NotificationKinds;
   
   type UserNotificationChangedKind is (
      Added,
      Removed
   );
   for UserNotificationChangedKind use (
      Added => 0,
      Removed => 1
   );
   for UserNotificationChangedKind'Size use 32;
   
   type UserNotificationChangedKind_Ptr is access UserNotificationChangedKind;
   
   type NotificationUpdateResult is (
      Succeeded,
      Failed,
      NotificationNotFound
   );
   for NotificationUpdateResult use (
      Succeeded => 0,
      Failed => 1,
      NotificationNotFound => 2
   );
   for NotificationUpdateResult'Size use 32;
   
   type NotificationUpdateResult_Ptr is access NotificationUpdateResult;
   
   type ToastNotificationPriority is (
      Default,
      High
   );
   for ToastNotificationPriority use (
      Default => 0,
      High => 1
   );
   for ToastNotificationPriority'Size use 32;
   
   type ToastNotificationPriority_Ptr is access ToastNotificationPriority;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IToastCollection_Interface;
   type AsyncOperationCompletedHandler_IToastCollection is access all AsyncOperationCompletedHandler_IToastCollection_Interface'Class;
   type AsyncOperationCompletedHandler_IToastCollection_Ptr is access all AsyncOperationCompletedHandler_IToastCollection;
   type TypedEventHandler_IToastNotification_add_Dismissed_Interface;
   type TypedEventHandler_IToastNotification_add_Dismissed is access all TypedEventHandler_IToastNotification_add_Dismissed_Interface'Class;
   type TypedEventHandler_IToastNotification_add_Dismissed_Ptr is access all TypedEventHandler_IToastNotification_add_Dismissed;
   type TypedEventHandler_IToastNotification_add_Activated_Interface;
   type TypedEventHandler_IToastNotification_add_Activated is access all TypedEventHandler_IToastNotification_add_Activated_Interface'Class;
   type TypedEventHandler_IToastNotification_add_Activated_Ptr is access all TypedEventHandler_IToastNotification_add_Activated;
   type TypedEventHandler_IToastNotification_add_Failed_Interface;
   type TypedEventHandler_IToastNotification_add_Failed is access all TypedEventHandler_IToastNotification_add_Failed_Interface'Class;
   type TypedEventHandler_IToastNotification_add_Failed_Ptr is access all TypedEventHandler_IToastNotification_add_Failed;
   type AsyncOperationCompletedHandler_IToastNotifier_Interface;
   type AsyncOperationCompletedHandler_IToastNotifier is access all AsyncOperationCompletedHandler_IToastNotifier_Interface'Class;
   type AsyncOperationCompletedHandler_IToastNotifier_Ptr is access all AsyncOperationCompletedHandler_IToastNotifier;
   type AsyncOperationCompletedHandler_IToastNotificationHistory_Interface;
   type AsyncOperationCompletedHandler_IToastNotificationHistory is access all AsyncOperationCompletedHandler_IToastNotificationHistory_Interface'Class;
   type AsyncOperationCompletedHandler_IToastNotificationHistory_Ptr is access all AsyncOperationCompletedHandler_IToastNotificationHistory;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IShownTileNotification_Interface;
   type IShownTileNotification is access all IShownTileNotification_Interface'Class;
   type IShownTileNotification_Ptr is access all IShownTileNotification;
   type IUserNotificationChangedEventArgs_Interface;
   type IUserNotificationChangedEventArgs is access all IUserNotificationChangedEventArgs_Interface'Class;
   type IUserNotificationChangedEventArgs_Ptr is access all IUserNotificationChangedEventArgs;
   type IUserNotification_Interface;
   type IUserNotification is access all IUserNotification_Interface'Class;
   type IUserNotification_Ptr is access all IUserNotification;
   type INotificationVisual_Interface;
   type INotificationVisual is access all INotificationVisual_Interface'Class;
   type INotificationVisual_Ptr is access all INotificationVisual;
   type IAdaptiveNotificationContent_Interface;
   type IAdaptiveNotificationContent is access all IAdaptiveNotificationContent_Interface'Class;
   type IAdaptiveNotificationContent_Ptr is access all IAdaptiveNotificationContent;
   type INotificationBinding_Interface;
   type INotificationBinding is access all INotificationBinding_Interface'Class;
   type INotificationBinding_Ptr is access all INotificationBinding;
   type IKnownNotificationBindingsStatics_Interface;
   type IKnownNotificationBindingsStatics is access all IKnownNotificationBindingsStatics_Interface'Class;
   type IKnownNotificationBindingsStatics_Ptr is access all IKnownNotificationBindingsStatics;
   type IKnownAdaptiveNotificationHintsStatics_Interface;
   type IKnownAdaptiveNotificationHintsStatics is access all IKnownAdaptiveNotificationHintsStatics_Interface'Class;
   type IKnownAdaptiveNotificationHintsStatics_Ptr is access all IKnownAdaptiveNotificationHintsStatics;
   type IKnownAdaptiveNotificationTextStylesStatics_Interface;
   type IKnownAdaptiveNotificationTextStylesStatics is access all IKnownAdaptiveNotificationTextStylesStatics_Interface'Class;
   type IKnownAdaptiveNotificationTextStylesStatics_Ptr is access all IKnownAdaptiveNotificationTextStylesStatics;
   type IAdaptiveNotificationText_Interface;
   type IAdaptiveNotificationText is access all IAdaptiveNotificationText_Interface'Class;
   type IAdaptiveNotificationText_Ptr is access all IAdaptiveNotificationText;
   type IToastDismissedEventArgs_Interface;
   type IToastDismissedEventArgs is access all IToastDismissedEventArgs_Interface'Class;
   type IToastDismissedEventArgs_Ptr is access all IToastDismissedEventArgs;
   type IToastFailedEventArgs_Interface;
   type IToastFailedEventArgs is access all IToastFailedEventArgs_Interface'Class;
   type IToastFailedEventArgs_Ptr is access all IToastFailedEventArgs;
   type IToastActivatedEventArgs_Interface;
   type IToastActivatedEventArgs is access all IToastActivatedEventArgs_Interface'Class;
   type IToastActivatedEventArgs_Ptr is access all IToastActivatedEventArgs;
   type ITileUpdateManagerStatics_Interface;
   type ITileUpdateManagerStatics is access all ITileUpdateManagerStatics_Interface'Class;
   type ITileUpdateManagerStatics_Ptr is access all ITileUpdateManagerStatics;
   type ITileUpdateManagerStatics2_Interface;
   type ITileUpdateManagerStatics2 is access all ITileUpdateManagerStatics2_Interface'Class;
   type ITileUpdateManagerStatics2_Ptr is access all ITileUpdateManagerStatics2;
   type ITileUpdateManagerForUser_Interface;
   type ITileUpdateManagerForUser is access all ITileUpdateManagerForUser_Interface'Class;
   type ITileUpdateManagerForUser_Ptr is access all ITileUpdateManagerForUser;
   type ITileUpdater_Interface;
   type ITileUpdater is access all ITileUpdater_Interface'Class;
   type ITileUpdater_Ptr is access all ITileUpdater;
   type ITileUpdater2_Interface;
   type ITileUpdater2 is access all ITileUpdater2_Interface'Class;
   type ITileUpdater2_Ptr is access all ITileUpdater2;
   type ITileFlyoutUpdateManagerStatics_Interface;
   type ITileFlyoutUpdateManagerStatics is access all ITileFlyoutUpdateManagerStatics_Interface'Class;
   type ITileFlyoutUpdateManagerStatics_Ptr is access all ITileFlyoutUpdateManagerStatics;
   type ITileFlyoutUpdater_Interface;
   type ITileFlyoutUpdater is access all ITileFlyoutUpdater_Interface'Class;
   type ITileFlyoutUpdater_Ptr is access all ITileFlyoutUpdater;
   type IBadgeUpdateManagerStatics_Interface;
   type IBadgeUpdateManagerStatics is access all IBadgeUpdateManagerStatics_Interface'Class;
   type IBadgeUpdateManagerStatics_Ptr is access all IBadgeUpdateManagerStatics;
   type IBadgeUpdateManagerStatics2_Interface;
   type IBadgeUpdateManagerStatics2 is access all IBadgeUpdateManagerStatics2_Interface'Class;
   type IBadgeUpdateManagerStatics2_Ptr is access all IBadgeUpdateManagerStatics2;
   type IBadgeUpdateManagerForUser_Interface;
   type IBadgeUpdateManagerForUser is access all IBadgeUpdateManagerForUser_Interface'Class;
   type IBadgeUpdateManagerForUser_Ptr is access all IBadgeUpdateManagerForUser;
   type IBadgeUpdater_Interface;
   type IBadgeUpdater is access all IBadgeUpdater_Interface'Class;
   type IBadgeUpdater_Ptr is access all IBadgeUpdater;
   type IToastNotificationManagerStatics_Interface;
   type IToastNotificationManagerStatics is access all IToastNotificationManagerStatics_Interface'Class;
   type IToastNotificationManagerStatics_Ptr is access all IToastNotificationManagerStatics;
   type IToastNotifier_Interface;
   type IToastNotifier is access all IToastNotifier_Interface'Class;
   type IToastNotifier_Ptr is access all IToastNotifier;
   type IToastNotifier2_Interface;
   type IToastNotifier2 is access all IToastNotifier2_Interface'Class;
   type IToastNotifier2_Ptr is access all IToastNotifier2;
   type IToastCollectionManager_Interface;
   type IToastCollectionManager is access all IToastCollectionManager_Interface'Class;
   type IToastCollectionManager_Ptr is access all IToastCollectionManager;
   type ITileNotificationFactory_Interface;
   type ITileNotificationFactory is access all ITileNotificationFactory_Interface'Class;
   type ITileNotificationFactory_Ptr is access all ITileNotificationFactory;
   type ITileNotification_Interface;
   type ITileNotification is access all ITileNotification_Interface'Class;
   type ITileNotification_Ptr is access all ITileNotification;
   type ITileFlyoutNotificationFactory_Interface;
   type ITileFlyoutNotificationFactory is access all ITileFlyoutNotificationFactory_Interface'Class;
   type ITileFlyoutNotificationFactory_Ptr is access all ITileFlyoutNotificationFactory;
   type ITileFlyoutNotification_Interface;
   type ITileFlyoutNotification is access all ITileFlyoutNotification_Interface'Class;
   type ITileFlyoutNotification_Ptr is access all ITileFlyoutNotification;
   type IBadgeNotificationFactory_Interface;
   type IBadgeNotificationFactory is access all IBadgeNotificationFactory_Interface'Class;
   type IBadgeNotificationFactory_Ptr is access all IBadgeNotificationFactory;
   type IBadgeNotification_Interface;
   type IBadgeNotification is access all IBadgeNotification_Interface'Class;
   type IBadgeNotification_Ptr is access all IBadgeNotification;
   type IToastNotificationFactory_Interface;
   type IToastNotificationFactory is access all IToastNotificationFactory_Interface'Class;
   type IToastNotificationFactory_Ptr is access all IToastNotificationFactory;
   type IToastNotification_Interface;
   type IToastNotification is access all IToastNotification_Interface'Class;
   type IToastNotification_Ptr is access all IToastNotification;
   type IToastNotification2_Interface;
   type IToastNotification2 is access all IToastNotification2_Interface'Class;
   type IToastNotification2_Ptr is access all IToastNotification2;
   type INotification_Interface;
   type INotification is access all INotification_Interface'Class;
   type INotification_Ptr is access all INotification;
   type IToastNotification3_Interface;
   type IToastNotification3 is access all IToastNotification3_Interface'Class;
   type IToastNotification3_Ptr is access all IToastNotification3;
   type IToastNotification4_Interface;
   type IToastNotification4 is access all IToastNotification4_Interface'Class;
   type IToastNotification4_Ptr is access all IToastNotification4;
   type IToastCollectionFactory_Interface;
   type IToastCollectionFactory is access all IToastCollectionFactory_Interface'Class;
   type IToastCollectionFactory_Ptr is access all IToastCollectionFactory;
   type INotificationDataFactory_Interface;
   type INotificationDataFactory is access all INotificationDataFactory_Interface'Class;
   type INotificationDataFactory_Ptr is access all INotificationDataFactory;
   type INotificationData_Interface;
   type INotificationData is access all INotificationData_Interface'Class;
   type INotificationData_Ptr is access all INotificationData;
   type IToastCollection_Interface;
   type IToastCollection is access all IToastCollection_Interface'Class;
   type IToastCollection_Ptr is access all IToastCollection;
   type IScheduledToastNotificationFactory_Interface;
   type IScheduledToastNotificationFactory is access all IScheduledToastNotificationFactory_Interface'Class;
   type IScheduledToastNotificationFactory_Ptr is access all IScheduledToastNotificationFactory;
   type IScheduledToastNotification_Interface;
   type IScheduledToastNotification is access all IScheduledToastNotification_Interface'Class;
   type IScheduledToastNotification_Ptr is access all IScheduledToastNotification;
   type IScheduledToastNotification2_Interface;
   type IScheduledToastNotification2 is access all IScheduledToastNotification2_Interface'Class;
   type IScheduledToastNotification2_Ptr is access all IScheduledToastNotification2;
   type IScheduledToastNotification3_Interface;
   type IScheduledToastNotification3 is access all IScheduledToastNotification3_Interface'Class;
   type IScheduledToastNotification3_Ptr is access all IScheduledToastNotification3;
   type IScheduledToastNotification4_Interface;
   type IScheduledToastNotification4 is access all IScheduledToastNotification4_Interface'Class;
   type IScheduledToastNotification4_Ptr is access all IScheduledToastNotification4;
   type IScheduledTileNotificationFactory_Interface;
   type IScheduledTileNotificationFactory is access all IScheduledTileNotificationFactory_Interface'Class;
   type IScheduledTileNotificationFactory_Ptr is access all IScheduledTileNotificationFactory;
   type IScheduledTileNotification_Interface;
   type IScheduledTileNotification is access all IScheduledTileNotification_Interface'Class;
   type IScheduledTileNotification_Ptr is access all IScheduledTileNotification;
   type IToastNotificationManagerStatics2_Interface;
   type IToastNotificationManagerStatics2 is access all IToastNotificationManagerStatics2_Interface'Class;
   type IToastNotificationManagerStatics2_Ptr is access all IToastNotificationManagerStatics2;
   type IToastNotificationManagerStatics4_Interface;
   type IToastNotificationManagerStatics4 is access all IToastNotificationManagerStatics4_Interface'Class;
   type IToastNotificationManagerStatics4_Ptr is access all IToastNotificationManagerStatics4;
   type IToastNotificationManagerStatics5_Interface;
   type IToastNotificationManagerStatics5 is access all IToastNotificationManagerStatics5_Interface'Class;
   type IToastNotificationManagerStatics5_Ptr is access all IToastNotificationManagerStatics5;
   type IToastNotificationManagerForUser_Interface;
   type IToastNotificationManagerForUser is access all IToastNotificationManagerForUser_Interface'Class;
   type IToastNotificationManagerForUser_Ptr is access all IToastNotificationManagerForUser;
   type IToastNotificationManagerForUser2_Interface;
   type IToastNotificationManagerForUser2 is access all IToastNotificationManagerForUser2_Interface'Class;
   type IToastNotificationManagerForUser2_Ptr is access all IToastNotificationManagerForUser2;
   type IToastNotificationHistory_Interface;
   type IToastNotificationHistory is access all IToastNotificationHistory_Interface'Class;
   type IToastNotificationHistory_Ptr is access all IToastNotificationHistory;
   type IToastNotificationHistory2_Interface;
   type IToastNotificationHistory2 is access all IToastNotificationHistory2_Interface'Class;
   type IToastNotificationHistory2_Ptr is access all IToastNotificationHistory2;
   type IToastNotificationHistoryChangedTriggerDetail_Interface;
   type IToastNotificationHistoryChangedTriggerDetail is access all IToastNotificationHistoryChangedTriggerDetail_Interface'Class;
   type IToastNotificationHistoryChangedTriggerDetail_Ptr is access all IToastNotificationHistoryChangedTriggerDetail;
   type IToastNotificationHistoryChangedTriggerDetail2_Interface;
   type IToastNotificationHistoryChangedTriggerDetail2 is access all IToastNotificationHistoryChangedTriggerDetail2_Interface'Class;
   type IToastNotificationHistoryChangedTriggerDetail2_Ptr is access all IToastNotificationHistoryChangedTriggerDetail2;
   type IToastNotificationActionTriggerDetail_Interface;
   type IToastNotificationActionTriggerDetail is access all IToastNotificationActionTriggerDetail_Interface'Class;
   type IToastNotificationActionTriggerDetail_Ptr is access all IToastNotificationActionTriggerDetail;
   type IIterator_IShownTileNotification_Interface;
   type IIterator_IShownTileNotification is access all IIterator_IShownTileNotification_Interface'Class;
   type IIterator_IShownTileNotification_Ptr is access all IIterator_IShownTileNotification;
   type IIterable_IShownTileNotification_Interface;
   type IIterable_IShownTileNotification is access all IIterable_IShownTileNotification_Interface'Class;
   type IIterable_IShownTileNotification_Ptr is access all IIterable_IShownTileNotification;
   type IVectorView_IShownTileNotification_Interface;
   type IVectorView_IShownTileNotification is access all IVectorView_IShownTileNotification_Interface'Class;
   type IVectorView_IShownTileNotification_Ptr is access all IVectorView_IShownTileNotification;
   type IIterator_INotificationBinding_Interface;
   type IIterator_INotificationBinding is access all IIterator_INotificationBinding_Interface'Class;
   type IIterator_INotificationBinding_Ptr is access all IIterator_INotificationBinding;
   type IIterable_INotificationBinding_Interface;
   type IIterable_INotificationBinding is access all IIterable_INotificationBinding_Interface'Class;
   type IIterable_INotificationBinding_Ptr is access all IIterable_INotificationBinding;
   type IVectorView_INotificationBinding_Interface;
   type IVectorView_INotificationBinding is access all IVectorView_INotificationBinding_Interface'Class;
   type IVectorView_INotificationBinding_Ptr is access all IVectorView_INotificationBinding;
   type IVector_INotificationBinding_Interface;
   type IVector_INotificationBinding is access all IVector_INotificationBinding_Interface'Class;
   type IVector_INotificationBinding_Ptr is access all IVector_INotificationBinding;
   type IIterator_IAdaptiveNotificationText_Interface;
   type IIterator_IAdaptiveNotificationText is access all IIterator_IAdaptiveNotificationText_Interface'Class;
   type IIterator_IAdaptiveNotificationText_Ptr is access all IIterator_IAdaptiveNotificationText;
   type IIterable_IAdaptiveNotificationText_Interface;
   type IIterable_IAdaptiveNotificationText is access all IIterable_IAdaptiveNotificationText_Interface'Class;
   type IIterable_IAdaptiveNotificationText_Ptr is access all IIterable_IAdaptiveNotificationText;
   type IVectorView_IAdaptiveNotificationText_Interface;
   type IVectorView_IAdaptiveNotificationText is access all IVectorView_IAdaptiveNotificationText_Interface'Class;
   type IVectorView_IAdaptiveNotificationText_Ptr is access all IVectorView_IAdaptiveNotificationText;
   type IIterator_IScheduledTileNotification_Interface;
   type IIterator_IScheduledTileNotification is access all IIterator_IScheduledTileNotification_Interface'Class;
   type IIterator_IScheduledTileNotification_Ptr is access all IIterator_IScheduledTileNotification;
   type IIterable_IScheduledTileNotification_Interface;
   type IIterable_IScheduledTileNotification is access all IIterable_IScheduledTileNotification_Interface'Class;
   type IIterable_IScheduledTileNotification_Ptr is access all IIterable_IScheduledTileNotification;
   type IVectorView_IScheduledTileNotification_Interface;
   type IVectorView_IScheduledTileNotification is access all IVectorView_IScheduledTileNotification_Interface'Class;
   type IVectorView_IScheduledTileNotification_Ptr is access all IVectorView_IScheduledTileNotification;
   type IIterator_IScheduledToastNotification_Interface;
   type IIterator_IScheduledToastNotification is access all IIterator_IScheduledToastNotification_Interface'Class;
   type IIterator_IScheduledToastNotification_Ptr is access all IIterator_IScheduledToastNotification;
   type IIterable_IScheduledToastNotification_Interface;
   type IIterable_IScheduledToastNotification is access all IIterable_IScheduledToastNotification_Interface'Class;
   type IIterable_IScheduledToastNotification_Ptr is access all IIterable_IScheduledToastNotification;
   type IVectorView_IScheduledToastNotification_Interface;
   type IVectorView_IScheduledToastNotification is access all IVectorView_IScheduledToastNotification_Interface'Class;
   type IVectorView_IScheduledToastNotification_Ptr is access all IVectorView_IScheduledToastNotification;
   type IAsyncOperation_IToastCollection_Interface;
   type IAsyncOperation_IToastCollection is access all IAsyncOperation_IToastCollection_Interface'Class;
   type IAsyncOperation_IToastCollection_Ptr is access all IAsyncOperation_IToastCollection;
   type IAsyncOperation_IToastNotifier_Interface;
   type IAsyncOperation_IToastNotifier is access all IAsyncOperation_IToastNotifier_Interface'Class;
   type IAsyncOperation_IToastNotifier_Ptr is access all IAsyncOperation_IToastNotifier;
   type IAsyncOperation_IToastNotificationHistory_Interface;
   type IAsyncOperation_IToastNotificationHistory is access all IAsyncOperation_IToastNotificationHistory_Interface'Class;
   type IAsyncOperation_IToastNotificationHistory_Ptr is access all IAsyncOperation_IToastNotificationHistory;
   type IIterator_IToastNotification_Interface;
   type IIterator_IToastNotification is access all IIterator_IToastNotification_Interface'Class;
   type IIterator_IToastNotification_Ptr is access all IIterator_IToastNotification;
   type IIterable_IToastNotification_Interface;
   type IIterable_IToastNotification is access all IIterable_IToastNotification_Interface'Class;
   type IIterable_IToastNotification_Ptr is access all IIterable_IToastNotification;
   type IVectorView_IToastNotification_Interface;
   type IVectorView_IToastNotification is access all IVectorView_IToastNotification_Interface'Class;
   type IVectorView_IToastNotification_Ptr is access all IVectorView_IToastNotification;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IShownTileNotification : aliased constant Windows.IID := (875399560, 23282, 18458, (166, 163, 242, 253, 199, 141, 232, 142 ));
   
   type IShownTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access IShownTileNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserNotificationChangedEventArgs : aliased constant Windows.IID := (3065866297, 31183, 19237, (130, 192, 12, 225, 238, 248, 31, 140 ));
   
   type IUserNotificationChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeKind
   (
      This       : access IUserNotificationChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Notifications.UserNotificationChangedKind
   )
   return Windows.HRESULT is abstract;
   
   function get_UserNotificationId
   (
      This       : access IUserNotificationChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserNotification : aliased constant Windows.IID := (2918704431, 20051, 17109, (156, 51, 235, 94, 165, 21, 178, 62 ));
   
   type IUserNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Notification
   (
      This       : access IUserNotification_Interface
      ; RetVal : access Windows.UI.Notifications.INotification
   )
   return Windows.HRESULT is abstract;
   
   function get_AppInfo
   (
      This       : access IUserNotification_Interface
      ; RetVal : access Windows.ApplicationModel.IAppInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IUserNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CreationTime
   (
      This       : access IUserNotification_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotificationVisual : aliased constant Windows.IID := (1753439118, 43606, 19985, (134, 211, 95, 154, 105, 87, 188, 91 ));
   
   type INotificationVisual_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Language
   (
      This       : access INotificationVisual_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access INotificationVisual_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bindings
   (
      This       : access INotificationVisual_Interface
      ; RetVal : access Windows.UI.Notifications.IVector_INotificationBinding -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBinding
   (
      This       : access INotificationVisual_Interface
      ; templateName : Windows.String
      ; RetVal : access Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveNotificationContent : aliased constant Windows.IID := (3943546470, 29768, 17549, (157, 184, 215, 138, 205, 42, 187, 169 ));
   
   type IAdaptiveNotificationContent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IAdaptiveNotificationContent_Interface
      ; RetVal : access Windows.UI.Notifications.AdaptiveNotificationContentKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Hints
   (
      This       : access IAdaptiveNotificationContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotificationBinding : aliased constant Windows.IID := (4070460293, 880, 19155, (180, 234, 218, 158, 53, 231, 234, 191 ));
   
   type INotificationBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Template
   (
      This       : access INotificationBinding_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Template
   (
      This       : access INotificationBinding_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access INotificationBinding_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access INotificationBinding_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hints
   (
      This       : access INotificationBinding_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTextElements
   (
      This       : access INotificationBinding_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_IAdaptiveNotificationText -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownNotificationBindingsStatics : aliased constant Windows.IID := (2034400174, 43191, 19800, (137, 234, 118, 167, 183, 188, 205, 237 ));
   
   type IKnownNotificationBindingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ToastGeneric
   (
      This       : access IKnownNotificationBindingsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownAdaptiveNotificationHintsStatics : aliased constant Windows.IID := (102786456, 54422, 18813, (134, 146, 79, 125, 124, 39, 112, 223 ));
   
   type IKnownAdaptiveNotificationHintsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Style
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wrap
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLines
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MinLines
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TextStacking
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Align
   (
      This       : access IKnownAdaptiveNotificationHintsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownAdaptiveNotificationTextStylesStatics : aliased constant Windows.IID := (539071191, 35222, 17834, (139, 161, 212, 97, 215, 44, 42, 27 ));
   
   type IKnownAdaptiveNotificationTextStylesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Caption
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Base
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subheader
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Header
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleNumeral
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubheaderNumeral
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderNumeral
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CaptionSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BodySubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubtitleSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubheaderSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubheaderNumeralSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderNumeralSubtle
   (
      This       : access IKnownAdaptiveNotificationTextStylesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveNotificationText : aliased constant Windows.IID := (1188340670, 24730, 17190, (164, 11, 191, 222, 135, 32, 52, 163 ));
   
   type IAdaptiveNotificationText_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IAdaptiveNotificationText_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access IAdaptiveNotificationText_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastDismissedEventArgs : aliased constant Windows.IID := (1065998645, 55755, 17720, (160, 240, 255, 231, 101, 153, 56, 248 ));
   
   type IToastDismissedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IToastDismissedEventArgs_Interface
      ; RetVal : access Windows.UI.Notifications.ToastDismissalReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastFailedEventArgs : aliased constant Windows.IID := (890726498, 53204, 17656, (173, 100, 245, 0, 253, 137, 108, 59 ));
   
   type IToastFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorCode
   (
      This       : access IToastFailedEventArgs_Interface
      ; RetVal : access Windows.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastActivatedEventArgs : aliased constant Windows.IID := (3820983027, 49559, 17263, (130, 101, 6, 37, 130, 79, 141, 172 ));
   
   type IToastActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access IToastActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileUpdateManagerStatics : aliased constant Windows.IID := (3658849885, 16041, 18822, (141, 132, 176, 157, 94, 18, 39, 109 ));
   
   type ITileUpdateManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTileUpdaterForApplication
   (
      This       : access ITileUpdateManagerStatics_Interface
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileUpdaterForApplicationWithId
   (
      This       : access ITileUpdateManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileUpdaterForSecondaryTile
   (
      This       : access ITileUpdateManagerStatics_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function GetTemplateContent
   (
      This       : access ITileUpdateManagerStatics_Interface
      ; type_x : Windows.UI.Notifications.TileTemplateType
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileUpdateManagerStatics2 : aliased constant Windows.IID := (1931222492, 36372, 19324, (163, 75, 157, 34, 222, 118, 200, 77 ));
   
   type ITileUpdateManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access ITileUpdateManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.UI.Notifications.ITileUpdateManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileUpdateManagerForUser : aliased constant Windows.IID := (1427379016, 12002, 20013, (156, 193, 33, 106, 32, 222, 204, 159 ));
   
   type ITileUpdateManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTileUpdaterForApplication
   (
      This       : access ITileUpdateManagerForUser_Interface
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileUpdaterForApplicationWithId
   (
      This       : access ITileUpdateManagerForUser_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileUpdaterForSecondaryTile
   (
      This       : access ITileUpdateManagerForUser_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileUpdater
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access ITileUpdateManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileUpdater : aliased constant Windows.IID := (155362443, 7569, 17644, (146, 67, 193, 232, 33, 194, 154, 32 ));
   
   type ITileUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function Update
   (
      This       : access ITileUpdater_Interface
      ; notification : Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access ITileUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function EnableNotificationQueue
   (
      This       : access ITileUpdater_Interface
      ; enable : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Setting
   (
      This       : access ITileUpdater_Interface
      ; RetVal : access Windows.UI.Notifications.NotificationSetting
   )
   return Windows.HRESULT is abstract;
   
   function AddToSchedule
   (
      This       : access ITileUpdater_Interface
      ; scheduledTile : Windows.UI.Notifications.IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFromSchedule
   (
      This       : access ITileUpdater_Interface
      ; scheduledTile : Windows.UI.Notifications.IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function GetScheduledTileNotifications
   (
      This       : access ITileUpdater_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_IScheduledTileNotification -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdate
   (
      This       : access ITileUpdater_Interface
      ; tileContent : Windows.Foundation.IUriRuntimeClass
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdateAtTime
   (
      This       : access ITileUpdater_Interface
      ; tileContent : Windows.Foundation.IUriRuntimeClass
      ; startTime : Windows.Foundation.DateTime
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StopPeriodicUpdate
   (
      This       : access ITileUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdateBatch
   (
      This       : access ITileUpdater_Interface
      ; tileContents : Windows.Foundation.IIterable_IUriRuntimeClass
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdateBatchAtTime
   (
      This       : access ITileUpdater_Interface
      ; tileContents : Windows.Foundation.IIterable_IUriRuntimeClass
      ; startTime : Windows.Foundation.DateTime
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileUpdater2 : aliased constant Windows.IID := (2720427538, 5614, 17389, (131, 245, 101, 179, 82, 187, 26, 132 ));
   
   type ITileUpdater2_Interface is interface and Windows.IInspectable_Interface;
   
   function EnableNotificationQueueForSquare150x150
   (
      This       : access ITileUpdater2_Interface
      ; enable : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnableNotificationQueueForWide310x150
   (
      This       : access ITileUpdater2_Interface
      ; enable : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnableNotificationQueueForSquare310x310
   (
      This       : access ITileUpdater2_Interface
      ; enable : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileFlyoutUpdateManagerStatics : aliased constant Windows.IID := (70662923, 6848, 19353, (136, 231, 173, 168, 62, 149, 61, 72 ));
   
   type ITileFlyoutUpdateManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTileFlyoutUpdaterForApplication
   (
      This       : access ITileFlyoutUpdateManagerStatics_Interface
      ; RetVal : access Windows.UI.Notifications.ITileFlyoutUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileFlyoutUpdaterForApplicationWithId
   (
      This       : access ITileFlyoutUpdateManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileFlyoutUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateTileFlyoutUpdaterForSecondaryTile
   (
      This       : access ITileFlyoutUpdateManagerStatics_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.Notifications.ITileFlyoutUpdater
   )
   return Windows.HRESULT is abstract;
   
   function GetTemplateContent
   (
      This       : access ITileFlyoutUpdateManagerStatics_Interface
      ; type_x : Windows.UI.Notifications.TileFlyoutTemplateType
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileFlyoutUpdater : aliased constant Windows.IID := (2369832810, 50277, 16466, (167, 64, 92, 38, 84, 193, 160, 137 ));
   
   type ITileFlyoutUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function Update
   (
      This       : access ITileFlyoutUpdater_Interface
      ; notification : Windows.UI.Notifications.ITileFlyoutNotification
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access ITileFlyoutUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdate
   (
      This       : access ITileFlyoutUpdater_Interface
      ; tileFlyoutContent : Windows.Foundation.IUriRuntimeClass
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdateAtTime
   (
      This       : access ITileFlyoutUpdater_Interface
      ; tileFlyoutContent : Windows.Foundation.IUriRuntimeClass
      ; startTime : Windows.Foundation.DateTime
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StopPeriodicUpdate
   (
      This       : access ITileFlyoutUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Setting
   (
      This       : access ITileFlyoutUpdater_Interface
      ; RetVal : access Windows.UI.Notifications.NotificationSetting
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeUpdateManagerStatics : aliased constant Windows.IID := (859836330, 28117, 16645, (174, 188, 155, 80, 252, 164, 146, 218 ));
   
   type IBadgeUpdateManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateBadgeUpdaterForApplication
   (
      This       : access IBadgeUpdateManagerStatics_Interface
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateBadgeUpdaterForApplicationWithId
   (
      This       : access IBadgeUpdateManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateBadgeUpdaterForSecondaryTile
   (
      This       : access IBadgeUpdateManagerStatics_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function GetTemplateContent
   (
      This       : access IBadgeUpdateManagerStatics_Interface
      ; type_x : Windows.UI.Notifications.BadgeTemplateType
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeUpdateManagerStatics2 : aliased constant Windows.IID := (2543465934, 63808, 18623, (148, 232, 202, 36, 77, 64, 11, 65 ));
   
   type IBadgeUpdateManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IBadgeUpdateManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdateManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeUpdateManagerForUser : aliased constant Windows.IID := (2573935036, 902, 17637, (186, 141, 12, 16, 119, 166, 46, 146 ));
   
   type IBadgeUpdateManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateBadgeUpdaterForApplication
   (
      This       : access IBadgeUpdateManagerForUser_Interface
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateBadgeUpdaterForApplicationWithId
   (
      This       : access IBadgeUpdateManagerForUser_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function CreateBadgeUpdaterForSecondaryTile
   (
      This       : access IBadgeUpdateManagerForUser_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IBadgeUpdater
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IBadgeUpdateManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeUpdater : aliased constant Windows.IID := (3053068244, 30050, 20332, (191, 163, 27, 110, 210, 229, 127, 47 ));
   
   type IBadgeUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function Update
   (
      This       : access IBadgeUpdater_Interface
      ; notification : Windows.UI.Notifications.IBadgeNotification
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IBadgeUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdate
   (
      This       : access IBadgeUpdater_Interface
      ; badgeContent : Windows.Foundation.IUriRuntimeClass
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StartPeriodicUpdateAtTime
   (
      This       : access IBadgeUpdater_Interface
      ; badgeContent : Windows.Foundation.IUriRuntimeClass
      ; startTime : Windows.Foundation.DateTime
      ; requestedInterval : Windows.UI.Notifications.PeriodicUpdateRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function StopPeriodicUpdate
   (
      This       : access IBadgeUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerStatics : aliased constant Windows.IID := (1353453631, 53813, 17816, (187, 239, 152, 254, 77, 26, 58, 212 ));
   
   type IToastNotificationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateToastNotifier
   (
      This       : access IToastNotificationManagerStatics_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function CreateToastNotifierWithId
   (
      This       : access IToastNotificationManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function GetTemplateContent
   (
      This       : access IToastNotificationManagerStatics_Interface
      ; type_x : Windows.UI.Notifications.ToastTemplateType
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotifier : aliased constant Windows.IID := (1972534163, 1011, 16876, (145, 211, 110, 91, 172, 27, 56, 231 ));
   
   type IToastNotifier_Interface is interface and Windows.IInspectable_Interface;
   
   function Show
   (
      This       : access IToastNotifier_Interface
      ; notification : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function Hide
   (
      This       : access IToastNotifier_Interface
      ; notification : Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_Setting
   (
      This       : access IToastNotifier_Interface
      ; RetVal : access Windows.UI.Notifications.NotificationSetting
   )
   return Windows.HRESULT is abstract;
   
   function AddToSchedule
   (
      This       : access IToastNotifier_Interface
      ; scheduledToast : Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFromSchedule
   (
      This       : access IToastNotifier_Interface
      ; scheduledToast : Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function GetScheduledToastNotifications
   (
      This       : access IToastNotifier_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_IScheduledToastNotification -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotifier2 : aliased constant Windows.IID := (893618630, 31745, 19413, (156, 32, 96, 67, 64, 205, 43, 116 ));
   
   type IToastNotifier2_Interface is interface and Windows.IInspectable_Interface;
   
   function UpdateWithTagAndGroup
   (
      This       : access IToastNotifier2_Interface
      ; data : Windows.UI.Notifications.INotificationData
      ; tag : Windows.String
      ; group : Windows.String
      ; RetVal : access Windows.UI.Notifications.NotificationUpdateResult
   )
   return Windows.HRESULT is abstract;
   
   function UpdateWithTag
   (
      This       : access IToastNotifier2_Interface
      ; data : Windows.UI.Notifications.INotificationData
      ; tag : Windows.String
      ; RetVal : access Windows.UI.Notifications.NotificationUpdateResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastCollectionManager : aliased constant Windows.IID := (706224638, 6045, 18876, (183, 157, 165, 39, 146, 13, 54, 101 ));
   
   type IToastCollectionManager_Interface is interface and Windows.IInspectable_Interface;
   
   function SaveToastCollectionAsync
   (
      This       : access IToastCollectionManager_Interface
      ; collection : Windows.UI.Notifications.IToastCollection
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FindAllToastCollectionsAsync
   (
      This       : access IToastCollectionManager_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetToastCollectionAsync
   (
      This       : access IToastCollectionManager_Interface
      ; collectionId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IAsyncOperation_IToastCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemoveToastCollectionAsync
   (
      This       : access IToastCollectionManager_Interface
      ; collectionId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAllToastCollectionsAsync
   (
      This       : access IToastCollectionManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IToastCollectionManager_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access IToastCollectionManager_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileNotificationFactory : aliased constant Windows.IID := (3333152110, 18728, 18120, (189, 191, 129, 160, 71, 222, 160, 212 ));
   
   type ITileNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTileNotification
   (
      This       : access ITileNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; RetVal : access Windows.UI.Notifications.ITileNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileNotification : aliased constant Windows.IID := (3954100474, 20716, 19480, (180, 208, 58, 240, 46, 85, 64, 171 ));
   
   type ITileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access ITileNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access ITileNotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access ITileNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access ITileNotification_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access ITileNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileFlyoutNotificationFactory : aliased constant Windows.IID := (4015353845, 21030, 20267, (178, 120, 136, 163, 93, 254, 86, 159 ));
   
   type ITileFlyoutNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTileFlyoutNotification
   (
      This       : access ITileFlyoutNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; RetVal : access Windows.UI.Notifications.ITileFlyoutNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileFlyoutNotification : aliased constant Windows.IID := (2589176417, 50956, 17086, (178, 243, 244, 42, 169, 125, 52, 229 ));
   
   type ITileFlyoutNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access ITileFlyoutNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access ITileFlyoutNotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access ITileFlyoutNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeNotificationFactory : aliased constant Windows.IID := (3992081870, 1560, 19801, (148, 138, 90, 97, 4, 12, 82, 249 ));
   
   type IBadgeNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateBadgeNotification
   (
      This       : access IBadgeNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; RetVal : access Windows.UI.Notifications.IBadgeNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBadgeNotification : aliased constant Windows.IID := (123516106, 53386, 20015, (146, 51, 126, 40, 156, 31, 119, 34 ));
   
   type IBadgeNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IBadgeNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access IBadgeNotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access IBadgeNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationFactory : aliased constant Windows.IID := (68307744, 33478, 16937, (177, 9, 253, 158, 212, 102, 43, 83 ));
   
   type IToastNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateToastNotification
   (
      This       : access IToastNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotification : aliased constant Windows.IID := (2575181429, 1438, 20064, (139, 6, 23, 96, 145, 124, 139, 128 ));
   
   type IToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IToastNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access IToastNotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access IToastNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_Dismissed
   (
      This       : access IToastNotification_Interface
      ; handler : TypedEventHandler_IToastNotification_add_Dismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Dismissed
   (
      This       : access IToastNotification_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Activated
   (
      This       : access IToastNotification_Interface
      ; handler : TypedEventHandler_IToastNotification_add_Activated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Activated
   (
      This       : access IToastNotification_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Failed
   (
      This       : access IToastNotification_Interface
      ; handler : TypedEventHandler_IToastNotification_add_Failed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Failed
   (
      This       : access IToastNotification_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotification2 : aliased constant Windows.IID := (2650513361, 5178, 18702, (144, 191, 185, 251, 167, 19, 45, 231 ));
   
   type IToastNotification2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Tag
   (
      This       : access IToastNotification2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IToastNotification2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Group
   (
      This       : access IToastNotification2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Group
   (
      This       : access IToastNotification2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SuppressPopup
   (
      This       : access IToastNotification2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SuppressPopup
   (
      This       : access IToastNotification2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotification : aliased constant Windows.IID := (276838398, 60278, 20354, (151, 188, 218, 7, 83, 10, 46, 32 ));
   
   type INotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpirationTime
   (
      This       : access INotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access INotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Visual
   (
      This       : access INotification_Interface
      ; RetVal : access Windows.UI.Notifications.INotificationVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_Visual
   (
      This       : access INotification_Interface
      ; value : Windows.UI.Notifications.INotificationVisual
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotification3 : aliased constant Windows.IID := (837332696, 33089, 20377, (188, 10, 196, 237, 33, 41, 125, 119 ));
   
   type IToastNotification3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NotificationMirroring
   (
      This       : access IToastNotification3_Interface
      ; RetVal : access Windows.UI.Notifications.NotificationMirroring
   )
   return Windows.HRESULT is abstract;
   
   function put_NotificationMirroring
   (
      This       : access IToastNotification3_Interface
      ; value : Windows.UI.Notifications.NotificationMirroring
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IToastNotification3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IToastNotification3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotification4 : aliased constant Windows.IID := (353716533, 10474, 18215, (136, 233, 197, 134, 128, 226, 209, 24 ));
   
   type IToastNotification4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IToastNotification4_Interface
      ; RetVal : access Windows.UI.Notifications.INotificationData
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IToastNotification4_Interface
      ; value : Windows.UI.Notifications.INotificationData
   )
   return Windows.HRESULT is abstract;
   
   function get_Priority
   (
      This       : access IToastNotification4_Interface
      ; RetVal : access Windows.UI.Notifications.ToastNotificationPriority
   )
   return Windows.HRESULT is abstract;
   
   function put_Priority
   (
      This       : access IToastNotification4_Interface
      ; value : Windows.UI.Notifications.ToastNotificationPriority
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastCollectionFactory : aliased constant Windows.IID := (374199255, 29636, 17655, (180, 255, 251, 109, 75, 241, 244, 198 ));
   
   type IToastCollectionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IToastCollectionFactory_Interface
      ; collectionId : Windows.String
      ; displayName : Windows.String
      ; launchArgs : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.Notifications.IToastCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotificationDataFactory : aliased constant Windows.IID := (599909178, 7184, 18171, (128, 64, 222, 195, 132, 98, 28, 248 ));
   
   type INotificationDataFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateNotificationDataWithValuesAndSequenceNumber
   (
      This       : access INotificationDataFactory_Interface
      ; initialValues : Windows.Address
      ; sequenceNumber : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.INotificationData
   )
   return Windows.HRESULT is abstract;
   
   function CreateNotificationDataWithValues
   (
      This       : access INotificationDataFactory_Interface
      ; initialValues : Windows.Address
      ; RetVal : access Windows.UI.Notifications.INotificationData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotificationData : aliased constant Windows.IID := (2684166930, 40298, 19119, (182, 172, 255, 23, 240, 193, 242, 128 ));
   
   type INotificationData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Values
   (
      This       : access INotificationData_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SequenceNumber
   (
      This       : access INotificationData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_SequenceNumber
   (
      This       : access INotificationData_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastCollection : aliased constant Windows.IID := (176931760, 57534, 18520, (188, 42, 137, 223, 224, 179, 40, 99 ));
   
   type IToastCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IToastCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IToastCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IToastCollection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LaunchArgs
   (
      This       : access IToastCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LaunchArgs
   (
      This       : access IToastCollection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Icon
   (
      This       : access IToastCollection_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Icon
   (
      This       : access IToastCollection_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledToastNotificationFactory : aliased constant Windows.IID := (3888042385, 3001, 16777, (131, 148, 49, 118, 27, 71, 111, 215 ));
   
   type IScheduledToastNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateScheduledToastNotification
   (
      This       : access IScheduledToastNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function CreateScheduledToastNotificationRecurring
   (
      This       : access IScheduledToastNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
      ; snoozeInterval : Windows.Foundation.TimeSpan
      ; maximumSnoozeCount : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledToastNotification : aliased constant Windows.IID := (2046130168, 3559, 18637, (151, 64, 155, 55, 4, 144, 200, 56 ));
   
   type IScheduledToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IScheduledToastNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function get_DeliveryTime
   (
      This       : access IScheduledToastNotification_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_SnoozeInterval
   (
      This       : access IScheduledToastNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaximumSnoozeCount
   (
      This       : access IScheduledToastNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IScheduledToastNotification_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IScheduledToastNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledToastNotification2 : aliased constant Windows.IID := (2792267932, 12724, 17328, (181, 221, 122, 64, 232, 83, 99, 177 ));
   
   type IScheduledToastNotification2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Tag
   (
      This       : access IScheduledToastNotification2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IScheduledToastNotification2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Group
   (
      This       : access IScheduledToastNotification2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Group
   (
      This       : access IScheduledToastNotification2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SuppressPopup
   (
      This       : access IScheduledToastNotification2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SuppressPopup
   (
      This       : access IScheduledToastNotification2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledToastNotification3 : aliased constant Windows.IID := (2554502795, 48434, 19003, (157, 21, 34, 174, 164, 148, 98, 161 ));
   
   type IScheduledToastNotification3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NotificationMirroring
   (
      This       : access IScheduledToastNotification3_Interface
      ; RetVal : access Windows.UI.Notifications.NotificationMirroring
   )
   return Windows.HRESULT is abstract;
   
   function put_NotificationMirroring
   (
      This       : access IScheduledToastNotification3_Interface
      ; value : Windows.UI.Notifications.NotificationMirroring
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IScheduledToastNotification3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IScheduledToastNotification3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledToastNotification4 : aliased constant Windows.IID := (491217405, 48623, 20042, (150, 190, 1, 1, 54, 155, 88, 210 ));
   
   type IScheduledToastNotification4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpirationTime
   (
      This       : access IScheduledToastNotification4_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access IScheduledToastNotification4_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledTileNotificationFactory : aliased constant Windows.IID := (864228234, 39104, 19515, (187, 214, 74, 99, 60, 124, 252, 41 ));
   
   type IScheduledTileNotificationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateScheduledTileNotification
   (
      This       : access IScheduledTileNotificationFactory_Interface
      ; content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.UI.Notifications.IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScheduledTileNotification : aliased constant Windows.IID := (180135637, 39388, 19576, (161, 28, 201, 231, 248, 109, 126, 247 ));
   
   type IScheduledTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IScheduledTileNotification_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function get_DeliveryTime
   (
      This       : access IScheduledTileNotification_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationTime
   (
      This       : access IScheduledTileNotification_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationTime
   (
      This       : access IScheduledTileNotification_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IScheduledTileNotification_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IScheduledTileNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IScheduledTileNotification_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IScheduledTileNotification_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerStatics2 : aliased constant Windows.IID := (2058959954, 3656, 18256, (186, 157, 26, 65, 19, 152, 24, 71 ));
   
   type IToastNotificationManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_History
   (
      This       : access IToastNotificationManagerStatics2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotificationHistory
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerStatics4 : aliased constant Windows.IID := (2409185235, 58646, 17915, (129, 48, 57, 142, 147, 250, 82, 195 ));
   
   type IToastNotificationManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IToastNotificationManagerStatics4_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.UI.Notifications.IToastNotificationManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureNotificationMirroring
   (
      This       : access IToastNotificationManagerStatics4_Interface
      ; value : Windows.UI.Notifications.NotificationMirroring
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerStatics5 : aliased constant Windows.IID := (3606443369, 54285, 16508, (137, 137, 136, 202, 180, 44, 253, 20 ));
   
   type IToastNotificationManagerStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IToastNotificationManagerStatics5_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotificationManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerForUser : aliased constant Windows.IID := (2041272310, 17406, 18555, (138, 127, 153, 86, 114, 0, 174, 148 ));
   
   type IToastNotificationManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateToastNotifier
   (
      This       : access IToastNotificationManagerForUser_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function CreateToastNotifierWithId
   (
      This       : access IToastNotificationManagerForUser_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function get_History
   (
      This       : access IToastNotificationManagerForUser_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotificationHistory
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IToastNotificationManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationManagerForUser2 : aliased constant Windows.IID := (1738302647, 33195, 17090, (136, 25, 201, 88, 118, 119, 83, 244 ));
   
   type IToastNotificationManagerForUser2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetToastNotifierForToastCollectionIdAsync
   (
      This       : access IToastNotificationManagerForUser2_Interface
      ; collectionId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IAsyncOperation_IToastNotifier -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetHistoryForToastCollectionIdAsync
   (
      This       : access IToastNotificationManagerForUser2_Interface
      ; collectionId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IAsyncOperation_IToastNotificationHistory -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetToastCollectionManager
   (
      This       : access IToastNotificationManagerForUser2_Interface
      ; RetVal : access Windows.UI.Notifications.IToastCollectionManager
   )
   return Windows.HRESULT is abstract;
   
   function GetToastCollectionManagerWithAppId
   (
      This       : access IToastNotificationManagerForUser2_Interface
      ; appId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IToastCollectionManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationHistory : aliased constant Windows.IID := (1554898019, 467, 19607, (152, 111, 5, 51, 72, 63, 238, 20 ));
   
   type IToastNotificationHistory_Interface is interface and Windows.IInspectable_Interface;
   
   function RemoveGroup
   (
      This       : access IToastNotificationHistory_Interface
      ; group : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveGroupWithId
   (
      This       : access IToastNotificationHistory_Interface
      ; group : Windows.String
      ; applicationId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveGroupedTagWithId
   (
      This       : access IToastNotificationHistory_Interface
      ; tag : Windows.String
      ; group : Windows.String
      ; applicationId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveGroupedTag
   (
      This       : access IToastNotificationHistory_Interface
      ; tag : Windows.String
      ; group : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IToastNotificationHistory_Interface
      ; tag : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IToastNotificationHistory_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ClearWithId
   (
      This       : access IToastNotificationHistory_Interface
      ; applicationId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationHistory2 : aliased constant Windows.IID := (1002689107, 12081, 16530, (145, 41, 138, 213, 171, 240, 103, 218 ));
   
   type IToastNotificationHistory2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetHistory
   (
      This       : access IToastNotificationHistory2_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_IToastNotification -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetHistoryWithId
   (
      This       : access IToastNotificationHistory2_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.UI.Notifications.IVectorView_IToastNotification -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationHistoryChangedTriggerDetail : aliased constant Windows.IID := (3674439674, 104, 16684, (156, 131, 38, 124, 55, 246, 86, 112 ));
   
   type IToastNotificationHistoryChangedTriggerDetail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeType
   (
      This       : access IToastNotificationHistoryChangedTriggerDetail_Interface
      ; RetVal : access Windows.UI.Notifications.ToastHistoryChangedType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationHistoryChangedTriggerDetail2 : aliased constant Windows.IID := (188148098, 51313, 18939, (186, 187, 37, 189, 188, 76, 196, 91 ));
   
   type IToastNotificationHistoryChangedTriggerDetail2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollectionId
   (
      This       : access IToastNotificationHistoryChangedTriggerDetail2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationActionTriggerDetail : aliased constant Windows.IID := (2487554906, 14579, 17142, (150, 170, 121, 85, 176, 240, 61, 162 ));
   
   type IToastNotificationActionTriggerDetail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Argument
   (
      This       : access IToastNotificationActionTriggerDetail_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserInput
   (
      This       : access IToastNotificationActionTriggerDetail_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IShownTileNotification : aliased constant Windows.IID := (81319691, 31765, 24416, (152, 148, 178, 19, 102, 180, 39, 194 ));
   
   type IIterator_IShownTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IShownTileNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IShownTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IShownTileNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IShownTileNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IShownTileNotification_Interface
      ; items : Windows.UI.Notifications.IShownTileNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IShownTileNotification : aliased constant Windows.IID := (409189102, 17649, 24145, (188, 223, 163, 205, 171, 130, 106, 21 ));
   
   type IIterable_IShownTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IShownTileNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_IShownTileNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IShownTileNotification : aliased constant Windows.IID := (723761833, 7508, 21568, (189, 50, 134, 237, 112, 241, 92, 158 ));
   
   type IVectorView_IShownTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IShownTileNotification_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IShownTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IShownTileNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IShownTileNotification_Interface
      ; value : Windows.UI.Notifications.IShownTileNotification
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IShownTileNotification_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.IShownTileNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_INotificationBinding : aliased constant Windows.IID := (1712881494, 40673, 23624, (130, 218, 108, 185, 221, 248, 121, 231 ));
   
   type IIterator_INotificationBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_INotificationBinding_Interface
      ; RetVal : access Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_INotificationBinding_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_INotificationBinding_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_INotificationBinding_Interface
      ; items : Windows.UI.Notifications.INotificationBinding_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_INotificationBinding : aliased constant Windows.IID := (3906554012, 25438, 20819, (138, 183, 56, 159, 46, 233, 250, 202 ));
   
   type IIterable_INotificationBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_INotificationBinding_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_INotificationBinding : aliased constant Windows.IID := (2655846976, 27996, 22570, (162, 157, 115, 78, 132, 117, 7, 56 ));
   
   type IVectorView_INotificationBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_INotificationBinding_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_INotificationBinding_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_INotificationBinding_Interface
      ; value : Windows.UI.Notifications.INotificationBinding
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_INotificationBinding_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.INotificationBinding_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_INotificationBinding : aliased constant Windows.IID := (2138933975, 46290, 23043, (190, 111, 43, 137, 135, 95, 179, 45 ));
   
   type IVector_INotificationBinding_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_INotificationBinding_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_INotificationBinding_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_INotificationBinding_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_INotificationBinding_Interface
      ; value : Windows.UI.Notifications.INotificationBinding
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_INotificationBinding_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_INotificationBinding_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_INotificationBinding_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_INotificationBinding_Interface
      ; value : Windows.UI.Notifications.INotificationBinding
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_INotificationBinding_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_INotificationBinding_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_INotificationBinding_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.INotificationBinding_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_INotificationBinding_Interface
      ; items : Windows.UI.Notifications.INotificationBinding_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAdaptiveNotificationText : aliased constant Windows.IID := (402742698, 52163, 23121, (159, 75, 60, 6, 145, 53, 176, 224 ));
   
   type IIterator_IAdaptiveNotificationText_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.UI.Notifications.IAdaptiveNotificationText
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAdaptiveNotificationText_Interface
      ; items : Windows.UI.Notifications.IAdaptiveNotificationText_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAdaptiveNotificationText : aliased constant Windows.IID := (54782194, 51788, 24384, (184, 209, 63, 244, 112, 71, 206, 67 ));
   
   type IIterable_IAdaptiveNotificationText_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_IAdaptiveNotificationText
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAdaptiveNotificationText : aliased constant Windows.IID := (3054364971, 19986, 21935, (180, 47, 175, 226, 215, 11, 162, 120 ));
   
   type IVectorView_IAdaptiveNotificationText_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAdaptiveNotificationText_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IAdaptiveNotificationText
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAdaptiveNotificationText_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAdaptiveNotificationText_Interface
      ; value : Windows.UI.Notifications.IAdaptiveNotificationText
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAdaptiveNotificationText_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.IAdaptiveNotificationText_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IScheduledTileNotification : aliased constant Windows.IID := (1449518225, 25923, 20534, (147, 95, 181, 21, 121, 80, 179, 89 ));
   
   type IIterator_IScheduledTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IScheduledTileNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IScheduledTileNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IScheduledTileNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IScheduledTileNotification_Interface
      ; items : Windows.UI.Notifications.IScheduledTileNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IScheduledTileNotification : aliased constant Windows.IID := (1264636389, 21166, 22374, (151, 32, 190, 74, 208, 134, 249, 82 ));
   
   type IIterable_IScheduledTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IScheduledTileNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IScheduledTileNotification : aliased constant Windows.IID := (1332911204, 41491, 21225, (175, 139, 88, 173, 202, 62, 89, 127 ));
   
   type IVectorView_IScheduledTileNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IScheduledTileNotification_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IScheduledTileNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IScheduledTileNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IScheduledTileNotification_Interface
      ; value : Windows.UI.Notifications.IScheduledTileNotification
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IScheduledTileNotification_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.IScheduledTileNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IScheduledToastNotification : aliased constant Windows.IID := (809646262, 34954, 24018, (150, 205, 191, 202, 137, 39, 72, 59 ));
   
   type IIterator_IScheduledToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IScheduledToastNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IScheduledToastNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IScheduledToastNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IScheduledToastNotification_Interface
      ; items : Windows.UI.Notifications.IScheduledToastNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IScheduledToastNotification : aliased constant Windows.IID := (2054892113, 49538, 22598, (168, 97, 79, 156, 3, 111, 36, 173 ));
   
   type IIterable_IScheduledToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IScheduledToastNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IScheduledToastNotification : aliased constant Windows.IID := (3121282847, 27274, 23166, (169, 247, 80, 91, 98, 102, 164, 54 ));
   
   type IVectorView_IScheduledToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IScheduledToastNotification_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IScheduledToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IScheduledToastNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IScheduledToastNotification_Interface
      ; value : Windows.UI.Notifications.IScheduledToastNotification
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IScheduledToastNotification_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.IScheduledToastNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IToastCollection : aliased constant Windows.IID := (2467359815, 40714, 22937, (128, 194, 75, 49, 233, 247, 126, 142 ));
   
   type IAsyncOperation_IToastCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IToastCollection_Interface
      ; handler : Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IToastCollection_Interface
      ; RetVal : access Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastCollection
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IToastCollection_Interface
      ; RetVal : access Windows.UI.Notifications.IToastCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IToastNotifier : aliased constant Windows.IID := (769507598, 14566, 22101, (173, 243, 130, 14, 143, 177, 77, 204 ));
   
   type IAsyncOperation_IToastNotifier_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IToastNotifier_Interface
      ; handler : Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IToastNotifier_Interface
      ; RetVal : access Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IToastNotifier_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IToastNotificationHistory : aliased constant Windows.IID := (706936523, 19350, 21791, (183, 185, 167, 181, 190, 236, 173, 5 ));
   
   type IAsyncOperation_IToastNotificationHistory_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IToastNotificationHistory_Interface
      ; handler : Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastNotificationHistory
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IToastNotificationHistory_Interface
      ; RetVal : access Windows.UI.Notifications.AsyncOperationCompletedHandler_IToastNotificationHistory
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IToastNotificationHistory_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotificationHistory
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IToastNotification : aliased constant Windows.IID := (4263408234, 15017, 23960, (177, 155, 151, 227, 225, 126, 236, 123 ));
   
   type IIterator_IToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IToastNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IToastNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IToastNotification_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IToastNotification_Interface
      ; items : Windows.UI.Notifications.IToastNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IToastNotification : aliased constant Windows.IID := (1388921483, 54138, 21837, (191, 85, 184, 104, 93, 95, 85, 45 ));
   
   type IIterable_IToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IToastNotification_Interface
      ; RetVal : access Windows.UI.Notifications.IIterator_IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IToastNotification : aliased constant Windows.IID := (2820273118, 24746, 20825, (132, 7, 240, 167, 251, 31, 104, 50 ));
   
   type IVectorView_IToastNotification_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IToastNotification_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Notifications.IToastNotification
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IToastNotification_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IToastNotification_Interface
      ; value : Windows.UI.Notifications.IToastNotification
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IToastNotification_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Notifications.IToastNotification_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IToastCollection : aliased constant Windows.IID := (2370095646, 5591, 23499, (176, 2, 56, 76, 135, 23, 28, 116 ));
   
   type AsyncOperationCompletedHandler_IToastCollection_Interface(Callback : access procedure (asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastCollection ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IToastCollection'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IToastCollection_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastCollection
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IToastNotification_add_Dismissed : aliased constant Windows.IID := (1640120367, 3792, 23064, (171, 105, 89, 244, 170, 153, 163, 104 ));
   
   type TypedEventHandler_IToastNotification_add_Dismissed_Interface(Callback : access procedure (sender : Windows.UI.Notifications.IToastNotification ; args : Windows.UI.Notifications.IToastDismissedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IToastNotification_add_Dismissed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IToastNotification_add_Dismissed_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.UI.Notifications.IToastDismissedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IToastNotification_add_Activated : aliased constant Windows.IID := (2874465837, 38873, 21800, (182, 173, 16, 90, 254, 21, 101, 48 ));
   
   type TypedEventHandler_IToastNotification_add_Activated_Interface(Callback : access procedure (sender : Windows.UI.Notifications.IToastNotification ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IToastNotification_add_Activated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IToastNotification_add_Activated_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IToastNotification_add_Failed : aliased constant Windows.IID := (2514741251, 51561, 24122, (151, 83, 234, 42, 210, 42, 154, 51 ));
   
   type TypedEventHandler_IToastNotification_add_Failed_Interface(Callback : access procedure (sender : Windows.UI.Notifications.IToastNotification ; args : Windows.UI.Notifications.IToastFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IToastNotification_add_Failed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IToastNotification_add_Failed_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.UI.Notifications.IToastFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IToastNotifier : aliased constant Windows.IID := (4259475159, 48183, 23164, (179, 218, 62, 65, 172, 151, 187, 164 ));
   
   type AsyncOperationCompletedHandler_IToastNotifier_Interface(Callback : access procedure (asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotifier ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IToastNotifier'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IToastNotifier_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotifier
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IToastNotificationHistory : aliased constant Windows.IID := (3328300506, 26466, 23955, (145, 56, 231, 218, 205, 87, 16, 86 ));
   
   type AsyncOperationCompletedHandler_IToastNotificationHistory_Interface(Callback : access procedure (asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotificationHistory ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IToastNotificationHistory'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IToastNotificationHistory_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotificationHistory
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ShownTileNotification is Windows.UI.Notifications.IShownTileNotification;
   subtype Notification is Windows.UI.Notifications.INotification;
   function Create return Windows.UI.Notifications.INotification;
   
   subtype NotificationBinding is Windows.UI.Notifications.INotificationBinding;
   subtype AdaptiveNotificationText is Windows.UI.Notifications.IAdaptiveNotificationText;
   function Create return Windows.UI.Notifications.IAdaptiveNotificationText;
   
   subtype TileUpdater is Windows.UI.Notifications.ITileUpdater;
   subtype TileUpdateManagerForUser is Windows.UI.Notifications.ITileUpdateManagerForUser;
   subtype TileNotification is Windows.UI.Notifications.ITileNotification;
   function CreateTileNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.ITileNotification;
   
   subtype ScheduledTileNotification is Windows.UI.Notifications.IScheduledTileNotification;
   function CreateScheduledTileNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
   )
   return Windows.UI.Notifications.IScheduledTileNotification;
   
   subtype TileFlyoutUpdater is Windows.UI.Notifications.ITileFlyoutUpdater;
   subtype TileFlyoutNotification is Windows.UI.Notifications.ITileFlyoutNotification;
   function CreateTileFlyoutNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.ITileFlyoutNotification;
   
   subtype BadgeUpdater is Windows.UI.Notifications.IBadgeUpdater;
   subtype BadgeUpdateManagerForUser is Windows.UI.Notifications.IBadgeUpdateManagerForUser;
   subtype BadgeNotification is Windows.UI.Notifications.IBadgeNotification;
   function CreateBadgeNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.IBadgeNotification;
   
   subtype ToastNotifier is Windows.UI.Notifications.IToastNotifier;
   subtype ToastNotification is Windows.UI.Notifications.IToastNotification;
   function CreateToastNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.IToastNotification;
   
   subtype ScheduledToastNotification is Windows.UI.Notifications.IScheduledToastNotification;
   function CreateScheduledToastNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
   )
   return Windows.UI.Notifications.IScheduledToastNotification;
   
   function CreateScheduledToastNotificationRecurring
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
      ; snoozeInterval : Windows.Foundation.TimeSpan
      ; maximumSnoozeCount : Windows.UInt32
   )
   return Windows.UI.Notifications.IScheduledToastNotification;
   
   subtype NotificationData is Windows.UI.Notifications.INotificationData;
   function Create return Windows.UI.Notifications.INotificationData;
   
   function CreateNotificationDataWithValuesAndSequenceNumber
   (
      initialValues : Windows.Address
      ; sequenceNumber : Windows.UInt32
   )
   return Windows.UI.Notifications.INotificationData;
   
   function CreateNotificationDataWithValues
   (
      initialValues : Windows.Address
   )
   return Windows.UI.Notifications.INotificationData;
   
   subtype ToastCollection is Windows.UI.Notifications.IToastCollection;
   function CreateInstance
   (
      collectionId : Windows.String
      ; displayName : Windows.String
      ; launchArgs : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Notifications.IToastCollection;
   
   subtype ToastDismissedEventArgs is Windows.UI.Notifications.IToastDismissedEventArgs;
   subtype ToastFailedEventArgs is Windows.UI.Notifications.IToastFailedEventArgs;
   subtype NotificationVisual is Windows.UI.Notifications.INotificationVisual;
   subtype ToastNotificationHistory is Windows.UI.Notifications.IToastNotificationHistory;
   subtype ToastNotificationManagerForUser is Windows.UI.Notifications.IToastNotificationManagerForUser;
   subtype ToastCollectionManager is Windows.UI.Notifications.IToastCollectionManager;
   subtype UserNotificationChangedEventArgs is Windows.UI.Notifications.IUserNotificationChangedEventArgs;
   subtype UserNotification is Windows.UI.Notifications.IUserNotification;
   subtype ToastActivatedEventArgs is Windows.UI.Notifications.IToastActivatedEventArgs;
   subtype ToastNotificationHistoryChangedTriggerDetail is Windows.UI.Notifications.IToastNotificationHistoryChangedTriggerDetail;
   subtype ToastNotificationActionTriggerDetail is Windows.UI.Notifications.IToastNotificationActionTriggerDetail;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Style
   return Windows.String;
   
   function get_Wrap
   return Windows.String;
   
   function get_MaxLines
   return Windows.String;
   
   function get_MinLines
   return Windows.String;
   
   function get_TextStacking
   return Windows.String;
   
   function get_Align
   return Windows.String;
   
   function get_ToastGeneric
   return Windows.String;
   
   function get_Caption
   return Windows.String;
   
   function get_Body
   return Windows.String;
   
   function get_Base
   return Windows.String;
   
   function get_Subtitle
   return Windows.String;
   
   function get_Title
   return Windows.String;
   
   function get_Subheader
   return Windows.String;
   
   function get_Header
   return Windows.String;
   
   function get_TitleNumeral
   return Windows.String;
   
   function get_SubheaderNumeral
   return Windows.String;
   
   function get_HeaderNumeral
   return Windows.String;
   
   function get_CaptionSubtle
   return Windows.String;
   
   function get_BodySubtle
   return Windows.String;
   
   function get_BaseSubtle
   return Windows.String;
   
   function get_SubtitleSubtle
   return Windows.String;
   
   function get_TitleSubtle
   return Windows.String;
   
   function get_SubheaderSubtle
   return Windows.String;
   
   function get_SubheaderNumeralSubtle
   return Windows.String;
   
   function get_HeaderSubtle
   return Windows.String;
   
   function get_HeaderNumeralSubtle
   return Windows.String;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.ITileUpdateManagerForUser;
   
   function CreateTileUpdaterForApplication
   return Windows.UI.Notifications.ITileUpdater;
   
   function CreateTileUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.ITileUpdater;
   
   function CreateTileUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.ITileUpdater;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.TileTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.IBadgeUpdateManagerForUser;
   
   function CreateBadgeUpdaterForApplication
   return Windows.UI.Notifications.IBadgeUpdater;
   
   function CreateBadgeUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.IBadgeUpdater;
   
   function CreateBadgeUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.IBadgeUpdater;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.BadgeTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument;
   
   function CreateTileFlyoutUpdaterForApplication
   return Windows.UI.Notifications.ITileFlyoutUpdater;
   
   function CreateTileFlyoutUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.ITileFlyoutUpdater;
   
   function CreateTileFlyoutUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.ITileFlyoutUpdater;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.TileFlyoutTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument;
   
   function GetDefault
   return Windows.UI.Notifications.IToastNotificationManagerForUser;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.IToastNotificationManagerForUser;
   
   procedure ConfigureNotificationMirroring
   (
      value : Windows.UI.Notifications.NotificationMirroring
   )
   ;
   
   function CreateToastNotifier
   return Windows.UI.Notifications.IToastNotifier;
   
   function CreateToastNotifierWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.IToastNotifier;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.ToastTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument;
   
   function get_History
   return Windows.UI.Notifications.IToastNotificationHistory;
   
end;
