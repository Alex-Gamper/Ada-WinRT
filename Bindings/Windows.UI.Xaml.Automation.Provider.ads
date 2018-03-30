--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.UI.Xaml.Automation.Text;
with Windows.Foundation;
limited with Windows.UI.Xaml.Automation.Peers;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Automation.Provider is

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
   
   type IAnnotationProvider_Interface;
   type IAnnotationProvider is access all IAnnotationProvider_Interface'Class;
   type IAnnotationProvider_Ptr is access all IAnnotationProvider;
   type IDockProvider_Interface;
   type IDockProvider is access all IDockProvider_Interface'Class;
   type IDockProvider_Ptr is access all IDockProvider;
   type IDragProvider_Interface;
   type IDragProvider is access all IDragProvider_Interface'Class;
   type IDragProvider_Ptr is access all IDragProvider;
   type IDropTargetProvider_Interface;
   type IDropTargetProvider is access all IDropTargetProvider_Interface'Class;
   type IDropTargetProvider_Ptr is access all IDropTargetProvider;
   type IExpandCollapseProvider_Interface;
   type IExpandCollapseProvider is access all IExpandCollapseProvider_Interface'Class;
   type IExpandCollapseProvider_Ptr is access all IExpandCollapseProvider;
   type IGridItemProvider_Interface;
   type IGridItemProvider is access all IGridItemProvider_Interface'Class;
   type IGridItemProvider_Ptr is access all IGridItemProvider;
   type IGridProvider_Interface;
   type IGridProvider is access all IGridProvider_Interface'Class;
   type IGridProvider_Ptr is access all IGridProvider;
   type IInvokeProvider_Interface;
   type IInvokeProvider is access all IInvokeProvider_Interface'Class;
   type IInvokeProvider_Ptr is access all IInvokeProvider;
   type IItemContainerProvider_Interface;
   type IItemContainerProvider is access all IItemContainerProvider_Interface'Class;
   type IItemContainerProvider_Ptr is access all IItemContainerProvider;
   type IMultipleViewProvider_Interface;
   type IMultipleViewProvider is access all IMultipleViewProvider_Interface'Class;
   type IMultipleViewProvider_Ptr is access all IMultipleViewProvider;
   type IObjectModelProvider_Interface;
   type IObjectModelProvider is access all IObjectModelProvider_Interface'Class;
   type IObjectModelProvider_Ptr is access all IObjectModelProvider;
   type IRangeValueProvider_Interface;
   type IRangeValueProvider is access all IRangeValueProvider_Interface'Class;
   type IRangeValueProvider_Ptr is access all IRangeValueProvider;
   type IScrollItemProvider_Interface;
   type IScrollItemProvider is access all IScrollItemProvider_Interface'Class;
   type IScrollItemProvider_Ptr is access all IScrollItemProvider;
   type IScrollProvider_Interface;
   type IScrollProvider is access all IScrollProvider_Interface'Class;
   type IScrollProvider_Ptr is access all IScrollProvider;
   type ISelectionItemProvider_Interface;
   type ISelectionItemProvider is access all ISelectionItemProvider_Interface'Class;
   type ISelectionItemProvider_Ptr is access all ISelectionItemProvider;
   type ISelectionProvider_Interface;
   type ISelectionProvider is access all ISelectionProvider_Interface'Class;
   type ISelectionProvider_Ptr is access all ISelectionProvider;
   type ISpreadsheetItemProvider_Interface;
   type ISpreadsheetItemProvider is access all ISpreadsheetItemProvider_Interface'Class;
   type ISpreadsheetItemProvider_Ptr is access all ISpreadsheetItemProvider;
   type ISpreadsheetProvider_Interface;
   type ISpreadsheetProvider is access all ISpreadsheetProvider_Interface'Class;
   type ISpreadsheetProvider_Ptr is access all ISpreadsheetProvider;
   type IStylesProvider_Interface;
   type IStylesProvider is access all IStylesProvider_Interface'Class;
   type IStylesProvider_Ptr is access all IStylesProvider;
   type ISynchronizedInputProvider_Interface;
   type ISynchronizedInputProvider is access all ISynchronizedInputProvider_Interface'Class;
   type ISynchronizedInputProvider_Ptr is access all ISynchronizedInputProvider;
   type ITableItemProvider_Interface;
   type ITableItemProvider is access all ITableItemProvider_Interface'Class;
   type ITableItemProvider_Ptr is access all ITableItemProvider;
   type ITableProvider_Interface;
   type ITableProvider is access all ITableProvider_Interface'Class;
   type ITableProvider_Ptr is access all ITableProvider;
   type ITextChildProvider_Interface;
   type ITextChildProvider is access all ITextChildProvider_Interface'Class;
   type ITextChildProvider_Ptr is access all ITextChildProvider;
   type ITextRangeProvider_Interface;
   type ITextRangeProvider is access all ITextRangeProvider_Interface'Class;
   type ITextRangeProvider_Ptr is access all ITextRangeProvider;
   type ITextProvider_Interface;
   type ITextProvider is access all ITextProvider_Interface'Class;
   type ITextProvider_Ptr is access all ITextProvider;
   type ITextProvider2_Interface;
   type ITextProvider2 is access all ITextProvider2_Interface'Class;
   type ITextProvider2_Ptr is access all ITextProvider2;
   type ITextRangeProvider2_Interface;
   type ITextRangeProvider2 is access all ITextRangeProvider2_Interface'Class;
   type ITextRangeProvider2_Ptr is access all ITextRangeProvider2;
   type IToggleProvider_Interface;
   type IToggleProvider is access all IToggleProvider_Interface'Class;
   type IToggleProvider_Ptr is access all IToggleProvider;
   type ITransformProvider_Interface;
   type ITransformProvider is access all ITransformProvider_Interface'Class;
   type ITransformProvider_Ptr is access all ITransformProvider;
   type ITransformProvider2_Interface;
   type ITransformProvider2 is access all ITransformProvider2_Interface'Class;
   type ITransformProvider2_Ptr is access all ITransformProvider2;
   type IValueProvider_Interface;
   type IValueProvider is access all IValueProvider_Interface'Class;
   type IValueProvider_Ptr is access all IValueProvider;
   type IVirtualizedItemProvider_Interface;
   type IVirtualizedItemProvider is access all IVirtualizedItemProvider_Interface'Class;
   type IVirtualizedItemProvider_Ptr is access all IVirtualizedItemProvider;
   type IWindowProvider_Interface;
   type IWindowProvider is access all IWindowProvider_Interface'Class;
   type IWindowProvider_Ptr is access all IWindowProvider;
   type IIRawElementProviderSimple_Interface;
   type IIRawElementProviderSimple is access all IIRawElementProviderSimple_Interface'Class;
   type IIRawElementProviderSimple_Ptr is access all IIRawElementProviderSimple;
   type ICustomNavigationProvider_Interface;
   type ICustomNavigationProvider is access all ICustomNavigationProvider_Interface'Class;
   type ICustomNavigationProvider_Ptr is access all ICustomNavigationProvider;
   type ITextEditProvider_Interface;
   type ITextEditProvider is access all ITextEditProvider_Interface'Class;
   type ITextEditProvider_Ptr is access all ITextEditProvider;
   
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
   type IAnnotationProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnnotationTypeId
   (
      This       : access IAnnotationProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationTypeName
   (
      This       : access IAnnotationProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Author
   (
      This       : access IAnnotationProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTime
   (
      This       : access IAnnotationProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Target
   (
      This       : access IAnnotationProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_IAnnotationProvider : aliased constant Windows.IID := (2512000023, 17463, 17691, (148, 97, 5, 10, 73, 181, 157, 6 ));
   
   ------------------------------------------------------------------------
   type IDockProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DockPosition
   (
      This       : access IDockProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.DockPosition
   )
   return Windows.HRESULT is abstract;
   
   function SetDockPosition
   (
      This       : access IDockProvider_Interface
      ; dockPosition : Windows.UI.Xaml.Automation.DockPosition
   )
   return Windows.HRESULT is abstract;
   
   IID_IDockProvider : aliased constant Windows.IID := (1220690936, 30897, 17568, (172, 95, 117, 7, 87, 188, 222, 60 ));
   
   ------------------------------------------------------------------------
   type IDragProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsGrabbed
   (
      This       : access IDragProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEffect
   (
      This       : access IDragProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEffects
   (
      This       : access IDragProvider_Interface
      ; RetVal : access String_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetGrabbedItems
   (
      This       : access IDragProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_IDragProvider : aliased constant Windows.IID := (779585193, 32764, 20311, (185, 101, 30, 241, 243, 115, 245, 70 ));
   
   ------------------------------------------------------------------------
   type IDropTargetProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropEffect
   (
      This       : access IDropTargetProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEffects
   (
      This       : access IDropTargetProvider_Interface
      ; RetVal : access String_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDropTargetProvider : aliased constant Windows.IID := (2049203165, 46168, 20448, (152, 200, 170, 200, 157, 245, 109, 97 ));
   
   ------------------------------------------------------------------------
   type IExpandCollapseProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpandCollapseState
   (
      This       : access IExpandCollapseProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.ExpandCollapseState
   )
   return Windows.HRESULT is abstract;
   
   function Collapse
   (
      This       : access IExpandCollapseProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Expand
   (
      This       : access IExpandCollapseProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IExpandCollapseProvider : aliased constant Windows.IID := (1236042649, 54822, 17731, (148, 185, 166, 217, 169, 89, 58, 246 ));
   
   ------------------------------------------------------------------------
   type IGridItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Column
   (
      This       : access IGridItemProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ColumnSpan
   (
      This       : access IGridItemProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainingGrid
   (
      This       : access IGridItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function get_Row
   (
      This       : access IGridItemProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RowSpan
   (
      This       : access IGridItemProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridItemProvider : aliased constant Windows.IID := (4294142012, 29703, 17851, (169, 54, 223, 62, 214, 211, 131, 125 ));
   
   ------------------------------------------------------------------------
   type IGridProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColumnCount
   (
      This       : access IGridProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RowCount
   (
      This       : access IGridProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetItem
   (
      This       : access IGridProvider_Interface
      ; row : Windows.Int32
      ; column : Windows.Int32
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_IGridProvider : aliased constant Windows.IID := (2338502560, 37676, 17552, (154, 19, 2, 253, 179, 154, 143, 91 ));
   
   ------------------------------------------------------------------------
   type IInvokeProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function Invoke
   (
      This       : access IInvokeProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IInvokeProvider : aliased constant Windows.IID := (4157710727, 45372, 17728, (176, 158, 103, 120, 226, 220, 155, 165 ));
   
   ------------------------------------------------------------------------
   type IItemContainerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function FindItemByProperty
   (
      This       : access IItemContainerProvider_Interface
      ; startAfter : Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
      ; automationProperty : Windows.UI.Xaml.Automation.IAutomationProperty
      ; value : Windows.Object
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_IItemContainerProvider : aliased constant Windows.IID := (4015839301, 57812, 16628, (186, 213, 199, 250, 212, 74, 112, 62 ));
   
   ------------------------------------------------------------------------
   type IMultipleViewProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentView
   (
      This       : access IMultipleViewProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedViews
   (
      This       : access IMultipleViewProvider_Interface
      ; RetVal : access Int32_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetViewName
   (
      This       : access IMultipleViewProvider_Interface
      ; viewId : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetCurrentView
   (
      This       : access IMultipleViewProvider_Interface
      ; viewId : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IMultipleViewProvider : aliased constant Windows.IID := (3491029398, 3664, 18499, (165, 210, 194, 40, 151, 200, 132, 90 ));
   
   ------------------------------------------------------------------------
   type IObjectModelProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetUnderlyingObjectModel
   (
      This       : access IObjectModelProvider_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_IObjectModelProvider : aliased constant Windows.IID := (3284809401, 1939, 20176, (187, 244, 159, 244, 224, 249, 143, 128 ));
   
   ------------------------------------------------------------------------
   type IRangeValueProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnly
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeChange
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Maximum
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Minimum
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallChange
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IRangeValueProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IRangeValueProvider_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IRangeValueProvider : aliased constant Windows.IID := (2206872744, 32095, 16505, (175, 3, 195, 208, 21, 233, 52, 19 ));
   
   ------------------------------------------------------------------------
   type IScrollItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function ScrollIntoView
   (
      This       : access IScrollItemProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollItemProvider : aliased constant Windows.IID := (2587803792, 23852, 20034, (158, 230, 157, 88, 219, 16, 11, 85 ));
   
   ------------------------------------------------------------------------
   type IScrollProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontallyScrollable
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalScrollPercent
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalViewSize
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticallyScrollable
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalScrollPercent
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalViewSize
   (
      This       : access IScrollProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Scroll
   (
      This       : access IScrollProvider_Interface
      ; horizontalAmount : Windows.UI.Xaml.Automation.ScrollAmount
      ; verticalAmount : Windows.UI.Xaml.Automation.ScrollAmount
   )
   return Windows.HRESULT is abstract;
   
   function SetScrollPercent
   (
      This       : access IScrollProvider_Interface
      ; horizontalPercent : Windows.Double
      ; verticalPercent : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IScrollProvider : aliased constant Windows.IID := (927724929, 30486, 19388, (130, 235, 217, 151, 0, 110, 169, 153 ));
   
   ------------------------------------------------------------------------
   type ISelectionItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelected
   (
      This       : access ISelectionItemProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionContainer
   (
      This       : access ISelectionItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function AddToSelection
   (
      This       : access ISelectionItemProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFromSelection
   (
      This       : access ISelectionItemProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Select_x
   (
      This       : access ISelectionItemProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectionItemProvider : aliased constant Windows.IID := (1783199681, 33549, 17106, (191, 98, 4, 46, 189, 222, 204, 25 ));
   
   ------------------------------------------------------------------------
   type ISelectionProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanSelectMultiple
   (
      This       : access ISelectionProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSelectionRequired
   (
      This       : access ISelectionProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetSelection
   (
      This       : access ISelectionProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_ISelectionProvider : aliased constant Windows.IID := (520196042, 47428, 17301, (141, 225, 136, 246, 116, 175, 81, 211 ));
   
   ------------------------------------------------------------------------
   type ISpreadsheetItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Formula
   (
      This       : access ISpreadsheetItemProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationObjects
   (
      This       : access ISpreadsheetItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationTypes
   (
      This       : access ISpreadsheetItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.AnnotationType_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpreadsheetItemProvider : aliased constant Windows.IID := (3957231506, 24597, 18470, (183, 25, 71, 82, 26, 129, 198, 126 ));
   
   ------------------------------------------------------------------------
   type ISpreadsheetProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemByName
   (
      This       : access ISpreadsheetProvider_Interface
      ; name : Windows.String
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpreadsheetProvider : aliased constant Windows.IID := (355831955, 48537, 19709, (159, 7, 59, 20, 179, 21, 226, 61 ));
   
   ------------------------------------------------------------------------
   type IStylesProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedProperties
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FillColor
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_FillPatternColor
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_FillPatternStyle
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Shape
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleId
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleName
   (
      This       : access IStylesProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStylesProvider : aliased constant Windows.IID := (442202647, 31745, 19436, (156, 212, 45, 250, 125, 194, 70, 205 ));
   
   ------------------------------------------------------------------------
   type ISynchronizedInputProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function Cancel
   (
      This       : access ISynchronizedInputProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartListening
   (
      This       : access ISynchronizedInputProvider_Interface
      ; inputType : Windows.UI.Xaml.Automation.SynchronizedInputType
   )
   return Windows.HRESULT is abstract;
   
   IID_ISynchronizedInputProvider : aliased constant Windows.IID := (1029754571, 55892, 19107, (185, 21, 227, 36, 68, 39, 212, 172 ));
   
   ------------------------------------------------------------------------
   type ITableItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetColumnHeaderItems
   (
      This       : access ITableItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function GetRowHeaderItems
   (
      This       : access ITableItemProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_ITableItemProvider : aliased constant Windows.IID := (992758221, 7650, 20194, (163, 225, 251, 85, 53, 89, 209, 93 ));
   
   ------------------------------------------------------------------------
   type ITableProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RowOrColumnMajor
   (
      This       : access ITableProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.RowOrColumnMajor
   )
   return Windows.HRESULT is abstract;
   
   function GetColumnHeaders
   (
      This       : access ITableProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function GetRowHeaders
   (
      This       : access ITableProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_ITableProvider : aliased constant Windows.IID := (2056180633, 26660, 17813, (186, 179, 70, 75, 201, 160, 68, 23 ));
   
   ------------------------------------------------------------------------
   type ITextChildProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextContainer
   (
      This       : access ITextChildProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function get_TextRange
   (
      This       : access ITextChildProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextChildProvider : aliased constant Windows.IID := (288604982, 43163, 16688, (155, 230, 85, 227, 51, 52, 245, 87 ));
   
   ------------------------------------------------------------------------
   type ITextRangeProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function Clone
   (
      This       : access ITextRangeProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function Compare
   (
      This       : access ITextRangeProvider_Interface
      ; textRangeProvider : Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CompareEndpoints
   (
      This       : access ITextRangeProvider_Interface
      ; endpoint : Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
      ; textRangeProvider : Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
      ; targetEndpoint : Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ExpandToEnclosingUnit
   (
      This       : access ITextRangeProvider_Interface
      ; unit : Windows.UI.Xaml.Automation.Text.TextUnit
   )
   return Windows.HRESULT is abstract;
   
   function FindAttribute
   (
      This       : access ITextRangeProvider_Interface
      ; attributeId : Windows.Int32
      ; value : Windows.Object
      ; backward : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function FindText
   (
      This       : access ITextRangeProvider_Interface
      ; text : Windows.String
      ; backward : Windows.Boolean
      ; ignoreCase : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetAttributeValue
   (
      This       : access ITextRangeProvider_Interface
      ; attributeId : Windows.Int32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetBoundingRectangles
   (
      This       : access ITextRangeProvider_Interface
      ; returnValue : access Windows.Double_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetEnclosingElement
   (
      This       : access ITextRangeProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   function GetText
   (
      This       : access ITextRangeProvider_Interface
      ; maxLength : Windows.Int32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Move
   (
      This       : access ITextRangeProvider_Interface
      ; unit : Windows.UI.Xaml.Automation.Text.TextUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveEndpointByUnit
   (
      This       : access ITextRangeProvider_Interface
      ; endpoint : Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
      ; unit : Windows.UI.Xaml.Automation.Text.TextUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveEndpointByRange
   (
      This       : access ITextRangeProvider_Interface
      ; endpoint : Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
      ; textRangeProvider : Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
      ; targetEndpoint : Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
   )
   return Windows.HRESULT is abstract;
   
   function Select_x
   (
      This       : access ITextRangeProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AddToSelection
   (
      This       : access ITextRangeProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFromSelection
   (
      This       : access ITextRangeProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ScrollIntoView
   (
      This       : access ITextRangeProvider_Interface
      ; alignToTop : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetChildren
   (
      This       : access ITextRangeProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextRangeProvider : aliased constant Windows.IID := (41183373, 1769, 20326, (148, 70, 40, 165, 190, 152, 251, 208 ));
   
   ------------------------------------------------------------------------
   type ITextProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DocumentRange
   (
      This       : access ITextProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedTextSelection
   (
      This       : access ITextProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.SupportedTextSelection
   )
   return Windows.HRESULT is abstract;
   
   function GetSelection
   (
      This       : access ITextProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetVisibleRanges
   (
      This       : access ITextProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function RangeFromChild
   (
      This       : access ITextProvider_Interface
      ; childElement : Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function RangeFromPoint
   (
      This       : access ITextProvider_Interface
      ; screenLocation : Windows.Foundation.Point
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextProvider : aliased constant Windows.IID := (3680222367, 18439, 20266, (134, 120, 27, 19, 243, 198, 14, 34 ));
   
   ------------------------------------------------------------------------
   type ITextProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function RangeFromAnnotation
   (
      This       : access ITextProvider2_Interface
      ; annotationElement : Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetCaretRange
   (
      This       : access ITextProvider2_Interface
      ; isActive : access Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextProvider2 : aliased constant Windows.IID := (3743238332, 1159, 20095, (157, 94, 240, 158, 119, 228, 18, 70 ));
   
   ------------------------------------------------------------------------
   type ITextRangeProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowContextMenu
   (
      This       : access ITextRangeProvider2_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextRangeProvider2 : aliased constant Windows.IID := (3552460283, 40788, 17986, (167, 165, 92, 24, 213, 238, 42, 63 ));
   
   ------------------------------------------------------------------------
   type IToggleProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ToggleState
   (
      This       : access IToggleProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.ToggleState
   )
   return Windows.HRESULT is abstract;
   
   function Toggle
   (
      This       : access IToggleProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IToggleProvider : aliased constant Windows.IID := (2478342800, 25967, 17655, (174, 175, 120, 184, 249, 68, 208, 98 ));
   
   ------------------------------------------------------------------------
   type ITransformProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanMove
   (
      This       : access ITransformProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanResize
   (
      This       : access ITransformProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRotate
   (
      This       : access ITransformProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Move
   (
      This       : access ITransformProvider_Interface
      ; x : Windows.Double
      ; y : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Resize
   (
      This       : access ITransformProvider_Interface
      ; width : Windows.Double
      ; height : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Rotate
   (
      This       : access ITransformProvider_Interface
      ; degrees : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ITransformProvider : aliased constant Windows.IID := (2036797405, 63145, 19045, (175, 23, 134, 29, 183, 153, 162, 218 ));
   
   ------------------------------------------------------------------------
   type ITransformProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanZoom
   (
      This       : access ITransformProvider2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevel
   (
      This       : access ITransformProvider2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxZoom
   (
      This       : access ITransformProvider2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinZoom
   (
      This       : access ITransformProvider2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Zoom
   (
      This       : access ITransformProvider2_Interface
      ; zoom : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function ZoomByUnit
   (
      This       : access ITransformProvider2_Interface
      ; zoomUnit : Windows.UI.Xaml.Automation.ZoomUnit
   )
   return Windows.HRESULT is abstract;
   
   IID_ITransformProvider2 : aliased constant Windows.IID := (2830178134, 41887, 20119, (140, 125, 193, 234, 141, 214, 51, 197 ));
   
   ------------------------------------------------------------------------
   type IValueProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnly
   (
      This       : access IValueProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IValueProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IValueProvider_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IValueProvider : aliased constant Windows.IID := (545699751, 44046, 18385, (171, 155, 42, 100, 41, 42, 253, 248 ));
   
   ------------------------------------------------------------------------
   type IVirtualizedItemProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function Realize
   (
      This       : access IVirtualizedItemProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IVirtualizedItemProvider : aliased constant Windows.IID := (399810635, 54872, 18656, (165, 116, 90, 81, 108, 88, 223, 167 ));
   
   ------------------------------------------------------------------------
   type IWindowProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsModal
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTopmost
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Maximizable
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Minimizable
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InteractionState
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.WindowInteractionState
   )
   return Windows.HRESULT is abstract;
   
   function get_VisualState
   (
      This       : access IWindowProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.WindowVisualState
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IWindowProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetVisualState
   (
      This       : access IWindowProvider_Interface
      ; state : Windows.UI.Xaml.Automation.WindowVisualState
   )
   return Windows.HRESULT is abstract;
   
   function WaitForInputIdle
   (
      This       : access IWindowProvider_Interface
      ; milliseconds : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IWindowProvider : aliased constant Windows.IID := (464161597, 14543, 16730, (133, 211, 32, 228, 58, 14, 193, 177 ));
   
   ------------------------------------------------------------------------
   type IIRawElementProviderSimple_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IIRawElementProviderSimple : aliased constant Windows.IID := (3967099428, 39799, 18208, (187, 33, 74, 200, 159, 219, 26, 253 ));
   
   ------------------------------------------------------------------------
   type ICustomNavigationProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function NavigateCustom
   (
      This       : access ICustomNavigationProvider_Interface
      ; direction : Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_ICustomNavigationProvider : aliased constant Windows.IID := (735618768, 12195, 18199, (178, 140, 73, 23, 206, 84, 146, 141 ));
   
   ------------------------------------------------------------------------
   type ITextEditProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetActiveComposition
   (
      This       : access ITextEditProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetConversionTarget
   (
      This       : access ITextEditProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_ITextEditProvider : aliased constant Windows.IID := (3929408948, 14853, 16398, (181, 249, 78, 145, 180, 15, 97, 118 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype IRawElementProviderSimple is Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
