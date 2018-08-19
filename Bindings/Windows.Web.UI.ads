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
with Windows.Foundation.Collections;
limited with Windows.Web.Http;
limited with Windows.Storage.Streams;
limited with Windows.ApplicationModel.DataTransfer;
--------------------------------------------------------------------------------
package Windows.Web.UI is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebViewControlPermissionState is (
      Unknown,
      Defer,
      Allow,
      Deny
   );
   for WebViewControlPermissionState use (
      Unknown => 0,
      Defer => 1,
      Allow => 2,
      Deny => 3
   );
   for WebViewControlPermissionState'Size use 32;
   
   type WebViewControlPermissionState_Ptr is access WebViewControlPermissionState;
   
   type WebViewControlPermissionType is (
      Geolocation,
      UnlimitedIndexedDBQuota,
      Media,
      PointerLock,
      WebNotifications,
      Screen
   );
   for WebViewControlPermissionType use (
      Geolocation => 0,
      UnlimitedIndexedDBQuota => 1,
      Media => 2,
      PointerLock => 3,
      WebNotifications => 4,
      Screen => 5
   );
   for WebViewControlPermissionType'Size use 32;
   
   type WebViewControlPermissionType_Ptr is access WebViewControlPermissionType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWebViewControl_Interface;
   type AsyncOperationCompletedHandler_IWebViewControl is access all AsyncOperationCompletedHandler_IWebViewControl_Interface'Class;
   type AsyncOperationCompletedHandler_IWebViewControl_Ptr is access all AsyncOperationCompletedHandler_IWebViewControl;
   type TypedEventHandler_IWebViewControl_add_NavigationStarting_Interface;
   type TypedEventHandler_IWebViewControl_add_NavigationStarting is access all TypedEventHandler_IWebViewControl_add_NavigationStarting_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_NavigationStarting_Ptr is access all TypedEventHandler_IWebViewControl_add_NavigationStarting;
   type TypedEventHandler_IWebViewControl_add_ContentLoading_Interface;
   type TypedEventHandler_IWebViewControl_add_ContentLoading is access all TypedEventHandler_IWebViewControl_add_ContentLoading_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_ContentLoading_Ptr is access all TypedEventHandler_IWebViewControl_add_ContentLoading;
   type TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Interface;
   type TypedEventHandler_IWebViewControl_add_DOMContentLoaded is access all TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Ptr is access all TypedEventHandler_IWebViewControl_add_DOMContentLoaded;
   type TypedEventHandler_IWebViewControl_add_NavigationCompleted_Interface;
   type TypedEventHandler_IWebViewControl_add_NavigationCompleted is access all TypedEventHandler_IWebViewControl_add_NavigationCompleted_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_NavigationCompleted_Ptr is access all TypedEventHandler_IWebViewControl_add_NavigationCompleted;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Interface;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationStarting is access all TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Ptr is access all TypedEventHandler_IWebViewControl_add_FrameNavigationStarting;
   type TypedEventHandler_IWebViewControl_add_FrameContentLoading_Interface;
   type TypedEventHandler_IWebViewControl_add_FrameContentLoading is access all TypedEventHandler_IWebViewControl_add_FrameContentLoading_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_FrameContentLoading_Ptr is access all TypedEventHandler_IWebViewControl_add_FrameContentLoading;
   type TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Interface;
   type TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded is access all TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Ptr is access all TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Interface;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted is access all TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Ptr is access all TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted;
   type TypedEventHandler_IWebViewControl_add_ScriptNotify_Interface;
   type TypedEventHandler_IWebViewControl_add_ScriptNotify is access all TypedEventHandler_IWebViewControl_add_ScriptNotify_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_ScriptNotify_Ptr is access all TypedEventHandler_IWebViewControl_add_ScriptNotify;
   type TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Interface;
   type TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected is access all TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Ptr is access all TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected;
   type TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Interface;
   type TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying is access all TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Ptr is access all TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying;
   type TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Interface;
   type TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified is access all TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Ptr is access all TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified;
   type TypedEventHandler_IWebViewControl_add_PermissionRequested_Interface;
   type TypedEventHandler_IWebViewControl_add_PermissionRequested is access all TypedEventHandler_IWebViewControl_add_PermissionRequested_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_PermissionRequested_Ptr is access all TypedEventHandler_IWebViewControl_add_PermissionRequested;
   type TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Interface;
   type TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified is access all TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Ptr is access all TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified;
   type TypedEventHandler_IWebViewControl_add_NewWindowRequested_Interface;
   type TypedEventHandler_IWebViewControl_add_NewWindowRequested is access all TypedEventHandler_IWebViewControl_add_NewWindowRequested_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_NewWindowRequested_Ptr is access all TypedEventHandler_IWebViewControl_add_NewWindowRequested;
   type TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Interface;
   type TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged is access all TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Ptr is access all TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged;
   type TypedEventHandler_IWebViewControl_add_WebResourceRequested_Interface;
   type TypedEventHandler_IWebViewControl_add_WebResourceRequested is access all TypedEventHandler_IWebViewControl_add_WebResourceRequested_Interface'Class;
   type TypedEventHandler_IWebViewControl_add_WebResourceRequested_Ptr is access all TypedEventHandler_IWebViewControl_add_WebResourceRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebViewControl_Interface;
   type IWebViewControl is access all IWebViewControl_Interface'Class;
   type IWebViewControl_Ptr is access all IWebViewControl;
   type IWebViewControlSettings_Interface;
   type IWebViewControlSettings is access all IWebViewControlSettings_Interface'Class;
   type IWebViewControlSettings_Ptr is access all IWebViewControlSettings;
   type IWebViewControlDeferredPermissionRequest_Interface;
   type IWebViewControlDeferredPermissionRequest is access all IWebViewControlDeferredPermissionRequest_Interface'Class;
   type IWebViewControlDeferredPermissionRequest_Ptr is access all IWebViewControlDeferredPermissionRequest;
   type IWebViewControlPermissionRequest_Interface;
   type IWebViewControlPermissionRequest is access all IWebViewControlPermissionRequest_Interface'Class;
   type IWebViewControlPermissionRequest_Ptr is access all IWebViewControlPermissionRequest;
   type IWebViewControlNavigationStartingEventArgs_Interface;
   type IWebViewControlNavigationStartingEventArgs is access all IWebViewControlNavigationStartingEventArgs_Interface'Class;
   type IWebViewControlNavigationStartingEventArgs_Ptr is access all IWebViewControlNavigationStartingEventArgs;
   type IWebViewControlContentLoadingEventArgs_Interface;
   type IWebViewControlContentLoadingEventArgs is access all IWebViewControlContentLoadingEventArgs_Interface'Class;
   type IWebViewControlContentLoadingEventArgs_Ptr is access all IWebViewControlContentLoadingEventArgs;
   type IWebViewControlDOMContentLoadedEventArgs_Interface;
   type IWebViewControlDOMContentLoadedEventArgs is access all IWebViewControlDOMContentLoadedEventArgs_Interface'Class;
   type IWebViewControlDOMContentLoadedEventArgs_Ptr is access all IWebViewControlDOMContentLoadedEventArgs;
   type IWebViewControlNavigationCompletedEventArgs_Interface;
   type IWebViewControlNavigationCompletedEventArgs is access all IWebViewControlNavigationCompletedEventArgs_Interface'Class;
   type IWebViewControlNavigationCompletedEventArgs_Ptr is access all IWebViewControlNavigationCompletedEventArgs;
   type IWebViewControlScriptNotifyEventArgs_Interface;
   type IWebViewControlScriptNotifyEventArgs is access all IWebViewControlScriptNotifyEventArgs_Interface'Class;
   type IWebViewControlScriptNotifyEventArgs_Ptr is access all IWebViewControlScriptNotifyEventArgs;
   type IWebViewControlLongRunningScriptDetectedEventArgs_Interface;
   type IWebViewControlLongRunningScriptDetectedEventArgs is access all IWebViewControlLongRunningScriptDetectedEventArgs_Interface'Class;
   type IWebViewControlLongRunningScriptDetectedEventArgs_Ptr is access all IWebViewControlLongRunningScriptDetectedEventArgs;
   type IWebViewControlUnviewableContentIdentifiedEventArgs_Interface;
   type IWebViewControlUnviewableContentIdentifiedEventArgs is access all IWebViewControlUnviewableContentIdentifiedEventArgs_Interface'Class;
   type IWebViewControlUnviewableContentIdentifiedEventArgs_Ptr is access all IWebViewControlUnviewableContentIdentifiedEventArgs;
   type IWebViewControlPermissionRequestedEventArgs_Interface;
   type IWebViewControlPermissionRequestedEventArgs is access all IWebViewControlPermissionRequestedEventArgs_Interface'Class;
   type IWebViewControlPermissionRequestedEventArgs_Ptr is access all IWebViewControlPermissionRequestedEventArgs;
   type IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface;
   type IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs is access all IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface'Class;
   type IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Ptr is access all IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs;
   type IWebViewControlNewWindowRequestedEventArgs_Interface;
   type IWebViewControlNewWindowRequestedEventArgs is access all IWebViewControlNewWindowRequestedEventArgs_Interface'Class;
   type IWebViewControlNewWindowRequestedEventArgs_Ptr is access all IWebViewControlNewWindowRequestedEventArgs;
   type IWebViewControlWebResourceRequestedEventArgs_Interface;
   type IWebViewControlWebResourceRequestedEventArgs is access all IWebViewControlWebResourceRequestedEventArgs_Interface'Class;
   type IWebViewControlWebResourceRequestedEventArgs_Ptr is access all IWebViewControlWebResourceRequestedEventArgs;
   type IAsyncOperation_IWebViewControl_Interface;
   type IAsyncOperation_IWebViewControl is access all IAsyncOperation_IWebViewControl_Interface'Class;
   type IAsyncOperation_IWebViewControl_Ptr is access all IAsyncOperation_IWebViewControl;
   type IIterator_IWebViewControl_Interface;
   type IIterator_IWebViewControl is access all IIterator_IWebViewControl_Interface'Class;
   type IIterator_IWebViewControl_Ptr is access all IIterator_IWebViewControl;
   type IIterable_IWebViewControl_Interface;
   type IIterable_IWebViewControl is access all IIterable_IWebViewControl_Interface'Class;
   type IIterable_IWebViewControl_Ptr is access all IIterable_IWebViewControl;
   type IVectorView_IWebViewControl_Interface;
   type IVectorView_IWebViewControl is access all IVectorView_IWebViewControl_Interface'Class;
   type IVectorView_IWebViewControl_Ptr is access all IVectorView_IWebViewControl;
   type IIterator_IWebViewControlDeferredPermissionRequest_Interface;
   type IIterator_IWebViewControlDeferredPermissionRequest is access all IIterator_IWebViewControlDeferredPermissionRequest_Interface'Class;
   type IIterator_IWebViewControlDeferredPermissionRequest_Ptr is access all IIterator_IWebViewControlDeferredPermissionRequest;
   type IIterable_IWebViewControlDeferredPermissionRequest_Interface;
   type IIterable_IWebViewControlDeferredPermissionRequest is access all IIterable_IWebViewControlDeferredPermissionRequest_Interface'Class;
   type IIterable_IWebViewControlDeferredPermissionRequest_Ptr is access all IIterable_IWebViewControlDeferredPermissionRequest;
   type IVectorView_IWebViewControlDeferredPermissionRequest_Interface;
   type IVectorView_IWebViewControlDeferredPermissionRequest is access all IVectorView_IWebViewControlDeferredPermissionRequest_Interface'Class;
   type IVectorView_IWebViewControlDeferredPermissionRequest_Ptr is access all IVectorView_IWebViewControlDeferredPermissionRequest;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControl : aliased constant Windows.IID := (1066537750, 48240, 19418, (145, 54, 201, 67, 112, 137, 159, 171 ));
   
   type IWebViewControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IWebViewControl_Interface
      ; source : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DocumentTitle
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CanGoBack
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanGoForward
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultBackgroundColor
   (
      This       : access IWebViewControl_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultBackgroundColor
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainsFullScreenElement
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Settings
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.IWebViewControlSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_DeferredPermissionRequests
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.IVectorView_IWebViewControlDeferredPermissionRequest -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GoForward
   (
      This       : access IWebViewControl_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GoBack
   (
      This       : access IWebViewControl_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Refresh
   (
      This       : access IWebViewControl_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IWebViewControl_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Navigate
   (
      This       : access IWebViewControl_Interface
      ; source : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function NavigateToString
   (
      This       : access IWebViewControl_Interface
      ; text : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function NavigateToLocalStreamUri
   (
      This       : access IWebViewControl_Interface
      ; source : Windows.Foundation.IUriRuntimeClass
      ; streamResolver : Windows.Web.IUriToStreamResolver
   )
   return Windows.HRESULT is abstract;
   
   function NavigateWithHttpRequestMessage
   (
      This       : access IWebViewControl_Interface
      ; requestMessage : Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function InvokeScriptAsync
   (
      This       : access IWebViewControl_Interface
      ; scriptName : Windows.String
      ; arguments : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CapturePreviewToStreamAsync
   (
      This       : access IWebViewControl_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CaptureSelectedContentToDataPackageAsync
   (
      This       : access IWebViewControl_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IAsyncOperation_IDataPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function BuildLocalStreamUri
   (
      This       : access IWebViewControl_Interface
      ; contentIdentifier : Windows.String
      ; relativePath : Windows.String
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferredPermissionRequestById
   (
      This       : access IWebViewControl_Interface
      ; id : Windows.UInt32
      ; result : access Windows.Web.UI.IWebViewControlDeferredPermissionRequest
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationStarting
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_NavigationStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationStarting
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ContentLoading
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_ContentLoading
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContentLoading
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DOMContentLoaded
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_DOMContentLoaded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DOMContentLoaded
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationCompleted
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_NavigationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationCompleted
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FrameNavigationStarting
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_FrameNavigationStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameNavigationStarting
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FrameContentLoading
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_FrameContentLoading
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameContentLoading
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FrameDOMContentLoaded
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameDOMContentLoaded
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FrameNavigationCompleted
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameNavigationCompleted
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ScriptNotify
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_ScriptNotify
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ScriptNotify
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LongRunningScriptDetected
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LongRunningScriptDetected
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UnsafeContentWarningDisplaying
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnsafeContentWarningDisplaying
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UnviewableContentIdentified
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnviewableContentIdentified
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PermissionRequested
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_PermissionRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PermissionRequested
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UnsupportedUriSchemeIdentified
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnsupportedUriSchemeIdentified
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NewWindowRequested
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_NewWindowRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NewWindowRequested
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ContainsFullScreenElementChanged
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContainsFullScreenElementChanged
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WebResourceRequested
   (
      This       : access IWebViewControl_Interface
      ; handler : TypedEventHandler_IWebViewControl_add_WebResourceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WebResourceRequested
   (
      This       : access IWebViewControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlSettings : aliased constant Windows.IID := (3382083519, 24216, 19709, (140, 206, 39, 176, 145, 30, 61, 232 ));
   
   type IWebViewControlSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsJavaScriptEnabled
   (
      This       : access IWebViewControlSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsJavaScriptEnabled
   (
      This       : access IWebViewControlSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsIndexedDBEnabled
   (
      This       : access IWebViewControlSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIndexedDBEnabled
   (
      This       : access IWebViewControlSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsScriptNotifyAllowed
   (
      This       : access IWebViewControlSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsScriptNotifyAllowed
   (
      This       : access IWebViewControlSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlDeferredPermissionRequest : aliased constant Windows.IID := (753093088, 55129, 17500, (153, 38, 137, 149, 41, 143, 21, 43 ));
   
   type IWebViewControlDeferredPermissionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PermissionType
   (
      This       : access IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Web.UI.WebViewControlPermissionType
   )
   return Windows.HRESULT is abstract;
   
   function Allow
   (
      This       : access IWebViewControlDeferredPermissionRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Deny
   (
      This       : access IWebViewControlDeferredPermissionRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlPermissionRequest : aliased constant Windows.IID := (3854336876, 61999, 16610, (149, 178, 119, 41, 248, 64, 235, 127 ));
   
   type IWebViewControlPermissionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IWebViewControlPermissionRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IWebViewControlPermissionRequest_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PermissionType
   (
      This       : access IWebViewControlPermissionRequest_Interface
      ; RetVal : access Windows.Web.UI.WebViewControlPermissionType
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IWebViewControlPermissionRequest_Interface
      ; RetVal : access Windows.Web.UI.WebViewControlPermissionState
   )
   return Windows.HRESULT is abstract;
   
   function Defer
   (
      This       : access IWebViewControlPermissionRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Allow
   (
      This       : access IWebViewControlPermissionRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Deny
   (
      This       : access IWebViewControlPermissionRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlNavigationStartingEventArgs : aliased constant Windows.IID := (210786245, 2568, 16839, (134, 59, 113, 227, 169, 84, 145, 55 ));
   
   type IWebViewControlNavigationStartingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlNavigationStartingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Cancel
   (
      This       : access IWebViewControlNavigationStartingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access IWebViewControlNavigationStartingEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlContentLoadingEventArgs : aliased constant Windows.IID := (2587872434, 47547, 16459, (162, 43, 102, 220, 205, 18, 80, 198 ));
   
   type IWebViewControlContentLoadingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlContentLoadingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlDOMContentLoadedEventArgs : aliased constant Windows.IID := (3196829704, 38209, 17733, (159, 242, 45, 245, 133, 178, 159, 125 ));
   
   type IWebViewControlDOMContentLoadedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlDOMContentLoadedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlNavigationCompletedEventArgs : aliased constant Windows.IID := (541104408, 18965, 19526, (165, 93, 247, 158, 219, 11, 222, 139 ));
   
   type IWebViewControlNavigationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlNavigationCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSuccess
   (
      This       : access IWebViewControlNavigationCompletedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WebErrorStatus
   (
      This       : access IWebViewControlNavigationCompletedEventArgs_Interface
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlScriptNotifyEventArgs : aliased constant Windows.IID := (1226696059, 28489, 16827, (181, 145, 81, 184, 91, 129, 112, 55 ));
   
   type IWebViewControlScriptNotifyEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlScriptNotifyEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWebViewControlScriptNotifyEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlLongRunningScriptDetectedEventArgs : aliased constant Windows.IID := (711875514, 39092, 17852, (187, 235, 15, 105, 206, 73, 197, 153 ));
   
   type IWebViewControlLongRunningScriptDetectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExecutionTime
   (
      This       : access IWebViewControlLongRunningScriptDetectedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StopPageScriptExecution
   (
      This       : access IWebViewControlLongRunningScriptDetectedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_StopPageScriptExecution
   (
      This       : access IWebViewControlLongRunningScriptDetectedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlUnviewableContentIdentifiedEventArgs : aliased constant Windows.IID := (1251377371, 35058, 20000, (182, 147, 180, 226, 223, 74, 165, 129 ));
   
   type IWebViewControlUnviewableContentIdentifiedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlUnviewableContentIdentifiedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Referrer
   (
      This       : access IWebViewControlUnviewableContentIdentifiedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access IWebViewControlUnviewableContentIdentifiedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlPermissionRequestedEventArgs : aliased constant Windows.IID := (656428369, 9352, 19653, (150, 142, 10, 119, 30, 89, 193, 71 ));
   
   type IWebViewControlPermissionRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PermissionRequest
   (
      This       : access IWebViewControlPermissionRequestedEventArgs_Interface
      ; RetVal : access Windows.Web.UI.IWebViewControlPermissionRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs : aliased constant Windows.IID := (3820493124, 58620, 17372, (148, 202, 249, 128, 243, 11, 197, 29 ));
   
   type IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlNewWindowRequestedEventArgs : aliased constant Windows.IID := (1039420347, 41252, 18133, (160, 131, 208, 44, 172, 223, 245, 173 ));
   
   type IWebViewControlNewWindowRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebViewControlNewWindowRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Referrer
   (
      This       : access IWebViewControlNewWindowRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IWebViewControlNewWindowRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IWebViewControlNewWindowRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlWebResourceRequestedEventArgs : aliased constant Windows.IID := (1154896461, 21924, 19851, (137, 28, 147, 29, 142, 37, 212, 46 ));
   
   type IWebViewControlWebResourceRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IWebViewControlWebResourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access IWebViewControlWebResourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function put_Response
   (
      This       : access IWebViewControlWebResourceRequestedEventArgs_Interface
      ; value : Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IWebViewControlWebResourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWebViewControl : aliased constant Windows.IID := (2889689260, 33634, 20934, (178, 204, 22, 243, 103, 39, 88, 241 ));
   
   type IAsyncOperation_IWebViewControl_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWebViewControl_Interface
      ; handler : Windows.Web.UI.AsyncOperationCompletedHandler_IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.AsyncOperationCompletedHandler_IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebViewControl : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_IWebViewControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebViewControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebViewControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebViewControl_Interface
      ; items : Windows.Web.UI.IWebViewControl_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebViewControl : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebViewControl_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebViewControl_Interface
      ; RetVal : access Windows.Web.UI.IIterator_IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebViewControl : aliased constant Windows.IID := (1590416832, 33410, 24545, (173, 57, 55, 76, 222, 112, 224, 205 ));
   
   type IVectorView_IWebViewControl_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebViewControl_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.UI.IWebViewControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebViewControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebViewControl_Interface
      ; value : Windows.Web.UI.IWebViewControl
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebViewControl_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.UI.IWebViewControl_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebViewControlDeferredPermissionRequest : aliased constant Windows.IID := (662339773, 15914, 24552, (149, 210, 204, 134, 247, 35, 191, 66 ));
   
   type IIterator_IWebViewControlDeferredPermissionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Web.UI.IWebViewControlDeferredPermissionRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebViewControlDeferredPermissionRequest_Interface
      ; items : Windows.Web.UI.IWebViewControlDeferredPermissionRequest_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebViewControlDeferredPermissionRequest : aliased constant Windows.IID := (2441109311, 5067, 21635, (181, 146, 185, 174, 14, 51, 79, 23 ));
   
   type IIterable_IWebViewControlDeferredPermissionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.Web.UI.IIterator_IWebViewControlDeferredPermissionRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebViewControlDeferredPermissionRequest : aliased constant Windows.IID := (3221044687, 6516, 21410, (141, 136, 150, 109, 132, 186, 152, 224 ));
   
   type IVectorView_IWebViewControlDeferredPermissionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebViewControlDeferredPermissionRequest_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.UI.IWebViewControlDeferredPermissionRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebViewControlDeferredPermissionRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebViewControlDeferredPermissionRequest_Interface
      ; value : Windows.Web.UI.IWebViewControlDeferredPermissionRequest
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebViewControlDeferredPermissionRequest_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.UI.IWebViewControlDeferredPermissionRequest_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWebViewControl : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_IWebViewControl_Interface(Callback : access procedure (asyncInfo : Windows.Web.UI.IAsyncOperation_IWebViewControl ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWebViewControl'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebViewControl_Interface
      ; asyncInfo : Windows.Web.UI.IAsyncOperation_IWebViewControl
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_NavigationStarting : aliased constant Windows.IID := (3912109004, 39657, 23451, (166, 132, 131, 221, 142, 229, 119, 117 ));
   
   type TypedEventHandler_IWebViewControl_add_NavigationStarting_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_NavigationStarting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NavigationStarting_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_ContentLoading : aliased constant Windows.IID := (896619774, 60442, 24522, (184, 96, 98, 240, 61, 236, 228, 157 ));
   
   type TypedEventHandler_IWebViewControl_add_ContentLoading_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_ContentLoading'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ContentLoading_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_DOMContentLoaded : aliased constant Windows.IID := (3621532478, 46369, 23414, (167, 255, 72, 180, 84, 245, 151, 229 ));
   
   type TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_DOMContentLoaded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_NavigationCompleted : aliased constant Windows.IID := (1470659667, 18341, 22628, (152, 129, 253, 76, 0, 242, 48, 169 ));
   
   type TypedEventHandler_IWebViewControl_add_NavigationCompleted_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_NavigationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NavigationCompleted_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_FrameNavigationStarting : aliased constant Windows.IID := (3912109004, 39657, 23451, (166, 132, 131, 221, 142, 229, 119, 117 ));
   
   type TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_FrameNavigationStarting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_FrameContentLoading : aliased constant Windows.IID := (896619774, 60442, 24522, (184, 96, 98, 240, 61, 236, 228, 157 ));
   
   type TypedEventHandler_IWebViewControl_add_FrameContentLoading_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_FrameContentLoading'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameContentLoading_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded : aliased constant Windows.IID := (3621532478, 46369, 23414, (167, 255, 72, 180, 84, 245, 151, 229 ));
   
   type TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted : aliased constant Windows.IID := (1470659667, 18341, 22628, (152, 129, 253, 76, 0, 242, 48, 169 ));
   
   type TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_ScriptNotify : aliased constant Windows.IID := (4002120147, 48066, 21936, (135, 123, 107, 168, 110, 58, 216, 153 ));
   
   type TypedEventHandler_IWebViewControl_add_ScriptNotify_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlScriptNotifyEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_ScriptNotify'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ScriptNotify_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlScriptNotifyEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected : aliased constant Windows.IID := (3173590174, 16658, 21309, (150, 162, 10, 28, 1, 81, 156, 175 ));
   
   type TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlLongRunningScriptDetectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlLongRunningScriptDetectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying : aliased constant Windows.IID := (3037238393, 43992, 22917, (138, 147, 76, 32, 138, 133, 227, 164 ));
   
   type TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified : aliased constant Windows.IID := (1461069539, 38784, 23351, (190, 138, 171, 142, 78, 120, 152, 207 ));
   
   type TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlUnviewableContentIdentifiedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlUnviewableContentIdentifiedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_PermissionRequested : aliased constant Windows.IID := (3855272998, 10856, 24074, (184, 43, 179, 215, 86, 225, 10, 86 ));
   
   type TypedEventHandler_IWebViewControl_add_PermissionRequested_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlPermissionRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_PermissionRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_PermissionRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlPermissionRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified : aliased constant Windows.IID := (2253915404, 24135, 21782, (178, 91, 87, 250, 226, 44, 75, 136 ));
   
   type TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_NewWindowRequested : aliased constant Windows.IID := (829493727, 4294, 21916, (133, 161, 132, 126, 176, 161, 178, 213 ));
   
   type TypedEventHandler_IWebViewControl_add_NewWindowRequested_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlNewWindowRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_NewWindowRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NewWindowRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNewWindowRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged : aliased constant Windows.IID := (3037238393, 43992, 22917, (138, 147, 76, 32, 138, 133, 227, 164 ));
   
   type TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControl_add_WebResourceRequested : aliased constant Windows.IID := (980341436, 811, 24263, (162, 10, 193, 239, 73, 37, 12, 60 ));
   
   type TypedEventHandler_IWebViewControl_add_WebResourceRequested_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.IWebViewControlWebResourceRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControl_add_WebResourceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_WebResourceRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlWebResourceRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebViewControlSettings is Windows.Web.UI.IWebViewControlSettings;
   subtype WebViewControlDeferredPermissionRequest is Windows.Web.UI.IWebViewControlDeferredPermissionRequest;
   subtype WebViewControlNavigationStartingEventArgs is Windows.Web.UI.IWebViewControlNavigationStartingEventArgs;
   subtype WebViewControlContentLoadingEventArgs is Windows.Web.UI.IWebViewControlContentLoadingEventArgs;
   subtype WebViewControlDOMContentLoadedEventArgs is Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs;
   subtype WebViewControlNavigationCompletedEventArgs is Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs;
   subtype WebViewControlScriptNotifyEventArgs is Windows.Web.UI.IWebViewControlScriptNotifyEventArgs;
   subtype WebViewControlLongRunningScriptDetectedEventArgs is Windows.Web.UI.IWebViewControlLongRunningScriptDetectedEventArgs;
   subtype WebViewControlUnviewableContentIdentifiedEventArgs is Windows.Web.UI.IWebViewControlUnviewableContentIdentifiedEventArgs;
   subtype WebViewControlPermissionRequestedEventArgs is Windows.Web.UI.IWebViewControlPermissionRequestedEventArgs;
   subtype WebViewControlUnsupportedUriSchemeIdentifiedEventArgs is Windows.Web.UI.IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs;
   subtype WebViewControlNewWindowRequestedEventArgs is Windows.Web.UI.IWebViewControlNewWindowRequestedEventArgs;
   subtype WebViewControlWebResourceRequestedEventArgs is Windows.Web.UI.IWebViewControlWebResourceRequestedEventArgs;
   subtype WebViewControlPermissionRequest is Windows.Web.UI.IWebViewControlPermissionRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
