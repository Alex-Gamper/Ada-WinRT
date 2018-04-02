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
limited with Windows.UI.Composition;
limited with Windows.UI.Xaml.Controls;
with Windows.Foundation;
with Windows; use Windows;
limited with Windows.UI.Xaml.Controls.Primitives;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Hosting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DesignerAppViewState is (
      Visible,
      Hidden
   );
   for DesignerAppViewState use (
      Visible => 0,
      Hidden => 1
   );
   for DesignerAppViewState'Size use 32;
   
   type DesignerAppViewState_Ptr is access DesignerAppViewState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HostingContract is null record;
   pragma Convention (C_Pass_By_Copy , HostingContract);
   
   type HostingContract_Ptr is access HostingContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface;
   type TypedEventHandler_IDesignerAppManager_add_DesignerAppExited is access all TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface'Class;
   type TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Ptr is access all TypedEventHandler_IDesignerAppManager_add_DesignerAppExited;
   type AsyncOperationCompletedHandler_IDesignerAppView_Interface;
   type AsyncOperationCompletedHandler_IDesignerAppView is access all AsyncOperationCompletedHandler_IDesignerAppView_Interface'Class;
   type AsyncOperationCompletedHandler_IDesignerAppView_Ptr is access all AsyncOperationCompletedHandler_IDesignerAppView;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IElementCompositionPreview_Interface;
   type IElementCompositionPreview is access all IElementCompositionPreview_Interface'Class;
   type IElementCompositionPreview_Ptr is access all IElementCompositionPreview;
   type IElementCompositionPreviewStatics_Interface;
   type IElementCompositionPreviewStatics is access all IElementCompositionPreviewStatics_Interface'Class;
   type IElementCompositionPreviewStatics_Ptr is access all IElementCompositionPreviewStatics;
   type IElementCompositionPreviewStatics2_Interface;
   type IElementCompositionPreviewStatics2 is access all IElementCompositionPreviewStatics2_Interface'Class;
   type IElementCompositionPreviewStatics2_Ptr is access all IElementCompositionPreviewStatics2;
   type IXamlUIPresenterHost_Interface;
   type IXamlUIPresenterHost is access all IXamlUIPresenterHost_Interface'Class;
   type IXamlUIPresenterHost_Ptr is access all IXamlUIPresenterHost;
   type IXamlUIPresenterHost2_Interface;
   type IXamlUIPresenterHost2 is access all IXamlUIPresenterHost2_Interface'Class;
   type IXamlUIPresenterHost2_Ptr is access all IXamlUIPresenterHost2;
   type IXamlUIPresenterHost3_Interface;
   type IXamlUIPresenterHost3 is access all IXamlUIPresenterHost3_Interface'Class;
   type IXamlUIPresenterHost3_Ptr is access all IXamlUIPresenterHost3;
   type IDesignerAppExitedEventArgs_Interface;
   type IDesignerAppExitedEventArgs is access all IDesignerAppExitedEventArgs_Interface'Class;
   type IDesignerAppExitedEventArgs_Ptr is access all IDesignerAppExitedEventArgs;
   type IDesignerAppManager_Interface;
   type IDesignerAppManager is access all IDesignerAppManager_Interface'Class;
   type IDesignerAppManager_Ptr is access all IDesignerAppManager;
   type IDesignerAppManagerFactory_Interface;
   type IDesignerAppManagerFactory is access all IDesignerAppManagerFactory_Interface'Class;
   type IDesignerAppManagerFactory_Ptr is access all IDesignerAppManagerFactory;
   type IDesignerAppView_Interface;
   type IDesignerAppView is access all IDesignerAppView_Interface'Class;
   type IDesignerAppView_Ptr is access all IDesignerAppView;
   type IXamlUIPresenter_Interface;
   type IXamlUIPresenter is access all IXamlUIPresenter_Interface'Class;
   type IXamlUIPresenter_Ptr is access all IXamlUIPresenter;
   type IXamlUIPresenterStatics_Interface;
   type IXamlUIPresenterStatics is access all IXamlUIPresenterStatics_Interface'Class;
   type IXamlUIPresenterStatics_Ptr is access all IXamlUIPresenterStatics;
   type IXamlUIPresenterStatics2_Interface;
   type IXamlUIPresenterStatics2 is access all IXamlUIPresenterStatics2_Interface'Class;
   type IXamlUIPresenterStatics2_Ptr is access all IXamlUIPresenterStatics2;
   type IAsyncOperation_IDesignerAppView_Interface;
   type IAsyncOperation_IDesignerAppView is access all IAsyncOperation_IDesignerAppView_Interface'Class;
   type IAsyncOperation_IDesignerAppView_Ptr is access all IAsyncOperation_IDesignerAppView;
   
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
   type IElementCompositionPreview_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IElementCompositionPreview : aliased constant Windows.IID := (3069290102, 53222, 18092, (172, 246, 196, 104, 123, 182, 94, 96 ));
   
   ------------------------------------------------------------------------
   type IElementCompositionPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetElementVisual
   (
      This       : access IElementCompositionPreviewStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function GetElementChildVisual
   (
      This       : access IElementCompositionPreviewStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function SetElementChildVisual
   (
      This       : access IElementCompositionPreviewStatics_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; visual : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function GetScrollViewerManipulationPropertySet
   (
      This       : access IElementCompositionPreviewStatics_Interface
      ; scrollViewer : Windows.UI.Xaml.Controls.IScrollViewer
      ; RetVal : access Windows.UI.Composition.ICompositionPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IElementCompositionPreviewStatics : aliased constant Windows.IID := (147401528, 60569, 19541, (188, 133, 161, 193, 128, 178, 118, 70 ));
   
   ------------------------------------------------------------------------
   type IElementCompositionPreviewStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetImplicitShowAnimation
   (
      This       : access IElementCompositionPreviewStatics2_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   function SetImplicitHideAnimation
   (
      This       : access IElementCompositionPreviewStatics2_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   function SetIsTranslationEnabled
   (
      This       : access IElementCompositionPreviewStatics2_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPointerPositionPropertySet
   (
      This       : access IElementCompositionPreviewStatics2_Interface
      ; targetElement : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Composition.ICompositionPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IElementCompositionPreviewStatics2 : aliased constant Windows.IID := (605327291, 9174, 20279, (186, 12, 7, 51, 231, 153, 114, 45 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenterHost_Interface is interface and Windows.IInspectable_Interface;
   
   function ResolveFileResource
   (
      This       : access IXamlUIPresenterHost_Interface
      ; path : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenterHost : aliased constant Windows.IID := (2868610253, 40813, 20352, (172, 44, 14, 108, 185, 243, 22, 89 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenterHost2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetGenericXamlFilePath
   (
      This       : access IXamlUIPresenterHost2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenterHost2 : aliased constant Windows.IID := (1633244786, 31908, 18977, (181, 106, 136, 244, 129, 35, 136, 202 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenterHost3_Interface is interface and Windows.IInspectable_Interface;
   
   function ResolveDictionaryResource
   (
      This       : access IXamlUIPresenterHost3_Interface
      ; dictionary : Windows.UI.Xaml.IResourceDictionary
      ; dictionaryKey : Windows.Object
      ; suggestedValue : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenterHost3 : aliased constant Windows.IID := (2973930175, 29472, 16827, (159, 38, 77, 111, 211, 77, 180, 90 ));
   
   ------------------------------------------------------------------------
   type IDesignerAppExitedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExitCode
   (
      This       : access IDesignerAppExitedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IDesignerAppExitedEventArgs : aliased constant Windows.IID := (4138387562, 3245, 16652, (143, 98, 220, 41, 54, 21, 28, 116 ));
   
   ------------------------------------------------------------------------
   type IDesignerAppManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppUserModelId
   (
      This       : access IDesignerAppManager_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_DesignerAppExited
   (
      This       : access IDesignerAppManager_Interface
      ; value : TypedEventHandler_IDesignerAppManager_add_DesignerAppExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DesignerAppExited
   (
      This       : access IDesignerAppManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateNewViewAsync
   (
      This       : access IDesignerAppManager_Interface
      ; initialViewState : Windows.UI.Xaml.Hosting.DesignerAppViewState
      ; initialViewSize : Windows.Foundation.Size
      ; RetVal : access Windows.UI.Xaml.Hosting.IAsyncOperation_IDesignerAppView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadObjectIntoAppAsync
   (
      This       : access IDesignerAppManager_Interface
      ; dllName : Windows.String
      ; classId : Windows.Guid
      ; initializationData : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IDesignerAppManager : aliased constant Windows.IID := (2787585194, 54726, 16587, (171, 217, 39, 186, 67, 131, 27, 183 ));
   
   ------------------------------------------------------------------------
   type IDesignerAppManagerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IDesignerAppManagerFactory_Interface
      ; appUserModelId : Windows.String
      ; RetVal : access Windows.UI.Xaml.Hosting.IDesignerAppManager
   )
   return Windows.HRESULT is abstract;
   
   IID_IDesignerAppManagerFactory : aliased constant Windows.IID := (2409456443, 4710, 19470, (132, 153, 13, 184, 91, 189, 76, 67 ));
   
   ------------------------------------------------------------------------
   type IDesignerAppView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ApplicationViewId
   (
      This       : access IDesignerAppView_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AppUserModelId
   (
      This       : access IDesignerAppView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewState
   (
      This       : access IDesignerAppView_Interface
      ; RetVal : access Windows.UI.Xaml.Hosting.DesignerAppViewState
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewSize
   (
      This       : access IDesignerAppView_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function UpdateViewAsync
   (
      This       : access IDesignerAppView_Interface
      ; viewState : Windows.UI.Xaml.Hosting.DesignerAppViewState
      ; viewSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IDesignerAppView : aliased constant Windows.IID := (1551334634, 56689, 19076, (165, 111, 218, 203, 75, 20, 112, 111 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RootElement
   (
      This       : access IXamlUIPresenter_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_RootElement
   (
      This       : access IXamlUIPresenter_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_ThemeKey
   (
      This       : access IXamlUIPresenter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ThemeKey
   (
      This       : access IXamlUIPresenter_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ThemeResourcesXaml
   (
      This       : access IXamlUIPresenter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ThemeResourcesXaml
   (
      This       : access IXamlUIPresenter_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetSize
   (
      This       : access IXamlUIPresenter_Interface
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Render
   (
      This       : access IXamlUIPresenter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Present
   (
      This       : access IXamlUIPresenter_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenter : aliased constant Windows.IID := (2803143754, 5657, 20422, (179, 27, 137, 81, 46, 240, 34, 162 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompleteTimelinesAutomatically
   (
      This       : access IXamlUIPresenterStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CompleteTimelinesAutomatically
   (
      This       : access IXamlUIPresenterStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetHost
   (
      This       : access IXamlUIPresenterStatics_Interface
      ; host : Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
   )
   return Windows.HRESULT is abstract;
   
   function NotifyWindowSizeChanged
   (
      This       : access IXamlUIPresenterStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenterStatics : aliased constant Windows.IID := (1911220936, 17889, 16786, (133, 170, 58, 66, 46, 221, 35, 207 ));
   
   ------------------------------------------------------------------------
   type IXamlUIPresenterStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFlyoutPlacementTargetInfo
   (
      This       : access IXamlUIPresenterStatics2_Interface
      ; placementTarget : Windows.UI.Xaml.IFrameworkElement
      ; preferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; targetPreferredPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : access Windows.Boolean
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetFlyoutPlacement
   (
      This       : access IXamlUIPresenterStatics2_Interface
      ; placementTargetBounds : Windows.Foundation.Rect
      ; controlSize : Windows.Foundation.Size
      ; minControlSize : Windows.Foundation.Size
      ; containerRect : Windows.Foundation.Rect
      ; targetPreferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : Windows.Boolean
      ; chosenPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IXamlUIPresenterStatics2 : aliased constant Windows.IID := (1550543058, 53020, 20307, (191, 9, 106, 116, 95, 122, 151, 3 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IDesignerAppView_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDesignerAppView_Interface
      ; handler : Windows.UI.Xaml.Hosting.AsyncOperationCompletedHandler_IDesignerAppView
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDesignerAppView_Interface
      ; RetVal : access Windows.UI.Xaml.Hosting.AsyncOperationCompletedHandler_IDesignerAppView
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDesignerAppView_Interface
      ; RetVal : access Windows.UI.Xaml.Hosting.IDesignerAppView
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IDesignerAppView : aliased constant Windows.IID := (1237763672, 7122, 22558, (163, 133, 110, 179, 253, 155, 254, 227 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Hosting.IDesignerAppManager ; args : Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface
      ; sender : Windows.UI.Xaml.Hosting.IDesignerAppManager
      ; args : Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDesignerAppManager_add_DesignerAppExited : aliased constant Windows.IID := (930270872, 39840, 20555, (138, 13, 54, 183, 248, 22, 161, 194 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IDesignerAppView_Interface(Callback : access procedure (asyncInfo : Windows.UI.Xaml.Hosting.IAsyncOperation_IDesignerAppView ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IDesignerAppView_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDesignerAppView_Interface
      ; asyncInfo : Windows.UI.Xaml.Hosting.IAsyncOperation_IDesignerAppView
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IDesignerAppView : aliased constant Windows.IID := (2934646574, 43028, 22913, (162, 195, 98, 62, 34, 110, 74, 113 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ElementCompositionPreview is Windows.UI.Xaml.Hosting.IElementCompositionPreview;
   subtype DesignerAppExitedEventArgs is Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs;
   subtype DesignerAppManager is Windows.UI.Xaml.Hosting.IDesignerAppManager;
   
   function Create
   (
      appUserModelId : Windows.String
   )
   return Windows.UI.Xaml.Hosting.IDesignerAppManager;
   
   subtype DesignerAppView is Windows.UI.Xaml.Hosting.IDesignerAppView;
   subtype XamlUIPresenter is Windows.UI.Xaml.Hosting.IXamlUIPresenter;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetElementVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual;
   
   function GetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual;
   
   procedure SetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
      ; visual : Windows.UI.Composition.IVisual
   )
   ;
   
   function GetScrollViewerManipulationPropertySet
   (
      scrollViewer : Windows.UI.Xaml.Controls.IScrollViewer
   )
   return Windows.UI.Composition.ICompositionPropertySet;
   
   procedure SetImplicitShowAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   ;
   
   procedure SetImplicitHideAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   ;
   
   procedure SetIsTranslationEnabled
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   ;
   
   function GetPointerPositionPropertySet
   (
      targetElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.ICompositionPropertySet;
   
   function get_CompleteTimelinesAutomatically
   return Windows.Boolean;
   
   procedure put_CompleteTimelinesAutomatically
   (
      value : Windows.Boolean
   )
   ;
   
   procedure SetHost
   (
      host : Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
   )
   ;
   
   procedure NotifyWindowSizeChanged
   ;
   
   function GetFlyoutPlacementTargetInfo
   (
      placementTarget : Windows.UI.Xaml.IFrameworkElement
      ; preferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; targetPreferredPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : access Windows.Boolean
   )
   return Windows.Foundation.Rect;
   
   function GetFlyoutPlacement
   (
      placementTargetBounds : Windows.Foundation.Rect
      ; controlSize : Windows.Foundation.Size
      ; minControlSize : Windows.Foundation.Size
      ; containerRect : Windows.Foundation.Rect
      ; targetPreferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : Windows.Boolean
      ; chosenPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.Foundation.Rect;

end;
