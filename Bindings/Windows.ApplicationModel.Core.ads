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
limited with Windows.UI.Core;
limited with Windows.ApplicationModel.Activation;
with Windows.Foundation.Collections;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppRestartFailureReason is (
      RestartPending,
      NotInForeground,
      InvalidUser,
      Other
   );
   for AppRestartFailureReason use (
      RestartPending => 0,
      NotInForeground => 1,
      InvalidUser => 2,
      Other => 3
   );
   for AppRestartFailureReason'Size use 32;
   
   type AppRestartFailureReason_Ptr is access AppRestartFailureReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_AppRestartFailureReason_Interface;
   type AsyncOperationCompletedHandler_AppRestartFailureReason is access all AsyncOperationCompletedHandler_AppRestartFailureReason_Interface'Class;
   type AsyncOperationCompletedHandler_AppRestartFailureReason_Ptr is access all AsyncOperationCompletedHandler_AppRestartFailureReason;
   type EventHandler_IUnhandledErrorDetectedEventArgs_Interface;
   type EventHandler_IUnhandledErrorDetectedEventArgs is access all EventHandler_IUnhandledErrorDetectedEventArgs_Interface'Class;
   type EventHandler_IUnhandledErrorDetectedEventArgs_Ptr is access all EventHandler_IUnhandledErrorDetectedEventArgs;
   type TypedEventHandler_ICoreApplicationView_add_Activated_Interface;
   type TypedEventHandler_ICoreApplicationView_add_Activated is access all TypedEventHandler_ICoreApplicationView_add_Activated_Interface'Class;
   type TypedEventHandler_ICoreApplicationView_add_Activated_Ptr is access all TypedEventHandler_ICoreApplicationView_add_Activated;
   type TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface;
   type TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing is access all TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface'Class;
   type TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Ptr is access all TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged is access all TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface'Class;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Ptr is access all TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged is access all TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface'Class;
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Ptr is access all TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppListEntry_Interface;
   type IAppListEntry is access all IAppListEntry_Interface'Class;
   type IAppListEntry_Ptr is access all IAppListEntry;
   type IAppListEntry2_Interface;
   type IAppListEntry2 is access all IAppListEntry2_Interface'Class;
   type IAppListEntry2_Ptr is access all IAppListEntry2;
   type IFrameworkView_Interface;
   type IFrameworkView is access all IFrameworkView_Interface'Class;
   type IFrameworkView_Ptr is access all IFrameworkView;
   type IFrameworkViewSource_Interface;
   type IFrameworkViewSource is access all IFrameworkViewSource_Interface'Class;
   type IFrameworkViewSource_Ptr is access all IFrameworkViewSource;
   type ICoreApplication_Interface;
   type ICoreApplication is access all ICoreApplication_Interface'Class;
   type ICoreApplication_Ptr is access all ICoreApplication;
   type ICoreApplicationUseCount_Interface;
   type ICoreApplicationUseCount is access all ICoreApplicationUseCount_Interface'Class;
   type ICoreApplicationUseCount_Ptr is access all ICoreApplicationUseCount;
   type ICoreApplicationExit_Interface;
   type ICoreApplicationExit is access all ICoreApplicationExit_Interface'Class;
   type ICoreApplicationExit_Ptr is access all ICoreApplicationExit;
   type ICoreApplication2_Interface;
   type ICoreApplication2 is access all ICoreApplication2_Interface'Class;
   type ICoreApplication2_Ptr is access all ICoreApplication2;
   type ICoreApplication3_Interface;
   type ICoreApplication3 is access all ICoreApplication3_Interface'Class;
   type ICoreApplication3_Ptr is access all ICoreApplication3;
   type ICoreImmersiveApplication_Interface;
   type ICoreImmersiveApplication is access all ICoreImmersiveApplication_Interface'Class;
   type ICoreImmersiveApplication_Ptr is access all ICoreImmersiveApplication;
   type ICoreImmersiveApplication2_Interface;
   type ICoreImmersiveApplication2 is access all ICoreImmersiveApplication2_Interface'Class;
   type ICoreImmersiveApplication2_Ptr is access all ICoreImmersiveApplication2;
   type ICoreImmersiveApplication3_Interface;
   type ICoreImmersiveApplication3 is access all ICoreImmersiveApplication3_Interface'Class;
   type ICoreImmersiveApplication3_Ptr is access all ICoreImmersiveApplication3;
   type ICoreApplicationUnhandledError_Interface;
   type ICoreApplicationUnhandledError is access all ICoreApplicationUnhandledError_Interface'Class;
   type ICoreApplicationUnhandledError_Ptr is access all ICoreApplicationUnhandledError;
   type ICoreApplicationView_Interface;
   type ICoreApplicationView is access all ICoreApplicationView_Interface'Class;
   type ICoreApplicationView_Ptr is access all ICoreApplicationView;
   type ICoreApplicationView2_Interface;
   type ICoreApplicationView2 is access all ICoreApplicationView2_Interface'Class;
   type ICoreApplicationView2_Ptr is access all ICoreApplicationView2;
   type ICoreApplicationView3_Interface;
   type ICoreApplicationView3 is access all ICoreApplicationView3_Interface'Class;
   type ICoreApplicationView3_Ptr is access all ICoreApplicationView3;
   type ICoreApplicationView5_Interface;
   type ICoreApplicationView5 is access all ICoreApplicationView5_Interface'Class;
   type ICoreApplicationView5_Ptr is access all ICoreApplicationView5;
   type ICoreApplicationView6_Interface;
   type ICoreApplicationView6 is access all ICoreApplicationView6_Interface'Class;
   type ICoreApplicationView6_Ptr is access all ICoreApplicationView6;
   type IHostedViewClosingEventArgs_Interface;
   type IHostedViewClosingEventArgs is access all IHostedViewClosingEventArgs_Interface'Class;
   type IHostedViewClosingEventArgs_Ptr is access all IHostedViewClosingEventArgs;
   type ICoreApplicationViewTitleBar_Interface;
   type ICoreApplicationViewTitleBar is access all ICoreApplicationViewTitleBar_Interface'Class;
   type ICoreApplicationViewTitleBar_Ptr is access all ICoreApplicationViewTitleBar;
   type IUnhandledErrorDetectedEventArgs_Interface;
   type IUnhandledErrorDetectedEventArgs is access all IUnhandledErrorDetectedEventArgs_Interface'Class;
   type IUnhandledErrorDetectedEventArgs_Ptr is access all IUnhandledErrorDetectedEventArgs;
   type IUnhandledError_Interface;
   type IUnhandledError is access all IUnhandledError_Interface'Class;
   type IUnhandledError_Ptr is access all IUnhandledError;
   type IAsyncOperation_AppRestartFailureReason_Interface;
   type IAsyncOperation_AppRestartFailureReason is access all IAsyncOperation_AppRestartFailureReason_Interface'Class;
   type IAsyncOperation_AppRestartFailureReason_Ptr is access all IAsyncOperation_AppRestartFailureReason;
   type IIterator_ICoreApplicationView_Interface;
   type IIterator_ICoreApplicationView is access all IIterator_ICoreApplicationView_Interface'Class;
   type IIterator_ICoreApplicationView_Ptr is access all IIterator_ICoreApplicationView;
   type IIterable_ICoreApplicationView_Interface;
   type IIterable_ICoreApplicationView is access all IIterable_ICoreApplicationView_Interface'Class;
   type IIterable_ICoreApplicationView_Ptr is access all IIterable_ICoreApplicationView;
   type IVectorView_ICoreApplicationView_Interface;
   type IVectorView_ICoreApplicationView is access all IVectorView_ICoreApplicationView_Interface'Class;
   type IVectorView_ICoreApplicationView_Ptr is access all IVectorView_ICoreApplicationView;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppListEntry : aliased constant Windows.IID := (4009816191, 8456, 18698, (135, 122, 138, 159, 23, 194, 95, 173 ));
   
   type IAppListEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayInfo
   (
      This       : access IAppListEntry_Interface
      ; RetVal : access Windows.ApplicationModel.IAppDisplayInfo
   )
   return Windows.HRESULT is abstract;
   
   function LaunchAsync
   (
      This       : access IAppListEntry_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppListEntry2 : aliased constant Windows.IID := (3500546221, 48949, 17068, (172, 6, 134, 238, 235, 65, 208, 75 ));
   
   type IAppListEntry2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppUserModelId
   (
      This       : access IAppListEntry2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkView : aliased constant Windows.IID := (4205534416, 35108, 17836, (173, 15, 160, 143, 174, 93, 3, 36 ));
   
   type IFrameworkView_Interface is interface and Windows.IInspectable_Interface;
   
   function Initialize
   (
      This       : access IFrameworkView_Interface
      ; applicationView : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function SetWindow
   (
      This       : access IFrameworkView_Interface
      ; window : Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   function Load
   (
      This       : access IFrameworkView_Interface
      ; entryPoint : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Run
   (
      This       : access IFrameworkView_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Uninitialize
   (
      This       : access IFrameworkView_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameworkViewSource : aliased constant Windows.IID := (3447129620, 26052, 17004, (148, 148, 52, 252, 67, 85, 72, 98 ));
   
   type IFrameworkViewSource_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateView
   (
      This       : access IFrameworkViewSource_Interface
      ; RetVal : access Windows.ApplicationModel.Core.IFrameworkView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplication : aliased constant Windows.IID := (179107748, 24093, 18911, (128, 52, 251, 106, 104, 188, 94, 209 ));
   
   type ICoreApplication_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ICoreApplication_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Suspending
   (
      This       : access ICoreApplication_Interface
      ; handler : Windows.ApplicationModel.EventHandler_ISuspendingEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Suspending
   (
      This       : access ICoreApplication_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Resuming
   (
      This       : access ICoreApplication_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Resuming
   (
      This       : access ICoreApplication_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ICoreApplication_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentView
   (
      This       : access ICoreApplication_Interface
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function Run
   (
      This       : access ICoreApplication_Interface
      ; viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
   )
   return Windows.HRESULT is abstract;
   
   function RunWithActivationFactories
   (
      This       : access ICoreApplication_Interface
      ; activationFactoryCallback : Windows.Foundation.IGetActivationFactory
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationUseCount : aliased constant Windows.IID := (1368245256, 49271, 18267, (128, 158, 11, 192, 197, 126, 75, 116 ));
   
   type ICoreApplicationUseCount_Interface is interface and Windows.IInspectable_Interface;
   
   function IncrementApplicationUseCount
   (
      This       : access ICoreApplicationUseCount_Interface
   )
   return Windows.HRESULT is abstract;
   
   function DecrementApplicationUseCount
   (
      This       : access ICoreApplicationUseCount_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationExit : aliased constant Windows.IID := (3481683485, 9758, 19314, (154, 205, 68, 237, 42, 206, 106, 41 ));
   
   type ICoreApplicationExit_Interface is interface and Windows.IInspectable_Interface;
   
   function Exit_x
   (
      This       : access ICoreApplicationExit_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Exiting
   (
      This       : access ICoreApplicationExit_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Exiting
   (
      This       : access ICoreApplicationExit_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplication2 : aliased constant Windows.IID := (2575729147, 6838, 19327, (190, 74, 154, 6, 69, 34, 76, 4 ));
   
   type ICoreApplication2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BackgroundActivated
   (
      This       : access ICoreApplication2_Interface
      ; handler : Windows.ApplicationModel.Activation.EventHandler_IBackgroundActivatedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BackgroundActivated
   (
      This       : access ICoreApplication2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LeavingBackground
   (
      This       : access ICoreApplication2_Interface
      ; handler : Windows.ApplicationModel.EventHandler_ILeavingBackgroundEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LeavingBackground
   (
      This       : access ICoreApplication2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnteredBackground
   (
      This       : access ICoreApplication2_Interface
      ; handler : Windows.ApplicationModel.EventHandler_IEnteredBackgroundEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnteredBackground
   (
      This       : access ICoreApplication2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function EnablePrelaunch
   (
      This       : access ICoreApplication2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplication3 : aliased constant Windows.IID := (4276882745, 22923, 17671, (138, 103, 119, 38, 50, 88, 10, 87 ));
   
   type ICoreApplication3_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestRestartAsync
   (
      This       : access ICoreApplication3_Interface
      ; launchArguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestRestartForUserAsync
   (
      This       : access ICoreApplication3_Interface
      ; user : Windows.System.IUser
      ; launchArguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreImmersiveApplication : aliased constant Windows.IID := (450498110, 58530, 16675, (180, 81, 220, 150, 191, 128, 4, 25 ));
   
   type ICoreImmersiveApplication_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Views
   (
      This       : access ICoreImmersiveApplication_Interface
      ; RetVal : access Windows.ApplicationModel.Core.IVectorView_ICoreApplicationView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateNewView
   (
      This       : access ICoreImmersiveApplication_Interface
      ; runtimeType : Windows.String
      ; entryPoint : Windows.String
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function get_MainView
   (
      This       : access ICoreImmersiveApplication_Interface
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreImmersiveApplication2 : aliased constant Windows.IID := (2190351926, 59875, 19708, (155, 102, 72, 183, 142, 169, 187, 44 ));
   
   type ICoreImmersiveApplication2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateNewViewFromMainView
   (
      This       : access ICoreImmersiveApplication2_Interface
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreImmersiveApplication3 : aliased constant Windows.IID := (882924335, 60941, 16869, (131, 20, 207, 16, 201, 27, 240, 175 ));
   
   type ICoreImmersiveApplication3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateNewViewWithViewSource
   (
      This       : access ICoreImmersiveApplication3_Interface
      ; viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationUnhandledError : aliased constant Windows.IID := (4041362096, 56585, 17121, (176, 188, 224, 225, 49, 247, 141, 126 ));
   
   type ICoreApplicationUnhandledError_Interface is interface and Windows.IInspectable_Interface;
   
   function add_UnhandledErrorDetected
   (
      This       : access ICoreApplicationUnhandledError_Interface
      ; handler : Windows.ApplicationModel.Core.EventHandler_IUnhandledErrorDetectedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnhandledErrorDetected
   (
      This       : access ICoreApplicationUnhandledError_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationView : aliased constant Windows.IID := (1670099675, 17693, 18017, (176, 153, 65, 79, 52, 255, 185, 241 ));
   
   type ICoreApplicationView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CoreWindow
   (
      This       : access ICoreApplicationView_Interface
      ; RetVal : access Windows.UI.Core.ICoreWindow
   )
   return Windows.HRESULT is abstract;
   
   function add_Activated
   (
      This       : access ICoreApplicationView_Interface
      ; handler : TypedEventHandler_ICoreApplicationView_add_Activated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Activated
   (
      This       : access ICoreApplicationView_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMain
   (
      This       : access ICoreApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHosted
   (
      This       : access ICoreApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationView2 : aliased constant Windows.IID := (1760262879, 37247, 18667, (154, 235, 125, 229, 62, 8, 106, 177 ));
   
   type ICoreApplicationView2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Dispatcher
   (
      This       : access ICoreApplicationView2_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationView3 : aliased constant Windows.IID := (132899251, 42191, 17744, (171, 112, 176, 126, 133, 51, 11, 200 ));
   
   type ICoreApplicationView3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsComponent
   (
      This       : access ICoreApplicationView3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleBar
   (
      This       : access ICoreApplicationView3_Interface
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar
   )
   return Windows.HRESULT is abstract;
   
   function add_HostedViewClosing
   (
      This       : access ICoreApplicationView3_Interface
      ; handler : TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HostedViewClosing
   (
      This       : access ICoreApplicationView3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationView5 : aliased constant Windows.IID := (734041512, 36592, 17517, (158, 96, 58, 62, 4, 40, 198, 113 ));
   
   type ICoreApplicationView5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access ICoreApplicationView5_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationView6 : aliased constant Windows.IID := (3239695514, 1657, 18874, (128, 63, 183, 156, 92, 243, 76, 202 ));
   
   type ICoreApplicationView6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access ICoreApplicationView6_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHostedViewClosingEventArgs : aliased constant Windows.IID := (3526923324, 45646, 18320, (172, 181, 62, 66, 67, 196, 255, 135 ));
   
   type IHostedViewClosingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IHostedViewClosingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICoreApplicationViewTitleBar : aliased constant Windows.IID := (7157219, 57841, 17179, (149, 8, 41, 185, 105, 38, 172, 83 ));
   
   type ICoreApplicationViewTitleBar_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ExtendViewIntoTitleBar
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendViewIntoTitleBar
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemOverlayLeftInset
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemOverlayRightInset
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function add_LayoutMetricsChanged
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; handler : TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LayoutMetricsChanged
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVisible
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_IsVisibleChanged
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; handler : TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsVisibleChanged
   (
      This       : access ICoreApplicationViewTitleBar_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUnhandledErrorDetectedEventArgs : aliased constant Windows.IID := (1738192779, 45878, 18466, (172, 64, 13, 117, 15, 11, 122, 43 ));
   
   type IUnhandledErrorDetectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnhandledError
   (
      This       : access IUnhandledErrorDetectedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Core.IUnhandledError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUnhandledError : aliased constant Windows.IID := (2488907558, 21429, 18054, (158, 175, 250, 129, 98, 220, 57, 128 ));
   
   type IUnhandledError_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IUnhandledError_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Propagate
   (
      This       : access IUnhandledError_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AppRestartFailureReason : aliased constant Windows.IID := (154701917, 21696, 22319, (132, 81, 75, 253, 43, 82, 237, 218 ));
   
   type IAsyncOperation_AppRestartFailureReason_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AppRestartFailureReason_Interface
      ; handler : Windows.ApplicationModel.Core.AsyncOperationCompletedHandler_AppRestartFailureReason
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AppRestartFailureReason_Interface
      ; RetVal : access Windows.ApplicationModel.Core.AsyncOperationCompletedHandler_AppRestartFailureReason
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AppRestartFailureReason_Interface
      ; RetVal : access Windows.ApplicationModel.Core.AppRestartFailureReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICoreApplicationView : aliased constant Windows.IID := (1331652932, 9803, 22632, (128, 158, 199, 172, 26, 197, 237, 173 ));
   
   type IIterator_ICoreApplicationView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICoreApplicationView_Interface
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICoreApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICoreApplicationView_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICoreApplicationView_Interface
      ; items : Windows.ApplicationModel.Core.ICoreApplicationView_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICoreApplicationView : aliased constant Windows.IID := (851186385, 9811, 23105, (165, 94, 136, 161, 42, 242, 2, 106 ));
   
   type IIterable_ICoreApplicationView_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICoreApplicationView_Interface
      ; RetVal : access Windows.ApplicationModel.Core.IIterator_ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICoreApplicationView : aliased constant Windows.IID := (3734902468, 7036, 20774, (177, 216, 124, 208, 79, 19, 189, 8 ));
   
   type IVectorView_ICoreApplicationView_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICoreApplicationView_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICoreApplicationView_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICoreApplicationView_Interface
      ; value : Windows.ApplicationModel.Core.ICoreApplicationView
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICoreApplicationView_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Core.ICoreApplicationView_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AppRestartFailureReason : aliased constant Windows.IID := (3706472330, 40743, 23645, (175, 219, 201, 26, 238, 79, 31, 2 ));
   
   type AsyncOperationCompletedHandler_AppRestartFailureReason_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AppRestartFailureReason'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AppRestartFailureReason_Interface
      ; asyncInfo : Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IUnhandledErrorDetectedEventArgs : aliased constant Windows.IID := (4136354849, 27476, 21915, (156, 221, 72, 154, 173, 11, 212, 29 ));
   
   type EventHandler_IUnhandledErrorDetectedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.Core.IUnhandledErrorDetectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IUnhandledErrorDetectedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IUnhandledErrorDetectedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.Core.IUnhandledErrorDetectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreApplicationView_add_Activated : aliased constant Windows.IID := (3474537110, 60179, 24123, (139, 223, 135, 182, 239, 174, 131, 57 ));
   
   type TypedEventHandler_ICoreApplicationView_add_Activated_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Core.ICoreApplicationView ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreApplicationView_add_Activated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreApplicationView_add_Activated_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationView
      ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing : aliased constant Windows.IID := (3651400755, 39884, 21718, (179, 207, 123, 1, 240, 38, 212, 205 ));
   
   type TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Core.ICoreApplicationView ; args : Windows.ApplicationModel.Core.IHostedViewClosingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreApplicationView3_add_HostedViewClosing_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationView
      ; args : Windows.ApplicationModel.Core.IHostedViewClosingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged : aliased constant Windows.IID := (674508321, 56019, 24114, (186, 225, 175, 231, 178, 108, 102, 251 ));
   
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreApplicationViewTitleBar_add_LayoutMetricsChanged_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged : aliased constant Windows.IID := (674508321, 56019, 24114, (186, 225, 175, 231, 178, 108, 102, 251 ));
   
   type TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICoreApplicationViewTitleBar_add_IsVisibleChanged_Interface
      ; sender : Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppListEntry is Windows.ApplicationModel.Core.IAppListEntry;
   subtype CoreApplicationView is Windows.ApplicationModel.Core.ICoreApplicationView;
   subtype CoreApplicationViewTitleBar is Windows.ApplicationModel.Core.ICoreApplicationViewTitleBar;
   subtype UnhandledErrorDetectedEventArgs is Windows.ApplicationModel.Core.IUnhandledErrorDetectedEventArgs;
   subtype HostedViewClosingEventArgs is Windows.ApplicationModel.Core.IHostedViewClosingEventArgs;
   subtype UnhandledError is Windows.ApplicationModel.Core.IUnhandledError;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateNewViewFromMainView
   return Windows.ApplicationModel.Core.ICoreApplicationView;
   
   procedure IncrementApplicationUseCount
   ;
   
   procedure DecrementApplicationUseCount
   ;
   
   procedure Exit_x
   ;
   
   function add_Exiting
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Exiting
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_Views
   return Windows.ApplicationModel.Core.IVectorView_ICoreApplicationView;
   
   function CreateNewView
   (
      runtimeType : Windows.String
      ; entryPoint : Windows.String
   )
   return Windows.ApplicationModel.Core.ICoreApplicationView;
   
   function get_MainView
   return Windows.ApplicationModel.Core.ICoreApplicationView;
   
   function add_UnhandledErrorDetected
   (
      handler : Windows.ApplicationModel.Core.EventHandler_IUnhandledErrorDetectedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_UnhandledErrorDetected
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function RequestRestartAsync
   (
      launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   
   function RequestRestartForUserAsync
   (
      user : Windows.System.IUser
      ; launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   
   function add_BackgroundActivated
   (
      handler : Windows.ApplicationModel.Activation.EventHandler_IBackgroundActivatedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_BackgroundActivated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_LeavingBackground
   (
      handler : Windows.ApplicationModel.EventHandler_ILeavingBackgroundEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_LeavingBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_EnteredBackground
   (
      handler : Windows.ApplicationModel.EventHandler_IEnteredBackgroundEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_EnteredBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   procedure EnablePrelaunch
   (
      value : Windows.Boolean
   )
   ;
   
   function CreateNewViewWithViewSource
   (
      viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
   )
   return Windows.ApplicationModel.Core.ICoreApplicationView;
   
   function get_Id
   return Windows.String;
   
   function add_Suspending
   (
      handler : Windows.ApplicationModel.EventHandler_ISuspendingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Suspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_Resuming
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Resuming
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_Properties
   return Windows.Foundation.Collections.IPropertySet;
   
   function GetCurrentView
   return Windows.ApplicationModel.Core.ICoreApplicationView;
   
   procedure Run
   (
      viewSource : Windows.ApplicationModel.Core.IFrameworkViewSource
   )
   ;
   
   procedure RunWithActivationFactories
   (
      activationFactoryCallback : Windows.Foundation.IGetActivationFactory
   )
   ;
   
end;
