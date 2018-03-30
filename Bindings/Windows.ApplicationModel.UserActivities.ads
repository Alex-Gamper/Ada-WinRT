--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.UI;
limited with Windows.UI.Shell;
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
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUserActivity_Interface;
   type AsyncOperationCompletedHandler_IUserActivity is access all AsyncOperationCompletedHandler_IUserActivity_Interface'Class;
   type AsyncOperationCompletedHandler_IUserActivity_Ptr is access all AsyncOperationCompletedHandler_IUserActivity;
   
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
   type IUserActivitySession_Interface;
   type IUserActivitySession is access all IUserActivitySession_Interface'Class;
   type IUserActivitySession_Ptr is access all IUserActivitySession;
   type IUserActivity_Interface;
   type IUserActivity is access all IUserActivity_Interface'Class;
   type IUserActivity_Ptr is access all IUserActivity;
   type IUserActivityChannelStatics_Interface;
   type IUserActivityChannelStatics is access all IUserActivityChannelStatics_Interface'Class;
   type IUserActivityChannelStatics_Ptr is access all IUserActivityChannelStatics;
   type IUserActivityChannel_Interface;
   type IUserActivityChannel is access all IUserActivityChannel_Interface'Class;
   type IUserActivityChannel_Ptr is access all IUserActivityChannel;
   type IAsyncOperation_IUserActivity_Interface;
   type IAsyncOperation_IUserActivity is access all IAsyncOperation_IUserActivity_Interface'Class;
   type IAsyncOperation_IUserActivity_Ptr is access all IAsyncOperation_IUserActivity;
   
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
   type IUserActivityAttributionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithUri
   (
      This       : access IUserActivityAttributionFactory_Interface
      ; iconUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityAttribution
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserActivityAttributionFactory : aliased constant Windows.IID := (3861631570, 50534, 20290, (153, 116, 145, 108, 77, 118, 55, 126 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IUserActivityAttribution : aliased constant Windows.IID := (883280053, 34525, 19180, (164, 145, 106, 79, 174, 165, 210, 46 ));
   
   ------------------------------------------------------------------------
   type IUserActivityContentInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function ToJson
   (
      This       : access IUserActivityContentInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserActivityContentInfo : aliased constant Windows.IID := (3013207469, 4991, 16541, (130, 45, 225, 175, 39, 206, 8, 220 ));
   
   ------------------------------------------------------------------------
   type IUserActivityContentInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromJson
   (
      This       : access IUserActivityContentInfoStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityContentInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserActivityContentInfoStatics : aliased constant Windows.IID := (2575876939, 902, 19401, (150, 138, 130, 0, 176, 4, 20, 79 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IUserActivityVisualElements : aliased constant Windows.IID := (2490725651, 9775, 18927, (187, 191, 155, 117, 210, 232, 82, 80 ));
   
   ------------------------------------------------------------------------
   type IUserActivitySession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IUserActivitySession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserActivitySession : aliased constant Windows.IID := (2923646328, 9466, 17571, (173, 72, 110, 218, 97, 170, 25, 36 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IUserActivity : aliased constant Windows.IID := (4228923038, 11435, 19766, (174, 162, 180, 187, 85, 108, 239, 15 ));
   
   ------------------------------------------------------------------------
   type IUserActivityChannelStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IUserActivityChannelStatics_Interface
      ; RetVal : access Windows.ApplicationModel.UserActivities.IUserActivityChannel
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserActivityChannelStatics : aliased constant Windows.IID := (3368027563, 6541, 19840, (171, 178, 201, 119, 94, 196, 167, 41 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IUserActivityChannel : aliased constant Windows.IID := (3133208760, 41188, 18491, (185, 72, 156, 186, 189, 6, 7, 12 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IAsyncOperation_IUserActivity : aliased constant Windows.IID := (889805187, 30608, 22900, (166, 96, 28, 45, 189, 210, 239, 167 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUserActivity_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUserActivity_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserActivity_Interface
      ; asyncInfo : Windows.ApplicationModel.UserActivities.IAsyncOperation_IUserActivity
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUserActivity : aliased constant Windows.IID := (1696925639, 3014, 23819, (130, 190, 151, 173, 34, 87, 182, 133 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserActivityAttribution is Windows.ApplicationModel.UserActivities.IUserActivityAttribution;
   
   function CreateUserActivityAttribution return Windows.ApplicationModel.UserActivities.IUserActivityAttribution;
   
   subtype UserActivityContentInfo is Windows.ApplicationModel.UserActivities.IUserActivityContentInfo;
   subtype UserActivityVisualElements is Windows.ApplicationModel.UserActivities.IUserActivityVisualElements;
   subtype UserActivitySession is Windows.ApplicationModel.UserActivities.IUserActivitySession;
   subtype UserActivity is Windows.ApplicationModel.UserActivities.IUserActivity;
   subtype UserActivityChannel is Windows.ApplicationModel.UserActivities.IUserActivityChannel;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromJson
   (
      value : Windows.String
   )
   return Windows.ApplicationModel.UserActivities.IUserActivityContentInfo;
   
   function GetDefault
   return Windows.ApplicationModel.UserActivities.IUserActivityChannel;

end;
