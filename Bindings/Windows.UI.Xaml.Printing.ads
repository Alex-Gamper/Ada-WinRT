--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Graphics.Printing;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Printing is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PreviewPageCountType is (
      Final,
      Intermediate
   );
   for PreviewPageCountType use (
      Final => 0,
      Intermediate => 1
   );
   for PreviewPageCountType'Size use 32;
   
   type PreviewPageCountType_Ptr is access PreviewPageCountType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AddPagesEventHandler_Interface;
   type AddPagesEventHandler is access all AddPagesEventHandler_Interface'Class;
   type AddPagesEventHandler_Ptr is access all AddPagesEventHandler;
   type GetPreviewPageEventHandler_Interface;
   type GetPreviewPageEventHandler is access all GetPreviewPageEventHandler_Interface'Class;
   type GetPreviewPageEventHandler_Ptr is access all GetPreviewPageEventHandler;
   type PaginateEventHandler_Interface;
   type PaginateEventHandler is access all PaginateEventHandler_Interface'Class;
   type PaginateEventHandler_Ptr is access all PaginateEventHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAddPagesEventArgs_Interface;
   type IAddPagesEventArgs is access all IAddPagesEventArgs_Interface'Class;
   type IAddPagesEventArgs_Ptr is access all IAddPagesEventArgs;
   type IGetPreviewPageEventArgs_Interface;
   type IGetPreviewPageEventArgs is access all IGetPreviewPageEventArgs_Interface'Class;
   type IGetPreviewPageEventArgs_Ptr is access all IGetPreviewPageEventArgs;
   type IPaginateEventArgs_Interface;
   type IPaginateEventArgs is access all IPaginateEventArgs_Interface'Class;
   type IPaginateEventArgs_Ptr is access all IPaginateEventArgs;
   type IPrintDocument_Interface;
   type IPrintDocument is access all IPrintDocument_Interface'Class;
   type IPrintDocument_Ptr is access all IPrintDocument;
   type IPrintDocumentStatics_Interface;
   type IPrintDocumentStatics is access all IPrintDocumentStatics_Interface'Class;
   type IPrintDocumentStatics_Ptr is access all IPrintDocumentStatics;
   type IPrintDocumentFactory_Interface;
   type IPrintDocumentFactory is access all IPrintDocumentFactory_Interface'Class;
   type IPrintDocumentFactory_Ptr is access all IPrintDocumentFactory;
   
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
   type IAddPagesEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrintTaskOptions
   (
      This       : access IAddPagesEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskOptionsCore
   )
   return Windows.HRESULT is abstract;
   
   IID_IAddPagesEventArgs : aliased constant Windows.IID := (3806669797, 1388, 17440, (151, 149, 203, 53, 38, 206, 12, 32 ));
   
   ------------------------------------------------------------------------
   type IGetPreviewPageEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PageNumber
   (
      This       : access IGetPreviewPageEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGetPreviewPageEventArgs : aliased constant Windows.IID := (2755489853, 57001, 19958, (167, 237, 53, 4, 156, 212, 133, 199 ));
   
   ------------------------------------------------------------------------
   type IPaginateEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrintTaskOptions
   (
      This       : access IPaginateEventArgs_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintTaskOptionsCore
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPreviewPageNumber
   (
      This       : access IPaginateEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaginateEventArgs : aliased constant Windows.IID := (3985924054, 31147, 17079, (147, 10, 61, 110, 9, 1, 29, 33 ));
   
   ------------------------------------------------------------------------
   type IPrintDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DocumentSource
   (
      This       : access IPrintDocument_Interface
      ; RetVal : access Windows.Graphics.Printing.IPrintDocumentSource
   )
   return Windows.HRESULT is abstract;
   
   function add_Paginate
   (
      This       : access IPrintDocument_Interface
      ; value : Windows.UI.Xaml.Printing.PaginateEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Paginate
   (
      This       : access IPrintDocument_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GetPreviewPage
   (
      This       : access IPrintDocument_Interface
      ; value : Windows.UI.Xaml.Printing.GetPreviewPageEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GetPreviewPage
   (
      This       : access IPrintDocument_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AddPages
   (
      This       : access IPrintDocument_Interface
      ; value : Windows.UI.Xaml.Printing.AddPagesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AddPages
   (
      This       : access IPrintDocument_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function AddPage
   (
      This       : access IPrintDocument_Interface
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function AddPagesComplete
   (
      This       : access IPrintDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetPreviewPageCount
   (
      This       : access IPrintDocument_Interface
      ; count : Windows.Int32
      ; type_x : Windows.UI.Xaml.Printing.PreviewPageCountType
   )
   return Windows.HRESULT is abstract;
   
   function SetPreviewPage
   (
      This       : access IPrintDocument_Interface
      ; pageNumber : Windows.Int32
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function InvalidatePreview
   (
      This       : access IPrintDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrintDocument : aliased constant Windows.IID := (3829606339, 43417, 18523, (177, 216, 114, 220, 81, 120, 33, 230 ));
   
   ------------------------------------------------------------------------
   type IPrintDocumentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DocumentSourceProperty
   (
      This       : access IPrintDocumentStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrintDocumentStatics : aliased constant Windows.IID := (4254534204, 45394, 18912, (166, 189, 106, 166, 71, 126, 67, 199 ));
   
   ------------------------------------------------------------------------
   type IPrintDocumentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPrintDocumentFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Printing.IPrintDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrintDocumentFactory : aliased constant Windows.IID := (4219974031, 9734, 18991, (153, 212, 167, 205, 188, 53, 215, 199 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AddPagesEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Printing.IAddPagesEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AddPagesEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AddPagesEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IAddPagesEventArgs
   )
   return Windows.HRESULT;
   
   IID_AddPagesEventHandler : aliased constant Windows.IID := (3568662896, 22432, 16905, (132, 124, 192, 147, 181, 75, 199, 41 ));
   
   ------------------------------------------------------------------------
   type GetPreviewPageEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access GetPreviewPageEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access GetPreviewPageEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs
   )
   return Windows.HRESULT;
   
   IID_GetPreviewPageEventHandler : aliased constant Windows.IID := (3434342893, 39953, 20048, (171, 73, 233, 128, 134, 187, 253, 239 ));
   
   ------------------------------------------------------------------------
   type PaginateEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Printing.IPaginateEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access PaginateEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access PaginateEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IPaginateEventArgs
   )
   return Windows.HRESULT;
   
   IID_PaginateEventHandler : aliased constant Windows.IID := (213932897, 33051, 18994, (153, 101, 19, 235, 120, 219, 176, 27 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AddPagesEventArgs is Windows.UI.Xaml.Printing.IAddPagesEventArgs;
   
   function CreateAddPagesEventArgs return Windows.UI.Xaml.Printing.IAddPagesEventArgs;
   
   subtype GetPreviewPageEventArgs is Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs;
   
   function CreateGetPreviewPageEventArgs return Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs;
   
   subtype PaginateEventArgs is Windows.UI.Xaml.Printing.IPaginateEventArgs;
   
   function CreatePaginateEventArgs return Windows.UI.Xaml.Printing.IPaginateEventArgs;
   
   subtype PrintDocument is Windows.UI.Xaml.Printing.IPrintDocument;
   
   type IPrintDocument_Interface_Impl is new IPrintDocument_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased IPrintDocument := null;
      m_IPrintDocument : IPrintDocument := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IPrintDocument_Impl is access all IPrintDocument_Interface_Impl'Class;
   type IPrintDocument_Impl_Ptr is access all IPrintDocument_Impl;
   
   function QueryInterface
   (
      This       : access IPrintDocument_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPrintDocument_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPrintDocument_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPrintDocument_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function get_DocumentSource
   (
      This       : access IPrintDocument_Interface_Impl
      ; RetVal : access Windows.Graphics.Printing.IPrintDocumentSource
   )
   return Windows.HRESULT;
   
   function add_Paginate
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.PaginateEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Paginate
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_GetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.GetPreviewPageEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_GetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_AddPages
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.AddPagesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_AddPages
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function AddPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT;
   
   function AddPagesComplete
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.HRESULT;
   
   function SetPreviewPageCount
   (
      This       : access IPrintDocument_Interface_Impl
      ; count : Windows.Int32
      ; type_x : Windows.UI.Xaml.Printing.PreviewPageCountType
   )
   return Windows.HRESULT;
   
   function SetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; pageNumber : Windows.Int32
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT;
   
   function InvalidatePreview
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.HRESULT;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_DocumentSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Printing.IPrintDocument;

end;
