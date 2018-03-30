--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.UI.Core.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface;
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs is access all EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface'Class;
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Ptr is access all EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISystemNavigationManagerPreview_Interface;
   type ISystemNavigationManagerPreview is access all ISystemNavigationManagerPreview_Interface'Class;
   type ISystemNavigationManagerPreview_Ptr is access all ISystemNavigationManagerPreview;
   type ISystemNavigationManagerPreviewStatics_Interface;
   type ISystemNavigationManagerPreviewStatics is access all ISystemNavigationManagerPreviewStatics_Interface'Class;
   type ISystemNavigationManagerPreviewStatics_Ptr is access all ISystemNavigationManagerPreviewStatics;
   type ISystemNavigationCloseRequestedPreviewEventArgs_Interface;
   type ISystemNavigationCloseRequestedPreviewEventArgs is access all ISystemNavigationCloseRequestedPreviewEventArgs_Interface'Class;
   type ISystemNavigationCloseRequestedPreviewEventArgs_Ptr is access all ISystemNavigationCloseRequestedPreviewEventArgs;
   
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
   type ISystemNavigationManagerPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CloseRequested
   (
      This       : access ISystemNavigationManagerPreview_Interface
      ; handler : Windows.UI.Core.Preview.EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CloseRequested
   (
      This       : access ISystemNavigationManagerPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemNavigationManagerPreview : aliased constant Windows.IID := (3965650056, 25637, 18295, (165, 54, 203, 86, 52, 66, 127, 13 ));
   
   ------------------------------------------------------------------------
   type ISystemNavigationManagerPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISystemNavigationManagerPreviewStatics_Interface
      ; RetVal : access Windows.UI.Core.Preview.ISystemNavigationManagerPreview
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemNavigationManagerPreviewStatics : aliased constant Windows.IID := (244781920, 57204, 19406, (132, 203, 189, 17, 129, 172, 10, 113 ));
   
   ------------------------------------------------------------------------
   type ISystemNavigationCloseRequestedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemNavigationCloseRequestedPreviewEventArgs : aliased constant Windows.IID := (2211450337, 52197, 20273, (132, 20, 54, 29, 160, 70, 81, 143 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   IID_EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs : aliased constant Windows.IID := (29139011, 19721, 23012, (177, 179, 162, 206, 36, 98, 158, 65 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SystemNavigationCloseRequestedPreviewEventArgs is Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs;
   subtype SystemNavigationManagerPreview is Windows.UI.Core.Preview.ISystemNavigationManagerPreview;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForCurrentView
   return Windows.UI.Core.Preview.ISystemNavigationManagerPreview;

end;
