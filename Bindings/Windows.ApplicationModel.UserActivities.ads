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
with Windows.Foundation;
limited with Windows.UI;
limited with Windows.UI.Shell;
with Windows.Foundation.Collections;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.UserActivities is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UserActivityState is (
      New_x,
      Published
   );
   for UserActivityState use (
      New_x => 0,
      Published => 1
   );
   for UserActivityState'Size use 32;
   
   type UserActivityState_Ptr is access UserActivityState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUserActivity_Interface;
   type AsyncOperationCompletedHandler_IUserActivity is access all AsyncOperationCompletedHandler_IUserActivity_Interface'Class;
   type AsyncOperationCompletedHandler_IUserActivity_Ptr is access all AsyncOperationCompletedHandler_IUserActivity;
   type TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Interface;
   type TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested is access all TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Interface'Class;
   type TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Ptr is access all TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserActivityAttributionFactory_Interface;
   type IUserActivityAttributionFactory is access all IUserActivityAttributionFactory_Interface'Class;
   type IUserActivityAttributionFactory_Ptr is access all IUserActivityAttributionFactory;
   type IUserActivityAttribution_Interface;
   type IUserActivityAttribution is access all IUserActivityAttribution_Interface'Class;
   type IUserActivityAttribution_Ptr is access all IUserActivityAttribution;
   type IUserActivityContentInfo_Interface;
   type IUserActivityContentInfo is access all IUserActivityContentInfo_Interface'Class;
   type IUserActivityContentInfo_Ptr is access all IUserActivityContentInfo;
   type IUserActivityContentInfoStatics_Interface;
   type IUserActivityContentInfoStatics is access all IUserActivityContentInfoStatics_Interface'Class;
   type IUserActivityContentInfoStatics_Ptr is access all IUserActivityContentInfoStatics;
   type IUserActivityVisualElements_Interface;
   type IUserActivityVisualElements is access all IUserActivityVisualElements_Interface'Class;
   type IUserActivityVisualElements_Ptr is access all IUserActivityVisualElements;
   type IUserActivityVisualElements2_Interface;
   type IUserActivityVisualElements2 is access all IUserActivityVisualElements2_Interface'Class;
   type IUserActivityVisualElements2_Ptr is access all IUserActivityVisualElements2;
   type IUserActivitySession_Interface;
   type IUserActivitySession is access all IUserActivitySession_Interface'Class;
   type IUserActivitySession_Ptr is access all IUserActivitySession;
   type IUserActivity_Interface;
   type IUserActivity is access all IUserActivity_Interface'Class;
   type IUserActivity_Ptr is access all IUserActivity;
   type IUserActivity2_Interface;
   type IUserActivity2 is access all IUserActivity2_Interface'Class;
   type IUserActivity2_Ptr is access all IUserActivity2;
   type IUserActivityStatics_Interface;
   type IUserActivityStatics is access all IUserActivityStatics_Interface'Class;
   type IUserActivityStatics_Ptr is access all IUserActivityStatics;
   type IUserActivityFactory_Interface;
   type IUserActivityFactory is access all IUserActivityFactory_Interface'Class;
   type IUserActivityFactory_Ptr is access all IUserActivityFactory;
   type IUserActivityChannelStatics_Interface;
   type IUserActivityChannelStatics is access all IUserActivityChannelStatics_Interface'Class;
   type IUserActivityChannelStatics_Ptr is access all IUserActivityChannelStatics;
   type IUserActivityChannelStatics2_Interface;
   type IUserActivityChannelStatics2 is access all IUserActivityChannelStatics2_Interface'Class;
   type IUserActivityChannelStatics2_Ptr is access all IUserActivityChannelStatics2;
   type IUserActivityChannel2_Interface;
   type IUserActivityChannel2 is access all IUserActivityChannel2_Interface'Class;
   type IUserActivityChannel2_Ptr is access all IUserActivityChannel2;
   type IUserActivityChannel_Interface;
   type IUserActivityChannel is access all IUserActivityChannel_Interface'Class;
   type IUserActivityChannel_Ptr is access all IUserActivityChannel;
   type IUserActivitySessionHistoryItem_Interface;
   type IUserActivitySessionHistoryItem is access all IUserActivitySessionHistoryItem_Interface'Class;
   type IUserActivitySessionHistoryItem_Ptr is access all IUserActivitySessionHistoryItem;
   type IUserActivityRequestedEventArgs_Interface;
   type IUserActivityRequestedEventArgs is access all IUserActivityRequestedEventArgs_Interface'Class;
   type IUserActivityRequestedEventArgs_Ptr is access all IUserActivityRequestedEventArgs;
   type IUserActivityRequest_Interface;
   type IUserActivityRequest is access all IUserActivityRequest_Interface'Class;
   type IUserActivityRequest_Ptr is access all IUserActivityRequest;
   type IUserActivityRequestManager_Interface;
   type IUserActivityRequestManager is access all IUserActivityRequestManager_Interface'Class;
   type IUserActivityRequestManager_Ptr is access all IUserActivityRequestManager;
   type IUserActivityRequestManagerStatics_Interface;
   type IUserActivityRequestManagerStatics is access all IUserActivityRequestManagerStatics_Interface'Class;
   type IUserActivityRequestManagerStatics_Ptr is access all IUserActivityRequestManagerStatics;
   type IIterator_IUserActivity_Interface;
   type IIterator_IUserActivity is access all IIterator_IUserActivity_Interface'Class;
   type IIterator_IUserActivity_Ptr is access all IIterator_IUserActivity;
   type IIterable_IUserActivity_Interface;
   type IIterable_IUserActivity is access all IIterable_IUserActivity_Interface'Class;
   type IIterable_IUserActivity_Ptr is access all IIterable_IUserActivity;
   type IVectorView_IUserActivity_Interface;
   type IVectorView_IUserActivity is access all IVectorView_IUserActivity_Interface'Class;
   type IVectorView_IUserActivity_Ptr is access all IVectorView_IUserActivity;
   type IVector_IUserActivity_Interface;
   type IVector_IUserActivity is access all IVector_IUserActivity_Interface'Class;
   type IVector_IUserActivity_Ptr is access all IVector_IUserActivity;
   type IAsyncOperation_IUserActivity_Interface;
   type IAsyncOperation_IUserActivity is access all IAsyncOperation_IUserActivity_Interface'Class;
   type IAsyncOperation_IUserActivity_Ptr is access all IAsyncOperation_IUserActivity;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityAttributionFactory : aliased constant Windows.IID := (3861631570, 50534, 20290, (153, 116, 145, 108, 77, 118, 55, 126 ));
   
   type IUserActivityAttributionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithUri
   (
      This       : access IUserActivityAttributionFactory_Interface
      ; iconUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityAttribution
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityAttribution : aliased constant Windows.IID := (883280053, 34525, 19180, (164, 145, 106, 79, 174, 165, 210, 46 ));
   
   type IUserActivityAttribution_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IconUri
   (
      This       : access IUserActivityAttribution_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_IconUri
   (
      This       : access IUserActivityAttribution_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateText
   (
      This       : access IUserActivityAttribution_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AlternateText
   (
      This       : access IUserActivityAttribution_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AddImageQuery
   (
      This       : access IUserActivityAttribution_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AddImageQuery
   (
      This       : access IUserActivityAttribution_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityContentInfo : aliased constant Windows.IID := (3013207469, 4991, 16541, (130, 45, 225, 175, 39, 206, 8, 220 ));
   
   type IUserActivityContentInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function ToJson
   (
      This       : access IUserActivityContentInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityContentInfoStatics : aliased constant Windows.IID := (2575876939, 902, 19401, (150, 138, 130, 0, 176, 4, 20, 79 ));
   
   type IUserActivityContentInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromJson
   (
      This       : access IUserActivityContentInfoStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityContentInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityVisualElements : aliased constant Windows.IID := (2490725651, 9775, 18927, (187, 191, 155, 117, 210, 232, 82, 80 ));
   
   type IUserActivityVisualElements_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayText
   (
      This       : access IUserActivityVisualElements_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayText
   (
      This       : access IUserActivityVisualElements_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IUserActivityVisualElements_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IUserActivityVisualElements_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IUserActivityVisualElements_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IUserActivityVisualElements_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Attribution
   (
      This       : access IUserActivityVisualElements_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityAttribution
   )
   return Windows.HRESULT is abstract;
   
   function put_Attribution
   (
      This       : access IUserActivityVisualElements_Interface
      ; value : Windows.ApplicationModel.UserActivities.IUserActivityAttribution
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IUserActivityVisualElements_Interface
      ; value : Windows.UI.Shell.IAdaptiveCard
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access IUserActivityVisualElements_Interface
      ; RetVal : access Windows.UI.Shell.IAdaptiveCard
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityVisualElements2 : aliased constant Windows.IID := (3400433607, 16111, 17241, (130, 92, 157, 81, 185, 34, 13, 227 ));
   
   type IUserActivityVisualElements2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AttributionDisplayText
   (
      This       : access IUserActivityVisualElements2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AttributionDisplayText
   (
      This       : access IUserActivityVisualElements2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivitySession : aliased constant Windows.IID := (2923646328, 9466, 17571, (173, 72, 110, 218, 97, 170, 25, 36 ));
   
   type IUserActivitySession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IUserActivitySession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivity : aliased constant Windows.IID := (4228923038, 11435, 19766, (174, 162, 180, 187, 85, 108, 239, 15 ));
   
   type IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.UserActivityState
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivityId
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VisualElements
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityVisualElements
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentUri
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentUri
   (
      This       : access IUserActivity_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentType
   (
      This       : access IUserActivity_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FallbackUri
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_FallbackUri
   (
      This       : access IUserActivity_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivationUri
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ActivationUri
   (
      This       : access IUserActivity_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentInfo
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityContentInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentInfo
   (
      This       : access IUserActivity_Interface
      ; value : Windows.ApplicationModel.UserActivities.IUserActivityContentInfo
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CreateSession
   (
      This       : access IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivitySession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivity2 : aliased constant Windows.IID := (2646871138, 2244, 18348, (170, 156, 43, 178, 34, 28, 85, 253 ));
   
   type IUserActivity2_Interface is interface and Windows.IInspectable_Interface;
   
   function ToJson
   (
      This       : access IUserActivity2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityStatics : aliased constant Windows.IID := (2358235955, 3593, 18422, (154, 199, 149, 207, 92, 57, 54, 123 ));
   
   type IUserActivityStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryParseFromJson
   (
      This       : access IUserActivityStatics_Interface
      ; json : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function TryParseFromJsonArray
   (
      This       : access IUserActivityStatics_Interface
      ; json : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IVector_IUserActivity -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ToJsonArray
   (
      This       : access IUserActivityStatics_Interface
      ; activities : Windows.ApplicationModel.UserActivities.IIterable_IUserActivity
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityFactory : aliased constant Windows.IID := (2084067160, 13853, 19047, (138, 59, 52, 202, 41, 120, 249, 163 ));
   
   type IUserActivityFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithActivityId
   (
      This       : access IUserActivityFactory_Interface
      ; activityId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityChannelStatics : aliased constant Windows.IID := (3368027563, 6541, 19840, (171, 178, 201, 119, 94, 196, 167, 41 ));
   
   type IUserActivityChannelStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IUserActivityChannelStatics_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityChannelStatics2 : aliased constant Windows.IID := (2391268912, 43599, 17956, (154, 208, 212, 15, 59, 160, 49, 124 ));
   
   type IUserActivityChannelStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function DisableAutoSessionCreation
   (
      This       : access IUserActivityChannelStatics2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TryGetForWebAccount
   (
      This       : access IUserActivityChannelStatics2_Interface
      ; account : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityChannel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityChannel2 : aliased constant Windows.IID := (379118427, 60286, 20128, (191, 23, 164, 89, 232, 190, 112, 108 ));
   
   type IUserActivityChannel2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetRecentUserActivitiesAsync
   (
      This       : access IUserActivityChannel2_Interface
      ; maxUniqueActivities : Windows.Int32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSessionHistoryItemsForUserActivityAsync
   (
      This       : access IUserActivityChannel2_Interface
      ; activityId : Windows.String
      ; startTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityChannel : aliased constant Windows.IID := (3133208760, 41188, 18491, (185, 72, 156, 186, 189, 6, 7, 12 ));
   
   type IUserActivityChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function GetOrCreateUserActivityAsync
   (
      This       : access IUserActivityChannel_Interface
      ; activityId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteActivityAsync
   (
      This       : access IUserActivityChannel_Interface
      ; activityId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAllActivitiesAsync
   (
      This       : access IUserActivityChannel_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivitySessionHistoryItem : aliased constant Windows.IID := (3906313171, 15965, 18941, (152, 215, 109, 169, 117, 33, 226, 85 ));
   
   type IUserActivitySessionHistoryItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserActivity
   (
      This       : access IUserActivitySessionHistoryItem_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IUserActivitySessionHistoryItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_EndTime
   (
      This       : access IUserActivitySessionHistoryItem_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityRequestedEventArgs : aliased constant Windows.IID := (2764864076, 33321, 19709, (163, 188, 198, 29, 49, 133, 117, 164 ));
   
   type IUserActivityRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserActivityRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserActivityRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityRequest : aliased constant Windows.IID := (2700043093, 53045, 20464, (136, 51, 80, 203, 75, 114, 224, 109 ));
   
   type IUserActivityRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function SetUserActivity
   (
      This       : access IUserActivityRequest_Interface
      ; activity : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityRequestManager : aliased constant Windows.IID := (204521038, 36925, 18646, (130, 212, 64, 67, 237, 87, 121, 27 ));
   
   type IUserActivityRequestManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_UserActivityRequested
   (
      This       : access IUserActivityRequestManager_Interface
      ; handler : TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserActivityRequested
   (
      This       : access IUserActivityRequestManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserActivityRequestManagerStatics : aliased constant Windows.IID := (3224972785, 8778, 17196, (129, 229, 12, 118, 180, 196, 206, 250 ));
   
   type IUserActivityRequestManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IUserActivityRequestManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityRequestManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUserActivity : aliased constant Windows.IID := (748708667, 1285, 24456, (169, 143, 142, 124, 91, 8, 242, 91 ));
   
   type IIterator_IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUserActivity_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUserActivity_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUserActivity_Interface
      ; items : Windows.ApplicationModel.UserActivities.IUserActivity_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUserActivity : aliased constant Windows.IID := (937864021, 7984, 22050, (151, 120, 27, 220, 7, 172, 121, 159 ));
   
   type IIterable_IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IIterator_IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUserActivity : aliased constant Windows.IID := (422203670, 25046, 24088, (134, 121, 10, 244, 247, 9, 8, 22 ));
   
   type IVectorView_IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUserActivity_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUserActivity_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUserActivity_Interface
      ; value : Windows.ApplicationModel.UserActivities.IUserActivity
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUserActivity_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.UserActivities.IUserActivity_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IUserActivity : aliased constant Windows.IID := (3808448149, 2821, 21980, (191, 59, 190, 6, 250, 224, 49, 82 ));
   
   type IVector_IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IUserActivity_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IUserActivity_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IVectorView_IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IUserActivity_Interface
      ; value : Windows.ApplicationModel.UserActivities.IUserActivity
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IUserActivity_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IUserActivity_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IUserActivity_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IUserActivity_Interface
      ; value : Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IUserActivity_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IUserActivity_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IUserActivity_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.UserActivities.IUserActivity_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IUserActivity_Interface
      ; items : Windows.ApplicationModel.UserActivities.IUserActivity_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUserActivity : aliased constant Windows.IID := (889805187, 30608, 22900, (166, 96, 28, 45, 189, 210, 239, 167 ));
   
   type IAsyncOperation_IUserActivity_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserActivity_Interface
      ; handler : Windows.ApplicationModel.UserActivities.AsyncOperationCompletedHandler_IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.AsyncOperationCompletedHandler_IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserActivity_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUserActivity : aliased constant Windows.IID := (1696925639, 3014, 23819, (130, 190, 151, 173, 34, 87, 182, 133 ));
   
   type AsyncOperationCompletedHandler_IUserActivity_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUserActivity'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserActivity_Interface
      ; asyncInfo : Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested : aliased constant Windows.IID := (3072290778, 8693, 23501, (184, 59, 108, 158, 173, 255, 36, 16 ));
   
   type TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserActivities.IUserActivityRequestManager ; args : Windows.ApplicationModel.UserActivities.IUserActivityRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserActivityRequestManager_add_UserActivityRequested_Interface
      ; sender : Windows.ApplicationModel.UserActivities.IUserActivityRequestManager
      ; args : Windows.ApplicationModel.UserActivities.IUserActivityRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserActivityAttribution is Windows.ApplicationModel.UserActivities.IUserActivityAttribution;
   function Create return Windows.ApplicationModel.UserActivities.IUserActivityAttribution;
   
   function CreateWithUri
   (
      iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityAttribution;
   
   subtype UserActivityContentInfo is Windows.ApplicationModel.UserActivities.IUserActivityContentInfo;
   subtype UserActivityVisualElements is Windows.ApplicationModel.UserActivities.IUserActivityVisualElements;
   subtype UserActivitySession is Windows.ApplicationModel.UserActivities.IUserActivitySession;
   subtype UserActivity is Windows.ApplicationModel.UserActivities.IUserActivity;
   function CreateWithActivityId
   (
      activityId : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivity;
   
   subtype UserActivityChannel is Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   subtype UserActivitySessionHistoryItem is Windows.ApplicationModel.UserActivities.IUserActivitySessionHistoryItem;
   subtype UserActivityRequest is Windows.ApplicationModel.UserActivities.IUserActivityRequest;
   subtype UserActivityRequestedEventArgs is Windows.ApplicationModel.UserActivities.IUserActivityRequestedEventArgs;
   subtype UserActivityRequestManager is Windows.ApplicationModel.UserActivities.IUserActivityRequestManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromJson
   (
      value : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityContentInfo;
   
   function TryParseFromJson
   (
      json : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivity;
   
   function TryParseFromJsonArray
   (
      json : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IVector_IUserActivity;
   
   function ToJsonArray
   (
      activities : Windows.ApplicationModel.UserActivities.IIterable_IUserActivity
   )
   return Windows.String;
   
   procedure DisableAutoSessionCreation
   ;
   
   function TryGetForWebAccount
   (
      account : Windows.Security.Credentials.IWebAccount
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   
   function GetDefault
   return Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   
   function GetForCurrentView
   return Windows.ApplicationModel.UserActivities.IUserActivityRequestManager;
   
end;
