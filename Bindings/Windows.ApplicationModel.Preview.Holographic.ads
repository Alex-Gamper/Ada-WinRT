--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.ApplicationModel.Activation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Preview.Holographic is

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
   
   type IHolographicApplicationPreviewStatics_Interface;
   type IHolographicApplicationPreviewStatics is access all IHolographicApplicationPreviewStatics_Interface'Class;
   type IHolographicApplicationPreviewStatics_Ptr is access all IHolographicApplicationPreviewStatics;
   
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
   type IHolographicApplicationPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsCurrentViewPresentedOnHolographicDisplay
   (
      This       : access IHolographicApplicationPreviewStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsHolographicActivation
   (
      This       : access IHolographicApplicationPreviewStatics_Interface
      ; activatedEventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicApplicationPreviewStatics : aliased constant Windows.IID := (4261643921, 10810, 17833, (162, 8, 123, 237, 105, 25, 25, 243 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsCurrentViewPresentedOnHolographicDisplay
   return Windows.Boolean;
   
   function IsHolographicActivation
   (
      activatedEventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.Boolean;

end;
