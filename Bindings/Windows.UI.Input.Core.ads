--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.ApplicationModel.Core;
limited with Windows.UI.Core;
--------------------------------------------------------------------------------
package Windows.UI.Input.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRadialControllerIndependentInputSourceStatics_Interface;
   type IRadialControllerIndependentInputSourceStatics is access all IRadialControllerIndependentInputSourceStatics_Interface'Class;
   type IRadialControllerIndependentInputSourceStatics_Ptr is access all IRadialControllerIndependentInputSourceStatics;
   type IRadialControllerIndependentInputSource_Interface;
   type IRadialControllerIndependentInputSource is access all IRadialControllerIndependentInputSource_Interface'Class;
   type IRadialControllerIndependentInputSource_Ptr is access all IRadialControllerIndependentInputSource;
   
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
   type IRadialControllerIndependentInputSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForView
   (
      This       : access IRadialControllerIndependentInputSourceStatics_Interface
      ; view : Windows.ApplicationModel.Core.ICoreApplicationView
      ; RetVal : access Windows.UI.Input.Core.IRadialControllerIndependentInputSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerIndependentInputSourceStatics : aliased constant Windows.IID := (1029144309, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerIndependentInputSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Controller
   (
      This       : access IRadialControllerIndependentInputSource_Interface
      ; RetVal : access Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access IRadialControllerIndependentInputSource_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerIndependentInputSource : aliased constant Windows.IID := (1029144310, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RadialControllerIndependentInputSource is Windows.UI.Input.Core.IRadialControllerIndependentInputSource;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateForView
   (
      view : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.UI.Input.Core.IRadialControllerIndependentInputSource;

end;
